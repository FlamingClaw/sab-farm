--[[ SAB Bridge v3
  Lets Claude run investigation code in your game and read the output.
  Polls a PRIVATE GitHub repo for cmd.lua, runs it, uploads the output.
  Several accounts can run it at once: a command's second line "--to:name1,name2" (or "--to:all",
  the default) says which accounts run it, and each account writes its own results:
    out/<id>/<PlayerName>.txt  (and B.post files as out/<id>/<PlayerName>_<name>.txt)
    out/hello/<PlayerName>.txt when it connects
  Your token is stored only in the executor's workspace (SAB_bridge_token.txt), never in this script.
]]
local OWNER, REPO, BRANCH = "FlamingClaw", "sab-bridge", "main"
local TOKEN_FILE = "SAB_bridge_token.txt"
local POLL = 2

local G = (getgenv and getgenv()) or _G
if G.SAB_BRIDGE and G.SAB_BRIDGE.stop then pcall(G.SAB_BRIDGE.stop) end

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LP = Players.LocalPlayer
local req = request or http_request or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)
local twait = (task and task.wait) or wait
local tspawn = (task and task.spawn) or function(f, ...) return coroutine.wrap(f)(...) end
local clock = os.clock

local B = { alive = true, S = {}, ran = 0, last = "starting", version = 3, me = LP.Name }
G.SAB_BRIDGE = B

---------------------------------------------------------------- base64
local ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local A = {}
for i = 1, 64 do A[i - 1] = ALPHA:sub(i, i) end
local function b64lua(s)
  local out, n, k = {}, #s, 0
  for i = 1, n, 3 do
    local a, b, c = s:byte(i, i + 2)
    local v = a * 65536 + (b or 0) * 256 + (c or 0)
    local c1 = math.floor(v / 262144) % 64
    local c2 = math.floor(v / 4096) % 64
    local c3 = math.floor(v / 64) % 64
    local c4 = v % 64
    k = k + 1
    out[k] = A[c1] .. A[c2] .. (b and A[c3] or "=") .. (c and A[c4] or "=")
    if k % 40000 == 0 then pcall(twait) end
  end
  return table.concat(out)
end
local b64 = b64lua
do
  local cands = {}
  if type(crypt) == "table" then
    cands[#cands + 1] = crypt.base64encode
    if type(crypt.base64) == "table" then cands[#cands + 1] = crypt.base64.encode end
  end
  cands[#cands + 1] = rawget(G, "base64_encode") or base64_encode
  for _, f in ipairs(cands) do
    if type(f) == "function" then
      local ok1, r1 = pcall(f, "Man")
      local ok2, r2 = pcall(f, "Ma\0\255")
      if ok1 and ok2 and r1 == "TWFu" and r2 == b64lua("Ma\0\255") then b64 = f break end
    end
  end
end
B.b64 = b64

---------------------------------------------------------------- serializer
local tyof = typeof or type
local function key(k) return tostring(k) end
local function ser(v, maxDepth, maxItems)
  maxDepth, maxItems = maxDepth or 6, maxItems or 300
  local seen, parts = {}, {}
  local function emit(s) parts[#parts + 1] = s end
  local function one(x, d, ind)
    local t = tyof(x)
    if t == "string" then emit(string.format("%q", x))
    elseif t == "number" or t == "boolean" or t == "nil" then emit(tostring(x))
    elseif t == "Instance" then
      local ok, fn = pcall(function() return x:GetFullName() end)
      emit("<" .. tostring(x.ClassName) .. " " .. (ok and fn or "?") .. ">")
    elseif t == "table" then
      if seen[x] then emit("<cycle>") return end
      if d >= maxDepth then emit("{...}") return end
      seen[x] = true
      local ks = {}
      for k in pairs(x) do ks[#ks + 1] = k end
      table.sort(ks, function(a, b)
        local ta, tb = type(a), type(b)
        if ta ~= tb then return ta < tb end
        if ta == "number" then return a < b end
        return key(a) < key(b)
      end)
      if #ks == 0 then emit("{}") seen[x] = nil return end
      emit("{\n")
      local ind2 = ind .. "  "
      for i, k in ipairs(ks) do
        if i > maxItems then emit(ind2 .. "... (" .. (#ks - maxItems) .. " more)\n") break end
        emit(ind2)
        if type(k) == "string" and k:match("^[%a_][%w_]*$") then emit(k) else emit("[") one(k, maxDepth, "") emit("]") end
        emit(" = ")
        one(x[k], d + 1, ind2)
        emit(",\n")
      end
      emit(ind .. "}")
      seen[x] = nil
    else
      emit(t .. "(" .. tostring(x) .. ")")
    end
  end
  one(v, 0, "")
  return table.concat(parts)
end
B.ser = ser

---------------------------------------------------------------- handy helpers for commands
function B.attrs(inst)
  local ok, a = pcall(function() return inst:GetAttributes() end)
  return ok and a or {}
end
function B.tree(root, depth, withAttrs)
  depth = depth or 3
  local lines = {}
  local function walk(i, d, ind)
    local line = ind .. i.Name .. " [" .. i.ClassName .. "]"
    if withAttrs then
      local a = B.attrs(i)
      local bits = {}
      for k, v in pairs(a) do bits[#bits + 1] = k .. "=" .. tostring(v) end
      table.sort(bits)
      if #bits > 0 then line = line .. "  {" .. table.concat(bits, ", ") .. "}" end
    end
    lines[#lines + 1] = line
    if d < depth then
      for _, c in ipairs(i:GetChildren()) do walk(c, d + 1, ind .. "  ") end
    end
  end
  walk(root, 0, "")
  return table.concat(lines, "\n")
end
function B.find(pattern, root, className)
  local hits = {}
  for _, d in ipairs((root or game):GetDescendants()) do
    if d.Name:lower():find(pattern:lower(), 1, true) and (not className or d:IsA(className)) then hits[#hits + 1] = d end
  end
  return hits
end

---------------------------------------------------------------- GitHub API
local TOKEN
local function hdr(r, name)
  if not r or type(r.Headers) ~= "table" then return nil end
  local low = name:lower()
  for k, v in pairs(r.Headers) do if tostring(k):lower() == low then return v end end
end
local nonce = 0
local function api(method, path, body, accept, etag)
  if not req then return nil, "executor has no request()" end
  local h = {
    ["Authorization"] = "Bearer " .. TOKEN,
    ["Accept"] = accept or "application/vnd.github+json",
    ["X-GitHub-Api-Version"] = "2022-11-28",
    ["User-Agent"] = "sab-bridge",
  }
  if etag then h["If-None-Match"] = etag end
  if body then h["Content-Type"] = "application/json" end
  nonce = nonce + 1
  local url = "https://api.github.com/repos/" .. OWNER .. "/" .. REPO .. path
  local ok, r = pcall(req, { Url = url, Method = method, Headers = h, Body = body })
  if not ok then return nil, tostring(r) end
  if type(r) ~= "table" then return nil, "bad response" end
  return r
end
local function esc(s) return (s:gsub('[%c"\\]', function(c) return string.format("\\u%04x", c:byte()) end)) end

local function putFile(path, text, msg)
  local content = b64(text)
  local function body(sha)
    return '{"message":"' .. esc(msg or ("bridge " .. path)) .. '","branch":"' .. BRANCH .. '","content":"' .. content .. '"'
      .. (sha and (',"sha":"' .. sha .. '"') or "") .. "}"
  end
  local r, e = api("PUT", "/contents/" .. path, body(nil))
  if not r then return false, e end
  local code = tonumber(r.StatusCode) or 0
  if code == 422 or code == 409 then
    local g = api("GET", "/contents/" .. path .. "?ref=" .. BRANCH)
    local sha = g and tostring(g.Body or ""):match('"sha"%s*:%s*"(%x+)"')
    if sha then
      r, e = api("PUT", "/contents/" .. path, body(sha))
      if not r then return false, e end
      code = tonumber(r.StatusCode) or 0
    end
  end
  return code == 200 or code == 201, code
end

-- uploads go through one queue so commits never collide
local queue = {}
function B.upload(path, text) -- a newer upload of the same file replaces one still waiting
  for _, job in ipairs(queue) do if job[1] == path then job[2] = text return end end
  queue[#queue + 1] = { path, text }
end
tspawn(function()
  while B.alive or #queue > 0 do
    local job = table.remove(queue, 1)
    if job then
      local ok, code
      for attempt = 1, 6 do
        ok, code = putFile(job[1], job[2])
        if ok then break end
        twait(1.5 * attempt + math.random() * 2)
      end
      if not ok then B.last = "upload failed (" .. tostring(code) .. ") " .. job[1] end
    else
      twait(0.25)
    end
  end
end)

---------------------------------------------------------------- UI
local function guiParent()
  local ok, h = pcall(function() return gethui and gethui() end)
  if ok and h then return h end
  ok, h = pcall(function() return game:GetService("CoreGui") end)
  if ok and h then return h end
  return LP:WaitForChild("PlayerGui")
end
local gui = Instance.new("ScreenGui")
gui.Name = "SAB_Bridge"
gui.ResetOnSpawn = false
gui.DisplayOrder = 9999
pcall(function() gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling end)
gui.Parent = guiParent()

local pill = Instance.new("Frame")
pill.Size = UDim2.new(0, 250, 0, 26)
pill.Position = UDim2.new(0.5, -125, 0, 6)
pill.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
pill.BackgroundTransparency = 0.15
pill.Active = true
pill.Parent = gui
Instance.new("UICorner", pill).CornerRadius = UDim.new(0, 8)
local lbl = Instance.new("TextLabel")
lbl.Size = UDim2.new(1, -30, 1, 0)
lbl.Position = UDim2.new(0, 8, 0, 0)
lbl.BackgroundTransparency = 1
lbl.TextColor3 = Color3.fromRGB(235, 235, 245)
lbl.Font = Enum.Font.GothamBold
lbl.TextSize = 12
lbl.TextXAlignment = Enum.TextXAlignment.Left
lbl.TextTruncate = Enum.TextTruncate.AtEnd
lbl.Text = "Bridge: starting"
lbl.Parent = pill
local xb = Instance.new("TextButton")
xb.Size = UDim2.new(0, 22, 0, 22)
xb.Position = UDim2.new(1, -24, 0, 2)
xb.BackgroundColor3 = Color3.fromRGB(170, 50, 50)
xb.Text = "X"
xb.TextColor3 = Color3.new(1, 1, 1)
xb.Font = Enum.Font.GothamBold
xb.TextSize = 12
xb.Parent = pill
Instance.new("UICorner", xb).CornerRadius = UDim.new(0, 6)

do -- drag
  local dragging, startPos, startIn
  pill.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
      dragging, startPos, startIn = true, pill.Position, i.Position
    end
  end)
  UIS.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseMovement) then
      local d = i.Position - startIn
      pill.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
  end)
  UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
  end)
end

function B.stop()
  B.alive = false
  pcall(function() gui:Destroy() end)
end
xb.MouseButton1Click:Connect(B.stop)

local function setStatus(s, color)
  B.last = s
  lbl.Text = "Bridge: " .. s
  pill.BackgroundColor3 = color or Color3.fromRGB(30, 30, 40)
end
local GREEN, RED, AMBER = Color3.fromRGB(25, 90, 50), Color3.fromRGB(120, 30, 30), Color3.fromRGB(120, 90, 20)

local function askToken(reason)
  local done = false
  local f = Instance.new("Frame")
  f.Size = UDim2.new(0, 320, 0, 150)
  f.Position = UDim2.new(0.5, -160, 0.5, -75)
  f.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  f.Parent = gui
  Instance.new("UICorner", f).CornerRadius = UDim.new(0, 10)
  local t = Instance.new("TextLabel")
  t.Size = UDim2.new(1, -20, 0, 50)
  t.Position = UDim2.new(0, 10, 0, 6)
  t.BackgroundTransparency = 1
  t.TextWrapped = true
  t.TextColor3 = Color3.new(1, 1, 1)
  t.Font = Enum.Font.Gotham
  t.TextSize = 12
  t.Text = (reason and (reason .. "\n") or "") .. "Paste your GitHub token for " .. REPO .. " (only asked once):"
  t.Parent = f
  local box = Instance.new("TextBox")
  box.Size = UDim2.new(1, -20, 0, 34)
  box.Position = UDim2.new(0, 10, 0, 60)
  box.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
  box.TextColor3 = Color3.new(1, 1, 1)
  box.ClearTextOnFocus = false
  box.PlaceholderText = "github_pat_..."
  box.Text = ""
  box.TextSize = 12
  box.Font = Enum.Font.Code
  box.TextTruncate = Enum.TextTruncate.AtEnd
  box.Parent = f
  local sv = Instance.new("TextButton")
  sv.Size = UDim2.new(1, -20, 0, 34)
  sv.Position = UDim2.new(0, 10, 0, 104)
  sv.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
  sv.TextColor3 = Color3.new(1, 1, 1)
  sv.Font = Enum.Font.GothamBold
  sv.TextSize = 14
  sv.Text = "SAVE TOKEN"
  sv.Parent = f
  sv.MouseButton1Click:Connect(function()
    local tok = box.Text:gsub("%s", "")
    if #tok < 20 then t.Text = "That doesn't look like a token, try again." return end
    TOKEN = tok
    pcall(writefile, TOKEN_FILE, tok)
    done = true
  end)
  while not done and B.alive do twait(0.2) end
  pcall(function() f:Destroy() end)
end

---------------------------------------------------------------- command runner
local function runCmd(id, src)
  B.ran = B.ran + 1
  setStatus("running #" .. id, AMBER)
  local buf, t0 = {}, clock()
  local function out(...)
    local n, t = select("#", ...), {}
    for i = 1, n do
      local v = select(i, ...)
      t[i] = type(v) == "table" and ser(v) or tostring(v)
    end
    buf[#buf + 1] = table.concat(t, "\t")
  end
  local base = "out/" .. id .. "/" .. LP.Name
  local C = setmetatable({ out = out, id = id }, { __index = B })
  function C.post(name, text) B.upload(base .. "_" .. name .. ".txt", tostring(text)) end
  local fn, cerr = (loadstring or load)(src, "=cmd" .. id)
  if not fn then
    B.upload(base .. ".txt", "#" .. id .. " " .. LP.Name .. " COMPILE ERROR\n" .. tostring(cerr))
    setStatus("#" .. id .. " compile error", RED)
    return
  end
  if setfenv and getfenv then
    pcall(function()
      local env = setmetatable({ print = out, warn = out, out = out, ser = ser, B = C }, { __index = getfenv(0) })
      setfenv(fn, env)
    end)
  end
  local ok, err = xpcall(function() return fn(C) end, function(e) return tostring(e) .. "\n" .. (debug and debug.traceback and debug.traceback() or "") end)
  local secs = string.format("%.2f", clock() - t0)
  local head = "#" .. id .. " " .. LP.Name .. (ok and " OK" or " ERROR") .. " in " .. secs .. "s\n"
  if not ok then buf[#buf + 1] = "ERROR: " .. tostring(err) end
  B.upload(base .. ".txt", head .. table.concat(buf, "\n"))
  setStatus((ok and "done #" or "error #") .. id .. " (" .. B.ran .. " run)", ok and GREEN or RED)
end

-- is this command for this account? second line "--to:all" or "--to:name1,name2" (no line = all)
local function forMe(body)
  local to = body:match("^[^\n]*\n%-%-to:([^\n]*)")
  if not to then return true end
  to = to:gsub("%s", ""):lower()
  if to == "" or to == "all" or to == "*" then return true end
  for n in to:gmatch("[^,]+") do
    if n == LP.Name:lower() or n == tostring(LP.UserId) then return true end
  end
  return false
end

---------------------------------------------------------------- main loop
tspawn(function()
  if not req then setStatus("this executor has no request()", RED) return end
  local okR, saved = pcall(function() return readfile(TOKEN_FILE) end)
  if okR and type(saved) == "string" and #saved > 20 then TOKEN = saved:gsub("%s", "") end
  if not TOKEN then askToken() end
  if not B.alive then return end

  -- check access
  while B.alive do
    setStatus("connecting...")
    local r, e = api("GET", "/contents/cmd.lua?ref=" .. BRANCH, nil, "application/vnd.github.raw")
    local code = r and tonumber(r.StatusCode) or 0
    if code == 401 then
      setStatus("token rejected", RED)
      askToken("GitHub rejected that token (401).")
    elseif code == 403 and r and tostring(r.Body):lower():find("rate limit") then
      setStatus("GitHub rate limit, waiting", RED) twait(60)
    elseif code == 200 or code == 404 then
      B.lastId = code == 200 and tonumber(tostring(r.Body):match("^%-%-id:(%d+)")) or 0
      B.etag = code == 200 and hdr(r, "etag") or nil
      break
    else
      setStatus("can't reach GitHub (" .. tostring(code ~= 0 and code or e) .. ")", RED)
      twait(5)
    end
  end
  if not B.alive then return end

  local info = {
    "bridge v" .. B.version .. " online",
    "executor: " .. tostring(identifyexecutor and select(2, pcall(identifyexecutor)) or "?"),
    "player: " .. LP.Name .. " (" .. LP.UserId .. ")",
    "place: " .. game.PlaceId .. "  job: " .. tostring(game.JobId),
    "farm loaded: " .. tostring(G.SAB ~= nil),
    "b64: " .. (b64 == b64lua and "lua" or "executor"),
    "time: " .. os.time(),
  }
  twait(math.random() * 3) -- several accounts starting together spread out
  local okW, wcode = putFile("out/hello/" .. LP.Name .. ".txt", table.concat(info, "\n"))
  if okW then B.upload("out/hello.txt", table.concat(info, "\n")) end
  if not okW then
    if wcode == 404 or wcode == 403 then
      setStatus("can't write to " .. REPO .. " (" .. tostring(wcode) .. "): check token access", RED)
    else
      setStatus("hello upload failed (" .. tostring(wcode) .. ")", RED)
    end
    return
  end
  setStatus("connected as " .. LP.Name, GREEN)

  local fails = 0
  while B.alive do
    twait(POLL)
    if not B.alive then break end
    local r = api("GET", "/contents/cmd.lua?ref=" .. BRANCH, nil, "application/vnd.github.raw", B.etag)
    local code = r and tonumber(r.StatusCode) or 0
    if code == 200 then
      fails = 0
      B.etag = hdr(r, "etag") or B.etag
      local body = tostring(r.Body or "")
      local id = tonumber(body:match("^%-%-id:(%d+)"))
      if id and id > (B.lastId or 0) then
        B.lastId = id
        if forMe(body) then tspawn(runCmd, id, body) end
      end
    elseif code == 304 or code == 404 then
      fails = 0
    else
      fails = fails + 1
      if code == 401 then setStatus("token rejected, rerun bridge", RED) break end
      if fails >= 3 then setStatus("GitHub unreachable (" .. tostring(code) .. "), retrying", RED) end
      twait(math.min(30, fails * 2))
    end
  end
end)

return B
