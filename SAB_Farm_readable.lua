-- SAB BUTTER FARM v17 | Delta / Android
-- Reacts to the Auto Roll pass. It never rolls and never touches the Limited holder.
-- It buys ONLY the butters ticked in the BUTTERS tab, and it checks what is actually
-- in your hands before waxing anything, so a butter someone gifts you is never placed.
local VERSION = "v17"
local Players = game:GetService("Players")
local plr = Players.LocalPlayer or Players.PlayerAdded:Wait()
local function toast(msg)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", { Title = "SAB " .. VERSION, Text = msg, Duration = 6 })
    end)
end
toast("script started")

local function main()
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local genv = (type(getgenv) == "function" and getgenv()) or _G
if type(genv.SAB_KILL) == "function" then pcall(genv.SAB_KILL) end -- replace an older instance
local now = (type(tick) == "function") and tick or os.clock
local VU = (function() local ok, v = pcall(function() return game:GetService("VirtualUser") end) return ok and v or nil end)()
local CFG = {
    Targets = { applepie = true }, -- set of key(name) -> true. Only these are bought and waxed.
    Collect = true, Every = 60,
    SellJunk = true,               -- anything else in hand gets sold, never waxed
    Crates = true,                 -- open a crate when a ticked butter can come out of it
    Rejoin = true,                 -- come back by myself after a disconnect or a restart
    AutoStart = true,              -- start farming as soon as the script loads, with no tap
    Confirm = 0.35,                -- match must hold this long before buying
    BuyGap = 1.2, PlaceTries = 3, PadDwell = 0.7,
}
local S = {
    alive = true, running = false, busy = false, busyText = "", holding = false,
    bought = 0, placed = 0, collected = 0, sold = 0, rolls = 0, gifts = 0,
    placeFails = 0, cashFails = 0, sellFails = 0,
    capHit = false, capMsg = "", uiErrs = 0, lastBuyAt = 0, lastCollect = 0, noCashUntil = 0,
    matchSince = nil, boot = now(), plot = nil, reason = "starting", level = "wait",
    lastCarryDesc = "", padSearchAt = -100, padPart = nil, padCands = {}, manualPad = nil,
    sellSpot = nil, sellSearchAt = -100, noSellSpot = false, catAt = 0,
    crates = 0, crateFails = 0, tapWay = nil, capAt = 0, carrySrc = nil, carryBlind = 0, attrStale = 0,
    config = "default", autoload = nil, selfPath = nil, rejoining = false, winPos = nil, togPos = nil, hidden = false,
}
local EV = { name = nil, rar = nil, at = now(), seq = 0, init = nil, initAt = 0, gift = nil, giftAt = 0 }
local CRATE = { on = false, data = nil, at = 0, title = "crate", lastFail = 0, padAt = 0 }
local KILLED = {}
local conns, logs, logAll, evAll = {}, {}, {}, {}
local lastDump = ""
---------------------------------------------------------------- utils
local function track(c) conns[#conns + 1] = c return c end
local function nap(t)
    task.wait(t)
    if not S.alive then error(KILLED, 0) end
end
local function note(s)
    s = os.date("%H:%M:%S") .. " " .. tostring(s)
    table.insert(logs, 1, s)
    if #logs > 6 then table.remove(logs) end
    logAll[#logAll + 1] = s
    if #logAll > 80 then table.remove(logAll, 1) end
end
local function norm(s)
    if type(s) ~= "string" then return "" end
    return (s:lower():gsub("[^%w]", ""))
end
local function key(s) -- "Tiramisu Butter" / "TiramisuButter" / "tiramisu" -> "tiramisu"
    local n = norm(s)
    local b = n:gsub("butter$", "")
    if b == "" then b = n end
    return b
end
-- a butter counts as a target only if its own tick box is on
local function isTarget(s) return type(s) == "string" and key(s) ~= "" and CFG.Targets[key(s)] == true end
local function butterish(n)
    n = n:lower()
    return n:find("squishy", 1, true) ~= nil or n:match("butter$") ~= nil or n:match("butter[^%a]") ~= nil
end
local SUF = { "", "K", "M", "B", "T", "Qa", "Qi", "Sx", "Sp", "Oc", "No", "Dc" }
local function fmt(n)
    if type(n) ~= "number" then return "?" end
    local i = 1
    while math.abs(n) >= 1000 and i < #SUF do n = n / 1000 i = i + 1 end
    local s = string.format("%.2f", n):gsub("%.?0+$", "")
    return s .. SUF[i]
end
local function parseMoney(s)
    if type(s) ~= "string" then return nil end
    local num, suf = s:gsub(",", ""):match("([%d%.]+)%s*(%a*)")
    local n = tonumber(num)
    if not n then return nil end
    if suf == "" then return n end
    for i, x in ipairs(SUF) do if x:lower() == suf:lower() then return n * 1000 ^ (i - 1) end end
    return nil
end
local function cash()
    local v = plr:GetAttribute("BoardValueMoney")
    if type(v) == "number" then return v end
    local ls = plr:FindFirstChild("leaderstats")
    if ls then
        for _, n in ipairs({ "Cash", "Money", "Coins" }) do
            local x = ls:FindFirstChild(n)
            if x and type(x.Value) == "number" then return x.Value end
        end
    end
end
local function relPath(i)
    local s = i:GetFullName()
    if S.plot then
        local base = S.plot:GetFullName()
        if s:sub(1, #base) == base then return s:sub(#base + 2) end
    end
    return s
end
---------------------------------------------------------------- world helpers
local function char()
    local c = plr.Character
    if c and c:FindFirstChild("HumanoidRootPart") then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h and h.Health > 0 then return c end
    end
end
local function findPlot()
    local plots = WS:FindFirstChild("Plots")
    if not plots then return nil end
    local function mine(p)
        local plate = p:FindFirstChild("Plate")
        return plate ~= nil and plate:FindFirstChild("EditStackAttachment", true) ~= nil
    end
    local n = plr:GetAttribute("PlotNumber")
    if n ~= nil then
        local p = plots:FindFirstChild(tostring(n))
        if p and mine(p) then return p end
    end
    for _, p in ipairs(plots:GetChildren()) do
        if mine(p) then return p end
    end
end
local function partOf(inst) -- BasePart that physically holds this prompt / attachment
    local p = inst and inst.Parent
    for _ = 1, 6 do
        if not p then return nil end
        if p:IsA("BasePart") then return p end
        if p:IsA("Model") then return p.PrimaryPart or p:FindFirstChildWhichIsA("BasePart", true) end
        p = p.Parent
    end
end
local function posOf(prompt)
    local par = prompt.Parent
    if par and par:IsA("Attachment") then return par.WorldPosition end
    local p = partOf(prompt)
    return p and p.Position
end
local function plateCenter()
    local pl = S.plot and S.plot:FindFirstChild("Plate")
    if not pl then return nil end
    if pl:IsA("BasePart") then return pl.Position end
    if pl:IsA("Model") then return pl:GetPivot().Position end
    local b = pl:FindFirstChildWhichIsA("BasePart", true)
    return b and b.Position
end
local function stationPrompts()
    local out = {}
    local ws = S.plot and S.plot:FindFirstChild("WaxStations")
    if ws then
        for _, st in ipairs(ws:GetChildren()) do
            local h = st:FindFirstChild("SquishyPlaceHolder")
            local p = h and h:FindFirstChild("PlacePrompt")
            if p and p:IsA("ProximityPrompt") then out[#out + 1] = p end
        end
    end
    return out
end
local function freeCount()
    local ps, free = stationPrompts(), 0
    for _, p in ipairs(ps) do if p.Enabled then free = free + 1 end end
    local total = #ps
    local a = plr:GetAttribute("WaxStations")
    if type(a) == "number" and a > total then total = a end
    return free, total
end
local function nearestFree()
    local c = char()
    local hp = c and c.HumanoidRootPart.Position
    local best, bd
    for _, p in ipairs(stationPrompts()) do
        if p.Enabled then
            local pos = posOf(p)
            local d = (pos and hp) and (pos - hp).Magnitude or 1e9
            if not best or d < bd then best, bd = p, d end
        end
    end
    return best
end
-- Only ever the ROLLED holder's prompt. The Limited holder is never referenced.
local function buyPrompt()
    local h = S.plot and S.plot:FindFirstChild("RolledSquishyPlaceHolder")
    if not h then return nil end
    local a = h:FindFirstChild("BuyPromptAttachment")
    local p = (a and a:FindFirstChild("BuyPrompt")) or h:FindFirstChild("BuyPrompt", true)
    if p and p:IsA("ProximityPrompt") and p:IsDescendantOf(h) then return p end
end
---------------------------------------------------------------- catalog + ordering
-- Every butter in the game, grouped by rarity, worst first. Three sources, best first:
--   1. crate contents seen live (CrateUpdate): drop chance descending = worst to best. Exact.
--   2. a cache of 1. saved from earlier sessions.
--   3. the built-in lists below, used until the game tells us otherwise.
-- Rarity order comes from crate prices the same way, so a new rarity sorts itself.
local BASE_RAR = { "Common", "Rare", "Epic", "Legendary", "Mythic", "Celestial", "Divine", "Dream", "Sugar Rush", "Picnic" }
local BASE_ORDER = {
    ["Sugar Rush"] = { "CherryButter", "StrawberryCrepeButter", "CreamPuffButter", "CheesecakeButter", "TiramisuButter" },
    ["Picnic"] = { "CantaloupeButter", "CinnamonRollButter", "StrawberryShortcakeButter", "BreakfastButter", "ApplePieButter" },
}
local LEARN = { order = {}, price = {}, dirty = false }
local CAT = { rar = {}, pretty = {}, members = {}, rarOrder = {}, n = 0, at = 0 }
local ORDFILE = "SAB_order.txt"
-- Tiny line format, so this never depends on HttpService being reachable:
--   P|<rarity>|<crate price>
--   O|<rarity>|<butter>,<butter>,...
local function saveLearn()
    if not LEARN.dirty or type(writefile) ~= "function" then return end
    local L = {}
    for r, p in pairs(LEARN.price) do L[#L + 1] = "P|" .. r .. "|" .. string.format("%.0f", p) end
    for r, o in pairs(LEARN.order) do L[#L + 1] = "O|" .. r .. "|" .. table.concat(o, ",") end
    if pcall(writefile, ORDFILE, table.concat(L, "\n")) then LEARN.dirty = false end
end
local function loadLearn()
    if type(isfile) ~= "function" or type(readfile) ~= "function" then return end
    local ok, has = pcall(isfile, ORDFILE)
    if not (ok and has) then return end
    local ok2, raw = pcall(readfile, ORDFILE)
    if not (ok2 and type(raw) == "string") then return end
    for line in raw:gmatch("[^\n]+") do
        local kind, rar, rest = line:match("^(%a)|([^|]+)|(.*)$")
        if kind == "P" then
            LEARN.price[rar] = tonumber(rest)
        elseif kind == "O" and rest ~= "" then
            local list = {}
            for nm in rest:gmatch("[^,]+") do list[#list + 1] = nm end
            if #list > 0 then LEARN.order[rar] = list end
        end
    end
end
-- a crate tells us the whole rarity: {contents={{butter=,chance=},...}, price=, rarity=}
local function learnCrate(d)
    if type(d) ~= "table" then return end
    local rar, c = d.rarity, d.contents
    if type(rar) ~= "string" or rar == "" or type(c) ~= "table" then return end
    local list = {}
    for _, e in ipairs(c) do
        if type(e) == "table" and type(e.butter) == "string" then
            list[#list + 1] = { n = e.butter, ch = tonumber(e.chance) or 0 }
        end
    end
    if #list == 0 then return end
    table.sort(list, function(a, b) return a.ch > b.ch end) -- most common first = worst first
    local order, changed = {}, false
    for i, e in ipairs(list) do order[i] = e.n end
    local was = LEARN.order[rar]
    if not was or #was ~= #order then changed = true end
    if not changed then
        for i = 1, #order do if was[i] ~= order[i] then changed = true break end end
    end
    LEARN.order[rar] = order
    local pr = tonumber(d.price)
    if pr and LEARN.price[rar] ~= pr then LEARN.price[rar] = pr changed = true end
    if changed then
        LEARN.dirty = true
        CAT.at = 0 -- rebuild
        note("learned the " .. rar .. " order from its crate")
    end
end
local function deepText(m, n)
    local l = m:FindFirstChild(n, true)
    local ok, t = pcall(function() return l.Text end)
    return (ok and type(t) == "string" and t ~= "") and t or nil
end
local function prettyOf(k) return CAT.pretty[k] or k end
-- read every squishy asset, group by its own RarityText, then sort worst to best
local function buildCat()
    local a = RS:FindFirstChild("Assets")
    local sq = a and a:FindFirstChild("Squishies")
    if not sq then return false end
    local rar, pretty, mem = {}, {}, {}
    local n = 0
    for _, m in ipairs(sq:GetChildren()) do
        local k = key(m.Name)
        if k ~= "" and not rar[k] then
            local r = deepText(m, "RarityText") or "?"
            rar[k] = r
            pretty[k] = deepText(m, "NameText") or m.Name
            mem[r] = mem[r] or {}
            table.insert(mem[r], k)
            n = n + 1
        end
    end
    if n == 0 then return false end
    -- butters inside a rarity: the ones the crate named first, in that order, then the rest A-Z
    for r, list in pairs(mem) do
        local want = LEARN.order[r] or BASE_ORDER[r]
        local rank = {}
        if want then for i, nm in ipairs(want) do rank[key(nm)] = i end end
        table.sort(list, function(x, y)
            local rx, ry = rank[x], rank[y]
            if rx and ry then return rx < ry end
            if rx then return true end
            if ry then return false end
            return prettyOf(x) < prettyOf(y)
        end)
    end
    -- rarities: by crate price when we have seen the crates, else the built-in order, else A-Z
    local base = {}
    for i, r in ipairs(BASE_RAR) do base[r] = i end
    local rl = {}
    for r in pairs(mem) do rl[#rl + 1] = r end
    table.sort(rl, function(x, y)
        local px, py = LEARN.price[x], LEARN.price[y]
        if px and py and px ~= py then return px < py end
        local bx, by = base[x], base[y]
        if bx and by then return bx < by end
        if bx then return true end
        if by then return false end
        return x < y
    end)
    CAT.rar, CAT.pretty, CAT.members, CAT.rarOrder, CAT.n, CAT.at = rar, pretty, mem, rl, n, now()
    return true
end
local function catReady()
    if CAT.at == 0 or (now() - CAT.at) > 120 then pcall(buildCat) end
    return CAT.n > 0
end
local function rarityOf(name)
    local k = key(name)
    return CAT.rar[k] or (EV.name and key(EV.name) == k and EV.rar) or "?"
end
local function targetNames()
    local out = {}
    for k, on in pairs(CFG.Targets) do if on then out[#out + 1] = prettyOf(k) end end
    table.sort(out)
    return out
end

---------------------------------------------------------------- files, configs, autoexec, rejoin
local F = { dir = "SAB", cfg = "SAB/configs", auto = "SAB/autoload.txt", exec = "autoexec/SAB_autoload.lua" }
local function canWrite() return type(writefile) == "function" and type(readfile) == "function" and type(isfile) == "function" end
local function ensureDir(d)
    if type(makefolder) ~= "function" then return end
    local ok, there = pcall(isfolder, d)
    if not (ok and there) then pcall(makefolder, d) end
end
local function readIf(p)
    if type(isfile) ~= "function" or type(readfile) ~= "function" then return nil end
    local ok, there = pcall(isfile, p)
    if not (ok and there) then return nil end
    local ok2, raw = pcall(readfile, p)
    return ok2 and raw or nil
end
local function writeTo(p, body)
    if type(writefile) ~= "function" then return false end
    return (pcall(writefile, p, body))
end
local function listIn(dir)
    local out = {}
    if type(listfiles) ~= "function" then return out end
    local ok, fs = pcall(listfiles, dir)
    if not ok or type(fs) ~= "table" then return out end
    for _, f in ipairs(fs) do out[#out + 1] = tostring(f) end
    return out
end
local function listConfigs()
    local out = {}
    for _, f in ipairs(listIn(F.cfg)) do
        local n = f:match("([^/\\]+)%.txt$")
        if n then out[#out + 1] = n end
    end
    table.sort(out)
    return out
end
-- settings are kept as plain lines so nothing depends on HttpService
local function configText()
    local L = { "V|1" }
    L[#L + 1] = "N|Every|" .. tostring(CFG.Every)
    for _, k in ipairs({ "Collect", "SellJunk", "Crates", "Rejoin", "AutoStart" }) do
        L[#L + 1] = "B|" .. k .. "|" .. (CFG[k] and "1" or "0")
    end
    if S.winPos then L[#L + 1] = ("W|%d|%d"):format(S.winPos[1], S.winPos[2]) end
    if S.togPos then L[#L + 1] = ("G|%d|%d"):format(S.togPos[1], S.togPos[2]) end
    local t = {}
    for k, on in pairs(CFG.Targets) do if on then t[#t + 1] = k end end
    table.sort(t)
    for _, k in ipairs(t) do L[#L + 1] = "T|" .. k end
    return table.concat(L, "\n")
end
local function applyConfig(raw)
    if type(raw) ~= "string" or raw == "" then return false end
    local tg, got = {}, false
    for line in raw:gmatch("[^\n]+") do
        local a, b, c = line:match("^(%a)|([^|]*)|?(.*)$")
        if a == "N" and b == "Every" then
            local n = tonumber(c)
            if n and n >= 1 then CFG.Every = math.floor(n) end
        elseif a == "B" then
            if CFG[b] ~= nil then CFG[b] = (c == "1") end
        elseif a == "W" then
            S.winPos = { tonumber(b) or 10, tonumber(c) or 44 }
        elseif a == "G" then
            S.togPos = { tonumber(b) or 10, tonumber(c) or 300 }
        elseif a == "T" and b ~= "" then
            tg[b] = true
            got = true
        end
    end
    if got then CFG.Targets = tg end
    return true
end
local function saveConfig(name)
    if not canWrite() then return false, "this executor cannot write files" end
    name = (name or "default"):gsub("[^%w_%- ]", ""):gsub("^%s+", ""):gsub("%s+$", "")
    if name == "" then return false, "give the config a name" end
    ensureDir(F.dir)
    ensureDir(F.cfg)
    if not writeTo(F.cfg .. "/" .. name .. ".txt", configText()) then return false, "could not write the file" end
    S.config = name
    return true, name
end
local function loadConfig(name)
    local raw = readIf(F.cfg .. "/" .. name .. ".txt")
    if not raw then return false, "no config called " .. tostring(name) end
    if not applyConfig(raw) then return false, "that config looks empty" end
    S.config = name
    return true, name
end
local function setAutoload(name)
    if name then
        ensureDir(F.dir)
        writeTo(F.auto, name)
    elseif type(delfile) == "function" then
        pcall(delfile, F.auto)
    else
        writeTo(F.auto, "")
    end
    S.autoload = name
end
-- where this script is saved, so it can be started again after a rejoin
local function findSelfPath()
    if S.selfPath then return S.selfPath end
    local best
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", F.dir }) do
        for _, f in ipairs(listIn(d)) do
            local low = f:lower()
            if low:sub(-4) == ".lua" and (low:find("sab_farm", 1, true) or low:find("sab farm", 1, true)) then
                best = best or f
            end
        end
    end
    S.selfPath = best
    return best
end
F.stub = [[
-- SAB autoloader: finds the saved SAB farm script and runs it on join.
task.spawn(function()
    task.wait(8)
    if type(listfiles) ~= "function" or type(readfile) ~= "function" then return end
    for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
        local ok, fs = pcall(listfiles, d)
        if ok and type(fs) == "table" then
            for _, f in ipairs(fs) do
                local s, low = tostring(f), tostring(f):lower()
                if low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                    local okr, src = pcall(readfile, s)
                    if okr and type(src) == "string" and #src > 1000 then
                        local fn = loadstring(src)
                        if fn then pcall(fn) return end
                    end
                end
            end
        end
    end
end)
]]
local function installAutoexec()
    if not canWrite() then return false, "this executor cannot write files" end
    ensureDir("autoexec")
    if not writeTo(F.exec, F.stub) then return false, "could not write to the autoexec folder" end
    local p = findSelfPath()
    return true, p and ("it will load " .. p) or "now save this script in Delta so the loader can find it"
end
-- rejoining after a disconnect or a server restart
local TPS = (function() local ok, v = pcall(function() return game:GetService("TeleportService") end) return ok and v or nil end)()
local function queueSelf()
    if type(queueonteleport) ~= "function" and type(queue_on_teleport) ~= "function" then return false end
    local q = queueonteleport or queue_on_teleport
    local p = findSelfPath()
    if not p then return false end
    return (pcall(q, ("local ok,s=pcall(readfile,%q) if ok and s then local f=loadstring(s) if f then task.spawn(f) end end"):format(p)))
end
local function rejoin(why)
    if S.rejoining then return end
    S.rejoining = true
    note("REJOIN (" .. why .. ")")
    pcall(saveLearn)
    if S.autoload then pcall(saveConfig, S.autoload) end
    local queued = queueSelf()
    note(queued and "queued the script for the new server" or "no saved copy found - set up autoexec for a clean restart")
    task.spawn(function()
        for _ = 1, 30 do
            if not TPS then break end
            pcall(function() TPS:Teleport(game.PlaceId, plr) end)
            task.wait(10)
        end
    end)
end
local function watchDisconnect()
    local okG, GS = pcall(function() return game:GetService("GuiService") end)
    if okG and GS then
        pcall(function()
            track(GS.ErrorMessageChanged:Connect(function()
                if CFG.Rejoin then rejoin("roblox error message") end
            end))
        end)
    end
    pcall(function()
        local cg = game:GetService("CoreGui")
        local gui = cg and cg:WaitForChild("RobloxPromptGui", 15)
        local ov = gui and gui:WaitForChild("promptOverlay", 15)
        if ov then
            track(ov.ChildAdded:Connect(function(c)
                if CFG.Rejoin and tostring(c.Name):lower():find("errorprompt", 1, true) then rejoin("disconnect prompt") end
            end))
        end
    end)
    pcall(function()
        track(plr.OnTeleport:Connect(function(st)
            if tostring(st):find("Started") then queueSelf() end
        end))
    end)
    if TPS then
        pcall(function()
            track(TPS.TeleportInitFailed:Connect(function()
                S.rejoining = false
                if CFG.Rejoin then task.delay(5, function() rejoin("teleport retry") end) end
            end))
        end)
    end
end

---------------------------------------------------------------- what is on the pad / in my hands
-- plot.RolledSquishy holds the model that was just rolled; its name IS the butter.
-- plot.SquishyEquipped holds what the character is carrying. Both are empty when idle.
local function holderChild(name)
    local h = S.plot and S.plot:FindFirstChild(name)
    if not h then return nil, false end
    for _, d in ipairs(h:GetChildren()) do
        if d:IsA("Model") or d:IsA("BasePart") then return d, true end
    end
    return nil, true -- holder exists and is empty: that is a real answer, not a missing holder
end
local function padInfo()
    local m = holderChild("RolledSquishy")
    if not m then return nil end
    return { model = m, name = m.Name, pretty = deepText(m, "NameText") or prettyOf(key(m.Name)),
        rar = deepText(m, "RarityText") or rarityOf(m.Name), price = deepText(m, "PriceText") }
end
-- What is in my hands, by name. Three sources, because the plot's SquishyEquipped model stays
-- empty while you carry: the butter is attached to the character and the server records the
-- name on the SquishyEquipped attribute, which it clears again when you put the butter down.
local function knownButter(n)
    return type(n) == "string" and (CAT.rar[key(n)] ~= nil or butterish(n))
end
local function carriedName()
    local m = holderChild("SquishyEquipped")
    if m then S.carrySrc = "model" return m.Name, m end
    local c = plr.Character
    if c then
        for _, d in ipairs(c:GetDescendants()) do
            if (d:IsA("Model") or d:IsA("Tool")) and knownButter(d.Name) then
                S.carrySrc = "character"
                return d.Name, d
            end
        end
    end
    local a = plr:GetAttribute("SquishyEquipped")
    if type(a) == "string" and a ~= "" and knownButter(a) and now() >= (S.carryBlind or 0) then
        S.carrySrc = "attribute"
        return a, nil
    end
    S.carrySrc = nil
end
local function carried() local _, inst = carriedName() return inst end
-- price shown on the pad vs cash. Only a clear shortfall counts.
local function cashShort()
    local pi = padInfo()
    local price = pi and parseMoney(pi.price)
    local have = cash()
    if price and have and have < price * 0.5 then return have, price end
end

---------------------------------------------------------------- remote events
local function evlog(s)
    evAll[#evAll + 1] = os.date("%H:%M:%S") .. " " .. s
    if #evAll > 40 then table.remove(evAll, 1) end
end
local function onRoll(name, rarity)
    if type(name) ~= "string" then return end
    evlog(("Roll(%s,%s)"):format(name, tostring(rarity)))
    if name:lower():find("crate", 1, true) then return end
    EV.seq = EV.seq + 1
    EV.name, EV.at = name, now()
    EV.rar = type(rarity) == "string" and rarity or nil
    S.rolls = S.rolls + 1
    if isTarget(name) then note(("ROLL %s [%s] = TARGET"):format(name, tostring(rarity))) end
end
local function onGift(d) -- someone sent you a butter: remember it so the log explains the odd one out
    if type(d) ~= "table" then return end
    local b = d.butter or d.itemName
    if type(b) ~= "string" then return end
    S.gifts = S.gifts + 1
    EV.gift, EV.giftAt = b, now()
    if type(d.giftId) == "string" then -- the game sends thanks back with the gift id
        local R = RS:FindFirstChild("Remotes")
        local th = R and R:FindFirstChild("GiftThanks")
        if th then pcall(function() th:FireServer(d.giftId) end) end
    end
    evlog("Gift(" .. b .. " from " .. tostring(d.fromName) .. ")")
    note(("GIFT from %s: %s - it will not be waxed"):format(tostring(d.fromName), b))
end
local function hookRemotes()
    local R = RS:WaitForChild("Remotes", 30)
    if not S.alive then return end
    if not R then note("Remotes folder missing - no roll events") return end
    local map = {
        SquishyRollAnimation = onRoll,
        InitSquishy = function(m) EV.init, EV.initAt = tostring(m), now() evlog("Init(" .. tostring(m) .. ")") end,
        CrateUpdate = function(d, shown)
            pcall(learnCrate, d)
            if type(d) == "table" and shown ~= false then
                CRATE.on, CRATE.data, CRATE.at = true, d, now()
                CRATE.title = tostring(d.title or d.name or "crate")
                evlog("CrateWindow(" .. CRATE.title .. ")")
            else
                if CRATE.on then evlog("CrateWindow closed") end
                CRATE.on, CRATE.data = false, nil
            end
        end,
        GiftReceived = onGift,
    }
    for name, fn in pairs(map) do
        local r = R:FindFirstChild(name)
        if r and r:IsA("RemoteEvent") then track(r.OnClientEvent:Connect(fn))
        elseif name ~= "CrateUpdate" and name ~= "GiftReceived" then note("remote " .. name .. " missing") end
    end
end

---------------------------------------------------------------- identity of what is on the pad
local function identity()
    local pi = padInfo()
    if pi then
        if isTarget(pi.name) then
            return { state = "match", shown = pi.pretty, src = "pad", info = pi }
        end
        return { state = "skip", info = pi, level = "idle",
            text = ("on pad: %s [%s] - not ticked"):format(pi.pretty, tostring(pi.rar)) }
    end
    -- the pad holder is empty. A roll event in the last few seconds still tells us what landed.
    if EV.name and (now() - EV.at) < 4 then
        if isTarget(EV.name) then
            return { state = "match", shown = prettyOf(key(EV.name)), src = "roll event" }
        end
        return { state = "skip", level = "idle",
            text = ("rolled %s [%s] - not ticked"):format(prettyOf(key(EV.name)), tostring(EV.rar)) }
    end
    return { state = "none", level = "wait", text = "no result on pad (auto-roll running)" }
end
---------------------------------------------------------------- movement + prompt activation
local function groundPos(x, y, z, ignore)
    local rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    local list = { plr.Character }
    for _, i in ipairs(ignore or {}) do list[#list + 1] = i end
    rp.FilterDescendantsInstances = list
    pcall(function() rp.RespectCanCollide = true end)
    local r = WS:Raycast(Vector3.new(x, y + 4, z), Vector3.new(0, -30, 0), rp)
    return r and r.Position or nil
end
local function hipH(c)
    local hum = c:FindFirstChildOfClass("Humanoid")
    return ((hum and hum.HipHeight) or 2) + c.HumanoidRootPart.Size.Y / 2 + 0.2
end
local function grounded(c, secs)
    local hum = c:FindFirstChildOfClass("Humanoid")
    local t0 = now()
    while now() - t0 < secs do
        if hum and hum.FloorMaterial ~= Enum.Material.Air then return true end
        nap(0.05)
    end
    return false
end
local function teleport(c, pos, lookAt)
    local hrp = c.HumanoidRootPart
    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    hrp.CFrame = lookAt and CFrame.new(pos, Vector3.new(lookAt.X, pos.Y, lookAt.Z)) or CFrame.new(pos)
end
-- Stand ~3 studs HORIZONTALLY from the part, on real ground, never inside / on top of it.
local function standNear(part, prompt)
    local c = char()
    if not c or not part then return false end
    local pp = part.Position
    local off = math.clamp(math.max(part.Size.X, part.Size.Z) / 2 + 2.2, 3, 7)
    local md = (prompt and prompt.MaxActivationDistance) or 10
    if off > md - 2 then off = math.max(2.5, md - 2) end
    local dirs = {}
    local function add(v)
        v = Vector3.new(v.X, 0, v.Z)
        if v.Magnitude > 0.05 then dirs[#dirs + 1] = v.Unit end
    end
    local pc = plateCenter()
    if pc then add(pc - pp) end
    add(part.CFrame.LookVector) add(-part.CFrame.LookVector)
    add(part.CFrame.RightVector) add(-part.CFrame.RightVector)
    add(c.HumanoidRootPart.Position - pp)
    if #dirs == 0 then add(Vector3.new(0, 0, 1)) end
    local h, ok = hipH(c), false
    for _, d in ipairs(dirs) do
        local p = pp + d * off
        local g = groundPos(p.X, pp.Y, p.Z, { part })
        if g and math.abs(g.Y - pp.Y) < 14 then
            teleport(c, Vector3.new(p.X, g.Y + h, p.Z), pp)
            if grounded(c, 0.7) then ok = true break end
        end
    end
    if not ok then
        teleport(c, pp + dirs[1] * off + Vector3.new(0, 3, 0), pp)
        ok = grounded(c, 1)
    end
    nap(0.12)
    return ok
end
local function holdFire(p)
    if not p.Parent or not p.Enabled then return false end
    pcall(function() p:InputHoldBegin() end)
    nap(math.max(p.HoldDuration, 0) + 0.08)
    pcall(function() p:InputHoldEnd() end)
    return true
end
local function waitFor(cond, timeout)
    local t0 = now()
    while now() - t0 < timeout do
        if cond() then return true end
        nap(0.05)
    end
    return cond()
end
-- done(): effect observed. guard(): still safe to try the second method. skip2: do not try it at all.
-- Remembers which method works so later calls start with it.
local function activate(p, done, guard, skip2)
    local order = S.zapFirst and { "zap", "hold" } or { "hold", "zap" }
    for i, m in ipairs(order) do
        if i == 2 and (skip2 or not (p.Parent and p.Enabled and (not guard or guard()))) then break end
        local fired
        if m == "hold" then fired = holdFire(p)
        else fired = type(fireproximityprompt) == "function" and p.Parent ~= nil and p.Enabled and pcall(fireproximityprompt, p) end
        if fired and waitFor(done, 1.2) then
            S.zapFirst = (m == "zap")
            return true, m
        end
    end
    return false
end
---------------------------------------------------------------- actions
local function doBuy(forced)
    local bp = buyPrompt()
    if not bp or not bp.Enabled then note("buy: nothing on the pad") return false end
    local part = partOf(bp)
    if not part then note("buy: pad part missing") return false end
    S.lastBuyAt = now()
    local seq0, cash0 = EV.seq, cash()
    standNear(part, bp)
    if not bp.Enabled then note("buy aborted: pad emptied") return false end
    local id = identity()
    if not forced and id.state ~= "match" then
        note("buy aborted: " .. (id.text or "pad changed"))
        S.matchSince = nil
        return false
    end
    local want = id.info and id.info.name or (id.state == "match" and EV.name) or nil
    local function safe()
        return bp.Enabled and carriedName() == nil and (forced or identity().state == "match")
    end
    local ok, how = activate(bp, function()
        return carriedName() ~= nil or ((not bp.Enabled) and (forced or EV.seq == seq0))
    end, safe, cashShort() ~= nil)
    if ok then
        waitFor(function() return carriedName() ~= nil end, 0.8)
        local got = carriedName()
        local c1 = cash()
        S.holding, S.bought, S.cashFails = true, S.bought + 1, 0
        S.matchSince = nil
        EV.name, EV.rar, EV.at = nil, nil, now()
        note(("BOUGHT %s%s via %s"):format(got and prettyOf(key(got)) or (id.shown or "?"),
            (cash0 and c1) and (" for $" .. fmt(cash0 - c1)) or "", how))
        if got and want and key(got) ~= key(want) then
            note(("note: picked up %s, not %s"):format(got, want))
        end
        return true
    end
    S.cashFails = S.cashFails + 1
    S.noCashUntil = now() + math.min(8 * 2 ^ (S.cashFails - 1), 60)
    local pi = padInfo()
    note(("BUY REFUSED: cash short? have $%s, price %s"):format(fmt(cash()), (pi and pi.price) or "?"))
    return false
end

-- Nothing is ever waxed without checking the name in your hands first.
local function doPlace()
    local held = carriedName()
    if not held then
        S.holding = false
        note("place: hands are empty")
        return false
    end
    if not isTarget(held) then
        note(("REFUSED TO WAX %s - it is not ticked"):format(prettyOf(key(held))))
        return false
    end
    for attempt = 1, CFG.PlaceTries do
        local pp = nearestFree()
        if not pp then note("place: no free station") break end
        local part = partOf(pp)
        if part then
            standNear(part, pp)
            local still = carriedName()
            if not still then S.holding = false note("place: hands emptied on the way") return false end
            if not isTarget(still) then note("place: what I carry changed, not waxing it") return false end
            if pp.Enabled then
                local ok, how = activate(pp, function() return not pp.Enabled end, function() return pp.Enabled end)
                if ok then
                    S.holding, S.placed, S.placeFails = false, S.placed + 1, 0
                    S.carryBlind, S.attrStale = now() + 2.5, 0
                    EV.name, EV.rar, EV.at = nil, nil, now()
                    note(("WAXED %s #%d at %s via %s"):format(prettyOf(key(held)), S.placed, pp.Parent.Parent.Name, how))
                    return true
                end
            end
        end
        nap(0.25)
    end
    S.placeFails = S.placeFails + 1
    if carriedName() == nil then S.holding = false end
    note("PLACE FAILED (" .. S.placeFails .. ")")
    if S.placeFails >= 2 then
        S.capHit, S.running, S.capAt = true, false, now()
        S.capMsg = ("STOPPED: waxing %s failed twice with free stations (plate full at 100?)"):format(
            tostring(carriedName()))
        note(S.capMsg)
    end
    return false
end

-- Crates. The game opens the crate window by itself about two seconds after one is rolled;
-- this presses Open! when a ticked butter can come out of it, and Discard when none can.
local function isCrateName(n)
    return type(n) == "string" and n:lower():find("crate", 1, true) ~= nil
end
local function crateWanted(d)
    if type(d) ~= "table" then return false end
    local c = d.contents
    if type(c) == "table" and #c > 0 then
        for _, e in ipairs(c) do
            if type(e) == "table" and isTarget(e.butter) then return true, prettyOf(key(e.butter)) end
        end
        return false
    end
    local mem = d.rarity and CAT.members[d.rarity] -- no contents listed: judge by the rarity
    if mem then
        for _, k in ipairs(mem) do if CFG.Targets[k] then return true, prettyOf(k) end end
    end
    return false
end
local MINE = { SABFarmGui = 1, SABToggle = 1, SABError = 1 }
local function onScreen(g) -- visible, every ancestor visible, and not one of our own windows
    local o = g
    while o do
        if MINE[o.Name] then return false end
        if o:IsA("ScreenGui") then
            local ok, en = pcall(function() return o.Enabled end)
            return (not ok) or en ~= false
        end
        if o:IsA("GuiObject") and not o.Visible then return false end
        o = o.Parent
    end
    return false
end
local function crateButtons()
    local open, disc
    local gui = plr:FindFirstChildOfClass("PlayerGui")
    if not gui then return nil, nil end
    for _, g in ipairs(gui:GetDescendants()) do
        if g:IsA("TextButton") and onScreen(g) then
            local t = g.Text:lower():gsub("[^%a]", "")
            if t:sub(1, 4) == "open" then open = open or g end
            if t:sub(1, 7) == "discard" then disc = disc or g end
        end
    end
    return open, disc
end
-- press a button that belongs to the game's own window. Executors differ, so try each way.
local VIM = (function() local ok, v = pcall(function() return game:GetService("VirtualInputManager") end) return ok and v or nil end)()
local function tapGui(b, done)
    local ways = {}
    local function add(n) ways[#ways + 1] = n end
    if S.tapWay then add(S.tapWay) end
    for _, n in ipairs({ "conn", "signal", "touch" }) do
        if n ~= S.tapWay then add(n) end
    end
    for _, way in ipairs(ways) do
        local fired = false
        if way == "conn" and type(getconnections) == "function" then
            for _, sig in ipairs({ b.MouseButton1Click, b.Activated, b.MouseButton1Down }) do
                local ok, cons = pcall(getconnections, sig)
                if ok and type(cons) == "table" then
                    for _, c in ipairs(cons) do
                        if pcall(function() c:Fire() end) then fired = true end
                    end
                end
            end
        elseif way == "signal" and type(firesignal) == "function" then
            fired = pcall(firesignal, b.MouseButton1Click) or pcall(firesignal, b.Activated)
        elseif way == "touch" and VIM then
            fired = pcall(function()
                local p, sz = b.AbsolutePosition, b.AbsoluteSize
                local inset = 0
                local top = b:FindFirstAncestorWhichIsA("ScreenGui")
                local okIg, ignores = pcall(function() return top and top.IgnoreGuiInset end)
                if not (okIg and ignores) then
                    pcall(function() inset = game:GetService("GuiService"):GetGuiInset().Y end)
                end
                local x, y = p.X + sz.X / 2, p.Y + sz.Y / 2 + inset
                VIM:SendMouseButtonEvent(x, y, 0, true, game, 1)
                task.wait(0.06)
                VIM:SendMouseButtonEvent(x, y, 0, false, game, 1)
            end)
        end
        if fired and waitFor(done, 1.5) then
            S.tapWay = way
            return true, way
        end
    end
    return false
end
-- The window usually appears on its own a couple of seconds after the roll; if it has not,
-- press the pad prompt. This never decides anything, it only gets the window up so we can read it.
local function summonCrate()
    if CRATE.on then return true end
    local bp, pi = buyPrompt(), padInfo()
    if bp and bp.Enabled and pi and isCrateName(pi.name) then
        local part = partOf(bp)
        if part then standNear(part, bp) end
        activate(bp, function() return CRATE.on end)
    end
    if waitFor(function() return CRATE.on end, 2.5) then return true end
    CRATE.lastFail = now()
    note("crate: the window did not come up")
    return false
end
local function doCrate(open)
    if not summonCrate() then return false end
    local title = CRATE.title
    local ob, db = crateButtons()
    local b = open and ob or db
    if not b then
        CRATE.lastFail = now()
        S.crateFails = S.crateFails + 1
        note(("crate: no %s button found in %s"):format(open and "Open" or "Discard", title))
        return false
    end
    local held0 = carriedName()
    local ok, how = tapGui(b, function()
        return (not CRATE.on) or (carriedName() ~= nil and carriedName() ~= held0)
    end)
    if not ok then
        CRATE.lastFail = now()
        S.crateFails = S.crateFails + 1
        note("crate: could not press " .. (open and "Open" or "Discard") .. " (no working tap method)")
        return false
    end
    S.crateFails = 0
    if open then
        S.crates = S.crates + 1
        waitFor(function() return carriedName() ~= nil end, 1.5)
        local got = carriedName()
        note(("OPENED %s -> %s"):format(title, got and prettyOf(key(got)) or "?"))
    else
        note("discarded " .. title .. " (nothing ticked in it)")
    end
    return true
end

-- Selling an unwanted butter. A capture of the real game shows the client sends
-- SellSquishy:FireServer() with no arguments at all, so that is the first thing tried.
local SELLW = { "sell", "trash", "discard", "dispose", "bin" }
local function sellish(t)
    if type(t) ~= "string" then return false end
    t = t:lower()
    for _, w in ipairs(SELLW) do if t:find(w, 1, true) then return true end end
    return false
end
local function sellRemoteCall()
    local R = RS:FindFirstChild("Remotes")
    local r = R and R:FindFirstChild("SellSquishy")
    if not (r and r:IsA("RemoteEvent")) then return false end
    if not pcall(function() r:FireServer() end) then return false end
    return waitFor(function() return carriedName() == nil end, 1.5)
end
local function findSellSpot() -- backup: a prompt that says it sells
    if S.sellSpot and S.sellSpot.Parent then return S.sellSpot end
    if now() - S.sellSearchAt < 20 then return nil end
    S.sellSearchAt = now()
    local c = char()
    local hp = c and c.HumanoidRootPart.Position
    local best, bd
    for _, d in ipairs((S.plot or WS):GetDescendants()) do
        if d:IsA("ProximityPrompt") and (sellish(d.ActionText) or sellish(d.ObjectText) or sellish(d.Name)) then
            local pos = posOf(d)
            local dist = (pos and hp) and (pos - hp).Magnitude or 1e9
            if dist <= 400 and (not best or dist < bd) then best, bd = d, dist end
        end
    end
    S.sellSpot = best
    S.noSellSpot = (best == nil)
    return best
end
local function doSell()
    local held = carriedName()
    if not held then S.holding = false return false end
    if isTarget(held) then return false end -- never sell something you ticked
    local nice = prettyOf(key(held))
    if sellRemoteCall() then
        S.sold, S.holding, S.sellFails = S.sold + 1, false, 0
        S.carryBlind, S.attrStale = now() + 2.5, 0
        note("SOLD " .. nice)
        return true
    end
    local sp = findSellSpot()
    if sp then
        local part = partOf(sp)
        if part then
            standNear(part, sp)
            local still = carriedName()
            if still and not isTarget(still) then
                local ok, how = activate(sp, function() return carriedName() == nil end, function() return sp.Enabled end)
                if ok then
                    S.sold, S.holding, S.sellFails = S.sold + 1, false, 0
                    note(("SOLD %s at %s via %s"):format(nice, relPath(sp), how))
                    return true
                end
            end
        end
    end
    S.sellFails = S.sellFails + 1
    note("could not sell " .. nice .. " (" .. S.sellFails .. ")")
    return false
end

---- money collect
local PAD_BAD = { "bounce", "lift", "lever", "wheel", "holder", "waxstation", "squishystack", "shadow", "crate", "skin" }
local function scorePad(part)
    local path = relPath(part):lower()
    for _, b in ipairs(PAD_BAD) do if path:find(b, 1, true) then return 0 end end
    local nm, s = part.Name:lower(), 0
    local function has(str, w) return str:find(w, 1, true) ~= nil end
    if has(nm, "collect") then s = s + 60 end
    if has(nm, "cash") or has(nm, "money") then s = s + 45 end
    if has(nm, "income") or has(nm, "claim") then s = s + 35 end
    if has(nm, "coin") or has(nm, "earn") or has(nm, "green") then s = s + 20 end
    if nm == "pad" or nm == "touch" then s = s + 25 end
    if s == 0 and (has(path, "collect") or has(path, "cash") or has(path, "money")) then s = 25 end
    if s == 0 then return 0 end
    local c = part.Color
    if c.G > 0.5 and c.G > c.R * 1.4 and c.G > c.B * 1.4 then s = s + 15 end
    if math.min(part.Size.X, part.Size.Y, part.Size.Z) < 2 then s = s + 5 end
    return s
end
local function findPad()
    if S.padPart and S.padPart.Parent then return S.padPart end
    if not S.plot or now() - S.padSearchAt < 20 then return nil end
    S.padSearchAt = now()
    local cands, best, bs = {}, nil, 29
    for _, d in ipairs(S.plot:GetDescendants()) do
        if d:IsA("BasePart") then
            local s = scorePad(d)
            if s > 0 then
                cands[#cands + 1] = { s = s, p = d }
                if s > bs then best, bs = d, s end
            end
        end
    end
    table.sort(cands, function(a, b) return a.s > b.s end)
    S.padCands, S.padPart = cands, best
    if best then note("collect pad: " .. relPath(best) .. " (score " .. bs .. ")") end
    return best
end
local PAD_FILE = "SAB_pad_v1.txt"
local function savePad(cf)
    if type(writefile) == "function" then pcall(writefile, PAD_FILE, table.concat({ cf:GetComponents() }, ",")) end
end
local function loadPad()
    if type(isfile) ~= "function" or type(readfile) ~= "function" then return nil end
    local ok, s = pcall(function() if isfile(PAD_FILE) then return readfile(PAD_FILE) end end)
    if not ok or type(s) ~= "string" then return nil end
    local n = {}
    for x in s:gmatch("[^,]+") do n[#n + 1] = tonumber(x) end
    if #n == 12 then return CFrame.new(unpack(n)) end
end
local function stepOff(c, from, radius)
    local h = hipH(c)
    local hp = S.plot and S.plot:FindFirstChild("RolledSquishyPlaceHolder")
    local base = (hp and hp:IsA("BasePart")) and (hp.Position - from) or Vector3.new(1, 0, 0)
    base = Vector3.new(base.X, 0, base.Z)
    if base.Magnitude < 0.05 then base = Vector3.new(1, 0, 0) end
    base = base.Unit
    for i = 0, 7 do
        local a = i * math.pi / 4
        local d = Vector3.new(base.X * math.cos(a) - base.Z * math.sin(a), 0, base.X * math.sin(a) + base.Z * math.cos(a))
        local p = from + d * (radius + 5)
        local g = groundPos(p.X, from.Y, p.Z)
        if g and math.abs(g.Y - from.Y) < 8 then
            teleport(c, Vector3.new(p.X, g.Y + h, p.Z))
            if grounded(c, 0.7) then return true end
        end
    end
    return false
end
local function doCollect()
    S.lastCollect = now()
    local c = char()
    if not c then return end
    local hrp, h = c.HumanoidRootPart, hipH(c)
    local target, radius, touchPart, label = nil, 4, nil, "?"
    local holder = S.plot and S.plot:FindFirstChild("RolledSquishyPlaceHolder")
    if S.manualPad and holder and holder:IsA("BasePart") then
        target, label = (holder.CFrame * S.manualPad).Position, "manual pad"
    else
        local p = findPad()
        if p then
            target = Vector3.new(p.Position.X, p.Position.Y + p.Size.Y / 2 + h, p.Position.Z)
            radius, touchPart, label = math.max(p.Size.X, p.Size.Z) / 2, p, p.Name
        end
    end
    if not target then note("COLLECT: pad not found - stand on it and tap SET PAD") return end
    local cash0 = cash()
    teleport(c, target)
    if touchPart and type(firetouchinterest) == "function" then pcall(firetouchinterest, hrp, touchPart, 0) end
    nap(CFG.PadDwell)
    if touchPart and type(firetouchinterest) == "function" then pcall(firetouchinterest, hrp, touchPart, 1) end
    nap(0.5)
    S.collected = S.collected + 1
    local c1 = cash()
    note(("COLLECTED (%s) %s"):format(label, (cash0 and c1 and c1 > cash0) and ("+$" .. fmt(c1 - cash0)) or "no cash change seen"))
    stepOff(c, target, radius) -- leave the pad so the next visit is a fresh touch
end

---------------------------------------------------------------- decision
local function decide()
    if S.capHit then
        -- left alone with auto start on, try again now and then instead of staying stopped for ever
        if CFG.AutoStart and now() - (S.capAt or 0) > 300 then
            S.capHit, S.placeFails = false, 0
            note("trying again after being stopped for 5 minutes")
            setRunning(true, true)
        else
            return nil, S.capMsg, "bad"
        end
    end
    if S.busy then return nil, S.busyText, "ok" end
    if not char() then return nil, "waiting for character", "wait" end
    if not S.plot or not S.plot.Parent then
        S.plot, S.padPart, S.sellSpot = findPlot(), nil, nil
        if not S.plot then return nil, "own plot not found yet", "wait" end
    end
    if not next(CFG.Targets) then
        return nil, "nothing ticked - pick a butter in the BUTTERS tab", "bad"
    end
    -- a crate window blocks the whole roll loop until it is answered
    if CRATE.on and CFG.Crates then
        if S.crateFails >= 3 then -- this window is not one we can work: leave it to you
            CRATE.on = false
            note("ignoring the " .. CRATE.title .. " window - its buttons do not respond")
            return nil, ("%s window open - press Open or Discard yourself"):format(CRATE.title), "bad"
        end
        if now() - CRATE.lastFail < 8 then
            return nil, ("%s window open - could not press its buttons"):format(CRATE.title), "bad"
        end
        local want, which = crateWanted(CRATE.data)
        if want then return "crate", ("opening %s for %s"):format(CRATE.title, which), "ok" end
        if CFG.SellJunk then return "nocrate", ("discarding %s - nothing ticked inside"):format(CRATE.title), "warn" end
        return nil, ("%s open - nothing ticked inside it"):format(CRATE.title), "idle"
    end
    local free, total = freeCount()
    local held = carriedName()
    if held then
        local nice = prettyOf(key(held))
        if not isTarget(held) then -- bought by someone else, gifted, or left over: never wax it
            local why = (EV.gift and key(EV.gift) == key(held) and now() - EV.giftAt < 600) and "gift" or "not ticked"
            if not CFG.SellJunk then return nil, ("holding %s (%s) - selling is off"):format(nice, why), "bad" end
            if S.sellFails >= 3 then
                return nil, ("holding %s (%s) - selling is not working, tap SELL"):format(nice, why), "bad"
            end
            return "sell", ("selling %s (%s)"):format(nice, why), "warn"
        end
        if free < 1 then return nil, ("holding %s - 0 free stations"):format(nice), "wait" end
        return "place", ("waxing %s (%d free)"):format(nice, free), "ok"
    end
    S.holding = false
    if free < 1 then
        S.matchSince = nil
        return nil, ("0 free stations (%d/%d busy) - waiting for wax"):format(total, total), "wait"
    end
    local bp = buyPrompt()
    if not bp then return nil, "BuyPrompt of RolledSquishyPlaceHolder missing", "bad" end
    local pcr = padInfo()
    if pcr and isCrateName(pcr.name) then
        S.matchSince = nil
        if not CFG.Crates then return nil, ("%s on the pad - crate opening is off"):format(pcr.name), "idle" end
        if now() - CRATE.lastFail < 8 then return nil, ("%s on the pad - could not open it"):format(pcr.name), "bad" end
        return "cratewin", ("%s on the pad - opening its window"):format(pcr.name), "ok"
    end
    local id = identity()
    if id.state ~= "match" then
        S.matchSince = nil
        if id.state == "skip" and not bp.Enabled then return nil, id.text .. " (sold out)", "idle" end
        return nil, id.text, id.level
    end
    if not bp.Enabled then S.matchSince = nil return nil, "target on pad but Buy is off", "wait" end
    local t = now()
    if t < S.noCashUntil then
        local have, price = cashShort()
        if have then return nil, ("cash short: have $%s, price ~$%s"):format(fmt(have), fmt(price)), "bad" end
        return nil, ("cash short? have $%s - retry in %ds"):format(fmt(cash()), math.ceil(S.noCashUntil - t)), "bad"
    end
    if t - S.lastBuyAt < CFG.BuyGap then return nil, "cooldown after last buy", "wait" end
    S.matchSince = S.matchSince or t
    local w = t - S.matchSince
    if w < CFG.Confirm then return nil, ("confirming %s (%.2fs)"):format(id.shown, w), "ok" end
    return "buy", ("buying %s via %s"):format(id.shown, id.src), "ok"
end
local function runAction(label, fn, ...)
    if S.busy then return end
    S.busy, S.busyText = true, label
    local ok, e = pcall(fn, ...)
    S.busy, S.busyText = false, ""
    if not ok and e ~= KILLED then note("ERR " .. tostring(e)) end
end
local function step()
    local act, txt, lvl = decide()
    S.reason, S.level = txt, lvl
    if act == "place" then runAction("waxing...", doPlace)
    elseif act == "crate" then runAction("opening crate...", doCrate, true)
    elseif act == "cratewin" then runAction("checking crate...", summonCrate)
    elseif act == "nocrate" then runAction("discarding crate...", doCrate, false)
    elseif act == "sell" then runAction("selling...", doSell)
    elseif act == "buy" then runAction("buying...", doBuy, false)
    elseif CFG.Collect and not S.matchSince and now() - S.lastCollect >= CFG.Every then
        runAction("collecting money...", doCollect)
    end
end
local function setRunning(v, quiet)
    if v == S.running then return end
    S.running = v
    if not quiet then CFG.AutoStart = v end -- so saving the config remembers this
    if v then
        S.capHit, S.placeFails, S.cashFails, S.sellFails, S.crateFails = false, 0, 0, 0, 0
        CRATE.lastFail = 0
        S.noCashUntil, S.matchSince = 0, nil
        S.lastCollect = now()
        S.plot = findPlot() or S.plot
        note("START")
    else
        S.reason = "stopped"
        note("STOP")
    end
end

---------------------------------------------------------------- dump
local function dump()
    local L = {}
    local function p(s) L[#L + 1] = tostring(s) end
    p("=== SAB " .. VERSION .. " DUMP " .. os.date("%H:%M:%S") .. " ===")
    p(("running=%s busy=%s holding=%s capHit=%s uiErrs=%d zapFirst=%s"):format(tostring(S.running),
        tostring(S.busy), tostring(S.holding), tostring(S.capHit), S.uiErrs, tostring(S.zapFirst)))
    p("reason: " .. tostring(S.reason))
    p("targets: " .. table.concat(targetNames(), ", "))
    p(("bought=%d waxed=%d sold=%d collected=%d rolls=%d gifts=%d"):format(S.bought, S.placed, S.sold, S.collected, S.rolls, S.gifts))
    p("cash=" .. fmt(cash()))
    local held, inst = carriedName()
    p("in hands: " .. tostring(held) .. (inst and (" (" .. inst.ClassName .. ")") or "") ..
        "  via " .. tostring(S.carrySrc) .. "  blind=" .. string.format("%.1f", math.max(0, (S.carryBlind or 0) - now())))
    p("  attribute SquishyEquipped = " .. tostring(plr:GetAttribute("SquishyEquipped")))
    local hm = S.plot and S.plot:FindFirstChild("SquishyEquipped")
    p("  plot.SquishyEquipped = " .. (hm and (#hm:GetChildren() .. " children") or "missing"))
    local cc = plr.Character
    if cc then
        local names = {}
        for _, d in ipairs(cc:GetDescendants()) do
            if (d:IsA("Model") or d:IsA("Tool")) and d.Name ~= cc.Name then names[#names + 1] = d.ClassName .. ":" .. d.Name end
        end
        p("  on the character: " .. (table.concat(names, ", "):sub(1, 300)))
    end
    local pi = padInfo()
    p("on pad: " .. (pi and ("%s [%s] %s"):format(pi.name, tostring(pi.rar), tostring(pi.price)) or "nothing"))
    p("sell spot: " .. (S.sellSpot and relPath(S.sellSpot) or "none found"))
    local cob, cdb = crateButtons()
    p(("crate window: on=%s title=%s open=%s discard=%s tapWay=%s opened=%d fails=%d"):format(
        tostring(CRATE.on), CRATE.title, tostring(cob and cob.Text), tostring(cdb and cdb.Text),
        tostring(S.tapWay), S.crates, S.crateFails))
    p("tap tools: getconnections=" .. type(getconnections) .. " firesignal=" .. type(firesignal) .. " VIM=" .. tostring(VIM ~= nil))
    p("--- CATALOG (" .. CAT.n .. " butters, worst rarity first) ---")
    for _, r in ipairs(CAT.rarOrder) do
        local names = {}
        for _, k in ipairs(CAT.members[r] or {}) do
            names[#names + 1] = (CFG.Targets[k] and "*" or "") .. prettyOf(k)
        end
        p(("  [%s]%s %s"):format(r, LEARN.price[r] and (" crate $" .. fmt(LEARN.price[r])) or "", table.concat(names, ", ")))
    end
    p("learned orders: ")
    for r, o in pairs(LEARN.order) do p("  " .. r .. ": " .. table.concat(o, ", ")) end
    p("--- PLOT ---")
    p("plot=" .. (S.plot and S.plot:GetFullName() or "none"))
    if S.plot then
        for _, ch in ipairs(S.plot:GetChildren()) do
            p(("  %s %s (%d)"):format(ch.ClassName, ch.Name, #ch:GetChildren()))
        end
        local free, total = freeCount()
        p(("stations free %d / %d"):format(free, total))
        local bp = buyPrompt()
        p("BuyPrompt: " .. (bp and ("enabled=" .. tostring(bp.Enabled) .. " hold=" .. bp.HoldDuration) or "MISSING"))
    end
    p("autostart=" .. tostring(CFG.AutoStart) .. " rejoin=" .. tostring(CFG.Rejoin))
    p(("config=%s autoload=%s selfPath=%s hidden=%s"):format(tostring(S.config), tostring(S.autoload),
        tostring(S.selfPath), tostring(S.hidden)))
    p("file tools: writefile=" .. type(writefile) .. " listfiles=" .. type(listfiles) ..
        " queueonteleport=" .. type(queueonteleport) .. " configs=" .. #listConfigs())
    p("--- COLLECT PAD ---")
    p("manual=" .. tostring(S.manualPad ~= nil) .. " auto=" .. (S.padPart and relPath(S.padPart) or "none"))
    p("--- ATTRIBUTES ---")
    for _, k in ipairs({ "SquishyEquipped", "AutoRollOn", "AutoRollRules", "AutoRollStop", "BestRarity", "PlotNumber", "WaxStations", "IndexRows" }) do
        p(("  %s = %s"):format(k, tostring(plr:GetAttribute(k))))
    end
    p("--- EVENTS ---")
    for i = math.max(1, #evAll - 15), #evAll do p("  " .. evAll[i]) end
    p("--- LOG ---")
    for i = math.max(1, #logAll - 25), #logAll do p("  " .. logAll[i]) end
    return table.concat(L, "\n")
end


-- a config marked "load on launch" is applied before the window is built, so it opens where you left it
do
    local nm = readIf(F.auto)
    if type(nm) == "string" then
        nm = nm:gsub("%s+$", "")
        if nm ~= "" then
            S.autoload = nm
            local ok = loadConfig(nm)
            note(ok and ("loaded config " .. nm) or ("config " .. nm .. " could not be loaded"))
        end
    end
end

---------------------------------------------------------------- GUI (built before anything touches the game)
local C = {
    bg = Color3.fromRGB(16, 17, 22), panel = Color3.fromRGB(26, 28, 36), panel2 = Color3.fromRGB(38, 41, 52),
    line = Color3.fromRGB(52, 56, 70), text = Color3.fromRGB(236, 238, 244), dim = Color3.fromRGB(140, 146, 162),
    accent = Color3.fromRGB(88, 101, 242), good = Color3.fromRGB(46, 190, 115), warn = Color3.fromRGB(240, 170, 60),
    bad = Color3.fromRGB(235, 80, 80),
}
local LV = { ok = C.good, wait = C.warn, warn = C.warn, bad = C.bad, idle = C.dim }
local RC = { -- a colour per rarity, so the list reads like the game's own
    Common = Color3.fromRGB(170, 175, 185), Rare = Color3.fromRGB(80, 150, 245), Epic = Color3.fromRGB(175, 95, 240),
    Legendary = Color3.fromRGB(240, 190, 60), Mythic = Color3.fromRGB(240, 70, 140), Celestial = Color3.fromRGB(120, 150, 255),
    Divine = Color3.fromRGB(240, 130, 60), Dream = Color3.fromRGB(225, 200, 120), ["Sugar Rush"] = Color3.fromRGB(240, 110, 210),
    Picnic = Color3.fromRGB(240, 100, 90), Limited = Color3.fromRGB(235, 80, 80),
}
local function mk(class, props, parent)
    local ok, o = pcall(Instance.new, class)
    if not ok then S.uiErrs = S.uiErrs + 1 return nil end
    for k, v in pairs(props) do
        if not pcall(function() o[k] = v end) then S.uiErrs = S.uiErrs + 1 end
    end
    o.Parent = parent
    return o
end
local function round(o, r) mk("UICorner", { CornerRadius = UDim.new(0, r or 6) }, o) end
local U = {}
local pg = plr:FindFirstChildOfClass("PlayerGui") or plr:WaitForChild("PlayerGui")
local oldGui = pg:FindFirstChild("SABFarmGui")
if oldGui then oldGui:Destroy() end
local sg = mk("ScreenGui", { Name = "SABFarmGui", ResetOnSpawn = false, DisplayOrder = 999, IgnoreGuiInset = true }, pg)
local Z = { w = 320, h = 330, head = 30, strip = 38, tabs = 26 }
U.root = mk("Frame", { Name = "Root", Size = UDim2.new(0, Z.w, 0, Z.h),
    Position = UDim2.new(0, S.winPos and S.winPos[1] or 10, 0, S.winPos and S.winPos[2] or 44),
    BackgroundColor3 = C.bg, BorderSizePixel = 0, Active = true, ClipsDescendants = true }, sg)
round(U.root, 10)
mk("UIStroke", { Color = C.line, Thickness = 1 }, U.root)
local FILL = UDim2.new(1, 0, 1, 0)
local function at(x, w) return UDim2.new(x, 0, 0, 0), UDim2.new(w, (x + w > 0.99) and 0 or -4, 1, 0) end
local function button(parent, text, color, ts, pos, size)
    local b = mk("TextButton", { Text = text, Position = pos, Size = size, BackgroundColor3 = color, BorderSizePixel = 0,
        Font = Enum.Font.GothamBold, TextSize = ts, TextColor3 = C.text, AutoButtonColor = true }, parent)
    round(b, 6)
    return b
end
local function textbox(parent, text, ph, pos, size)
    local b = mk("TextBox", { Text = text, PlaceholderText = ph, Position = pos, Size = size, BackgroundColor3 = C.panel2,
        BorderSizePixel = 0, Font = Enum.Font.Gotham, TextSize = 13, TextColor3 = C.text, PlaceholderColor3 = C.dim,
        ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Left }, parent)
    round(b, 6)
    mk("UIPadding", { PaddingLeft = UDim.new(0, 8) }, b)
    return b
end
-- Phones rotate, and a spot that was fine in portrait can be off the bottom in landscape,
-- so every panel is pulled back inside the viewport whenever the screen changes shape.
local cam = WS.CurrentCamera
local function viewport()
    local ok, vp = pcall(function() return cam and cam.ViewportSize end)
    if ok and vp and vp.X > 50 and vp.Y > 50 then return vp end
end
local function clampIn(frame)
    local vp = viewport()
    if not (vp and frame and frame.Parent) then return end
    local ok = pcall(function()
        local ap, as = frame.AbsolutePosition, frame.AbsoluteSize
        local keep = 70 -- always leave this much of it reachable
        local x = math.clamp(ap.X, keep - as.X, vp.X - keep)
        local y = math.clamp(ap.Y, 0, vp.Y - math.min(as.Y, keep))
        if math.abs(x - ap.X) > 0.5 or math.abs(y - ap.Y) > 0.5 then
            frame.Position = UDim2.new(0, math.floor(x), 0, math.floor(y))
        end
    end)
    return ok
end
local function remember(frame)
    local ok, ap = pcall(function() return frame.AbsolutePosition end)
    if ok and ap then return { math.floor(ap.X), math.floor(ap.Y) } end
end
local dragging = {}
local function makeDraggable(handle, target, onDrop)
    track(handle.InputBegan:Connect(function(i)
        if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
        dragging[handle] = { start = i.Position, from = target.Position, moved = 0, target = target }
        local cn
        cn = i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End then
                local d = dragging[handle]
                dragging[handle] = nil
                if cn then cn:Disconnect() end
                if d and onDrop then onDrop(d.moved) end
            end
        end)
    end))
end
track(UIS.InputChanged:Connect(function(i)
    if i.UserInputType ~= Enum.UserInputType.MouseMovement and i.UserInputType ~= Enum.UserInputType.Touch then return end
    for h, d in pairs(dragging) do
        local tgt = d.target
        if tgt and tgt.Parent then
            local dx, dy = i.Position.X - d.start.X, i.Position.Y - d.start.Y
            d.moved = math.max(d.moved, math.abs(dx) + math.abs(dy))
            tgt.Position = UDim2.new(d.from.X.Scale, d.from.X.Offset + dx, d.from.Y.Scale, d.from.Y.Offset + dy)
        end
    end
end))
local function lbl(parent, text, ts, color, bold, pos, size)
    return mk("TextLabel", { Text = text, Position = pos or UDim2.new(0, 0, 0, 0), Size = size or FILL, BackgroundTransparency = 1,
        Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham, TextSize = ts, TextColor3 = color,
        TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true }, parent)
end
-- header
U.title = mk("Frame", { Size = UDim2.new(1, 0, 0, Z.head), BackgroundColor3 = C.panel, BorderSizePixel = 0, Active = true }, U.root)
U.dot = mk("Frame", { Size = UDim2.new(0, 9, 0, 9), Position = UDim2.new(0, 11, 0.5, -4), BackgroundColor3 = C.dim, BorderSizePixel = 0 }, U.title)
round(U.dot, 5)
lbl(U.title, "SAB  BUTTER FARM  " .. VERSION, 12, C.text, true, UDim2.new(0, 28, 0, 0), UDim2.new(1, -120, 1, 0))
U.minB = button(U.title, "-", C.panel2, 14, UDim2.new(1, -78, 0.5, -10), UDim2.new(0, 34, 0, 20))
U.xB = button(U.title, "X", C.bad, 12, UDim2.new(1, -40, 0.5, -10), UDim2.new(0, 34, 0, 20))
-- reason strip, always visible
U.strip = mk("Frame", { Position = UDim2.new(0, 0, 0, Z.head), Size = UDim2.new(1, 0, 0, Z.strip), BackgroundColor3 = C.bg, BorderSizePixel = 0 }, U.root)
U.bar = mk("Frame", { Size = UDim2.new(0, 4, 1, -10), Position = UDim2.new(0, 9, 0, 5), BackgroundColor3 = C.warn, BorderSizePixel = 0 }, U.strip)
round(U.bar, 2)
U.reason = lbl(U.strip, "starting", 12, C.text, false, UDim2.new(0, 20, 0, 2), UDim2.new(1, -28, 1, -4))
-- tabs
U.tabs = mk("Frame", { Position = UDim2.new(0, 0, 0, Z.head + Z.strip), Size = UDim2.new(1, 0, 0, Z.tabs), BackgroundTransparency = 1 }, U.root)
U.tabFarm = button(U.tabs, "FARM", C.accent, 11, UDim2.new(0, 8, 0, 0), UDim2.new(0.34, -10, 1, -4))
U.tabBut = button(U.tabs, "BUTTERS", C.panel2, 11, UDim2.new(0.34, 2, 0, 0), UDim2.new(0.33, -6, 1, -4))
U.tabSet = button(U.tabs, "SETUP", C.panel2, 11, UDim2.new(0.67, 2, 0, 0), UDim2.new(0.33, -10, 1, -4))
local function pane()
    local f = mk("ScrollingFrame", { Position = UDim2.new(0, 0, 0, Z.head + Z.strip + Z.tabs), Size = UDim2.new(1, 0, 1, -(Z.head + Z.strip + Z.tabs)),
        BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.line,
        CanvasSize = UDim2.new(0, 0, 0, 100) }, U.root)
    mk("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, f)
    mk("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 8) }, f)
    return f
end
U.farm, U.but, U.set = pane(), pane(), pane()
U.but.Visible, U.set.Visible = false, false

-- ---- FARM tab
local order, total, rw = 0, 12, nil
local function row(h, parent)
    order, total = order + 1, total + h + 6
    return mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = order }, parent or U.farm)
end
local function caption(t) lbl(row(14), t, 10, C.dim, true) end
rw = row(34)
U.startB = button(rw, "START", C.good, 14, at(0, 0.68))
U.killB = button(rw, "KILL", C.bad, 14, at(0.68, 0.32))
local r2 = row(42)
local function cell(i, cap, n)
    local f = mk("Frame", { Position = UDim2.new((i - 1) / n, 0, 0, 0), Size = UDim2.new(1 / n, i < n and -4 or 0, 1, 0),
        BackgroundColor3 = C.panel, BorderSizePixel = 0 }, r2)
    round(f, 6)
    local v = lbl(f, "0", 15, C.text, true, UDim2.new(0, 0, 0, 3), UDim2.new(1, 0, 0, 21))
    local c = lbl(f, cap, 9, C.dim, false, UDim2.new(0, 0, 0, 24), UDim2.new(1, 0, 0, 14))
    v.TextXAlignment, c.TextXAlignment = Enum.TextXAlignment.Center, Enum.TextXAlignment.Center
    return v
end
U.sBought, U.sPlaced, U.sSold, U.sColl, U.sFree = cell(1, "BOUGHT", 5), cell(2, "WAXED", 5), cell(3, "SOLD", 5), cell(4, "MONEY", 5), cell(5, "FREE", 5)
U.info = lbl(row(40), "", 10, C.dim, false)
U.tgt = lbl(row(26), "", 10, C.good, false)
caption("MONEY COLLECT")
rw = row(28)
U.secB = textbox(rw, tostring(CFG.Every), "60", at(0, 0.2))
lbl(rw, "sec", 11, C.dim, false, at(0.21, 0.09))
U.secSet = button(rw, "SET", C.accent, 12, at(0.3, 0.2))
U.colT = button(rw, "COLLECT: ON", C.accent, 11, at(0.5, 0.5))
rw = row(26)
U.padB = button(rw, "SET PAD (stand on it)", C.panel2, 10, at(0, 0.55))
U.padL = lbl(rw, "", 10, C.dim, false, at(0.56, 0.44))
caption("BUTTERS YOU DID NOT TICK, AND CRATES")
rw = row(28)
U.sellT = button(rw, "SELL THEM: ON", C.accent, 11, at(0, 0.55))
U.sellB = button(rw, "SELL NOW", C.warn, 11, at(0.55, 0.45))
rw = row(28)
U.crateT = button(rw, "OPEN CRATES: ON", C.accent, 11, at(0, 0.55))
U.crateB = button(rw, "OPEN NOW", C.warn, 11, at(0.55, 0.45))
caption("TOOLS")
rw = row(30)
U.buyB = button(rw, "BUY NOW", C.warn, 11, at(0, 0.28))
U.plB = button(rw, "WAX", C.good, 11, at(0.28, 0.24))
U.dumpB = button(rw, "DUMP", C.accent, 11, at(0.52, 0.24))
U.copyB = button(rw, "COPY", C.panel2, 11, at(0.76, 0.24))
caption("LOG")
U.log = mk("TextLabel", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0, Font = Enum.Font.Code,
    TextSize = 10, TextColor3 = C.text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true, Text = "" }, row(84))
round(U.log, 6)
mk("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingTop = UDim.new(0, 4), PaddingRight = UDim.new(0, 6) }, U.log)
caption("OUTPUT  (DUMP result)")
U.out = mk("TextBox", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0, Font = Enum.Font.Code,
    TextSize = 9, TextColor3 = Color3.fromRGB(190, 205, 170), TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, MultiLine = true, ClearTextOnFocus = false,
    Text = "DUMP output appears here. Tap COPY to put it on the clipboard." }, row(110))
round(U.out, 6)
U.farm.CanvasSize = UDim2.new(0, 0, 0, total)

-- ---- SETUP tab
order, total = 0, 12
local function srow(h) return row(h, U.set) end
local function scap(t) lbl(srow(14), t, 10, C.dim, true) end
scap("SETTINGS FILE  (saved on your phone)")
rw = srow(28)
U.cfgName = textbox(rw, "default", "config name", at(0, 0.5))
U.cfgSave = button(rw, "SAVE", C.good, 11, at(0.5, 0.25))
U.cfgLoad = button(rw, "LOAD", C.accent, 11, at(0.75, 0.25))
rw = srow(26)
U.cfgPrev = button(rw, "<", C.panel2, 11, at(0, 0.13))
U.cfgPick = button(rw, "(none saved)", C.panel2, 10, at(0.13, 0.74))
U.cfgNext = button(rw, ">", C.panel2, 11, at(0.87, 0.13))
rw = srow(26)
U.cfgAuto = button(rw, "LOAD IT ON LAUNCH: OFF", C.panel2, 10, at(0, 1))
U.cfgMsg = lbl(srow(26), "", 10, C.dim, false)
scap("START BY ITSELF")
rw = srow(26)
U.autoB = button(rw, "INSTALL F.exec", C.accent, 10, at(0, 1))
U.autoMsg = lbl(srow(30), "", 10, C.dim, false)
rw = srow(28)
U.startT = button(rw, "START FARMING ON LOAD: ON", C.accent, 10, at(0, 1))
lbl(srow(26), "Pressing START or STOP also sets this, so saving the config keeps whatever you were doing.", 10, C.dim, false)
scap("IF THE GAME DROPS ME")
rw = srow(28)
U.rejT = button(rw, "AUTO REJOIN: ON", C.accent, 11, at(0, 0.55))
U.rejB = button(rw, "REJOIN NOW", C.warn, 11, at(0.55, 0.45))
U.rejMsg = lbl(srow(30), "", 10, C.dim, false)
scap("THE ROUND SAB BUTTON")
lbl(srow(30), "Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.", 10, C.dim, false)
U.set.CanvasSize = UDim2.new(0, 0, 0, total)

-- ---- the floating button: hides and brings back the whole window, drag it anywhere
local tg = mk("ScreenGui", { Name = "SABToggle", ResetOnSpawn = false, DisplayOrder = 1000, IgnoreGuiInset = true }, pg)
U.tgRoot = mk("Frame", { Size = UDim2.new(0, 52, 0, 52),
    Position = S.togPos and UDim2.new(0, S.togPos[1], 0, S.togPos[2]) or UDim2.new(0, 10, 0.45, -26),
    BackgroundColor3 = C.accent, BorderSizePixel = 0, Active = true }, tg)
round(U.tgRoot, 26)
mk("UIStroke", { Color = C.line, Thickness = 1 }, U.tgRoot)
U.tgBtn = mk("TextButton", { Text = "SAB", Size = FILL, BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
    TextSize = 13, TextColor3 = C.text, AutoButtonColor = false }, U.tgRoot)
U.tgDot = mk("Frame", { Size = UDim2.new(0, 8, 0, 8), Position = UDim2.new(1, -11, 0, 3), BackgroundColor3 = C.dim,
    BorderSizePixel = 0 }, U.tgRoot)
round(U.tgDot, 4)

-- ---- BUTTERS tab: worst at the top, best at the bottom, built the first time you open it
local LST = { built = false, boxes = {}, at = 0 }
local function setTick(k, on)
    CFG.Targets[k] = on or nil
    local b = LST.boxes[k]
    if b then
        b.Text = on and "X" or ""
        b.BackgroundColor3 = on and C.good or C.panel2
    end
end
local function refreshTicks()
    for k, b in pairs(LST.boxes) do
        local on = CFG.Targets[k] == true
        b.Text = on and "X" or ""
        b.BackgroundColor3 = on and C.good or C.panel2
    end
end
local buildList
local function butHead()
    local n = 0
    local f = mk("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, LayoutOrder = 1 }, U.but)
    U.butInfo = lbl(f, "", 10, C.dim, false, at(0, 0.5))
    local cl = button(f, "CLEAR", C.panel2, 10, at(0.5, 0.24))
    local rf = button(f, "REFRESH", C.panel2, 10, at(0.74, 0.26))
    cl.MouseButton1Click:Connect(function()
        for k in pairs(CFG.Targets) do CFG.Targets[k] = nil end
        refreshTicks()
    end)
    rf.MouseButton1Click:Connect(function()
        CAT.at = 0
        catReady()
        buildList(true)
    end)
    return n
end
buildList = function(force)
    if not catReady() then
        if not U.butEmpty then
            U.butEmpty = lbl(mk("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, LayoutOrder = 2 }, U.but),
                "butter list not loaded yet - open this tab again in a moment", 11, C.warn, false)
        end
        return
    end
    if LST.built and not force and LST.at == CAT.at then return end
    for _, ch in ipairs(U.but:GetChildren()) do
        if ch:IsA("Frame") or ch:IsA("TextButton") then ch:Destroy() end
    end
    LST.boxes, U.butEmpty = {}, nil
    butHead()
    local y, ord = 36, 1
    local function add(h)
        ord = ord + 1
        local f = mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = ord }, U.but)
        y = y + h + 6
        return f
    end
    for _, r in ipairs(CAT.rarOrder) do
        local hf = add(24)
        local col = RC[r] or C.text
        local hb = mk("Frame", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0 }, hf)
        round(hb, 6)
        lbl(hb, "  " .. r:upper(), 11, col, true, UDim2.new(0, 4, 0, 0), UDim2.new(1, -70, 1, 0))
        local allB = button(hb, "ALL", C.panel2, 9, UDim2.new(1, -62, 0.5, -9), UDim2.new(0, 56, 0, 18))
        local rr = r
        allB.MouseButton1Click:Connect(function()
            local list = CAT.members[rr] or {}
            local anyOff = false
            for _, k in ipairs(list) do if not CFG.Targets[k] then anyOff = true break end end
            for _, k in ipairs(list) do setTick(k, anyOff) end
        end)
        for _, k in ipairs(CAT.members[r] or {}) do
            local rf2 = add(22)
            local b = mk("TextButton", { Text = "", Size = FILL, BackgroundColor3 = C.bg, BorderSizePixel = 0,
                AutoButtonColor = true }, rf2)
            round(b, 5)
            lbl(b, "   " .. prettyOf(k), 11, C.text, false, UDim2.new(0, 4, 0, 0), UDim2.new(1, -40, 1, 0))
            local tick = mk("TextButton", { Text = "", Size = UDim2.new(0, 22, 0, 16), Position = UDim2.new(1, -28, 0.5, -8),
                BackgroundColor3 = C.panel2, BorderSizePixel = 0, Font = Enum.Font.GothamBold, TextSize = 10,
                TextColor3 = C.text, AutoButtonColor = false }, b)
            round(tick, 4)
            LST.boxes[k] = tick
            local kk = k
            local function toggle() setTick(kk, not CFG.Targets[kk]) end
            b.MouseButton1Click:Connect(toggle)
            tick.MouseButton1Click:Connect(toggle)
        end
    end
    refreshTicks()
    U.but.CanvasSize = UDim2.new(0, 0, 0, y + 10)
    LST.built, LST.at = true, CAT.at
end
local tab = "farm"
local function showTab(which)
    tab = which
    U.farm.Visible, U.but.Visible, U.set.Visible = (which == "farm"), (which == "but"), (which == "set")
    U.tabFarm.BackgroundColor3 = (which == "farm") and C.accent or C.panel2
    U.tabBut.BackgroundColor3 = (which == "but") and C.accent or C.panel2
    U.tabSet.BackgroundColor3 = (which == "set") and C.accent or C.panel2
    if which == "but" then buildList(false) end
end

---------------------------------------------------------------- button handlers
local function setToggle(b, on, onText, offText)
    b.Text = on and onText or offText
    b.BackgroundColor3 = on and C.accent or C.panel2
end
-- put a config that was just loaded onto the controls
local function applyLoaded()
    U.secB.Text = tostring(CFG.Every)
    setToggle(U.colT, CFG.Collect, "COLLECT: ON", "COLLECT: OFF")
    setToggle(U.sellT, CFG.SellJunk, "SELL THEM: ON", "SELL THEM: OFF")
    setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
    setToggle(U.rejT, CFG.Rejoin, "AUTO REJOIN: ON", "AUTO REJOIN: OFF")
    setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
    if CFG.AutoStart ~= S.running then setRunning(CFG.AutoStart, true) end -- a loaded config that was running starts again
    if S.winPos then U.root.Position = UDim2.new(0, S.winPos[1], 0, S.winPos[2]) end
    if S.togPos then U.tgRoot.Position = UDim2.new(0, S.togPos[1], 0, S.togPos[2]) end
    clampIn(U.root)
    clampIn(U.tgRoot)
    S.lastCollect = now()
    refreshTicks()
end
local function flash(box)
    task.spawn(function()
        box.TextColor3 = C.bad
        task.wait(0.8)
        if S.alive then box.TextColor3 = C.text end
    end)
end
local function applyInterval()
    local t = U.secB.Text:match("^%s*(%d+)%s*$")
    local n = t and tonumber(t)
    if not n or n < 1 then
        U.secB.Text = tostring(CFG.Every) flash(U.secB)
        note("interval must be a whole number >= 1")
        return
    end
    if n == CFG.Every then return end
    CFG.Every, S.lastCollect = n, now()
    note("collect every " .. n .. "s")
end
local function clip(txt)
    local sc = setclipboard or toclipboard
    return type(sc) == "function" and pcall(sc, txt)
end
local function copyOut()
    local txt = lastDump ~= "" and lastDump or (S.reason .. "\n" .. table.concat(logAll, "\n"))
    if clip(txt) then note("copied " .. #txt .. " chars") return end
    U.out.Text = txt
    pcall(function() U.out:CaptureFocus() end)
    note("no clipboard here - select the text in OUTPUT")
end
local function doDump()
    local ok, r = pcall(dump)
    lastDump = ok and r or ("DUMP ERROR " .. tostring(r))
    local copied = clip(lastDump)
    U.out.Text = (copied and #lastDump > 7000) and (lastDump:sub(1, 7000) .. "\n... (full text is on your clipboard)") or lastDump
    note("DUMP " .. #lastDump .. " chars" .. (copied and ", copied" or ""))
end
local function click(b, fn) track(b.MouseButton1Click:Connect(fn)) end
click(U.secSet, applyInterval)
track(U.secB.FocusLost:Connect(applyInterval))
click(U.colT, function()
    CFG.Collect, S.lastCollect = not CFG.Collect, now()
    setToggle(U.colT, CFG.Collect, "COLLECT: ON", "COLLECT: OFF")
end)
click(U.sellT, function()
    CFG.SellJunk = not CFG.SellJunk
    setToggle(U.sellT, CFG.SellJunk, "SELL THEM: ON", "SELL THEM: OFF")
end)
click(U.sellB, function()
    S.sellFails = 0
    task.spawn(runAction, "selling...", doSell)
end)
click(U.crateT, function()
    CFG.Crates = not CFG.Crates
    setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
end)
click(U.crateB, function()
    CRATE.lastFail = 0
    task.spawn(runAction, "opening crate...", doCrate, true)
end)
click(U.padB, function()
    S.plot = findPlot() or S.plot
    local c, h = char(), S.plot and S.plot:FindFirstChild("RolledSquishyPlaceHolder")
    if not (c and h and h:IsA("BasePart")) then note("SET PAD: need character and plot") return end
    S.manualPad = h.CFrame:ToObjectSpace(c.HumanoidRootPart.CFrame)
    savePad(S.manualPad)
    note("collect pad saved at your position")
end)
click(U.startB, function() setRunning(not S.running) end)
click(U.buyB, function()
    S.plot = findPlot() or S.plot
    task.spawn(runAction, "buying (manual)...", doBuy, true)
end)
click(U.plB, function()
    S.plot = findPlot() or S.plot
    task.spawn(runAction, "waxing (manual)...", doPlace)
end)
click(U.dumpB, doDump)
click(U.copyB, copyOut)
click(U.tabFarm, function() showTab("farm") end)
click(U.tabBut, function() showTab("but") end)
click(U.tabSet, function() showTab("set") end)

-- the floating button: tap to hide or show, drag to move
local function setHidden(v)
    S.hidden = v
    U.root.Visible = not v
    U.tgBtn.Text = v and "SAB+" or "SAB"
end
makeDraggable(U.tgRoot, U.tgRoot, function(moved)
    clampIn(U.tgRoot)
    S.togPos = remember(U.tgRoot) or S.togPos
    if moved < 8 then setHidden(not S.hidden) end -- a tap, not a drag
end)
click(U.tgBtn, function() setHidden(not S.hidden) end)

-- configs
local picks, pick = {}, 0
local function refreshPicks()
    picks = listConfigs()
    if #picks == 0 then
        U.cfgPick.Text = "(none saved)"
        pick = 0
        return
    end
    if pick < 1 or pick > #picks then pick = 1 end
    U.cfgPick.Text = picks[pick] .. ("  (%d/%d)"):format(pick, #picks)
end
local function setAutoBtn()
    local on = S.autoload ~= nil
    U.cfgAuto.Text = on and ("LOAD IT ON LAUNCH: " .. S.autoload) or "LOAD IT ON LAUNCH: OFF"
    U.cfgAuto.BackgroundColor3 = on and C.accent or C.panel2
end
-- the name in the box wins; the arrows just fill the box in for you
local function currentName()
    local n = U.cfgName.Text:gsub("^%s+", ""):gsub("%s+$", "")
    if n ~= "" then return n end
    return (pick > 0 and picks[pick]) or ""
end
click(U.cfgSave, function()
    S.winPos = remember(U.root) or S.winPos
    S.togPos = remember(U.tgRoot) or S.togPos
    local ok, msg = saveConfig(currentName())
    U.cfgMsg.Text = ok and ("saved as " .. msg) or ("could not save: " .. msg)
    U.cfgMsg.TextColor3 = ok and C.good or C.bad
    refreshPicks()
    note(U.cfgMsg.Text)
end)
local function doLoad(name)
    local ok, msg = loadConfig(name)
    U.cfgMsg.Text = ok and ("loaded " .. msg) or ("could not load: " .. msg)
    U.cfgMsg.TextColor3 = ok and C.good or C.bad
    if ok then
        U.cfgName.Text = name
        applyLoaded()
    end
    note(U.cfgMsg.Text)
end
click(U.cfgLoad, function() doLoad(currentName()) end)
click(U.cfgPick, function()
    refreshPicks()
    if pick > 0 then U.cfgName.Text = picks[pick] end
end)
click(U.cfgPrev, function()
    if #picks == 0 then refreshPicks() return end
    pick = (pick - 2) % #picks + 1
    refreshPicks()
    U.cfgName.Text = picks[pick]
end)
click(U.cfgNext, function()
    if #picks == 0 then refreshPicks() return end
    pick = pick % #picks + 1
    refreshPicks()
    U.cfgName.Text = picks[pick]
end)
click(U.cfgAuto, function()
    if S.autoload then
        setAutoload(nil)
        U.cfgMsg.Text = "it will not load a config on launch"
    else
        local n = currentName()
        local known = false
        for _, c in ipairs(listConfigs()) do if c == n then known = true end end
        local ok = known or saveConfig(n) -- never overwrite a config you already saved
        if ok and n ~= "" then
            setAutoload(n)
            refreshPicks()
            U.cfgMsg.Text = n .. " will load every time the script starts"
        else
            U.cfgMsg.Text = "name the config and save it first"
        end
    end
    U.cfgMsg.TextColor3 = C.dim
    setAutoBtn()
end)
-- start by itself
click(U.autoB, function()
    local ok, msg = installAutoexec()
    U.autoMsg.Text = ok and ("installed. " .. msg) or ("failed: " .. msg)
    U.autoMsg.TextColor3 = ok and C.good or C.bad
    note(U.autoMsg.Text)
end)
-- rejoining
click(U.startT, function()
    CFG.AutoStart = not CFG.AutoStart
    setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
end)
click(U.rejT, function()
    CFG.Rejoin = not CFG.Rejoin
    setToggle(U.rejT, CFG.Rejoin, "AUTO REJOIN: ON", "AUTO REJOIN: OFF")
end)
click(U.rejB, function() rejoin("you asked") end)
local minimized = false
click(U.minB, function()
    minimized = not minimized
    U.tabs.Visible = not minimized
    if minimized then
        U.farm.Visible, U.but.Visible, U.set.Visible = false, false, false
    else
        showTab(tab)
    end
    U.root.Size = UDim2.new(0, Z.w, 0, minimized and (Z.head + Z.strip) or Z.h)
    U.minB.Text = minimized and "+" or "-"
end)
-- KILL: stops both loops and any action in progress, disconnects every event, removes the window
local function kill()
    if not S.alive then return end
    S.alive, S.running = false, false
    pcall(saveLearn)
    for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
    pcall(function() sg:Destroy() end)
    pcall(function() tg:Destroy() end)
    if genv.SAB_KILL == kill then genv.SAB_KILL = nil end
end
genv.SAB_KILL = kill
click(U.killB, kill)
click(U.xB, kill)
-- drag the window by its header, and remember where you left it
makeDraggable(U.title, U.root, function()
    clampIn(U.root)
    S.winPos = remember(U.root) or S.winPos
end)

---------------------------------------------------------------- loops (the window already exists at this point)
local function refresh()
    local txt, lvl = S.reason, S.level
    if S.busy then
        txt, lvl = S.busyText, "ok"
    elseif not S.running then
        local _, t2, l2 = decide()
        if S.capHit then txt, lvl = t2, "bad" else txt, lvl = "[stopped] " .. t2, (l2 == "bad") and "bad" or "idle" end
        S.reason, S.level = txt, lvl
    end
    U.reason.Text = txt
    U.bar.BackgroundColor3 = LV[lvl] or C.dim
    U.dot.BackgroundColor3 = S.running and C.good or (S.capHit and C.bad or C.dim)
    U.tgDot.BackgroundColor3 = U.dot.BackgroundColor3
    U.tgRoot.BackgroundColor3 = S.hidden and C.panel2 or C.accent
    U.startB.Text = S.running and "STOP" or "START"
    setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
    U.startB.BackgroundColor3 = S.running and C.warn or C.good
    local free, total2 = freeCount()
    U.sBought.Text, U.sPlaced.Text, U.sSold.Text = tostring(S.bought), tostring(S.placed), tostring(S.sold)
    U.sColl.Text, U.sFree.Text = tostring(S.collected), free .. "/" .. total2
    local nxt = (S.running and CFG.Collect) and math.max(0, math.ceil(CFG.Every - (now() - S.lastCollect))) or nil
    local held = carriedName()
    U.info.Text = ("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
        fmt(cash()), S.rolls, S.gifts, S.crates, held and prettyOf(key(held)) or "nothing",
        CRATE.on and ("   [" .. CRATE.title .. " window open]") or "",
        nxt and ("in " .. nxt .. "s") or "off")
    local tn = targetNames()
    U.tgt.Text = (#tn == 0) and "NOTHING TICKED - open the BUTTERS tab"
        or ("buying: " .. ((#tn <= 3) and table.concat(tn, ", ") or (#tn .. " butters ticked")))
    U.tgt.TextColor3 = (#tn == 0) and C.bad or C.good
    U.padL.Text = S.manualPad and "pad: saved" or (S.padPart and ("auto: " .. S.padPart.Name) or "pad: not found")
    U.log.Text = table.concat(logs, "\n")
    if U.butInfo then
        U.butInfo.Text = ("%d butters, %d rarities\n%d ticked"):format(CAT.n, #CAT.rarOrder, #tn)
    end
    if U.but.Visible and LST.at ~= CAT.at then buildList(false) end
end
genv.SAB = { S = S, CFG = CFG, EV = EV, U = U, sg = sg, dump = dump, CAT = CAT, LEARN = LEARN, buildList = buildList }
note(VERSION .. " loaded")
if S.uiErrs > 0 then note("UI: " .. S.uiErrs .. " properties skipped") end
showTab("farm")
clampIn(U.root)
clampIn(U.tgRoot)
if cam then
    pcall(function()
        track(cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
            task.wait(0.2) -- let the new size settle before measuring
            clampIn(U.root)
            clampIn(U.tgRoot)
        end))
    end)
end
refreshPicks()
setAutoBtn()
if S.config and S.config ~= "" then U.cfgName.Text = S.config end
setToggle(U.colT, CFG.Collect, "COLLECT: ON", "COLLECT: OFF")
setToggle(U.sellT, CFG.SellJunk, "SELL THEM: ON", "SELL THEM: OFF")
setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
setToggle(U.rejT, CFG.Rejoin, "AUTO REJOIN: ON", "AUTO REJOIN: OFF")
setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
U.secB.Text = tostring(CFG.Every)
pcall(refresh)
task.spawn(function()
    local p = findSelfPath()
    U.rejMsg.Text = p and ("after a rejoin it restarts from\n" .. p) or
        "no saved copy of this script found, so after a rejoin you would start it by hand"
    U.autoMsg.Text = (readIf(F.exec) ~= nil) and "autoexec loader is installed" or "not installed yet"
    pcall(watchDisconnect)
end)
task.spawn(function()
    while S.alive do
        local ok, e = pcall(refresh)
        if not ok then note("UI ERR " .. tostring(e)) end
        task.wait(0.25)
    end
end)
task.spawn(function()
    local ok, e = pcall(hookRemotes)
    if not ok then note("HOOK ERR " .. tostring(e)) end
end)
task.spawn(function()
    pcall(loadLearn)
    if catReady() then note(("catalog: %d butters in %d rarities"):format(CAT.n, #CAT.rarOrder)) end
    local ok, cf = pcall(loadPad)
    if ok and cf and S.alive and not S.manualPad then S.manualPad = cf end
end)
task.spawn(function() -- keep what the crates taught us
    while S.alive do
        task.wait(20)
        pcall(saveLearn)
    end
end)
if VU then
    track(plr.Idled:Connect(function() pcall(function() VU:CaptureController() VU:ClickButton2(Vector2.new()) end) end))
end
task.spawn(function() -- start by myself, once the character and the plot exist
    if not CFG.AutoStart then return end
    S.reason, S.level = "waiting for the game to load, then starting", "wait"
    for _ = 1, 120 do
        if not S.alive then return end
        if S.running then return end -- you got there first
        S.plot = S.plot or findPlot()
        if char() and S.plot and next(CFG.Targets) then
            setRunning(true, true)
            note("started by itself")
            return
        end
        task.wait(1)
    end
    if S.alive and not S.running then note("gave up waiting to start - tap START") end
end)
task.spawn(function() -- the farm loop
    S.plot = findPlot()
    S.lastCollect = now()
    while S.alive do
        if S.running then
            local ok, e = pcall(step)
            if not ok and e ~= KILLED then note("LOOP ERR " .. tostring(e)) end
        end
        task.wait(0.1)
    end
end)
toast("loaded - window is at the top left")
end -- main

local okMain, errMain = xpcall(main, function(e) return tostring(e) .. "\n" .. debug.traceback() end)
if not okMain then
    pcall(function() warn("SAB " .. VERSION .. " ERROR: " .. tostring(errMain)) end)
    toast("ERROR while starting - see the red box")
    pcall(function() setclipboard("SAB " .. VERSION .. " ERROR: " .. tostring(errMain)) end)
    pcall(function()
        local genv = (type(getgenv) == "function" and getgenv()) or _G
        if type(genv.SAB_KILL) == "function" then genv.SAB_KILL() end
        for _, n in ipairs({ "SABFarmGui", "SABToggle" }) do
            local half = plr.PlayerGui:FindFirstChild(n)
            if half then half:Destroy() end
        end
    end)
    pcall(function()
        local g = Instance.new("ScreenGui")
        g.Name = "SABError"
        g.ResetOnSpawn = false
        g.DisplayOrder = 1000
        local b = Instance.new("TextBox")
        b.Size = UDim2.new(0, 340, 0, 170)
        b.Position = UDim2.new(0, 10, 0, 50)
        b.BackgroundColor3 = Color3.fromRGB(90, 20, 20)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.TextSize = 11
        b.TextWrapped = true
        b.ClearTextOnFocus = false
        b.TextXAlignment = Enum.TextXAlignment.Left
        b.TextYAlignment = Enum.TextYAlignment.Top
        b.Text = "SAB " .. VERSION .. " failed to start. Send this text:\n" .. tostring(errMain)
        b.Parent = g
        g.Parent = plr:WaitForChild("PlayerGui")
    end)
end
-- END OF SCRIPT (if this line is missing after pasting, the paste was cut off)
