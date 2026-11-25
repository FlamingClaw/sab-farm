--[[ SAB team v1: several accounts on one PC working together (loaded by altboot after CHURN).
  Shared state: every account writes SAB/team/<Name>.txt in the executor workspace (one folder for
  every Roblox window on this PC) and reads the others'.
  MAIN (o_oFlame3): stays at the campfire. When an alt has a free wax station (and >= 3 stations,
    which the game asks for Dotonbori butters), it stands up so its crate opens and Auto Roll rolls,
    keeps any Dotonbori/Picnic butter it gets, and walks it over to that alt (the game's Give prompt).
  ALTS: keep + wax what they pull only while a quest needs waxing/buying, otherwise sell so the
    lever keeps going; never sell a good butter (a gift); leave the campfire while a gift waits for
    a station or a quest is open, sit again afterwards.
]]
local G = getgenv()
if G.SAB_TEAM and G.SAB_TEAM.stop then pcall(G.SAB_TEAM.stop) end
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local LP = Players.LocalPlayer
local MAIN = "o_oFlame3"
local DIR = "SAB/team"
local T = { alive = true, me = LP.Name, role = LP.Name == MAIN and "main" or "alt", gifts = 0, log = {}, version = 1 }
G.SAB_TEAM = T
function T.stop() T.alive = false end
G.SAB_ALT_LOOP = (G.SAB_ALT_LOOP or 0) + 1 -- retire the older live alt rule (its loop checks this)
local function note(s)
  local line = os.date("%H:%M:%S ") .. s
  T.log[#T.log + 1] = line
  if #T.log > 80 then table.remove(T.log, 1) end
  local SAB = G.SAB
  if SAB and type(SAB.logAll) == "table" then SAB.logAll[#SAB.logAll + 1] = line end
end
T.note = note

local SI = require(RS.Modules.SquishyInfo)
local function key(n) return (tostring(n):lower():gsub("butter$", "")) end
local GOOD_RAR = { Dotonbori = true, Picnic = true }
local ALL, GOOD = {}, {}
for n, v in pairs(SI) do
  if type(v) == "table" and v.rarity ~= "Limited" then
    ALL[key(n)] = true
    if GOOD_RAR[v.rarity] then GOOD[key(n)] = true end
  end
end
T.GOOD = GOOD
local function isGood(n) return n ~= nil and GOOD[key(n)] == true end

---------------------------------------------------------------- my status
local function myPlot() local SAB = G.SAB return SAB and SAB.S and SAB.S.plot end
local function freeStations()
  local p = myPlot()
  local ws = p and p:FindFirstChild("WaxStations")
  local n = 0
  for _, st in ipairs(ws and ws:GetChildren() or {}) do if not st:GetAttribute("HasSquishy") then n = n + 1 end end
  return n
end
local function humanoid() return LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") end
local function seated() local h = humanoid() return h ~= nil and h.Sit == true end
local function standUp()
  pcall(function() RS.Remotes.LeaveSeat:FireServer() end)
  local h = humanoid()
  if h and h.Sit then h.Sit = false h.Jump = true end
end
T.pass = { at = -1e9 }
local function passState()
  if os.clock() - T.pass.at < 45 then return T.pass end
  local r = RS.Remotes:FindFirstChild("ThanksgivingAction")
  local ok, st = pcall(function() return r:InvokeServer("state") end)
  local P = { at = os.clock(), live = false, open = 0, need = false }
  if ok and type(st) == "table" then
    P.live, P.rank, P.points, P.pro = st.live == true, st.rank, st.points, st.pass
    for _, q in ipairs(st.quests or {}) do
      if not q.done then
        P.open = P.open + 1
        if q.kind == "stack" or q.kind == "rare" or q.kind == "buy" then P.need = true end
      end
    end
  end
  T.pass = P
  return P
end
T.passState = passState
function T.refreshPass() T.pass.at = -1e9 return passState() end

local function writeMe()
  pcall(makefolder, "SAB") pcall(makefolder, DIR)
  local P = T.pass
  local L = {
    "t=" .. os.time(), "role=" .. T.role, "job=" .. game.JobId,
    "free=" .. freeStations(), "stations=" .. tostring(LP:GetAttribute("WaxStations") or 0),
    "holding=" .. tostring(LP:GetAttribute("SquishyEquipped") or ""),
    "seated=" .. tostring(seated()), "open=" .. tostring(P.open or 0),
    "rank=" .. tostring(P.rank or ""), "points=" .. tostring(P.points or ""),
    "boost=" .. tostring(LP:GetAttribute("FriendBoost") or 0), "gifts=" .. T.gifts,
    "mode=" .. tostring(T.mode or ""),
  }
  pcall(writefile, DIR .. "/" .. T.me .. ".txt", table.concat(L, "\n"))
end
function T.peers()
  local out = {}
  local ok, fs = pcall(listfiles, DIR)
  for _, f in ipairs(ok and fs or {}) do
    local name = tostring(f):match("([^/\\]+)%.txt$")
    if name and name ~= T.me then
      local okr, body = pcall(readfile, DIR .. "/" .. name .. ".txt")
      if okr and type(body) == "string" then
        local s = { name = name }
        for k, v in body:gmatch("(%w+)=([^\n]*)") do s[k] = tonumber(v) or v end
        s.fresh = type(s.t) == "number" and os.time() - s.t < 45 and s.job == game.JobId
        s.player = Players:FindFirstChild(name)
        out[#out + 1] = s
      end
    end
  end
  return out
end

---------------------------------------------------------------- alt rules
local function altTick()
  local SAB = G.SAB
  local C = SAB.CFG
  local P = passState()
  local held = LP:GetAttribute("SquishyEquipped")
  local giftWaiting = isGood(held)
  -- targets: always keep good butters; everything else only while a quest needs waxing/buying
  local Tg = C.Targets
  for k in pairs(Tg) do if not GOOD[k] and not (P.need and ALL[k]) then Tg[k] = nil end end
  for k in pairs(GOOD) do Tg[k] = true end
  if P.need then for k in pairs(ALL) do Tg[k] = true end end
  -- the campfire seat holds every walking job: up while quests are open or a gift waits for a station
  local wantUp = (P.live and P.open > 0) or (giftWaiting and freeStations() > 0)
  if wantUp then
    if C.Campfire then C.Campfire = false end
    if seated() then standUp() end
  elseif not C.Campfire then
    C.Campfire = true
    SAB.CF.nextAt = 0
  end
  T.mode = (P.need and "keep+wax (quest)" or "sell (pulls go on)") .. (giftWaiting and ", gift to wax" or "")
    .. (wantUp and ", campfire waits" or ", campfire on")
end

---------------------------------------------------------------- main: the Sushi feeder
T.feed = { on = true, target = nil, since = 0, standing = false }
local function nearTo(plr)
  local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  local th = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
  if not (hrp and th) then return nil end
  hrp.CFrame = th.CFrame * CFrame.new(0, 0, -3)
  return th
end
local function pickAlt()
  local best, bestFree
  for _, s in ipairs(T.peers()) do
    if s.fresh and s.player and s.role == "alt" and (s.stations or 0) >= 3 and (s.free or 0) > 0
      and (s.holding == nil or s.holding == "") then
      if not best or (s.free or 0) > bestFree then best, bestFree = s, s.free end
    end
  end
  return best
end
local function give(s)
  local SAB = G.SAB
  local held = LP:GetAttribute("SquishyEquipped")
  SAB.S.running = false
  task.wait(0.5)
  standUp()
  local th = nearTo(s.player)
  task.wait(0.8)
  local gp = th and th:FindFirstChild("GivePrompt")
  if gp and gp.Enabled then
    pcall(fireproximityprompt, gp)
  else
    pcall(function() RS.Remotes.GiveSquishy:FireServer(s.player) end)
  end
  local t0 = os.clock()
  repeat task.wait(0.2) until LP:GetAttribute("SquishyEquipped") == nil or os.clock() - t0 > 4
  local ok = LP:GetAttribute("SquishyEquipped") == nil
  if ok then
    T.gifts = T.gifts + 1
    note(("TEAM: gave %s to %s (%d given)"):format(tostring(held), s.name, T.gifts))
  else
    note(("TEAM: could not give %s to %s"):format(tostring(held), s.name))
  end
  SAB.S.running = true
  return ok
end
local function mainTick()
  local SAB = G.SAB
  local C = SAB.CFG
  -- keep (never sell) every good butter: they go to the alts
  for k in pairs(GOOD) do C.Targets[k] = true end
  local held = LP:GetAttribute("SquishyEquipped")
  local alt = T.feed.on and pickAlt() or nil
  if isGood(held) and alt then
    give(alt)
    return
  end
  if alt and not isGood(held) then
    -- an alt has room: stand up so the crate opens and Auto Roll rolls; CHURN buys the next good one
    if not T.feed.standing then
      T.feed.standing, T.feed.since = true, os.clock()
      note(("TEAM: %s has %d free station(s) - rolling a Sushi for it"):format(alt.name, alt.free))
    end
    if C.Campfire then C.Campfire = false end
    if seated() then standUp() end
    T.mode = "feeding " .. alt.name
  else
    if T.feed.standing then
      T.feed.standing = false
      note("TEAM: no alt has room - back to the campfire")
    end
    if not C.Campfire then C.Campfire = true SAB.CF.nextAt = 0 end
    T.mode = isGood(held) and ("holding " .. tostring(held) .. ", no alt has room") or "campfire"
  end
end

---------------------------------------------------------------- loop
task.spawn(function()
  note("TEAM v" .. T.version .. ": " .. T.me .. " as " .. T.role)
  while T.alive and G.SAB_TEAM == T do
    local SAB = G.SAB
    if SAB and SAB.S and SAB.S.alive then
      pcall(passState)
      local ok, err = pcall(T.role == "main" and mainTick or altTick)
      if not ok then note("TEAM error: " .. tostring(err)) end
      pcall(writeMe)
    end
    task.wait(T.role == "main" and 4 or 6)
  end
end)
return T
