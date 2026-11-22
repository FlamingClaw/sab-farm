-- SAB BUTTER FARM v25 | Delta / Android
-- Reacts to the Auto Roll pass. It never rolls and never touches the Limited holder.
-- It buys ONLY the butters ticked in the BUTTERS tab, and it checks what is actually
-- in your hands before waxing anything, so a butter someone gifts you is never placed.
local VERSION = "v26"
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
    Crates = true,                 -- master switch: open the crates ticked in the CRATES tab
    CrateTicks = { picniccrate = true }, -- set of crate keys; anything not ticked is left alone
    Rejoin = true,                 -- come back by myself after a disconnect or a restart
    AutoStart = true,              -- start farming as soon as the script loads, with no tap
    AutoRoll = false,              -- keep the game's Auto Roll pass switched on (it resets to off on join)
    ARrules = "", ARstop = "",     -- your Auto Roll choices, put back after a rejoin
    Confirm = 0.35,                -- match must hold this long before buying
    BuyGap = 1.2, PlaceTries = 3, PadDwell = 0.7,
    PetBuy = false, PetWish = false, -- PETS tab master switches
    Pets = {},                     -- Pets[PetName] = { b = adopt it, g = Big only, w = keep a wish on it, f = Big goal }
    AutoFuse = false,              -- fuse copies into Bigs as soon as a pet's goal can use them
    AutoBuild = false,             -- work the role teams out again from your pets after fuses / new pets
    Teams = false,                 -- TEAMS tab: switch saved pet teams by itself
    TeamNormal = "", TeamFull = "", TeamGlaze = "", TeamWax = "", GlazeLead = 45,
    Lite = false, HideHud = false, NoRender = false, FpsCap = 0, -- SETUP tab: smoother running
    Calm = false,                  -- NO ANIMATIONS: switch off the game's own per-frame eye candy (stack squish, glaze rainbow...)
    HideBases = false,             -- don't draw other players' bases (they are still there: helping works)
    HideMine = false,              -- ... and your own base and stack tower too (the farm still works there)
    MemLimit = 2000,               -- MB; above it for 30 s -> rejoin this same server (0 = never)
    Help = false,                  -- step over to other players' waxes in this server and help them
    HelpGuild = false,             -- answer guildmates' "Need help with a wax" calls from here
    Campfire = true,               -- sit at the event campfire (+50% cash per camper) whenever a seat is free
    Ghost = false,                 -- FULL ghost: wait inside the ground between jobs, help from inside the butter
    GhostHelps = false,            -- HELPS-only ghost: hidden helps, but you stay free to walk around between jobs
    Quests = true,                 -- claim finished event quests; pull the lever / collect faster for quests that ask
    AutoIndex = false,             -- buy + wax once every butter not in your Index yet (a running wax of it counts)
    Best = 0,                      -- 1-3: buy the game's top 1-3 butters by income instead of the BUTTERS ticks (0 = off)
                                   -- 4 UPGRADES: the top one + anything that beats the weakest butter in your full stack
    BestCrate = false,             -- open the game's dearest crate (a new one counts the moment the game has it)
    Shower = true,                 -- admin shower: grab the butters that fall on the map
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
-- waiting: a crate has landed on your stand (CrateUpdate(data, false)).
-- on:      its window is open on screen        (CrateUpdate(data, true)).
-- Both clear on CrateUpdate(nil, false), when it is opened or discarded.
-- The game's Auto Roll pass. Learned by watching AutoRollAction, like the crate call.
local AR = { rec = { rules = {} }, replaying = false, busy = false, msg = "", lastCheck = 0 }
local CRATE = { on = false, waiting = false, data = nil, at = 0, title = "crate", lastFail = 0,
    rolled = nil, rolledAt = 0, prompt = nil, summonFails = 0, ignoreUntil = 0, scanAt = 0,
    ours = false, byYou = false, openedAt = 0, win = nil }
local PX, TM, PF, FU, HX, CF, QX = {}, {}, {}, {}, {}, {}, {} -- pets, teams, smooth + ghost, fusing, helping, campfire, quests
local IX, SH = {}, {} -- index / best butter / best crate, admin shower
local KILLED = {}
local conns, logs, logAll, evAll = {}, {}, {}, {}
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
    S.logN = (S.logN or 0) + 1
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
-- (or, with AUTO INDEX / BEST BUTTER on, if those want it: IX.want)
local function isTarget(s)
    if type(s) ~= "string" then return false end
    local k = key(s)
    if k == "" then return false end
    if IX.want then return IX.want(k) end
    return CFG.Targets[k] == true
end
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
    local alias = { qd = "qa", qn = "qi" } -- the game's own spelling of 1e15 / 1e18
    suf = alias[suf:lower()] or suf
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
local CR = { seen = {}, at = 0, boxes = {}, built = 0 } -- crates; filled in below
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
    if CRATE.learned and CRATE.enc then
        L[#L + 1] = "M|mode|" .. tostring(CRATE.learned.mode or "")
        for i, c in ipairs(CRATE.learned.seq) do
            local enc = {}
            for j = 1, c.n do enc[j] = CRATE.enc(c.args[j]) end
            L[#L + 1] = ("A|%d|%s|%d|%s"):format(i, c.m, c.n, table.concat(enc, ";"))
        end
    end
    local function arLine(kind, i, c)
        local enc = {}
        for j = 1, c.n do enc[j] = CRATE.enc(c.args[j]) end
        L[#L + 1] = ("R|%d|%s|%s|%d|%s"):format(i, kind, c.m, c.n, table.concat(enc, ";"))
    end
    if CRATE.enc then
        for i, c in ipairs(AR.rec.rules) do arLine("rules", i, c) end
        if AR.rec.on then arLine("on", 0, AR.rec.on) end
        if AR.rec.off then arLine("off", 0, AR.rec.off) end
    end
    for _, e in pairs(CR.seen) do
        L[#L + 1] = ("K|%s|%s|%s|%s"):format(e.name, e.title or "", e.rar or "", e.price and string.format("%.0f", e.price) or "")
    end
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
        elseif kind == "M" then
            CRATE.loadMode = (rest ~= "" and rest ~= "nil") and rest or nil
        elseif kind == "A" and CRATE.dec then
            local i = tonumber(rar)
            local m, n, enc = rest:match("^([^|]+)|(%d+)|(.*)$")
            if i and m then
                n = tonumber(n)
                local args, j = {}, 0
                for e in (enc .. ";"):gmatch("([^;]*);") do
                    j = j + 1
                    if j <= n then args[j] = CRATE.dec(e) end
                end
                CRATE.loadSeq = CRATE.loadSeq or {}
                CRATE.loadSeq[i] = { m = m, n = n, args = args }
            end
        elseif kind == "R" and CRATE.dec then
            local i = tonumber(rar)
            local what, m, n, enc = rest:match("^([^|]+)|([^|]+)|(%d+)|(.*)$")
            if i and what then
                n = tonumber(n)
                local args, j = {}, 0
                for e in (enc .. ";"):gmatch("([^;]*);") do
                    j = j + 1
                    if j <= n then args[j] = CRATE.dec(e) end
                end
                local c = { m = m, n = n, args = args }
                if what == "rules" then AR.rec.rules[i] = c
                elseif what == "on" then AR.rec.on = c
                elseif what == "off" then AR.rec.off = c end
            end
        elseif kind == "K" then
            local title, rr, pr = rest:match("^([^|]*)|([^|]*)|(.*)$")
            CR.seen[CR.key(rar)] = { name = rar, title = title ~= "" and title or nil,
                rar = rr ~= "" and rr or nil, price = tonumber(pr) }
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
-- Every crate: the ten the game has today (one per rarity, as in its Auto Roll menu), anything
-- CrateUpdate tells us about, and a guessed "<Rarity>Crate" for any rarity with no crate yet.
CR.base = {
    { "SnackCrate", "Snack Crate", "Common" }, { "BerryCrate", "Berry Crate", "Rare" },
    { "BakeryCrate", "Bakery Crate", "Epic" }, { "GourmetCrate", "Gourmet Crate", "Legendary" },
    { "RoyalCrate", "Royal Crate", "Mythic" }, { "CelestialCrate", "Celestial Crate", "Celestial" },
    { "DivineCrate", "Divine Crate", "Divine" }, { "DreamCrate", "Dream Crate", "Dream" },
    { "SugarRushCrate", "Sugar Rush Crate", "Sugar Rush" }, { "PicnicCrate", "Picnic Crate", "Picnic" } }
function CR.key(n) return norm(n or "") end -- "Picnic Crate" and "PicnicCrate" are the same crate
function CR.learn(d)
    if type(d) ~= "table" or type(d.name) ~= "string" then return end
    local k = CR.key(d.name)
    local e = CR.seen[k] or {}
    local changed = (CR.seen[k] == nil) or (tonumber(d.price) and e.price ~= tonumber(d.price))
    e.name, e.title = d.name, d.title or e.title
    e.rar, e.price = d.rarity or e.rar, tonumber(d.price) or e.price
    CR.seen[k] = e
    if changed then CR.at, LEARN.dirty = now(), true end
end
function CR.wanted(n)
    if n == nil then return false end
    local k = CR.key(n)
    return CFG.CrateTicks[k] == true or (CFG.BestCrate and IX.bestCrate ~= nil and (k == IX.bestCrate or k == IX.bestCrateTitle))
end
function CR.list() -- every known crate, cheapest (worst) first
    local all = {}
    for i, b in ipairs(CR.base) do all[CR.key(b[1])] = { name = b[1], title = b[2], rar = b[3], i = i } end
    for _, r in ipairs(CAT.rarOrder) do -- a rarity with no crate we know of: guess its name
        local covered = false
        for _, a in pairs(all) do if a.rar == r then covered = true break end end
        if not covered and r ~= "?" then
            local nm = r:gsub("[^%w]", "") .. "Crate"
            all[CR.key(nm)] = { name = nm, title = r .. " Crate", rar = r, i = 50, guess = true }
        end
    end
    for k, e in pairs(CR.seen) do
        local a = all[k] or { i = 100 }
        a.name, a.title, a.rar = e.name or a.name, e.title or a.title, e.rar or a.rar
        a.price, a.guess = e.price or a.price, nil
        all[k] = a
    end
    local rank, out = {}, {}
    for i, r in ipairs(BASE_RAR) do rank[r] = i end
    for i, r in ipairs(CAT.rarOrder) do rank[r] = rank[r] or (20 + i) end
    for k, a in pairs(all) do
        a.k = k
        a.price = a.price or LEARN.price[a.rar or ""]
        out[#out + 1] = a
    end
    table.sort(out, function(x, y)
        if x.price and y.price and x.price ~= y.price then return x.price < y.price end
        local rx, ry = rank[x.rar or ""] or 99, rank[y.rar or ""] or 99
        if rx ~= ry then return rx < ry end
        if (x.i or 100) ~= (y.i or 100) then return (x.i or 100) < (y.i or 100) end
        return x.k < y.k
    end)
    return out
end

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
    local rl, rk = {}, {}
    for r in pairs(mem) do rl[#rl + 1] = r end
    pcall(function() for i, r in ipairs(require(RS.Modules.SquishyRNG).Keys) do rk[r] = i end end) -- the game's own order
    table.sort(rl, function(x, y)
        if rk[x] and rk[y] and rk[x] ~= rk[y] then return rk[x] < rk[y] end
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
    local list = ((CFG.Best or 0) > 0 and next(IX.best or {})) and IX.best or CFG.Targets
    for k, on in pairs(list) do if on then out[#out + 1] = prettyOf(k) end end
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
    L[#L + 1] = "N|GlazeLead|" .. tostring(CFG.GlazeLead)
    L[#L + 1] = "N|FpsCap|" .. tostring(CFG.FpsCap)
    L[#L + 1] = "N|MemLimit|" .. tostring(CFG.MemLimit)
    L[#L + 1] = "N|Best|" .. tostring(CFG.Best or 0)
    for _, k in ipairs({ "TeamNormal", "TeamFull", "TeamGlaze", "TeamWax" }) do L[#L + 1] = "S|" .. k .. "|" .. CFG[k] end
    do
        local t = {}
        for n, w in pairs(CFG.Pets) do
            local f = (w.b and "b" or "") .. (w.g and "g" or "") .. (w.w and "w" or "") .. ((tonumber(w.f) or 0) > 0 and tostring(w.f) or "")
            if f ~= "" then t[#t + 1] = n .. "|" .. f end
        end
        table.sort(t)
        L[#L + 1] = "P|-"
        for _, x in ipairs(t) do L[#L + 1] = "P|" .. x end
    end
    for _, k in ipairs({ "Collect", "SellJunk", "Crates", "Rejoin", "AutoStart", "AutoRoll", "PetBuy", "PetWish", "Teams", "Lite", "HideHud", "NoRender", "AutoFuse", "AutoBuild", "Help", "HelpGuild", "Campfire", "Ghost", "GhostHelps", "Quests", "HideBases", "HideMine", "AutoIndex", "BestCrate", "Shower", "Calm" }) do
        L[#L + 1] = "B|" .. k .. "|" .. (CFG[k] and "1" or "0")
    end
    -- your Auto Roll choices as the game holds them right now (if any), else what we had
    local gr = plr:GetAttribute("AutoRollRules")
    if type(gr) == "string" and gr ~= "" then CFG.ARrules, CFG.ARstop = gr, tostring(plr:GetAttribute("AutoRollStop") or "") end
    if CFG.ARrules ~= "" then
        L[#L + 1] = "S|rules|" .. CFG.ARrules
        L[#L + 1] = "S|stop|" .. CFG.ARstop
    end
    if S.winPos then L[#L + 1] = ("W|%d|%d"):format(S.winPos[1], S.winPos[2]) end
    if S.togPos then L[#L + 1] = ("G|%d|%d"):format(S.togPos[1], S.togPos[2]) end
    -- "-" marks the list as present, so a config saved with nothing ticked loads as nothing ticked
    for _, pair in ipairs({ { "T", CFG.Targets }, { "K", CFG.CrateTicks } }) do
        local t = {}
        for k, on in pairs(pair[2]) do if on then t[#t + 1] = k end end
        table.sort(t)
        L[#L + 1] = pair[1] .. "|-"
        for _, k in ipairs(t) do L[#L + 1] = pair[1] .. "|" .. k end
    end
    return table.concat(L, "\n")
end
local function applyConfig(raw)
    if type(raw) ~= "string" or raw == "" then return false end
    local tg, got, kt, gotK, pets = {}, false, {}, false, nil
    for line in raw:gmatch("[^\n]+") do
        local a, b, c = line:match("^(%a)|([^|]*)|?(.*)$")
        if a == "N" and b == "Every" then
            local n = tonumber(c)
            if n and n >= 1 then CFG.Every = math.floor(n) end
        elseif a == "N" and (b == "FpsCap" or b == "MemLimit") then
            local n = tonumber(c)
            if n and n >= 0 then CFG[b] = math.floor(n) end
        elseif a == "N" and b == "Best" then
            local n = tonumber(c)
            if n and n >= 0 and n <= 4 then CFG.Best = math.floor(n) end
        elseif a == "N" and b == "GlazeLead" then
            local n = tonumber(c)
            if n and n >= 5 and n <= 600 then CFG.GlazeLead = math.floor(n) end
        elseif a == "S" and (b == "TeamNormal" or b == "TeamFull" or b == "TeamGlaze" or b == "TeamWax") then
            CFG[b] = c
        elseif a == "P" and b ~= "" then
            if not pets then pets = {} end
            if b ~= "-" and c ~= "" then
                pets[b] = { b = c:find("b", 1, true) and true or nil, g = c:find("g", 1, true) and true or nil,
                    w = c:find("w", 1, true) and true or nil, f = tonumber(c:match("%d")) }
            end
        elseif a == "B" then
            if CFG[b] ~= nil then CFG[b] = (c == "1") end
        elseif a == "S" and b == "rules" then
            CFG.ARrules = c
        elseif a == "S" and b == "stop" then
            CFG.ARstop = c
        elseif a == "W" then
            S.winPos = { tonumber(b) or 10, tonumber(c) or 44 }
        elseif a == "G" then
            S.togPos = { tonumber(b) or 10, tonumber(c) or 300 }
        elseif a == "T" and b ~= "" then
            if b ~= "-" then tg[b] = true end
            got = true
        elseif a == "K" and b ~= "" then
            if b ~= "-" then kt[b] = true end
            gotK = true
        end
    end
    if got then CFG.Targets = tg end
    if gotK then CFG.CrateTicks = kt end -- an older config without crates keeps the default
    if pets then CFG.Pets = pets end
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
-- SAB autoloader v2: loads the newest SAB farm from GitHub on every join (a saved copy if GitHub is down).
task.spawn(function()
    task.wait(6)
    local G = (type(getgenv) == "function" and getgenv()) or _G
    if type(G.SAB) == "table" and type(G.SAB.S) == "table" and G.SAB.S.alive then return end -- already running
    local url, cache, src = "https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua", "SAB/SAB_Farm_cache.lua", nil
    for _ = 1, 3 do
        local ok, s = pcall(function() return game:HttpGet(url .. "?t=" .. tostring(tick())) end)
        if ok and type(s) == "string" and #s > 1000 and s:find("SAB_KILL", 1, true) then src = s break end
        task.wait(3)
    end
    if src then
        pcall(function() if type(makefolder) == "function" then pcall(makefolder, "SAB") end writefile(cache, src) end)
    else
        local ok, s = pcall(readfile, cache)
        if ok and type(s) == "string" and #s > 1000 then src = s end
    end
    if not src and type(listfiles) == "function" then -- an older setup: a copy saved by hand
        for _, d in ipairs({ "", "scripts", "Scripts", "Delta", "Delta/Scripts", "SAB" }) do
            local ok, fs = pcall(listfiles, d)
            if ok and type(fs) == "table" then
                for _, f in ipairs(fs) do
                    local low = tostring(f):lower()
                    if not src and low:sub(-4) == ".lua" and low:find("sab_farm", 1, true) and not low:find("autoload", 1, true) then
                        local okr, s = pcall(readfile, tostring(f))
                        if okr and type(s) == "string" and #s > 1000 then src = s end
                    end
                end
            end
        end
    end
    if src then
        local fn = loadstring(src)
        if fn then pcall(fn) end
    end
end)
]]
local function installAutoexec()
    if not canWrite() then return false, "this executor cannot write files" end
    ensureDir("autoexec")
    if not writeTo(F.exec, F.stub) then return false, "could not write to the autoexec folder" end
    return true, "it loads the newest version from GitHub on every join"
end
-- rejoining after a disconnect or a server restart
local TPS = (function() local ok, v = pcall(function() return game:GetService("TeleportService") end) return ok and v or nil end)()
local function queueSelf()
    if type(queueonteleport) ~= "function" and type(queue_on_teleport) ~= "function" then return false end
    local q = queueonteleport or queue_on_teleport
    return (pcall(q, F.stub)) -- the same loader: newest from GitHub, the saved copy if GitHub is down
end
local function rejoin(why)
    if S.rejoining then return end
    S.rejoining = true
    note("REJOIN (" .. why .. ")")
    pcall(saveLearn)
    if S.autoload then pcall(saveConfig, S.autoload) end
    local queued = queueSelf()
    note(queued and "queued the script for the new server" or "this executor cannot queue scripts - set up autoexec for a clean restart")
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
    -- (no queueing on every teleport any more: the farm only comes back by itself after a rejoin it
    -- started; otherwise it loads when you run it or when Delta's autoexecute runs it)
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
    if m then S.carrySrc, CRATE.heldAt = "model", now() return m.Name, m end
    local c = plr.Character
    if c then
        for _, d in ipairs(c:GetDescendants()) do
            if (d:IsA("Model") or d:IsA("Tool")) and knownButter(d.Name) then
                S.carrySrc, CRATE.heldAt = "character", now()
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
    if name:lower():find("crate", 1, true) then
        CRATE.rolled, CRATE.rolledAt = name, now()
        return
    end
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
    track(plr:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
        local a = plr:GetAttribute("SquishyEquipped")
        if type(a) == "string" and a ~= "" then CRATE.heldAt = now() end
    end))
    local map = {
        SquishyRollAnimation = onRoll,
        InitSquishy = function(m) EV.init, EV.initAt = tostring(m), now() evlog("Init(" .. tostring(m) .. ")") end,
        CrateUpdate = function(d, shown)
            pcall(learnCrate, d)
            pcall(CR.learn, d)
            if type(d) == "table" then
                -- a closed-window update only means "waiting on YOUR stand" if you just rolled a crate;
                -- otherwise it is just crate data (which still teaches the order)
                local mine = shown == true or (CRATE.rolled ~= nil and now() - CRATE.rolledAt < 15) or CRATE.waiting
                if not mine then return end
                local first = not CRATE.waiting
                local wasOn = CRATE.on
                CRATE.waiting, CRATE.data, CRATE.at = true, d, now()
                CRATE.on = (shown == true)
                CRATE.title = tostring(d.title or d.name or "crate")
                if CRATE.on and not wasOn then
                    CRATE.openedAt, CRATE.byYou = now(), not CRATE.ours
                    if CRATE.onShow then task.spawn(CRATE.onShow) end
                end
                if CRATE.on then evlog("CrateWindow open(" .. CRATE.title .. ")")
                elseif first then
                    evlog("Crate waiting(" .. CRATE.title .. ")")
                    note(CRATE.title .. " is waiting on your stand")
                end
            else
                if CRATE.waiting then evlog("Crate gone") end
                CRATE.on, CRATE.waiting, CRATE.data, CRATE.prompt = false, false, nil, nil
                local yours = CRATE.byYou
                CRATE.summonFails, CRATE.ours, CRATE.byYou = 0, false, false
                if CRATE.onGone then task.spawn(CRATE.onGone, yours) end
                if CRATE.classify then
                    local at = now()
                    task.spawn(function() pcall(CRATE.classify, at) end)
                end
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
        if hum and (hum.FloorMaterial ~= Enum.Material.Air or hum.SeatPart) then return true end -- seated: no floor to wait for
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
    local c0 = char()
    local far = c0 and (c0.HumanoidRootPart.Position - part.Position).Magnitude > 12
    standNear(part, bp)
    -- just arrived from the campfire / a help: the server still has us where we were for a moment and
    -- ignores the press (that was the "first buy fails" on Sushi), so let it catch up first
    if far then nap(0.4) end
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
        S.holding, S.bought, S.cashFails, S.buyMiss = true, S.bought + 1, 0, 0
        S.matchSince = nil
        EV.name, EV.rar, EV.at = nil, nil, now()
        note(("BOUGHT %s%s via %s"):format(got and prettyOf(key(got)) or (id.shown or "?"),
            (cash0 and c1) and (" for $" .. fmt(cash0 - c1)) or "", how))
        if got and want and key(got) ~= key(want) then
            note(("note: picked up %s, not %s"):format(got, want))
        end
        return true
    end
    local pi = padInfo()
    if cashShort() then -- really short: back off longer each time
        S.cashFails = S.cashFails + 1
        S.noCashUntil = now() + math.min(8 * 2 ^ (S.cashFails - 1), 60)
        note(("BUY REFUSED: cash short - have $%s, price %s"):format(fmt(cash()), (pi and pi.price) or "?"))
    else -- enough cash: the server just did not take that press; go again in a moment, standing still
        S.buyMiss = (S.buyMiss or 0) + 1
        S.noCashUntil = now() + (S.buyMiss <= 3 and 1 or 6)
        note(("buy did not go through (%s, try %d) - again in %ds"):format(pi and pi.price or "?", S.buyMiss, S.buyMiss <= 3 and 1 or 6))
    end
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
                    if IX.placed then pcall(IX.placed, held) end
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

-- placing with the WAX team on: head starts ("X% of waxes start half done") are decided the moment a
-- butter is placed. Wax speed is not: it follows whatever you wear afterwards.
function TM.place()
    local tw = now()
    while S.alive and TM.editing and now() - tw < 25 do nap(0.2) end -- a team rebuild in progress
    if CFG.Teams and CFG.TeamWax ~= "" then
        TM.placing = true
        local t0 = now()
        while S.alive and TM.current() ~= CFG.TeamWax and now() - t0 < 5 do nap(0.1) end
        if TM.current() == CFG.TeamWax then
            nap(0.3)
        else
            note("wax team did not come on in time - placing anyway")
        end
    end
    local ok, res = pcall(doPlace)
    TM.placing = false
    if not ok then error(res, 0) end
    return res
end
-- Crates. The game opens the crate window by itself about two seconds after one is rolled;
-- this presses Open! when a ticked butter can come out of it, and Discard when none can.
local function isCrateName(n)
    return type(n) == "string" and n:lower():find("crate", 1, true) ~= nil
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
-- What a button says to a player. Styled game buttons are often an ImageButton with the words
-- in a TextLabel inside it, so look there too, and fall back to the button's own name.
local function btnWords(g)
    local t = ""
    pcall(function() if g:IsA("TextButton") then t = g.Text end end)
    if not t:find("%a") then
        for _, d in ipairs(g:GetDescendants()) do
            if (d:IsA("TextLabel") or d:IsA("TextButton")) and d.Text:find("%a") then t = d.Text break end
        end
    end
    if not t:find("%a") then t = g.Name end
    return (t:lower():gsub("[^%a]", ""))
end
local function crateButtons()
    local open, disc
    local gui = plr:FindFirstChildOfClass("PlayerGui")
    if not gui then return nil, nil end
    for _, g in ipairs(gui:GetDescendants()) do
        if g:IsA("GuiButton") and onScreen(g) then
            local t = btnWords(g)
            if t:sub(1, 4) == "open" and not t:find("shop", 1, true) then open = open or g end
            if t:sub(1, 7) == "discard" then disc = disc or g end
        end
    end
    -- only trust a pair: Open on its own could be some other menu
    if open and disc then return open, disc end
    if CRATE.on then return open, disc end
    return nil, nil
end
-- press a button that belongs to the game's own window. Executors differ, so try each way.
local VIM = (function() local ok, v = pcall(function() return game:GetService("VirtualInputManager") end) return ok and v or nil end)()
local function tapGui(b, done)
    local ways = {}
    local function add(n) ways[#ways + 1] = n end
    if S.tapWay then add(S.tapWay) end
    for _, n in ipairs({ "touch", "conn", "signal" }) do
        if n ~= S.tapWay then add(n) end
    end
    -- Each way presses the button the way ONE tap would: a single signal, each handler once,
    -- and never MouseButton1Down on its own. Firing Down with no Up leaves the game thinking the
    -- button is still held, which wedges its window open (and its X) - that was the stuck window.
    local function fireSig(sig, ...)
        local ok, cons = pcall(getconnections, sig)
        if not (ok and type(cons) == "table" and #cons > 0) then return false end
        local any, args, n = false, { ... }, select("#", ...)
        for _, c in ipairs(cons) do
            if pcall(function() c:Fire(table.unpack(args, 1, n)) end) then any = true end
        end
        return any
    end
    -- Activated normally comes with the tap that caused it. Game handlers often read where you
    -- tapped; firing it with nothing leaves them half done and jams the window, so pass a stand-in.
    local function fakeTap()
        local pos = Vector3.new(0, 0, 0)
        pcall(function()
            local p, sz = b.AbsolutePosition, b.AbsoluteSize
            pos = Vector3.new(p.X + sz.X / 2, p.Y + sz.Y / 2, 0)
        end)
        local t = { Position = pos, Delta = Vector3.new(0, 0, 0), KeyCode = Enum.KeyCode.Unknown }
        pcall(function() t.UserInputType = Enum.UserInputType.Touch end)
        pcall(function() t.UserInputState = Enum.UserInputState.End end)
        return t
    end
    for _, way in ipairs(ways) do
        local fired = false
        if way == "conn" and type(getconnections) == "function" then
            -- Click first; Activated only if Click changed nothing, so the action never runs twice
            if fireSig(b.MouseButton1Click) then
                fired = true
                if waitFor(done, 1.5) then S.tapWay = way return true, way end
            end
            fired = fireSig(b.Activated, fakeTap(), 1)
        elseif way == "signal" and type(firesignal) == "function" then
            if pcall(firesignal, b.MouseButton1Click) then
                if waitFor(done, 1.5) then S.tapWay = way return true, way end
            end
            fired = pcall(firesignal, b.Activated, fakeTap(), 1)
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
CRATE.NOT = { LimitedSquishyPlaceHolder = 1, Lever = 1, WaxStations = 1, RolledSquishyPlaceHolder = 1, SquishyStack = 1 }
local function safePrompt(d)
    local o = d.Parent
    while o and o ~= S.plot do
        if CRATE.NOT[o.Name] then return false end
        o = o.Parent
    end
    local a = (d.ActionText or ""):lower()
    if a:find("roll", 1, true) or a:find("place", 1, true) or a:find("sell", 1, true) then return false end
    return true
end
-- The prompt that opens a waiting crate's window: on the CrateStand first, then anything
-- in the plot that names a crate.
local function findCratePrompt()
    if CRATE.prompt and CRATE.prompt.Parent and CRATE.prompt.Enabled then return CRATE.prompt end
    if not S.plot then return nil end
    local stand = S.plot:FindFirstChild("CrateStand")
    local best
    if stand then
        for _, d in ipairs(stand:GetDescendants()) do
            if d:IsA("ProximityPrompt") and d.Enabled and safePrompt(d) then best = d break end
        end
    end
    if not best then
        for _, d in ipairs(S.plot:GetDescendants()) do
            if d:IsA("ProximityPrompt") and d.Enabled and safePrompt(d) then
                local m = d:FindFirstAncestorWhichIsA("Model")
                local words = ((d.ActionText or "") .. " " .. (d.ObjectText or "") .. " " .. d.Name .. " " ..
                    (m and m.Name or "")):lower()
                if words:find("crate", 1, true) then best = d break end
            end
        end
    end
    CRATE.prompt = best
    return best
end
-- Gets the crate window onto the screen. It never decides anything; the window branch does.
local function summonCrate()
    if CRATE.on then return true end
    local cp = findCratePrompt()
    if not cp then
        CRATE.summonFails = CRATE.summonFails + 1
        CRATE.lastFail = now()
        note("crate: cannot find where to open " .. CRATE.title .. " - open it once by hand")
        return false
    end
    local part = partOf(cp)
    if part then standNear(part, cp) end
    CRATE.ours = true -- the window that comes up now is ours, so it is kept out of sight
    activate(cp, function() return CRATE.on end)
    if waitFor(function() return CRATE.on end, 3) then
        CRATE.summonFails = 0
        return true
    end
    CRATE.ours = false
    CRATE.summonFails = CRATE.summonFails + 1
    CRATE.lastFail = now()
    note("crate: pressed " .. relPath(cp) .. " but no window came up")
    return false
end
do -- crate window helpers, kept in their own scope
-- The crate window: the smallest frame that holds Open, Discard and the crate's own words.
local function crateWindowOf(btn)
    local o = btn.Parent
    while o and o:IsA("GuiObject") do
        local disc, words = false, false
        for _, d in ipairs(o:GetDescendants()) do
            if d ~= btn and d:IsA("GuiButton") and btnWords(d):sub(1, 7) == "discard" then disc = true end
            if d:IsA("TextLabel") then
                local t = d.Text:lower()
                if t:find("crate", 1, true) or t:find("can contain", 1, true) or t:find("cost", 1, true) then words = true end
            end
            if disc and words then return o end
        end
        o = o.Parent
    end
end
function CRATE.findWin()
    if CRATE.win and CRATE.win.Parent then return CRATE.win end
    local gui = plr:FindFirstChildOfClass("PlayerGui")
    if not gui then return nil end
    for _, g in ipairs(gui:GetDescendants()) do
        if g:IsA("GuiButton") and not g:FindFirstAncestor("SABFarmGui") and btnWords(g):sub(1, 4) == "open" then
            local w = crateWindowOf(g)
            if w then CRATE.win = w return w end
        end
    end
end
local function closeBtnOf(win)
    for _, d in ipairs(win:GetDescendants()) do
        if d:IsA("GuiButton") then
            local w, n = btnWords(d), d.Name:lower()
            if w == "x" or w == "close" or n == "x" or n:find("close", 1, true) or n:find("exit", 1, true) then return d end
        end
    end
end
-- The window belongs to the game. Hiding it behind the game's back leaves its menu system
-- thinking it is still open (dark blurred screen that eats your touches, buttons that ignore
-- presses), so the script never changes its visibility. It only presses the game's buttons.
CRATE.onShow = function()
    CRATE.win = nil -- found fresh each time
    CRATE.findWin()
end
-- The crate is gone. If the game left its window up, close it the game's own way: its X.
CRATE.onGone = function(yours)
    task.wait(yours and 4 or 1.2)
    if CRATE.on or CRATE.waiting then return end -- another crate already arrived
    local w = CRATE.findWin()
    if not w or not onScreen(w) then return end
    local x = closeBtnOf(w)
    if x and tapGui(x, function() return not onScreen(w) end) then return end
    note("the crate window is still open - tap its X")
end
end
local function doCrate(open)
    if not summonCrate() then return false end
    local age = now() - (CRATE.openedAt or 0)
    if age < 0.6 then nap(0.6 - age) end -- let its open animation finish; game buttons often ignore early taps
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

-- ---- opening a crate straight on the server, with no window at all
-- The game's Open! button sends CrateAction to the server. The script watches for that the first
-- time a crate opens (whether you tapped Open or the script pressed it), keeps it, and from then on
-- sends the same thing itself - so the game's window never comes up and cannot get stuck. A crate's
-- own name, title or rarity inside that message is swapped for the next crate's.
CRATE.calls = {}
function CRATE.saw(method, ...) -- called from the namecall hook for every CrateAction call
    local n = select("#", ...)
    CRATE.calls[#CRATE.calls + 1] = { t = now(), m = method, n = n, args = { ... }, data = CRATE.data,
        crate = CRATE.data and CRATE.data.name, title = CRATE.title, rar = CRATE.data and CRATE.data.rarity }
    if #CRATE.calls > 12 then table.remove(CRATE.calls, 1) end
end
function CRATE.slot(v, c)
    local t = type(v)
    if (t == "string" or t == "number") and type(c.data) == "table" then
        for fk, fv in pairs(c.data) do
            if fv == v and type(fk) == "string" and (type(fv) == "string" or type(fv) == "number") then
                return { __slot = "f:" .. fk }
            end
        end
    end
    if t == "string" then
        if c.crate and v == c.crate then return { __slot = "crate" } end
        if c.title and v == c.title then return { __slot = "title" } end
        if c.rar and v == c.rar then return { __slot = "rarity" } end
        return v
    end
    if t == "number" or t == "boolean" or t == "nil" then return v end
    if t == "table" then
        local o = {}
        for k, x in pairs(v) do
            if type(x) == "table" then return nil, "nested table" end
            local y, err = CRATE.slot(x, c)
            if err then return nil, err end
            o[k] = y
        end
        return o
    end
    local ok, inst = pcall(function() return v:IsA("Instance") end)
    if ok and inst then
        if v == plr then return { __slot = "player" } end
        if S.plot and v == S.plot then return { __slot = "plot" } end
        local stand = S.plot and S.plot:FindFirstChild("CrateStand")
        if stand and v == stand then return { __slot = "stand" } end
        if stand and v.Parent == stand then return { __slot = "model" } end
    end
    return nil, "a value it cannot rebuild (" .. t .. ")"
end
function CRATE.resolve(v)
    if type(v) ~= "table" then return v end
    local s = v.__slot
    if s and s:sub(1, 2) == "f:" then return CRATE.data and CRATE.data[s:sub(3)] end
    if s == "crate" then return CRATE.data and CRATE.data.name end
    if s == "title" then return (CRATE.data and CRATE.data.title) or CRATE.title end
    if s == "rarity" then return CRATE.data and CRATE.data.rarity end
    if s == "player" then return plr end
    if s == "plot" then return S.plot end
    if s == "stand" or s == "model" then
        local stand = S.plot and S.plot:FindFirstChild("CrateStand")
        if s == "stand" or not stand then return stand end
        for _, m in ipairs(stand:GetChildren()) do if isCrateName(m.Name) then return m end end
        return nil
    end
    local o = {}
    for k, x in pairs(v) do o[k] = CRATE.resolve(x) end
    return o
end
-- after a crate went: if a butter landed in hand, the calls made just before were "open"
function CRATE.classify(goneAt)
    if CRATE.directOff then return end
    local seq = {}
    for _, c in ipairs(CRATE.calls) do
        if c.t <= goneAt + 0.05 and goneAt - c.t <= 6 then seq[#seq + 1] = c end
    end
    if #seq == 0 then return end
    -- a butter landing in hand around then means it was opened (no butter = discarded). Judged from
    -- the game's own pickup signal, which cannot be missed even if the butter is sold a moment later.
    if not waitFor(function() return (CRATE.heldAt or 0) >= goneAt - 1 end, 2.5) then return end
    local out = {}
    for _, c in ipairs(seq) do
        local args = {}
        for i = 1, c.n do
            local v, err = CRATE.slot(c.args[i], c)
            if err then
                note("crate call has " .. err .. " - keeping the button method")
                return
            end
            args[i] = v
        end
        out[#out + 1] = { m = c.m, n = c.n, args = args }
    end
    local was = CRATE.learned
    CRATE.learned = { seq = out, mode = was and was.mode or nil }
    LEARN.dirty = true
    if not was then note(("learned how to open crates directly (%d call%s)"):format(#out, #out == 1 and "" or "s")) end
end
function CRATE.replay()
    local L = CRATE.learned
    local R = RS:FindFirstChild("Remotes")
    local r = R and R:FindFirstChild("CrateAction")
    if not (L and r) then return false end
    local unpack_ = table.unpack or unpack
    CRATE.replaying = true
    for _, c in ipairs(L.seq) do
        local args = {}
        for i = 1, c.n do args[i] = CRATE.resolve(c.args[i]) end
        -- InvokeServer waits for the server's answer; never let that freeze the farm
        task.spawn(function()
            pcall(function()
                if c.m == "InvokeServer" then r:InvokeServer(unpack_(args, 1, c.n))
                else r:FireServer(unpack_(args, 1, c.n)) end
            end)
        end)
        task.wait(0.2)
    end
    CRATE.replaying = false
    return true
end
-- line format for keeping it: one "A" line per call, "M" for the mode
function CRATE.esc(x) return (x:gsub("[%%|;=,\n]", function(ch) return ("%%%02X"):format(ch:byte()) end)) end
function CRATE.enc(v)
    local t = type(v)
    if t == "string" then return "s" .. CRATE.esc(v) end
    if t == "number" then return "n" .. tostring(v) end
    if t == "boolean" then return v and "b1" or "b0" end
    if t == "nil" then return "z" end
    if v.__slot then return "k" .. v.__slot end
    local parts = {}
    for k, x in pairs(v) do parts[#parts + 1] = CRATE.enc(k) .. "=" .. CRATE.enc(x) end
    return "t" .. table.concat(parts, ",")
end
function CRATE.dec(e)
    local c, rest = e:sub(1, 1), e:sub(2)
    local function un(x) return (x:gsub("%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end)) end
    if c == "s" then return un(rest) end
    if c == "n" then return tonumber(rest) end
    if c == "b" then return rest == "1" end
    if c == "k" then return { __slot = rest } end
    if c == "t" then
        local o = {}
        for item in rest:gmatch("[^,]+") do
            local a, b = item:match("^(.-)=(.*)$")
            if a then
                local kk = CRATE.dec(a)
                if kk ~= nil then o[kk] = CRATE.dec(b) end
            end
        end
        return o
    end
    return nil
end
-- open the waiting crate the best way we know: directly, or with its window up, or by its button
function CRATE.goneOrNew(held0)
    return function()
        if not CRATE.waiting then return true end
        local h = carriedName()
        return h ~= nil and h ~= held0
    end
end
-- ---- opening a crate without its window (since the Nov update the server only accepts "open"
-- from someone standing at the crate): step next to the stand, send CrateAction "open" ourselves,
-- read the server's answer { ok, prize | reason }, and step back to where we were. No window, no taps.
function CRATE.near()
    local rem = RS:FindFirstChild("Remotes")
    local r = rem and rem:FindFirstChild("CrateAction")
    local c = char()
    local stand = S.plot and S.plot:FindFirstChild("CrateStand")
    local spot = stand and stand:FindFirstChild("Spot")
    if not (r and c and spot) then
        note(("crate: cannot open %s right now (%s)"):format(tostring(CRATE.title),
            not r and "no CrateAction remote" or not c and "no character (respawning?)" or "no crate stand"))
        return false, "no crate stand or remote"
    end
    local hrp = c.HumanoidRootPart
    local back = hrp.CFrame
    local title, why = CRATE.title, "no answer"
    local held0 = carriedName()
    local holder = stand:FindFirstChild("Holder")
    local function live() -- the crate's model sits in CrateStand.Holder while it waits
        if not holder then return CRATE.waiting or CRATE.on end
        for _, m in ipairs(holder:GetChildren()) do if m:IsA("Model") then return true end end
        return false
    end
    for attempt = 1, 3 do
        if not (CRATE.waiting or CRATE.on) or not live() then
            CRATE.waiting, CRATE.on, CRATE.quietUntil = false, false, now() + 4
            return true, "already gone"
        end
        if (hrp.Position - spot.Position).Magnitude > 8 then standNear(spot, CRATE.prompt) end
        nap(0.12 + 0.15 * attempt) -- let the server see where we now stand
        local box = {}
        CRATE.replaying = true
        task.spawn(function()
            box.ok, box.v = pcall(function() return r:InvokeServer("open") end)
            box.done = true
        end)
        waitFor(function() return box.done end, 6)
        CRATE.replaying = false
        local v = box.v
        if box.done and box.ok and type(v) == "table" and v.ok then
            S.crates, CRATE.fails, CRATE.nearFails = S.crates + 1, 0, 0
            CRATE.waiting, CRATE.on, CRATE.quietUntil = false, false, now() + 4
            note(("OPENED %s -> %s (no window)"):format(title, v.prize and prettyOf(key(tostring(v.prize))) or "?"))
            waitFor(function() local h = carriedName() return h ~= nil and h ~= held0 end, 1.5)
            if (hrp.Position - back.Position).Magnitude > 8 then pcall(function() teleport(c, back.Position, back.Position + back.LookVector) end) end
            return true, "opened"
        end
        why = (box.done and box.ok and type(v) == "table") and tostring(v.reason or "refused, no reason given")
            or (box.done and ("error: " .. tostring(v)) or "no answer in 6s")
        nap(0.3)
        if not live() then -- someone (you, or the game) opened it meanwhile
            CRATE.waiting, CRATE.on, CRATE.quietUntil = false, false, now() + 4
            return true, "already gone"
        end
    end
    CRATE.nearFails = (CRATE.nearFails or 0) + 1
    note(("crate: the server would not open %s next to the stand (%s)"):format(title, why))
    return false, why
end
CRATE.GIVEUP = 600
function CRATE.drop() -- last resort for a crate that would not open in 10 min: the game's own Discard
    local rem = RS:FindFirstChild("Remotes")
    local r = rem and rem:FindFirstChild("CrateAction")
    local stand = S.plot and S.plot:FindFirstChild("CrateStand")
    local spot = stand and stand:FindFirstChild("Spot")
    local c = char()
    if spot and c and (c.HumanoidRootPart.Position - spot.Position).Magnitude > 8 then standNear(spot, CRATE.prompt) nap(0.3) end
    local ok, v = false, nil
    if r then ok, v = pcall(function() return r:InvokeServer("discard") end) end
    note(("DISCARDED %s after %d min of failed opens (%s)"):format(tostring(CRATE.title), math.floor(CRATE.GIVEUP / 60),
        (ok and type(v) == "table" and v.ok) and "done" or ("answer: " .. tostring(type(v) == "table" and (v.reason or v.ok) or v))))
    CRATE.waiting, CRATE.on, CRATE.quietUntil = false, false, now() + 4
    CRATE.summonFails, CRATE.nearFails, CRATE.lastFail, CRATE.at, CRATE.prompt = 0, 0, 0, nil, nil
    if not (ok and type(v) == "table" and v.ok) then doCrate(false) end -- the window's Discard button, if that is what works
end
function CRATE.smart()
    local title = CRATE.title
    if (CRATE.nearFails or 0) < 3 then
        local ok = CRATE.near()
        if ok then return true end
        if CRATE.nearFails >= 3 then note("opening next to the stand failed 3 times - trying the older ways") end
    end
    local L = CRATE.learned
    if L then
        local held0 = carriedName()
        if CRATE.on then -- its window is already up: send the call rather than tap the button
            CRATE.replay()
            if waitFor(CRATE.goneOrNew(held0), 3.5) then
                S.crates = S.crates + 1
                note("OPENED " .. title .. " (direct)")
                return true
            end
        else
            if L.mode ~= "window" then
                CRATE.replay()
                if waitFor(CRATE.goneOrNew(held0), 3.5) then
                    S.crates, CRATE.fails = S.crates + 1, 0
                    if L.mode ~= "direct" then
                        L.mode, LEARN.dirty = "direct", true
                        note("crates now open directly - the window never comes up")
                    end
                    note("OPENED " .. title .. " (direct, no window)")
                    return true
                end
            end
            -- the server wants the window up first: bring it up, then send the call
            if summonCrate() then
                CRATE.replay()
                if waitFor(CRATE.goneOrNew(held0), 3.5) then
                    S.crates, CRATE.fails = S.crates + 1, 0
                    if L.mode ~= "window" then
                        L.mode, LEARN.dirty = "window", true
                        note("crates need their window up first - it shows briefly")
                    end
                    note("OPENED " .. title .. " (direct, window up)")
                    return true
                end
            end
        end
        CRATE.fails = (CRATE.fails or 0) + 1
        CRATE.lastBad, CRATE.learned, LEARN.dirty = L, nil, true
        if CRATE.fails >= 3 then
            CRATE.directOff = true
            note("direct crate opening failed 3 times - using the button for now")
        else
            note("the learned crate call did not work - back to pressing Open")
        end
    end
    return doCrate(true) -- by the button; this is also where the call gets learned
end

-- ---- the game's Auto Roll pass
-- On every join the game resets it: AutoRollOn false, no choices. The script watches what the
-- game's own Auto Roll menu sends (AutoRollAction) and what each message changes, so it learns
-- how to put your choices back and how to switch it on and off, then does that after a rejoin.
function AR.snap()
    return { rules = plr:GetAttribute("AutoRollRules"), stop = plr:GetAttribute("AutoRollStop"),
        on = plr:GetAttribute("AutoRollOn"), main = plr:GetAttribute("AutoRoll") }
end
-- AR.cache mirrors those four flags, updated by the game's own change events. The namecall hook
-- must read THIS, never call GetAttribute: any method call made inside the hook replaces the call
-- in progress, so the game's own AutoRollAction would never reach the server (that was v23's bug).
AR.cache = {}
function AR.watchCache()
    AR.cache = AR.snap()
    for key, attr in pairs({ rules = "AutoRollRules", stop = "AutoRollStop", on = "AutoRollOn", main = "AutoRoll" }) do
        track(plr:GetAttributeChangedSignal(attr):Connect(function() AR.cache[key] = plr:GetAttribute(attr) end))
    end
end
function AR.isOn() return plr:GetAttribute("AutoRollOn") == true end
function AR.saw(m, ...) -- runs INSIDE the namecall hook: no method calls allowed here
    local c = AR.cache
    local rec = { m = m, n = select("#", ...), args = { ... },
        before = { rules = c.rules, stop = c.stop, on = c.on, main = c.main } }
    task.delay(1.5, function()
        if S.alive then pcall(AR.learnOne, rec) end
    end)
end
function AR.learnOne(rec)
    local a, b = AR.snap(), rec.before
    local ruleCh = (a.rules ~= b.rules) or (a.stop ~= b.stop)
    local powCh = (a.on ~= b.on) or (a.main ~= b.main)
    if not ruleCh and not powCh then return end -- no visible effect: nothing to learn
    local args = {}
    for i = 1, rec.n do
        local v = rec.args[i]
        local t = type(v)
        if t == "string" and v ~= "" and v == a.rules then v = { __slot = "rules" }
        elseif t == "string" and v ~= "" and ruleCh and v == a.stop and a.stop ~= b.stop then v = { __slot = "stop" }
        elseif t == "table" then
            local o = {}
            for k, x in pairs(v) do
                if type(x) == "table" or (type(x) == "userdata") then
                    AR.msg = "Auto Roll sends something I cannot repeat" return
                end
                o[k] = (type(x) == "string" and x ~= "" and x == a.rules) and { __slot = "rules" } or x
            end
            v = o
        elseif t ~= "string" and t ~= "number" and t ~= "boolean" and t ~= "nil" then
            if v == plr then v = { __slot = "player" } else AR.msg = "Auto Roll sends something I cannot repeat" return end
        end
        args[i] = v
    end
    local call = { m = rec.m, n = rec.n, args = args }
    if ruleCh then
        local whole = false
        for i = 1, call.n do
            local x = call.args[i]
            if type(x) == "table" and x.__slot == "rules" then whole = true end
            if type(x) == "table" and not x.__slot then
                for _, y in pairs(x) do if type(y) == "table" and y.__slot == "rules" then whole = true end end
            end
        end
        if whole then AR.rec.rules = { call } -- one message sets every choice at once
        else
            table.insert(AR.rec.rules, call) -- choice by choice: keep them in order
            if #AR.rec.rules > 60 then table.remove(AR.rec.rules, 1) end
        end
    end
    if powCh then
        if a.on == true then AR.rec.on = call else AR.rec.off = call end
        CFG.AutoRoll = (a.on == true) -- the switch follows what you did in the game
    end
    if a.rules and a.rules ~= "" then CFG.ARrules, CFG.ARstop = a.rules, a.stop or "" end
    LEARN.dirty = true
    AR.msg = ""
    note(("learned an Auto Roll %s message"):format(ruleCh and "choices" or (a.on and "on" or "off")))
end
function AR.resolve(v)
    if type(v) ~= "table" then return v end
    if v.__slot == "rules" then return CFG.ARrules ~= "" and CFG.ARrules or plr:GetAttribute("AutoRollRules") end
    if v.__slot == "stop" then return CFG.ARstop ~= "" and CFG.ARstop or plr:GetAttribute("AutoRollStop") end
    if v.__slot == "player" then return plr end
    local o = {}
    for k, x in pairs(v) do o[k] = AR.resolve(x) end
    return o
end
function AR.replay(r, list)
    local unpack_ = table.unpack or unpack
    for _, c in ipairs(list) do
        local args = {}
        for i = 1, c.n do args[i] = AR.resolve(c.args[i]) end
        AR.replaying = true
        pcall(function()
            if c.m == "InvokeServer" then
                task.spawn(function() pcall(function() r:InvokeServer(unpack_(args, 1, c.n)) end) end)
            else r:FireServer(unpack_(args, 1, c.n)) end
        end)
        AR.replaying = false
        task.wait(0.25)
    end
end
-- Put the game's Auto Roll the way your settings say. forceOff: also switch it OFF if you asked.
function AR.apply(why, forceOff)
    if AR.busy or not S.alive then return end
    AR.busy = true
    pcall(function()
        local R = RS:FindFirstChild("Remotes")
        local r = R and R:FindFirstChild("AutoRollAction")
        if not r then AR.msg = "this game has no AutoRollAction" return end
        local want = CFG.AutoRoll
        if want and CFG.ARrules ~= "" and plr:GetAttribute("AutoRollRules") ~= CFG.ARrules then
            if #AR.rec.rules == 0 then
                AR.msg = "pick your Auto Roll choices once in the game's menu so I can learn them"
                note(AR.msg)
            else
                AR.replay(r, AR.rec.rules)
                if waitFor(function() return plr:GetAttribute("AutoRollRules") == CFG.ARrules end, 4) then
                    note("Auto Roll choices put back")
                else
                    AR.msg = "Auto Roll choices did not come out the same - set them in the game, then SAVE"
                    note(AR.msg)
                end
            end
        end
        if want == AR.isOn() or (not want and not forceOff) then return end
        local call = want and AR.rec.on or AR.rec.off
        if not call then -- a plain "toggle" message (no true/false in it) works both ways; it is checked below
            local other = want and AR.rec.off or AR.rec.on
            local plain = other ~= nil
            for j = 1, other and other.n or 0 do
                if type(other.args[j]) == "boolean" then plain = false end
            end
            if plain then call = other end
        end
        if not call then
            AR.msg = ("switch Auto Roll %s once in the game's menu so I can learn it"):format(want and "on" or "off")
            note(AR.msg)
            return
        end
        AR.replay(r, { call })
        if waitFor(function() return AR.isOn() == want end, 4) then
            AR.msg = ""
            note(("Auto Roll switched %s%s"):format(want and "ON" or "OFF", why and (" (" .. why .. ")") or ""))
        else
            AR.msg = "Auto Roll did not switch - do it once in the game so I can relearn it"
            note(AR.msg)
        end
    end)
    AR.busy = false
end

-- Selling an unwanted butter. A capture of the real game shows the client sends
-- SellSquishy:FireServer() with no arguments at all, so that is the first thing tried.
-- ---- pets: adopt ticked pets from Biscuit's pen and keep wishes running for them.
-- Both go straight to the server (PetRequest), from anywhere on the map. The pen lives in
-- ReplicatedStorage.PetMeadowSpawns: one child per pet in the pen (attributes Pet, Variant,
-- ExpiresAt, and A_<userId> once that player adopted it - every player may adopt each pen pet once).
-- Its "Wishes" attribute is JSON { PetName = serverTimeItEnds }: one wish per pet per server, 20 min.
PX.HS = game:GetService("HttpService")
PX.uid = (function() local ok, id = pcall(function() return plr.UserId end) return ok and id or 0 end)()
PX.buyMsg, PX.wishMsg, PX.wishN = "", "", 0
function PX.info()
    if PX.I then return PX.I end
    local ok, I = pcall(function() return require(RS:WaitForChild("Modules", 5):WaitForChild("PetInfo", 5)) end)
    if ok and type(I) == "table" and type(I.Pets) == "table" then PX.I = I end
    return PX.I
end
function PX.order() -- every pet, worst first: by rarity, then price
    if PX.list then return PX.list end
    local I = PX.info()
    if not I then return {} end
    local t = {}
    if type(I.Order) == "table" and #I.Order > 0 then
        for _, n in ipairs(I.Order) do if I.Pets[n] then t[#t + 1] = n end end
    else
        for n in pairs(I.Pets) do t[#t + 1] = n end
        table.sort(t, function(a, b) return (I.Pets[a].price or 0) < (I.Pets[b].price or 0) end)
    end
    PX.list = t
    return t
end
function PX.nice(name, var)
    local I = PX.info()
    local p = I and I.Pets[name]
    return ((var and var ~= "") and (var .. " ") or "") .. (p and p.displayName or tostring(name))
end
function PX.data() -- read-only: decoded again only when the game changes it (the team loop asks 4x a second)
    local raw = plr:GetAttribute("PetsData")
    if type(raw) ~= "string" then return nil end
    if raw == PX.rawD then return PX.lastD end
    local ok, d = pcall(function() return PX.HS:JSONDecode(raw) end)
    d = (ok and type(d) == "table") and d or nil
    PX.rawD, PX.lastD = raw, d
    return d
end
function PX.pen() return RS:FindFirstChild("PetMeadowSpawns") end
function PX.srv() return WS:GetServerTimeNow() end
function PX.money()
    local mv = plr:FindFirstChild("MoneyValue")
    if mv and type(mv.Value) == "number" then return mv.Value end
    return cash() or 0
end
function PX.wishes() -- running wishes in this server: name -> seconds left
    local pen = PX.pen()
    local raw = pen and pen:GetAttribute("Wishes")
    local out, t = {}, PX.srv()
    if type(raw) ~= "string" then return out end
    local ok, w = pcall(function() return PX.HS:JSONDecode(raw) end)
    if ok and type(w) == "table" then
        for k, v in pairs(w) do if type(v) == "number" and v > t then out[k] = v - t end end
    end
    return out
end
function PX.call(...) -- PetRequest:InvokeServer, never waiting more than 6 s for the answer
    local rem = RS:FindFirstChild("Remotes")
    local r = rem and rem:FindFirstChild("PetRequest")
    if not r then return nil end
    local a = table.pack(...)
    local box = {}
    task.spawn(function()
        box.ok, box.v = pcall(function() return r:InvokeServer(table.unpack(a, 1, a.n)) end)
        box.done = true
    end)
    local t0 = now()
    while not box.done and now() - t0 < 6 do task.wait(0.05) end
    if box.done and box.ok then return box.v end
    return nil
end
function PX.want(name) return CFG.Pets[name] end
-- After an adopt the game shows its card for ~2.6 s, then opens "Name your pet" with the keyboard up and
-- leaves it there. For pets adopted here it is shut the way the game's own Later button does it
-- (Naming.close), so it never sits on the screen; name them any time from the pet menu.
function PX.closeNaming(g)
    local ok = pcall(function()
        local ps = plr:FindFirstChild("PlayerScripts")
        local m = ps and ps:FindFirstChild("Naming", true)
        require(m).close()
    end)
    nap(0.5) -- its close tween is 0.15 s
    if g.Visible then
        pcall(function() local b = g:FindFirstChild("NameBox", true) if b then b:ReleaseFocus() end end)
        g.Visible = false
        ok = false
    end
    return ok
end
function PX.skipNaming()
    -- a burst of adopts opens one window (for the last pet); one close per burst, within 10 s of it
    PX.namingUntil = now() + 10
    if PX.namingOn then return end
    PX.namingOn = true
    task.spawn(function()
        while S.alive and now() < PX.namingUntil do
            local pg = plr:FindFirstChildOfClass("PlayerGui")
            local mg = pg and pg:FindFirstChild("MainGui")
            local g = mg and mg:FindFirstChild("PetNameGui")
            if g and g.Visible then
                nap(0.4) -- let it finish opening first
                if g.Visible then
                    PX.namingShut = (PX.namingShut or 0) + 1
                    pcall(PX.closeNaming, g)
                    break
                end
            end
            nap(0.25)
        end
        PX.namingOn = false
    end)
end
function PX.buyTick()
    if not CFG.PetBuy then PX.buyMsg = "auto adopt is off" return end
    local I, pen, d = PX.info(), PX.pen(), PX.data()
    if not (I and pen and d) then PX.buyMsg = "pet data not loaded yet" return end
    PX.tryAt = PX.tryAt or {}
    local owned, maxOwned = #(d.pets or {}), tonumber(d.maxOwned) or 60
    local t, seen, msg = PX.srv(), {}, nil
    for _, s in ipairs(pen:GetChildren()) do
        seen[s.Name] = true
        local name, var = s:GetAttribute("Pet"), s:GetAttribute("Variant") or ""
        local w = name and PX.want(name)
        if w and w.b and I.Pets[name] and (not w.g or var == "Big") and FU.wantMore(name, var, d) and not s:GetAttribute("A_" .. PX.uid)
            and (tonumber(s:GetAttribute("ExpiresAt")) or 0) > t + 1 and now() >= (PX.tryAt[s.Name] or 0) then
            local nice, price = PX.nice(name, var), I.Pets[name].price or 0
            if owned >= maxOwned then
                msg = ("%s is in the pen, but you have %d/%d pets"):format(nice, owned, maxOwned)
                PX.tryAt[s.Name] = now() + 15
            elseif PX.money() < price then
                msg = ("%s is in the pen - need $%s"):format(nice, fmt(price))
                PX.tryAt[s.Name] = now() + 5
            else
                PX.tryAt[s.Name] = now() + 8
                local r = PX.call("adopt", s.Name)
                if type(r) == "table" and r.ok then
                    owned = owned + 1
                    PX.buys = (PX.buys or 0) + 1
                    PX.recent = PX.recent or {}
                    local got = type(r.pet) == "table" and r.pet or {}
                    table.insert(PX.recent, { id = tostring(got.id or ("?" .. now())), name = name, variant = var, at = now() })
                    if #PX.recent > 30 then table.remove(PX.recent, 1) end
                    note("ADOPTED " .. nice)
                    PX.skipNaming()
                    msg = "adopted " .. nice
                else
                    local why = type(r) == "table" and tostring(r.reason or "no reason given") or "no answer"
                    note(("adopt %s failed: %s"):format(nice, why))
                    msg = "adopt failed: " .. why
                    if type(r) == "table" and r.bagFull then PX.tryAt[s.Name] = now() + 60 end
                end
            end
        end
    end
    for k in pairs(PX.tryAt) do if not seen[k] then PX.tryAt[k] = nil end end
    PX.buyMsg = msg or ("watching the pen (%d/%d pets)"):format(owned, maxOwned)
end
function PX.wishTick()
    if not CFG.PetWish then PX.wishMsg = "auto wish is off" return end
    local I = PX.info()
    if not (I and PX.pen()) then PX.wishMsg = "pet data not loaded yet" return end
    PX.wishTry, PX.wishWhy = PX.wishTry or {}, PX.wishWhy or {}
    local w, mine, msg = PX.wishes(), 0, nil
    local share = (type(I.Wish) == "table" and I.Wish.cashShare) or 2
    local dd = PX.data()
    for _, name in ipairs(PX.order()) do
        local want = PX.want(name)
        if want and want.w and FU.wantMore(name, "", dd) then -- a Big goal that is covered needs no more wishes
            mine = mine + 1
            if not w[name] and now() >= (PX.wishTry[name] or 0) then
                local credits = tonumber(plr:GetAttribute("PetWishCredits")) or 0
                local price = math.floor((I.Pets[name].price or 0) * share)
                if credits <= 0 and PX.money() < price then
                    PX.wishTry[name] = now() + 10
                    msg = ("need $%s to wish for %s"):format(fmt(price), PX.nice(name))
                    PX.wishWhy[name] = msg
                else
                    PX.wishTry[name] = now() + 3
                    local how = credits > 0 and "wishCredit" or "wish"
                    local r = PX.call(how, name)
                    if type(r) == "table" and r.ok then
                        PX.wishN, PX.wishWhy[name] = PX.wishN + 1, nil
                        note(("WISHED for %s (%s)"):format(PX.nice(name), credits > 0 and "free wish" or ("$" .. fmt(price))))
                    else
                        local why = type(r) == "table" and tostring(r.reason or "no reason given") or "no answer"
                        -- someone else's wish beat us to it: it shows up in Wishes, so just look again soon
                        if why:lower():find("already", 1, true) then PX.wishTry[name] = now() + 2
                        else note(("wish %s failed: %s"):format(PX.nice(name), why)) msg = "wish failed: " .. why end
                    end
                end
            end
        end
    end
    if not msg then
        for _, name in ipairs(PX.order()) do
            local want = PX.want(name)
            if want and want.w and not w[name] and PX.wishWhy[name] then msg = PX.wishWhy[name] break end
        end
    end
    if not msg then
        local run = {}
        for _, name in ipairs(PX.order()) do
            local want = PX.want(name)
            if want and want.w and w[name] then run[#run + 1] = ("%s %dm"):format(PX.nice(name), math.ceil(w[name] / 60)) end
        end
        msg = mine == 0 and "no pet has WISH ticked" or ("running: " .. (#run > 0 and table.concat(run, ", ") or "none yet"))
    end
    PX.wishMsg = msg
end

-- ---- pet teams: the saved loadouts from the game's Teams page, switched with PetRequest("teamEquip", n)
-- Every running wax goes at the speed of the pets worn right now; head starts are decided when a butter
-- is placed and the glaze is rolled the moment a wax finishes. So: WAX team (head starts) while placing,
-- GLAZE team from GlazeLead s before a wax finishes until it has, FULL (money + wax speed) while every
-- station is busy, NORMAL the rest of the time. A help never leaves a wax under 60 s, so 45 s is safe.
TM.switches, TM.glazed, TM.finished = 0, 0, 0
TM.done, TM.doneN, TM.later = {}, 0, {}
function TM.teams()
    local d = PX.data()
    return (d and d.teams) or {}, d
end
function TM.current(d)
    d = d or PX.data()
    if not d then return "" end
    local eq = {}
    for _, id in ipairs(d.equipped or {}) do eq[tostring(id)] = true end
    for _, t in ipairs(d.teams or {}) do
        local pets = t.pets or {}
        local same = #pets == #(d.equipped or {})
        if same then for _, id in ipairs(pets) do if not eq[tostring(id)] then same = false break end end end
        if same then return t.name end
    end
    return ""
end
function TM.equip(name)
    local list, d = TM.teams()
    local idx
    for i, t in ipairs(list) do if t.name == name then idx = i break end end
    if not idx then TM.msg = "no saved team called " .. tostring(name) return false end
    if TM.current(d) == name then return true end
    for _ = 1, 4 do
        local r = PX.call("teamEquip", idx)
        if type(r) == "table" and r.ok then
            TM.switches = TM.switches + 1
            return true
        end
        task.wait(0.4) -- the server allows about one switch a second
    end
    return false
end
-- A running wax speeds up and slows down with the pets you wear RIGHT NOW (measured Nov 17: switching
-- to the wax team cut every station's time by x1.71 at once). PourEnd is only the guess made when the
-- butter was placed and goes stale after any team change, so the time left is read from the station's
-- own countdown, which the server writes ("103:44"; "0-1:59" once done).
function TM.left(st)
    local ph = st:FindFirstChild("SquishyPlaceHolder")
    local tg = ph and ph:FindFirstChild("TimerGui")
    local tl = tg and tg:FindFirstChildWhichIsA("TextLabel", true)
    local s = tl and tl.Text
    if type(s) ~= "string" or s:find("-", 1, true) then return nil end
    local a, b, c = s:match("^%s*(%d+):(%d+):?(%d*)%s*$")
    if not a then return nil end
    local v = c ~= "" and (tonumber(a) * 3600 + tonumber(b) * 60 + tonumber(c)) or (tonumber(a) * 60 + tonumber(b))
    return v > 0 and v or nil -- 0 or a leftover "done" text: not a time to act on
end
function TM.waxes() -- your running waxes, soonest first
    local out = {}
    local ws = S.plot and S.plot:FindFirstChild("WaxStations")
    if not ws then return out end
    local t = PX.srv()
    for _, st in ipairs(ws:GetChildren()) do
        local e = tonumber(st:GetAttribute("PourEnd"))
        local own = st:GetAttribute("PourOwner")
        if st:GetAttribute("HasSquishy") and st:GetAttribute("PourId") and (own == nil or own == PX.uid) then
            local l = TM.left(st)
            local ends = l and (t + l) or ((e and e > t) and e or nil) -- no countdown yet (just placed): the placing guess
            if ends then
                local ph, nm = st:FindFirstChild("SquishyPlaceHolder"), "?"
                if ph then for _, c in ipairs(ph:GetChildren()) do if c:IsA("Model") then nm = c.Name break end end end
                local helpers = tostring(st:GetAttribute("Helpers") or "")
                local nh = 0
                for _ in helpers:gmatch("%d+") do nh = nh + 1 end
                out[#out + 1] = { st = st, ends = ends, sure = l ~= nil, id = st:GetAttribute("PourId"), name = nm, helps = nh,
                    long = st:GetAttribute("PourLong") == true }
            end
        end
    end
    table.sort(out, function(a, b) return a.ends < b.ends end)
    return out
end
function TM.glazeCount()
    local rem = RS:FindFirstChild("Remotes")
    local r = rem and rem:FindFirstChild("EditStack")
    if not r then return nil end
    local ok, v = pcall(function() return r:InvokeServer("State", nil) end)
    if not (ok and type(v) == "table" and type(v.state) == "table") then return nil end
    local n, g = 0, {}
    for _, e in ipairs(v.state.entries or {}) do
        if e.glaze and e.glaze ~= "" then n = n + 1 g[e.glaze] = (g[e.glaze] or 0) + 1 end
    end
    return n, g, #(v.state.entries or {}), v.state.capacity
end
function TM.finishedOne(w, before)
    TM.finished = TM.finished + 1
    task.wait(2)
    local n, g, cnt, cap = TM.glazeCount()
    if n and before and n > before then
        TM.glazed = TM.glazed + 1
        local kinds = {}
        for k, v in pairs(g) do kinds[#kinds + 1] = k .. " " .. v end
        note(("GLAZED! %s on station %s finished glazed (%s glazed now: %s)"):format(prettyOf(key(w.name)), w.st.Name, n, table.concat(kinds, ", ")))
    else
        note(("wax done on station %s: %s, no glaze%s"):format(w.st.Name, prettyOf(key(w.name)),
            cnt and (" (stack " .. cnt .. "/" .. tostring(cap) .. ")") or ""))
    end
end
function TM.tick()
    TM.list = TM.waxes()
    if TM.editing and now() - (TM.editingSince or now()) > 120 then TM.editing = false end -- never stuck paused
    if TM.editing then TM.msg = "rebuilding teams..." return end
    if not CFG.Teams then TM.want, TM.msg = "", "auto teams is off" return end
    local t = PX.srv()
    -- the wax we are covering with the glaze team: hold it until its station has been cleared
    local g = TM.glazeFor
    if g then
        local st = g.st
        local still = st.Parent and st:GetAttribute("HasSquishy") and st:GetAttribute("PourId") == g.id
        local l = still and TM.left(st)
        if l then g.ends = t + l end -- the glaze team's own speed, helps included
        if not still then
            TM.glazeFor, TM.afterUntil = nil, now() + 1.5
            if not TM.done[g.id or "?"] then -- each wax is counted once
                TM.done[g.id or "?"], TM.doneN = true, TM.doneN + 1
                if TM.doneN > 400 then TM.done, TM.doneN = { [g.id or "?"] = true }, 1 end
                local before = g.before
                task.spawn(function() pcall(TM.finishedOne, g, before) end)
            end
        elseif g.ends - t > CFG.GlazeLead * 3 + 60 or t > g.ends + 90 then
            -- it is not finishing after all (or its countdown stopped): let it go, look again in 2 min
            TM.glazeFor, TM.afterUntil = nil, now() + 1.5
            TM.later[g.id or "?"] = now() + 120
            note(("station %s is not finishing yet (%s left) - glaze team off again"):format(st.Name, TM.clock(g.ends - t)))
        end
    end
    if CFG.TeamGlaze ~= "" and not TM.glazeFor then
        local r = TM.speedRatio(CFG.TeamGlaze)
        for _, w in ipairs(TM.list) do
            -- the lead is in glaze-team time: a wax with 30 s left on fast pets has ~50 s once they come off
            if w.sure and (w.ends - t) * r[w.long and 2 or 1] <= CFG.GlazeLead and now() >= (TM.later[w.id or "?"] or 0)
                and not TM.done[w.id or "?"] then
                TM.glazeFor = w
                task.spawn(function() w.before = TM.glazeCount() end)
                break
            end
        end
    end
    -- 1 glaze at a finish, 2 wax while placing (or holding a ticked butter with a station free),
    -- 3 FULL while every station is busy (money + the wax speed every running wax goes at), 4 NORMAL
    local want, why = "", ""
    local snap = IX.snapAt and (IX.snapAt - t) -- the admin's snap finishes every wax at once: glaze rolls then
    if snap and snap < -8 then IX.snapAt, snap = nil, nil end
    if CFG.TeamGlaze ~= "" and snap and snap <= 20 then
        want, why = CFG.TeamGlaze, (" - the admin snap finishes every wax in %ds"):format(math.max(0, math.floor(snap)))
    elseif CFG.TeamGlaze ~= "" and (TM.glazeFor or now() < (TM.afterUntil or 0)) then
        want, why = CFG.TeamGlaze, TM.glazeFor and (" - station " .. TM.glazeFor.st.Name .. " finishes soon") or ""
    elseif CFG.TeamWax ~= "" and (TM.placing or TM.aboutToPlace()) then
        want, why = CFG.TeamWax, " - placing a butter"
    elseif CFG.TeamFull ~= "" and TM.allBusy() then
        want, why = CFG.TeamFull, " - every station is busy"
    else
        want = CFG.TeamNormal
    end
    TM.want = want
    local cur = TM.current()
    TM.cur = cur
    if want ~= "" and cur ~= want and now() >= (TM.nextTry or 0) then
        TM.nextTry = now() + 1.1
        if TM.equip(want) then
            note("team: " .. want .. why)
        else
            TM.nextTry = now() + 3
        end
    end
    local nx = TM.list[1]
    TM.msg = ("on: %s%s | next wax done %s"):format(cur ~= "" and cur or "(not a saved team)",
        (want ~= "" and want ~= cur) and (" -> " .. want) or "",
        nx and ("in " .. TM.clock(nx.ends - t) .. " (st " .. nx.st.Name .. ")") or "- none running")
end
function TM.clock(s)
    s = math.max(0, math.floor(s))
    if s >= 3600 then return ("%d:%02d:%02d"):format(math.floor(s / 3600), math.floor((s % 3600) / 60), s % 60) end
    return ("%d:%02d"):format(math.floor(s / 60), s % 60)
end
function TM.allBusy()
    local free, total = freeCount()
    return total > 0 and free == 0
end
function TM.aboutToPlace() -- a ticked butter in hand and somewhere to put it: put the wax team on already
    if not S.running then return false end
    local held = carriedName()
    if not (held and isTarget(held)) then return false end
    local free = freeCount()
    return free > 0
end
function TM.mult(ws, lw, so) return { (1 + ws) * (1 + so), (1 + ws + lw) * (1 + so) } end -- short wax, long wax
function TM.speedNow()
    local function a(k) return tonumber(plr:GetAttribute(k)) or 0 end
    return TM.mult(a("PetWaxSpeed"), a("PetLongWax"), a("PetSocialWax"))
end
function TM.speedOf(name) -- the wax speed a saved team gives, from its pets
    local list, d = TM.teams()
    if not d then return nil end
    for _, tm in ipairs(list) do
        if tm.name == name then
            local pets = {}
            for _, id in ipairs(tm.pets or {}) do
                for _, p in ipairs(d.pets or {}) do if tostring(p.id) == tostring(id) then pets[#pets + 1] = p break end end
            end
            local c = FU.caps()
            local s, soc = FU.stats(pets)
            return TM.mult(math.min(s.waxSpeed or 0, c.waxSpeed or 0.25), math.min(s.longWax or 0, c.longWax or 0.3), soc.socialWax or 0)
        end
    end
    return nil
end
function TM.speedRatio(name) -- time left now x this = time left once that team is on
    local a, b = TM.speedNow(), TM.speedOf(name)
    if not b then return { 1, 1 } end
    return { a[1] / b[1], a[2] / b[2] }
end
function TM.glazeSoon() -- placing waits while the glaze team is covering a finish
    return CFG.Teams and CFG.TeamGlaze ~= "" and (TM.glazeFor ~= nil or now() < (TM.afterUntil or 0))
end
-- ---- fusing and team building
-- Fuse: 7 non-Big copies of one pet (3 with the Fuse pass) -> one Big, by PetRequest("fuse", { ids = {...} }).
-- Each ticked pet can have a goal of Big copies; buying and wishing stop once there is enough for it,
-- and the fuse happens as soon as the copies are there. A fuse can use up pets your teams wear, so the
-- teams are then worked out again from everything you own, one role at a time:
--   farm  (stations free)      money and Apple Pie supply (luck, social luck, Eagle), then wax speed
--   full  (every station busy) money and wax speed: every running wax goes at the speed worn right now
--   glaze (at a finish)        the glaze gain per finish, money to break ties
--   wax   (while placing)      head starts (decided at the drop), then money
FU.CAPS = { income = 0.5, price = 0.25, waxSpeed = 0.25, offline = 1, luck = 3, waxStirPerMinute = 30, cratePulls = 4,
    glaze = 0.25, glazeUp = 0.5, headStart = 0.4, cashGiftPerMinute = 9, newFind = 2, longWax = 0.3 }
FU.ROUND = { luck = true, luckyPull = true, crate = true, waxStir = true, socialLuck = true, cashGift = true }
FU.buildMsg, FU.fuseMsg, FU.fused, FU.builds = "", "", 0, 0
function FU.need() return plr:GetAttribute("FusePass") == true and 3 or 7 end
function FU.caps()
    local I = PX.info()
    return (I and type(I.Caps) == "table") and I.Caps or FU.CAPS
end
function FU.value(name, variant) -- this pet's boost kind, value (Big included) and period
    local I = PX.info()
    local p = I and I.Pets[name]
    if not (p and type(p.boost) == "table") then return nil end
    local v
    if type(I.boostValue) == "function" then
        local ok, x = pcall(I.boostValue, name, (variant ~= "" and variant) or nil)
        v = ok and tonumber(x) or nil
    end
    if not v then
        v = p.boost.value or 0
        if variant == "Big" then
            local b = v * 1.5
            v = FU.ROUND[p.boost.kind] and math.max(v + 1, math.floor(b + 0.5)) or b
        end
    end
    return p.boost.kind, v, p.boost.every
end
function FU.stats(list)
    local s, soc = {}, {}
    for _, p in ipairs(list) do
        local kind, v, every = FU.value(p.name, p.variant or "")
        if kind then
            if kind:sub(1, 6) == "social" then soc[kind] = math.max(soc[kind] or 0, v) -- only the best one counts
            elseif kind == "waxStir" or kind == "cashGift" then s[kind] = (s[kind] or 0) + v * 60 / (every or 60)
            elseif kind == "luckyPull" then s.luckyPull = (s.luckyPull or 0) + v / (every or 10)
            else s[kind] = (s[kind] or 0) + v end
        end
    end
    return s, soc
end
function FU.glazeGain(bonus, up) -- the game's GlazeOdds: worth of one finish, in plain-butter incomes
    local base, mult, order = { 0.003, 0.0005, 0.0002 }, { 1.5, 2, 2.5 }, nil
    local total = base[1] + base[2] + base[3]
    local guild = tonumber(plr:GetAttribute("GuildUpGlaze")) or 0
    local b = {}
    for i = 1, 3 do b[i] = base[i] + bonus * base[i] / total + (i == 1 and guild or 0) end
    local f = { b[1] * (1 - up), b[2] * (1 - up) + b[1] * up, b[3] + b[2] * up }
    return f[1] * (mult[1] - 1) + f[2] * (mult[2] - 1) + f[3] * (mult[3] - 1)
end
function FU.score(role, list)
    local c = FU.caps()
    local s, soc = FU.stats(list)
    local function cap(k) return math.min(s[k] or 0, c[k] or math.huge) end
    local money = (1 + cap("income")) * (1 + (soc.socialIncome or 0)) * (1 + math.min(s.cashGift or 0, c.cashGiftPerMinute or 9) / 60)
    local rolls = 1 + cap("luck") + (s.luckyPull or 0) + (soc.socialLuck or 0)
    local pie = rolls * (1 + cap("newFind")) * (1 + cap("rollSpeed")) -- rollSpeed (Ostrich, Star Whale): more rolls a minute
    local lm = math.log(money)
    local st = math.max(tonumber(plr:GetAttribute("WaxStations")) or 18, 1)
    -- a stir pet works on one wax at a time: +30 s a minute is ~3% more speed spread over 18 stations
    local speed = (1 + cap("waxSpeed") + cap("longWax")) * (1 + (soc.socialWax or 0))
        + math.min(s.waxStir or 0, c.waxStirPerMinute or 30) / 60 / st
    local hs = 1 - (1 - cap("headStart")) * (1 - (soc.socialHeadStart or 0))
    -- weights: with the stack full of Apple Pie a finish only pays through its glaze: ~0.085% more income
    -- for good per finish with the glaze team. With every station busy, x1.71 speed is ~3.6 more finishes
    -- an hour, which over ~3 days of farming is worth about as much as +20% money: so speed counts 0.4
    -- of money there. While stations wait for Apple Pies, luck fills them and speed only brings the
    -- glaze sooner, so it counts a little.
    if role == "farm" then return lm + 0.7 * math.log(pie) + 0.1 * math.log(speed) end
    if role == "full" then return lm + 0.4 * math.log(speed) + 0.02 * math.log(pie) end
    if role == "glaze" then return FU.glazeGain(cap("glaze"), cap("glazeUp")) + 0.001 * lm end
    if role == "wax" then return -math.log(1 - 0.5 * hs) + 0.001 * lm + 0.001 * math.log(speed) end
    return lm
end
function FU.best(role, pets, slots, keep) -- greedy fill, then swaps until nothing improves
    keep = keep or {}
    local chosen, used = {}, {}
    local function listOf(idx) local l = {} for i, k in ipairs(idx) do l[i] = pets[k] end return l end
    local function sc(idx)
        local v = FU.score(role, listOf(idx))
        for _, k in ipairs(idx) do if keep[pets[k].id] then v = v + 1e-7 end end -- ties: stay as you are
        return v
    end
    for _ = 1, math.min(slots, #pets) do
        local bi, bs
        for k = 1, #pets do
            if not used[k] then
                chosen[#chosen + 1] = k
                local v = sc(chosen)
                chosen[#chosen] = nil
                if not bs or v > bs + 1e-12 then bi, bs = k, v end
            end
        end
        if not bi then break end
        used[bi] = true
        chosen[#chosen + 1] = bi
    end
    for _ = 1, 6 do
        task.wait() -- spread the search over frames
        local improved, cur = false, sc(chosen)
        for a = 1, #chosen do
            for k = 1, #pets do
                if not used[k] then
                    local old = chosen[a]
                    chosen[a] = k
                    local v = sc(chosen)
                    if v > cur + 1e-9 then used[old], used[k], cur, improved = nil, true, v, true
                    else chosen[a] = old end
                end
            end
        end
        if not improved then break end
    end
    local ids = {}
    for i, k in ipairs(chosen) do ids[i] = tostring(pets[k].id) end
    return ids, FU.score(role, listOf(chosen))
end
function FU.count(name, d, forFuse)
    local regs, bigs = {}, 0
    local arriving, seen = {}, {}
    for _, id in ipairs(d.arriving or {}) do arriving[tostring(id)] = true end
    for _, p in ipairs(d.pets or {}) do
        seen[tostring(p.id)] = true
        if p.name == name and not arriving[tostring(p.id)] then
            if p.variant == "Big" then bigs = bigs + 1 elseif (p.variant or "") == "" then regs[#regs + 1] = p end
        end
    end
    if not forFuse then -- pets adopted a moment ago that your pet list does not show yet still count
        for _, a in ipairs(PX.recent or {}) do
            if a.name == name and not seen[a.id] and now() - a.at < 20 then
                if a.variant == "Big" then bigs = bigs + 1 else regs[#regs + 1] = a end
            end
        end
    end
    return regs, bigs
end
function FU.goal(name) local w = CFG.Pets[name] return w and tonumber(w.f) or 0 end
function FU.wantMore(name, variant, d) -- smart buying: only what the Big goal still needs
    local goal = FU.goal(name)
    if goal <= 0 or not d then return true end
    local regs, bigs = FU.count(name, d)
    if bigs >= goal then return false end
    if variant == "Big" then return true end
    return #regs < FU.need() * (goal - bigs)
end
function FU.status(name, d)
    local goal = FU.goal(name)
    if goal <= 0 or not d then return nil end
    local regs, bigs = FU.count(name, d)
    if bigs >= goal then return ("Big %d/%d done"):format(bigs, goal) end
    return ("%d/%d to fuse, Big %d/%d"):format(math.min(#regs, FU.need()), FU.need(), bigs, goal)
end
function FU.wear(ids) -- put on exactly these pets
    local want = {}
    for _, id in ipairs(ids) do want[tostring(id)] = true end
    for _ = 1, 3 do
        local d = PX.data()
        if not d then return false end
        for _, id in ipairs(d.equipped or {}) do
            if not want[tostring(id)] then PX.call("unequip", id) task.wait(0.3) end
        end
        d = PX.data()
        local have = {}
        for _, id in ipairs(d.equipped or {}) do have[tostring(id)] = true end
        for _, id in ipairs(ids) do
            if not have[tostring(id)] then PX.call("equip", id) task.wait(0.3) end
        end
        task.wait(0.4)
        d = PX.data()
        local n, ok = 0, true
        for _, id in ipairs(d.equipped or {}) do n = n + 1 if not want[tostring(id)] then ok = false end end
        if ok and n == #ids then return true end
    end
    return false
end
function FU.saveTeam(name, ids)
    if not FU.wear(ids) then return false, "could not put the pets on" end
    local list = TM.teams()
    local idx
    for i, t in ipairs(list) do if t.name == name then idx = i break end end
    local r
    if idx then
        r = PX.call("teamSave", idx)
    else
        r = PX.call("teamNew")
        if type(r) == "table" and r.ok and r.index then
            idx = r.index
            task.wait(0.3)
            PX.call("teamRename", { index = idx, name = name })
        end
    end
    task.wait(0.4)
    local d = PX.data()
    local t = d and d.teams and idx and d.teams[idx]
    if not t then return false, "the game did not save it" end
    local got = {}
    for _, id in ipairs(t.pets or {}) do got[tostring(id)] = true end
    for _, id in ipairs(ids) do if not got[tostring(id)] then return false, "saved, but not with these pets" end end
    return true
end
FU.ROLES = { { "TeamNormal", "farm" }, { "TeamFull", "full" }, { "TeamGlaze", "glaze" }, { "TeamWax", "wax" } }
function FU.quiet() -- nothing about to finish, nothing being placed: a rebuild takes ~15 s
    if TM.placing or TM.glazeSoon() then return false end
    local t = PX.srv()
    for _, w in ipairs(TM.list or {}) do if w.ends - t < (CFG.GlazeLead or 45) + 90 then return false end end
    return true
end
function FU.plan() -- which of your role teams would change, and to what
    local d = PX.data()
    if not d then return {} end
    local arriving = {}
    for _, id in ipairs(d.arriving or {}) do arriving[tostring(id)] = true end
    local pets = {}
    for _, p in ipairs(d.pets or {}) do
        if not arriving[tostring(p.id)] then pets[#pets + 1] = { id = tostring(p.id), name = p.name, variant = p.variant or "" } end
    end
    local byId = {}
    for _, p in ipairs(pets) do byId[p.id] = p end
    local slots = tonumber(d.slots) or 3
    local out, seen = {}, {}
    for _, r in ipairs(FU.ROLES) do
        local name = CFG[r[1]]
        if name ~= "" and not seen[name] then
            seen[name] = true
            local cur, curList, broken = {}, {}, false
            for _, t in ipairs(d.teams or {}) do
                if t.name == name then
                    for _, id in ipairs(t.pets or {}) do
                        local p = byId[tostring(id)]
                        if p then cur[p.id] = true curList[#curList + 1] = p else broken = true end
                    end
                end
            end
            local ids, best = FU.best(r[2], pets, slots, cur)
            local now0 = FU.score(r[2], curList)
            local same = #ids == #curList
            for _, id in ipairs(ids) do if not cur[id] then same = false end end
            if not same and (broken or #curList < math.min(slots, #pets) or best > now0 + 1e-4) then
                out[#out + 1] = { team = name, role = r[2], ids = ids, gain = best - now0 }
            end
        end
    end
    return out
end
function FU.rebuild(why)
    local changes = FU.plan()
    if #changes == 0 then FU.buildMsg = "teams are already the best your pets allow" return true end
    if not FU.quiet() then FU.buildMsg = "a wax finishes soon - rebuilding the teams after it" return false end
    TM.editing, TM.editingSince = true, now()
    local okAll = true
    local okRun, errRun = pcall(function()
    for _, ch in ipairs(changes) do
        local ok, err = FU.saveTeam(ch.team, ch.ids)
        local d = PX.data()
        local names = {}
        for _, id in ipairs(ch.ids) do
            for _, p in ipairs(d and d.pets or {}) do
                if tostring(p.id) == id then names[#names + 1] = PX.nice(p.name, p.variant) end
            end
        end
        if ok then note(("TEAM %s rebuilt (%s): %s"):format(ch.team, why or "pets changed", table.concat(names, ", ")))
        else okAll = false note(("TEAM %s: %s"):format(ch.team, tostring(err))) end
    end
    end)
    TM.editing, TM.nextTry = false, 0 -- always handed back, even after an error
    if not okRun then okAll = false note("TEAM BUILD ERR " .. tostring(errRun)) end
    FU.builds = FU.builds + 1
    FU.buildMsg = okAll and ("teams rebuilt " .. os.date("%H:%M")) or "a team could not be saved - see the log"
    return okAll
end
function FU.fuseTick()
    if not CFG.AutoFuse or TM.editing then return end
    local d = PX.data()
    if not d then return end
    local need = FU.need()
    local inTeam, eq = {}, {}
    for _, t in ipairs(d.teams or {}) do for _, id in ipairs(t.pets or {}) do inTeam[tostring(id)] = true end end
    for _, id in ipairs(d.equipped or {}) do eq[tostring(id)] = true end
    FU.failUntil = FU.failUntil or {}
    for name, w in pairs(CFG.Pets) do
        local goal = tonumber(w.f) or 0
        local regs, bigs = FU.count(name, d, true)
        if goal > 0 and bigs < goal and #regs >= need and now() >= (FU.failUntil[name] or 0) then
            -- spare copies first: not worn, not in a team, not one you named
            table.sort(regs, function(a, b)
                local ra = (eq[tostring(a.id)] and 4 or 0) + (inTeam[tostring(a.id)] and 2 or 0) + (a.named and 1 or 0)
                local rb = (eq[tostring(b.id)] and 4 or 0) + (inTeam[tostring(b.id)] and 2 or 0) + (b.named and 1 or 0)
                if ra ~= rb then return ra < rb end
                return tostring(a.id) < tostring(b.id)
            end)
            local ids, worn = {}, {}
            for i = 1, need do
                ids[i] = tostring(regs[i].id)
                if eq[ids[i]] then worn[#worn + 1] = ids[i] end
            end
            TM.editing, TM.editingSince = true, now()
            for _, id in ipairs(worn) do PX.call("unequip", id) task.wait(0.3) end
            local r = PX.call("fuse", { ids = ids })
            TM.editing, TM.nextTry = false, 0
            if type(r) == "table" and r.ok then
                FU.fused = FU.fused + 1
                FU.dirtyAt = now()
                note(("FUSED %d %s -> Big %s"):format(need, PX.nice(name), PX.nice(name)))
                FU.fuseMsg = ("fused a Big %s %s"):format(PX.nice(name), os.date("%H:%M"))
            else
                FU.failUntil[name] = now() + 120
                note(("fuse %s failed: %s"):format(PX.nice(name), type(r) == "table" and tostring(r.reason or "no reason given") or "no answer"))
            end
            return -- one fuse at a time; the pet list changes under us
        end
    end
end
function FU.tick()
    pcall(FU.fuseTick)
    if not CFG.AutoBuild or not CFG.Teams then return end
    local d = PX.data()
    if not d then return end
    local sig = {}
    for _, p in ipairs(d.pets or {}) do sig[#sig + 1] = tostring(p.id) end
    table.sort(sig)
    sig = table.concat(sig, ",")
    if sig ~= FU.sig then FU.sig, FU.dirtyAt = sig, now() end
    local due = (FU.dirtyAt and now() - FU.dirtyAt > 8) or now() - (FU.lastBuild or 0) > 900
    if due and not TM.editing then
        local ok = FU.rebuild(FU.dirtyAt and "pets changed" or "check")
        if ok then FU.dirtyAt, FU.lastBuild = nil, now() end
    end
end
-- ---- smoother overnight running
-- Measured on your phone (Nov 17): about 22 fps with the game's own Performance Mode already on.
-- Switching the 3D view off did not raise fps (the phone is busy with the game's per-frame scripts),
-- but turning the floating labels off did (+5 fps), and hiding the game's screens did (+3 fps).
-- Everything here is client-side and undone when switched off or when the script is killed.
PF.bb, PF.fx, PF.post, PF.hud = setmetatable({}, { __mode = "k" }), setmetatable({}, { __mode = "k" }), {}, {}
PF.watch = setmetatable({}, { __mode = "k" })
PF.mem, PF.memPeak, PF.fps = 0, 0, 0
function PF.isFx(d)
    return d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Beam") or d:IsA("Fire") or d:IsA("Smoke")
        or d:IsA("Sparkles") or d:IsA("Light")
end
-- Every label and effect is watched, not only the ones showing right now: the game switches a wax
-- station's timer on when a wax starts, so a timer that was off when LITE began must stay off too.
-- PF.bb / PF.fx remember what the game wants each one to be, so switching LITE off puts that back.
function PF.muteOne(d)
    if not CFG.Lite or not d.Parent then return end
    local store = (d:IsA("BillboardGui") and PF.bb) or (PF.isFx(d) and PF.fx) or nil
    if not store or store[d] ~= nil then return end
    store[d] = d.Enabled
    if d.Enabled then d.Enabled = false end
    PF.watch[d] = d:GetPropertyChangedSignal("Enabled"):Connect(function()
        if CFG.Lite and d.Enabled then store[d] = true d.Enabled = false end
    end)
end
function PF.lite(on)
    CFG.Lite = on
    if on then
        task.spawn(function()
            for i, d in ipairs(WS:GetDescendants()) do
                if not CFG.Lite then return end
                pcall(PF.muteOne, d)
                if i % 600 == 0 then task.wait() end -- spread over frames, never one long freeze
            end
        end)
        if not PF.addConn then
            PF.queue = {}
            PF.addConn = track(WS.DescendantAdded:Connect(function(d)
                if CFG.Lite and (d:IsA("BillboardGui") or PF.isFx(d)) then PF.queue[#PF.queue + 1] = d end
            end))
        end
        local L = game:GetService("Lighting")
        for _, e in ipairs(L:GetChildren()) do
            if e:IsA("PostEffect") and e.Enabled and PF.post[e] == nil then PF.post[e] = true e.Enabled = false end
        end
        pcall(function() PF.oldShadows = PF.oldShadows == nil and L.GlobalShadows or PF.oldShadows L.GlobalShadows = false end)
        pcall(function() PF.oldDeco = PF.oldDeco == nil and WS.Terrain.Decoration or PF.oldDeco WS.Terrain.Decoration = false end)
    else
        for _, c in pairs(PF.watch) do pcall(function() c:Disconnect() end) end
        for d, want in pairs(PF.bb) do pcall(function() if d.Parent then d.Enabled = want end end) end
        for d, want in pairs(PF.fx) do pcall(function() if d.Parent then d.Enabled = want end end) end
        for d in pairs(PF.post) do pcall(function() if d.Parent then d.Enabled = true end end) end
        PF.bb, PF.fx = setmetatable({}, { __mode = "k" }), setmetatable({}, { __mode = "k" })
        PF.watch, PF.post, PF.queue = setmetatable({}, { __mode = "k" }), {}, {}
        local L = game:GetService("Lighting")
        if PF.oldShadows ~= nil then pcall(function() L.GlobalShadows = PF.oldShadows end) PF.oldShadows = nil end
        if PF.oldDeco ~= nil then pcall(function() WS.Terrain.Decoration = PF.oldDeco end) PF.oldDeco = nil end
    end
end
PF.MINE = { SABFarmGui = true, SABToggle = true, SABError = true, SAB_Bridge = true }
function PF.hideHud(on)
    CFG.HideHud = on
    local pgui = plr:FindFirstChildOfClass("PlayerGui")
    if not pgui then return end
    if on then
        for _, g in ipairs(pgui:GetChildren()) do
            if g:IsA("ScreenGui") and not PF.MINE[g.Name] and g.Enabled then PF.hud[g] = true g.Enabled = false end
        end
        if not PF.hudConn then
            PF.hudConn = track(pgui.ChildAdded:Connect(function(g)
                if CFG.HideHud and g:IsA("ScreenGui") and not PF.MINE[g.Name] then
                    task.defer(function() if CFG.HideHud and g.Enabled then PF.hud[g] = true g.Enabled = false end end)
                end
            end))
        end
    else
        for g in pairs(PF.hud) do pcall(function() if g.Parent then g.Enabled = true end end) end
        PF.hud = {}
    end
end
PF.CAPS = { 0, 30, 15, 10 } -- 0 = leave the game's own limit alone
function PF.cap(n)
    CFG.FpsCap = n
    local f = (type(setfpscap) == "function" and setfpscap) or (type(set_fps_cap) == "function" and set_fps_cap)
    if not f then return false end
    return pcall(f, n == 0 and 60 or n)
end
-- Other players' bases, stacks and butters, made see-through on THIS screen only: fully see-through
-- parts are not drawn, so the phone has far less to draw. Nothing is removed, so helping their waxes,
-- reading their stations and walking about all work as before; new things that appear there (a new
-- butter on a stack) are hidden as they come. Switching it off puts every value back.
PF.unseen = setmetatable({}, { __mode = "k" })
function PF.hideOne(d)
    if d:IsA("BasePart") or d:IsA("Decal") or d:IsA("Texture") then
        if d.Transparency < 1 then PF.unseen[d] = d.Transparency d.Transparency = 1 end
    elseif d:IsA("BillboardGui") or d:IsA("SurfaceGui") or d:IsA("ParticleEmitter") or d:IsA("Beam")
        or d:IsA("Trail") or d:IsA("Light") or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles") then
        if d.Enabled then PF.unseen[d] = true d.Enabled = false end
    end
end
function PF.notMine(d) return CFG.HideMine or (S.plot and not d:IsDescendantOf(S.plot)) end
PF.BASES = { [0] = "BASES: ALL DRAWN", "BASES: OTHERS HIDDEN", "BASES: ALL HIDDEN" }
function PF.basesMode() return CFG.HideBases and (CFG.HideMine and 2 or 1) or 0 end
function PF.setBases(m) -- 0 draw everything, 1 hide other players' bases, 2 hide yours too
    if CFG.HideBases then PF.bases(false) end -- put everything back, then hide the new set
    CFG.HideMine = m == 2
    if m > 0 then PF.bases(true) end
end
function PF.bases(on)
    CFG.HideBases = on
    local plots = WS:FindFirstChild("Plots")
    if not plots then return end
    if on then
        task.spawn(function()
            local n = 0
            for _, pl in ipairs(plots:GetChildren()) do
                if pl ~= S.plot or CFG.HideMine then
                    for _, d in ipairs(pl:GetDescendants()) do
                        if not CFG.HideBases then return end
                        pcall(PF.hideOne, d)
                        n = n + 1
                        if n % 600 == 0 then task.wait() end -- spread over frames, no freeze
                    end
                end
            end
        end)
        if not PF.basesConn then
            PF.basesConn = track(plots.DescendantAdded:Connect(function(d)
                if CFG.HideBases and PF.notMine(d) then task.defer(function() pcall(PF.hideOne, d) end) end
            end))
        end
    else
        for d, v in pairs(PF.unseen) do
            pcall(function()
                if not d.Parent then return end
                if type(v) == "number" then d.Transparency = v else d.Enabled = true end
            end)
        end
        PF.unseen = setmetatable({}, { __mode = "k" })
    end
end
function PF.render(off)
    CFG.NoRender = off
    pcall(function() game:GetService("RunService"):Set3dRenderingEnabled(not off) end)
end
-- ---- NO ANIMATIONS: the game's own per-frame work that only changes what you see. Measured on your
-- phone Nov 22 (uncapped): ~36 fps with all of it, 48-55 fps with any one of the big ones off.
-- Read from the game's code before switching anything off; all of these only animate:
--   SquishyHandler   the stack's squish/rise animation (every butter, every frame)
--   GlazeHandler     the rainbow colour cycle on glazed butters
--   ConveyorHandler  the conveyor texture scroll and push
--   DeckHandler      bounce pads, deck fading
--   PetHandler       pets walking after you, the pen pets wandering (adopting is server-side)
--   SignDodge, Cannon, TeleportPads   sign and base-skin animations
-- The stairs gate (it changes collisions) and anything that runs the farm's prompts stays on.
PF.CALM = { "LocalScript.SquishyHandler", "LocalScript.GlazeHandler", "LocalScript.ConveyorHandler", "LocalScript.DeckHandler",
    "PetHandler.Walker", "PetHandler.Meadow", "FloorTeleportHandler.SignDodge", "BaseSkinHandler.Cannon", "BaseSkinHandler.TeleportPads" }
PF.calmed = {}
function PF.calmScan() -- (again every 20 s: the game makes new ones after a respawn)
    if not CFG.Calm or type(getconnections) ~= "function" then return 0 end
    local RunS = game:GetService("RunService")
    local n = 0
    for _, nm in ipairs({ "RenderStepped", "Heartbeat", "Stepped" }) do
        local okS, sig = pcall(function() return RunS[nm] end)
        local ok, cs = false, nil
        if okS and sig then ok, cs = pcall(getconnections, sig) end
        if ok and type(cs) == "table" then
            for _, c in ipairs(cs) do
                local src = ""
                pcall(function() local sc = getfenv(c.Function).script src = sc and sc:GetFullName() or "" end)
                if src ~= "" then
                    for _, pat in ipairs(PF.CALM) do
                        if src:find(pat, 1, true) then
                            if pcall(function() c:Disable() end) then PF.calmed[#PF.calmed + 1] = c n = n + 1 end
                            break
                        end
                    end
                end
            end
        end
    end
    if #PF.calmed > 200 then -- the same ones again and again: keep the list short
        local keep = {} for i = #PF.calmed - 49, #PF.calmed do keep[#keep + 1] = PF.calmed[i] end PF.calmed = keep
    end
    return n
end
function PF.calm(on)
    CFG.Calm = on
    if on then
        local n = PF.calmScan()
        note(("NO ANIMATIONS: %d of the game's animation loops switched off"):format(n))
    else
        for _, c in ipairs(PF.calmed) do pcall(function() c:Enable() end) end
        PF.calmed = {}
    end
end
function PF.restoreAll() -- KILL puts the game back exactly as it was
    pcall(PF.unpin)
    pcall(PF.calm, false)
    if CFG.HideBases then pcall(PF.bases, false) end
    if QX.arPaused then pcall(QX.resume, "script stopped") end
    pcall(PF.lite, false)
    pcall(PF.hideHud, false)
    pcall(function() game:GetService("RunService"):Set3dRenderingEnabled(true) end)
    if (CFG.FpsCap or 0) ~= 0 then pcall(PF.cap, 0) end
end
function PF.rejoinSame(why) -- back into this same server, so its wishes and helpers stay
    if S.rejoining then return end
    note("REJOIN this server (" .. why .. ")")
    pcall(saveLearn)
    if S.autoload then pcall(saveConfig, S.autoload) end
    queueSelf()
    local ok = pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
    end)
    task.delay(25, function() if S.alive then rejoin(why .. ", same server failed") end end)
    return ok
end
function PF.tick() -- once a second: fps, memory, queued labels, the watchdog
    local q = PF.queue
    if CFG.Lite and q and #q > 0 then
        PF.queue = {}
        for i, d in ipairs(q) do pcall(PF.muteOne, d) if i % 300 == 0 then task.wait() end end
    end
    -- the station timers once more, by hand: one was seen on near a finish (18 lookups a second)
    local ws = CFG.Lite and S.plot and S.plot:FindFirstChild("WaxStations")
    if ws then
        for _, st in ipairs(ws:GetChildren()) do
            local ph = st:FindFirstChild("SquishyPlaceHolder")
            local tg = ph and ph:FindFirstChild("TimerGui")
            if tg and tg:IsA("BillboardGui") then
                if PF.bb[tg] == nil then pcall(PF.muteOne, tg)
                elseif tg.Enabled then PF.bb[tg] = true tg.Enabled = false end
            end
        end
    end
    local ok, mb = pcall(function() return game:GetService("Stats"):GetTotalMemoryUsageMb() end)
    if ok and type(mb) == "number" then
        PF.mem = mb
        PF.memPeak = math.max(PF.memPeak, mb)
        if (CFG.MemLimit or 0) > 0 and mb > CFG.MemLimit then
            PF.over = (PF.over or 0) + 1
            if PF.over >= 30 and not S.busy then -- over the limit for 30 s straight
                PF.over = -600 -- one try, then wait 10 min before another
                PF.rejoinSame(("memory %d MB > %d MB"):format(mb, CFG.MemLimit))
            end
        elseif (PF.over or 0) > 0 then
            PF.over = 0
        end
    end
    if now() - (PF.noteAt or 0) > 1800 then -- a line in the log every 30 min, to see the night afterwards
        PF.noteAt = now()
        note(("health: %d fps, %d MB (peak %d)"):format(math.floor(PF.fps + 0.5), PF.mem, PF.memPeak))
    end
end
S.sellWords = { "sell", "trash", "discard", "dispose", "bin" }
local function sellish(t)
    if type(t) ~= "string" then return false end
    t = t:lower()
    for _, w in ipairs(S.sellWords) do if t:find(w, 1, true) then return true end end
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

---------------------------------------------------------------- index, best butter, best crate, admin show
-- AUTO INDEX: a butter only counts in your Index once a wax of it has FINISHED. So every butter you
-- have never finished is bought once and waxed, and not bought again while that wax runs.
-- BEST BUTTER: the game's top 1-3 butters by income are bought instead of the BUTTERS tab's ticks
-- (an update's new best takes over by itself). BEST CRATE: the dearest crate is opened.
-- All three read the game's own tables (SquishyInfo, AutoRollRules, CrateInfo), so new butters,
-- rarities and crates count as soon as the game has them, and the game's Auto Roll is set to stop on
-- exactly what is wanted.
IX.disc, IX.need, IX.best, IX.waxing, IX.order, IX.placedAt = nil, {}, {}, {}, {}, {}
IX.discAt, IX.modAt, IX.sentAt, IX.msg, IX.nNeed, IX.nWax, IX.fails = -100, -100, -100, "", 0, 0, 0
function IX.on() return CFG.AutoIndex or (CFG.Best or 0) > 0 or CFG.BestCrate end
function IX.mods()
    if IX.si and now() - IX.modAt < 120 then return true end
    local M = RS:FindFirstChild("Modules")
    if not M then return false end
    local function req(n)
        local m = M:FindFirstChild(n)
        if not m then return nil end
        local ok, v = pcall(require, m)
        return (ok and type(v) == "table") and v or nil
    end
    IX.si, IX.arm, IX.ci = req("SquishyInfo"), req("AutoRollRules"), req("CrateInfo")
    IX.modAt = now()
    if not IX.si then return false end
    local roll = {} -- what Auto Roll can stop on: every rarity of the roll table but the first
    if IX.arm and type(IX.arm.tierOf) == "table" then
        for n in pairs(IX.arm.tierOf) do
            local e = IX.si[n]
            -- never a Limited (Robux / event-only), even if an update puts one in the roll table
            if type(e) == "table" and e.rarity ~= "Limited" and not e.incomeType and not e.hiddenAfter then roll[key(n)] = n end
        end
    end
    IX.roll = roll
    local list = {} -- plain $ income only (the "x% of your best" Limiteds are never rolled)
    for k, n in pairs(roll) do
        local e = IX.si[n]
        if type(e) == "table" and type(e.income) == "number" and not e.incomeType then
            list[#list + 1] = { k = k, inc = e.income, pr = tonumber(e.price) or 0 }
        end
    end
    table.sort(list, function(a, b) if a.inc ~= b.inc then return a.inc > b.inc end return a.pr > b.pr end)
    IX.order = list
    local bc, bp, bt
    local crates = (IX.ci and type(IX.ci.crates) == "table") and IX.ci.crates or {}
    for n, e in pairs(crates) do
        local pr = type(e) == "table" and tonumber(e.price)
        if pr and (not bp or pr > bp) then bc, bp, bt = n, pr, e.title end
    end
    IX.bestCrate, IX.bestCrateName = bc and CR.key(bc), bc
    IX.bestCrateTitle = bt and CR.key(bt) or nil
    return true
end
function IX.rank(r) -- rarity position in the game's roll table (higher = rarer)
    local ok, v = pcall(function() return IX.arm.rankOf(r) end)
    return (ok and tonumber(v)) or 0
end
function IX.loadDisc(t)
    if type(t) ~= "table" then return end
    local d = {}
    for n, v in pairs(t) do if v then d[key(tostring(n))] = true end end
    IX.disc, IX.discAt = d, now()
end
function IX.fetch()
    IX.discAt = now()
    local R = RS:FindFirstChild("Remotes")
    local f = R and R:FindFirstChild("GetSquishiesDiscovered")
    if not f then return end
    local ok, t = pcall(function() return f:InvokeServer() end)
    if ok then IX.loadDisc(t) end
end
function IX.scanWax() -- what your own stations are waxing right now
    local w = {}
    local ws = S.plot and S.plot:FindFirstChild("WaxStations")
    if ws then
        for _, st in ipairs(ws:GetChildren()) do
            local ph = st:FindFirstChild("SquishyPlaceHolder")
            if ph and st:GetAttribute("HasSquishy") then
                for _, c in ipairs(ph:GetChildren()) do if c:IsA("Model") then w[key(c.Name)] = true end end
            end
        end
    end
    for k, t in pairs(IX.placedAt) do -- just placed: the station may not show it yet
        if now() - t < 20 then w[k] = true else IX.placedAt[k] = nil end
    end
    IX.waxing = w
end
function IX.compute()
    local need, n, w = {}, 0, 0
    if IX.disc then
        for k in pairs(IX.roll or {}) do
            if not IX.disc[k] then
                if IX.waxing[k] then w = w + 1 else need[k], n = true, n + 1 end
            end
        end
    end
    IX.need, IX.nNeed, IX.nWax = need, n, w
    local b, mode = {}, CFG.Best or 0
    -- UPGRADES: anything that earns more than the weakest butter in your stack (it fills a new slot or
    -- replaces that one); stations are what is short, so nothing weaker takes one
    local floor = (mode == 4) and IX.stackMin or nil
    for i, e in ipairs(IX.order) do
        -- (a full stack waits for a real upgrade: nothing equal is bought, so stations stay free)
        if (floor and e.inc > floor) or (not floor and i <= (mode == 4 and 1 or mode)) then b[e.k] = true end
    end
    IX.best = b
end
function IX.readStack() -- the weakest butter in your stack (by its plain income) and whether it is full
    IX.stackAt = now()
    local R = RS:FindFirstChild("Remotes")
    local r = R and R:FindFirstChild("EditStack")
    if not r then return end
    local ok, v = pcall(function() return r:InvokeServer("State", nil) end)
    if not (ok and type(v) == "table" and type(v.state) == "table" and type(v.state.entries) == "table") then return end
    local lo
    for _, e in ipairs(v.state.entries) do
        local i = type(e) == "table" and IX.si and IX.si[tostring(e.name)]
        if type(i) == "table" and type(i.income) == "number" and not i.incomeType and (not lo or i.income < lo) then lo = i.income end
    end
    IX.stackMin = lo
    IX.stackFull = #v.state.entries >= (tonumber(v.state.capacity) or 100)
end
function IX.want(k)
    if (CFG.Best or 0) > 0 and (next(IX.best) or (CFG.Best == 4 and IX.stackMin)) then
        if IX.best[k] then return true end
    elseif CFG.Targets[k] then
        return true
    end
    return CFG.AutoIndex == true and IX.need[k] == true
end
function IX.any()
    return next(CFG.Targets) ~= nil or ((CFG.Best or 0) > 0 and next(IX.best) ~= nil) or (CFG.AutoIndex and next(IX.need) ~= nil)
        or CFG.Best == 4 -- UPGRADES waiting for something better than the stack: a fine state
end
function IX.placed(held)
    local k = key(held)
    IX.placedAt[k], IX.waxing[k] = now(), true
    if IX.need[k] then
        IX.need[k], IX.nNeed, IX.nWax = nil, math.max(0, IX.nNeed - 1), IX.nWax + 1
        note(("INDEX: %s is waxing - it counts once it finishes, not buying it again"):format(prettyOf(k)))
        if IX.on() then task.spawn(pcall, IX.sync, true) end
    end
end
function IX.rulesNow() -- the game's Auto Roll choices for what is wanted right now
    local bt, cr = {}, {}
    for k, n in pairs(IX.roll or {}) do if IX.want(k) then bt[n] = true end end
    for n, e in pairs((IX.ci and type(IX.ci.crates) == "table") and IX.ci.crates or {}) do
        if CR.wanted(n) or (type(e) == "table" and type(e.title) == "string" and CR.wanted(e.title)) then cr[n] = true end
    end
    if not next(bt) and not next(cr) then return nil end
    if IX.arm and type(IX.arm.encode) == "function" then
        local ok, s = pcall(IX.arm.encode, { rarities = {}, butters = bt, crates = cr, index = false })
        if ok and type(s) == "string" then return s end
    end
    local function list(t) local o = {} for n in pairs(t) do o[#o + 1] = n end table.sort(o) return table.concat(o, ",") end
    local s = "adv:"
    if next(bt) then s = s .. ";butters:" .. list(bt) end
    if next(cr) then s = s .. ";crates:" .. list(cr) end
    return s
end
function IX.canon(s) -- same choices in any order compare equal
    local t = {}
    for part in tostring(s or ""):gmatch("[^;]+") do
        local head, rest = part:match("^(%a+):(.*)$")
        if not head then head, rest = "r", part:gsub("^adv:", "") end
        for x in rest:gmatch("[^,]+") do t[#t + 1] = head .. "=" .. x end
    end
    table.sort(t)
    return table.concat(t, "|")
end
function IX.sync(force)
    if plr:GetAttribute("AutoRoll") ~= true then return end -- no Auto Roll pass: nothing to set
    if now() < (IX.pauseUntil or 0) then return end
    local s = IX.rulesNow()
    if not s or #s > 1900 then return end
    if IX.canon(plr:GetAttribute("AutoRollRules")) == IX.canon(s) then IX.fails = 0 return end
    if not force and now() - IX.sentAt < 4 then return end
    local R = RS:FindFirstChild("Remotes")
    local r = R and R:FindFirstChild("AutoRollAction")
    if not r then return end
    IX.fails = IX.fails + 1
    if IX.fails > 4 then
        IX.fails, IX.pauseUntil = 0, now() + 300
        note("the game did not take the Auto Roll choices - trying again in 5 min")
        return
    end
    IX.sentAt = now()
    AR.replaying = true
    pcall(function() r:FireServer("Rules", s) end)
    AR.replaying = false
    CFG.ARrules = s
    local nb, nc = 0, 0
    for x in (s:match("butters:([^;]*)") or ""):gmatch("[^,]+") do nb = nb + 1 end
    for x in (s:match("crates:([^;]*)") or ""):gmatch("[^,]+") do nc = nc + 1 end
    local tag = nb .. "/" .. nc
    if IX.told ~= tag then IX.told = tag note(("auto roll now stops on %d butters and %d crates"):format(nb, nc)) end
end
function IX.tick()
    if not IX.mods() then IX.msg = "index: the game's butter list cannot be read" return end
    if now() - IX.discAt > 30 then IX.fetch() end
    IX.scanWax()
    if CFG.Best == 4 and now() - (IX.stackAt or -100) > 60 then IX.readStack() end
    IX.compute()
    if IX.on() then IX.sync(false) end
    local parts = {}
    if CFG.AutoIndex then
        parts[#parts + 1] = not IX.disc and "index: reading..." or (IX.nNeed + IX.nWax == 0 and "index: complete"
            or ("index: %d to get, %d waxing"):format(IX.nNeed, IX.nWax))
    end
    if CFG.Best == 4 then
        local n = 0 for _ in pairs(IX.best) do n = n + 1 end
        parts[#parts + 1] = n == 0 and "upgrades: none better than your stack - stations kept free"
            or ("upgrades: %d butter%s"):format(n, n == 1 and "" or "s")
    elseif (CFG.Best or 0) > 0 and IX.order[1] then parts[#parts + 1] = "best: " .. prettyOf(IX.order[1].k) end
    if CFG.BestCrate and IX.bestCrateName then parts[#parts + 1] = "crate: " .. IX.bestCrateName end
    if SH.got > 0 then parts[#parts + 1] = "shower: " .. SH.got end
    IX.msg = #parts > 0 and table.concat(parts, " | ") or "index / best: off"
end
IX.heard = {}
function IX.admin(kind, name, d) -- the AdminShow remote: ("Effect", name, data), ("Say", text), ...
    if kind ~= "Effect" then return end
    if name == "Shower" then SH.add(d) return end
    if name == "ShowerTaken" then SH.gone(d) return end
    if name == "ShowerClear" then SH.drops = {} return end
    if name == "WaxGlow" then
        local t = type(d) == "table" and tonumber(d.SnapAt)
        if t then
            IX.snapAt = t
            note(("ADMIN: every wax finishes in %ds%s"):format(math.floor(t - PX.srv()),
                (CFG.Teams and CFG.TeamGlaze ~= "") and " - glaze team on for it" or ""))
        end
        return
    end
    name = tostring(name)
    evlog("Admin " .. name)
    if name ~= "GoalPoint" and now() - (IX.heard[name] or -100) > 30 then
        IX.heard[name] = now()
        note("ADMIN: " .. name)
    end
end
-- ---- admin shower: butters fall, land, pop into pieces; standing on a piece takes it (server-side)
SH.drops, SH.tried, SH.got, SH.miss = {}, {}, 0, 0
function SH.add(d)
    if type(d) ~= "table" or type(d.Pieces) ~= "table" then return end
    for _, p in pairs(d.Pieces) do
        if type(p) == "table" and p.Id ~= nil and p.Position ~= nil then
            SH.drops[p.Id] = { id = p.Id, butter = tostring(p.Butter or "?"), rar = tostring(p.Rarity or "?"), star = p.Star == true,
                pos = p.Position, opens = tonumber(p.OpensAt) or 0, ends = tonumber(p.ExpiresAt) or 0 }
        end
    end
end
function SH.gone(d)
    if type(d) ~= "table" or d.Id == nil then return end
    SH.drops[d.Id] = nil
    if tonumber(d.UserId) == PX.uid then SH.mine = d.Id end
end
function SH.pick()
    local t = PX.srv()
    local best, bs
    for id, p in pairs(SH.drops) do
        if t >= p.ends - 0.3 then
            SH.drops[id] = nil
        elseif t >= p.opens - 0.2 and (SH.tried[id] or 0) < 3 then
            local sc = (isTarget(p.butter) and 1e6 or 0) + (p.star and 1e5 or 0) + IX.rank(p.rar) * 100 - (p.ends - t)
            if not best or sc > bs then best, bs = p, sc end
        end
    end
    return best
end
function SH.due()
    return CFG.Shower and S.running and next(SH.drops) ~= nil and not carriedName() and SH.pick() ~= nil
end
function SH.grab()
    local p, c = SH.pick(), char()
    if not (p and c) then return end
    SH.tried[p.id] = (SH.tried[p.id] or 0) + 1
    if PF.hold then pcall(PF.unpin, true) end
    teleport(c, p.pos + Vector3.new(0, hipH(c) + 0.5, 0))
    waitFor(function() return SH.mine == p.id or carriedName() ~= nil or not SH.drops[p.id] end, 1.5)
    if SH.mine == p.id or carriedName() then
        SH.got, SH.drops[p.id] = SH.got + 1, nil
        note(("GRABBED %s [%s]%s from the admin shower"):format(prettyOf(key(p.butter)), p.rar, p.star and " (star)" or ""))
    elseif not SH.drops[p.id] then
        SH.miss = SH.miss + 1 -- someone else got there first
    end
end

---------------------------------------------------------------- decision
local setRunning -- defined below; decide() needs it for the unattended retry
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
    if not IX.any() then
        return nil, "nothing ticked - pick a butter in the BUTTERS tab", "bad"
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
        if TM.glazeSoon() then return nil, ("holding %s - glaze team is on for a wax that is finishing, placing right after"):format(nice), "wait" end
        return "place", ("waxing %s (%d free)"):format(nice, free), "ok"
    end
    S.holding = false
    -- A crate already waiting on your stand (e.g. it landed before the script started): the game
    -- switches on CrateStand.Spot's CratePrompt while one is there, titled with the crate's name.
    if CFG.Crates and not CRATE.waiting and now() - (CRATE.scanAt or 0) > 1 and now() > (CRATE.quietUntil or 0) then
        CRATE.scanAt = now()
        local stand = S.plot:FindFirstChild("CrateStand")
        if stand then
            for _, d in ipairs(stand:GetDescendants()) do
                if d:IsA("ProximityPrompt") and d.Enabled and safePrompt(d) then
                    local title = d.ObjectText
                    if title == "" then title = deepText(stand, "TitleLabel") or "" end
                    if title ~= "" and CR.wanted(title) then
                        local base = norm(title):gsub("crate$", "")
                        local rar
                        for r in pairs(CAT.members) do if norm(r) == base then rar = r end end
                        CRATE.waiting, CRATE.at, CRATE.title, CRATE.prompt = true, now(), title, d
                        CRATE.data = { name = (title:gsub("%s", "")), rarity = rar, title = title }
                        note(title .. " found waiting on your stand")
                    end
                    break
                end
            end
        end
    end
    -- Crates. One lands on your stand ~2s after it is rolled and waits there, with the pad's Buy
    -- prompt switched off, until someone opens its window. That blocks the roll loop, so deal with it.
    -- only crates ticked in the CRATES tab are touched; any other crate is left for the game to clear
    local cticked = CR.wanted(CRATE.data and CRATE.data.name) or CR.wanted(CRATE.title)
    if CFG.Crates and (CRATE.on or CRATE.waiting) and cticked then
        local title = CRATE.title
        if now() < (CRATE.ignoreUntil or 0) then -- keep saying so; the crate still blocks rolling
            return nil, ("%s - its buttons do not respond to me, press Open yourself"):format(title), "bad"
        end
        if CRATE.on then
            if S.crateFails >= 3 then -- this window is not one we can work: leave it to you
                CRATE.ignoreUntil, S.crateFails = now() + 120, 0
                note("could not press the " .. title .. " buttons 3 times - leaving it to you for 2 min")
                return nil, ("%s window open - press Open yourself"):format(title), "bad"
            end
            if now() - CRATE.lastFail < 8 then
                return nil, ("%s window open - could not press its buttons"):format(title), "bad"
            end
            if CRATE.byYou and now() - CRATE.openedAt < 60 then
                return nil, ("%s window is yours - tap Open or Discard (I step in after %ds)"):format(
                    title, math.ceil(60 - (now() - CRATE.openedAt))), "idle"
            end
            return "cratesmart", ("opening %s"):format(title), "ok"
        end
        if CRATE.at and now() - CRATE.at > CRATE.GIVEUP then -- 10 min of tries: it blocks every roll, let it go
            return "cratedrop", ("%s could not be opened for %d min - discarding it so rolling goes on"):format(title,
                math.floor(CRATE.GIVEUP / 60)), "bad"
        end
        if CRATE.summonFails >= 3 then
            if now() - CRATE.lastFail < 45 then
                return nil, ("%s waiting - could not open it (trying again in %ds)"):format(title,
                    math.ceil(45 - (now() - CRATE.lastFail))), "bad"
            end
            CRATE.summonFails, CRATE.nearFails, CRATE.prompt = 0, 0, nil -- start over by itself
            note("trying the " .. title .. " again")
        end
        if now() - CRATE.lastFail < 8 then
            return nil, ("%s waiting - retrying shortly"):format(title), "wait"
        end
        return "cratesmart", ("%s waiting - opening it%s"):format(title,
            (CRATE.learned and CRATE.learned.mode ~= "window") and " directly" or ""), "ok"
    end
    if (CRATE.on or CRATE.waiting) and not cticked then
        local tag = CRATE.title .. tostring(CRATE.rolledAt)
        if CRATE.told ~= tag then
            CRATE.told = tag
            note(CRATE.title .. " is not ticked - leaving it to the game")
        end
    end
    if CRATE.rolled and not CRATE.waiting and now() - CRATE.rolledAt < 6 and CR.wanted(CRATE.rolled) then
        return nil, CRATE.rolled .. " rolled - waiting for it to land", "wait"
    end
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
        -- it shows on the pad a moment before it lands on the stand; until the stand has it there is
        -- nothing to press, and that is not a failure (the v26 overnight stall counted these)
        if not findCratePrompt() then return nil, ("%s rolled - waiting for it to land on the stand"):format(pcr.name), "wait" end
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
        return nil, (cashShort() and "cash short - have $%s, retry in %ds" or "buy did not go through - have $%s, again in %ds"):format(
            fmt(cash()), math.ceil(S.noCashUntil - t)), cashShort() and "bad" or "wait"
    end
    if t - S.lastBuyAt < CFG.BuyGap then return nil, "cooldown after last buy", "wait" end
    S.matchSince = S.matchSince or t
    local w = t - S.matchSince
    if w < CFG.Confirm then return nil, ("confirming %s (%.2fs)"):format(id.shown, w), "ok" end
    return "buy", ("buying %s via %s"):format(id.shown, id.src), "ok"
end
-- ---- ghost: out of sight
-- Only your position reaches the other players (your client owns your character's physics), so this
-- is what can be hidden. Between jobs the character waits inside the solid ground under your base
-- (the map's 500-stud baseplate, whatever floor your plot is on: "under the floor" left you hanging
-- in the air under raised floors). Helps are sent from INSIDE the waxing butter: its solid 24x6x6
-- body hides a whole character and its middle is 0 studs from the station (measured Nov 19).
-- Name tags (VipTag, ClanTag), the leaderboard and the name over your head are the server's and each
-- viewer's own: hiding them here would only hide them on your screen. Your camera goes under too.
PF.DEPTH = 11
function PF.pinTick() -- every frame: hold the pin, no collisions while under
    local cf = PF.hold
    if not cf then return end
    local c = plr.Character
    local hrp = c and c:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = cf
    hrp.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    for _, d in ipairs(c:GetChildren()) do
        if d:IsA("BasePart") and d.CanCollide then PF.noclip[d] = true d.CanCollide = false end
    end
end
PF.noclip = setmetatable({}, { __mode = "k" })
function PF.pin(cf, surface)
    PF.hold = cf
    if surface then PF.surface = surface end
end
function PF.unpin(stay) -- back to the surface spot it went under from (stay: leave it where it is)
    if not PF.hold then return end
    PF.hold = nil
    for d in pairs(PF.noclip) do pcall(function() if d.Parent then d.CanCollide = true end end) end
    PF.noclip = setmetatable({}, { __mode = "k" })
    local c = char()
    if c and PF.surface and not stay then
        teleport(c, PF.surface.Position, PF.surface.Position + PF.surface.LookVector)
        nap(0.1)
    end
end
-- Home for a ghost: always the same spot, beside your own pad on the ground (seen live: parking
-- under wherever it last stood once left it hanging under a neighbour's raised deck, in plain view)
function PF.home()
    local h, c = S.plot and S.plot:FindFirstChild("RolledSquishyPlaceHolder"), char()
    if not (h and h:IsA("BasePart") and c) then return nil end
    local pc = plateCenter() or h.Position
    local d = Vector3.new(pc.X - h.Position.X, 0, pc.Z - h.Position.Z)
    d = d.Magnitude > 0.1 and d.Unit or Vector3.new(0, 0, 1)
    local p = h.Position + d * 6
    local g = groundPos(p.X, h.Position.Y, p.Z, { h })
    return CFrame.new(p.X, (g and g.Y or h.Position.Y) + hipH(c), p.Z)
end
function PF.ground(x, y, z) -- top of the LAST solid straight down (the map's ground, not a floor or deck)
    local list, last = { plr.Character }, nil
    for _ = 1, 12 do
        local rp = RaycastParams.new()
        rp.FilterType = Enum.RaycastFilterType.Exclude
        rp.FilterDescendantsInstances = list
        local r = WS:Raycast(Vector3.new(x, y, z), Vector3.new(0, -2000, 0), rp)
        if not r then break end
        last, y = r, r.Position.Y - 0.05
        list[#list + 1] = r.Instance
    end
    return last and last.Position.Y
end
function PF.parkHome()
    local hm = PF.home()
    if not hm then return false end
    local p = hm.Position
    local g = PF.ground(p.X, p.Y + 300, p.Z) or (p.Y - 3)
    PF.pin(CFrame.new(p.X, g - 8, p.Z), hm) -- inside the ground under your base
    return true
end
-- three settings, one button: OFF (plain teleports, you can walk around), HELPS (helps are sent from
-- inside the butter, then you are put back where you were), FULL (also waits inside the ground)
PF.GHOST = { [0] = { "GHOST: OFF", "G: OFF" }, { "GHOST: HELPS ONLY", "G: HELP" }, { "GHOST: FULL", "G: FULL" } }
function PF.ghostMode() return CFG.Ghost and 2 or (CFG.GhostHelps and 1 or 0) end
function PF.setGhost(m)
    CFG.Ghost, CFG.GhostHelps = m == 2, m == 1
    if m < 2 then -- come up from the ground (after the job in hand, if any)
        task.spawn(function()
            while S.busy do nap(0.1) end
            if PF.ghostMode() < 2 and PF.hold and not HX.home then pcall(PF.unpin) end
        end)
    end
    PF.paintGhost()
    note("ghost: " .. PF.GHOST[m][1]:sub(8):lower())
end
function PF.cycleGhost() PF.setGhost((PF.ghostMode() + 1) % 3) end
function PF.parkTick() -- called by the main loop when the farm is idle
    if not (CFG.Ghost and S.running) or PF.hold or S.busy then return end
    local c = char()
    if not c or CF.seat() then return end -- seated at the campfire: stay on the log
    PF.parkHome()
end

-- ---- the event campfire
-- While a weather event runs the server puts a campfire with 6 log seats near spawn (NightSeats).
-- Sitting on one (its prompt) gives +50% cash for every camper by the fire, you included
-- (CampfireBoost; 4 campers = +200%, seen Nov 19). Moving around while seated keeps it, so the farm
-- sits down once a seat is free and carries on with everything else from the seat.
CF.n, CF.fails, CF.nextAt, CF.msg, CF.lost = 0, 0, 0, "no campfire right now", 0
function CF.seat()
    local c = plr.Character
    local h = c and c:FindFirstChildOfClass("Humanoid")
    local sp = h and h.SeatPart
    return (sp and sp.Name == "LogSeat") and sp or nil
end
function CF.due()
    if not (CFG.Campfire and S.running) or now() < CF.nextAt then return false end
    local ns = WS:FindFirstChild("NightSeats")
    if not ns then
        if CF.wasOn then CF.wasOn, CF.fails, CF.lost = false, 0, 0 end
        CF.msg = "no campfire (comes with weather events)"
        return false
    end
    CF.wasOn = true
    if CF.seat() then
        CF.sitAt = CF.sitAt or now()
        CF.msg = ("sitting at the campfire: +%s%% cash"):format(tostring(plr:GetAttribute("CampfireBoost") or "?"))
        return false
    end
    if CF.sitAt then -- we were sitting and are not any more
        CF.lost, CF.sitAt = CF.lost + 1, nil
        if CF.lost >= 4 then
            CF.nextAt, CF.msg = now() + 600, "kept losing the seat - leaving the campfire for 10 min"
            note(CF.msg)
            return false
        end
    end
    return true
end
function CF.sit()
    local ns, c = WS:FindFirstChild("NightSeats"), char()
    if not ns or not c then return end
    local pos, free = c.HumanoidRootPart.Position, {}
    for _, st in ipairs(ns:GetChildren()) do
        local p = st:IsA("Seat") and st.Occupant == nil and st:FindFirstChildOfClass("ProximityPrompt")
        if p then free[#free + 1] = { st = st, p = p } end
    end
    if #free == 0 then CF.nextAt, CF.msg = now() + 10, "the campfire is full - waiting for a seat" return end
    table.sort(free, function(a, b) return (a.st.Position - pos).Magnitude < (b.st.Position - pos).Magnitude end)
    local st, p = free[1].st, free[1].p
    PF.unpin(true)
    local cf = st.CFrame
    teleport(c, cf.Position + cf.LookVector * 2 + Vector3.new(0, 2.5, 0), cf.Position)
    nap(0.25)
    local ok = activate(p, function() return CF.seat() ~= nil end)
    if not ok then -- prompt did nothing: sit down on it directly
        teleport(c, cf.Position + Vector3.new(0, 2, 0), cf.Position + cf.LookVector)
        waitFor(function() return CF.seat() ~= nil end, 1.5)
    end
    if CF.seat() then
        CF.n, CF.fails, CF.sitAt = CF.n + 1, 0, now()
        note(("SAT at the campfire (+%s%% cash)"):format(tostring(plr:GetAttribute("CampfireBoost") or "?")))
    else
        CF.fails = CF.fails + 1
        CF.nextAt = now() + (CF.fails >= 3 and 60 or 5)
        CF.msg = "could not sit at the campfire" .. (CF.fails >= 3 and " - trying again in a minute" or "")
        if CF.fails <= 3 then note(CF.msg) end
    end
end

-- ---- quests: guild tasks and the event's season pass quests
-- Read Nov 19. Guild tasks (ClanRequest "state" -> tasks.list) count by themselves and need no claim.
-- Event quests (<Event>Action "state" -> quests, while live) are claimed one by one ("claimQuest", id)
-- plus the day's bonus ("claimBonus"); the pass's own rank rewards are never touched. The farm's own
-- work already covers buy / wax / stack / help / rare quests. What it does extra:
--   pull  "Pull the lever N times": Auto Roll's pulls do not count, so Auto Roll is paused, the farm
--         pulls the lever itself (the game's own lever prompt), one pull at a time between its own
--         jobs, and switches Auto Roll back on when the quests are done. A butter the game would ask
--         about ("Roll away your ...?") is never rolled away: the pulling stops for 10 min instead.
--   collect  "Collect your cash N times": collects every 15 s while such a quest is open.
QX.msg, QX.nextAt, QX.at, QX.pulls, QX.claims, QX.pullLeft, QX.collectLeft, QX.events = "", 0, 0, 0, 0, 0, 0, {}
function QX.refresh()
    QX.at = now()
    local R = RS:FindFirstChild("Remotes")
    if not R then return end
    local pull, coll, open = 0, 0, {}
    local ok, st = pcall(function() return R.ClanRequest:InvokeServer("state") end)
    local tk = ok and type(st) == "table" and st.tasks
    for _, q in ipairs(tk and tk.list or {}) do
        if not q.done and q.kind == "pull" then pull = math.max(pull, (q.goal or 0) - (q.progress or 0)) end
        if not q.done then open[#open + 1] = ("%s %d/%d"):format(tostring(q.text), q.progress or 0, q.goal or 0) end
    end
    QX.events = {}
    for _, r in ipairs(R:GetChildren()) do
        if r:IsA("RemoteFunction") and r.Name:match("^%u%a+Action$") and r.Name ~= "CrateAction" and r.Name ~= "AutoRollAction" then
            local ok2, v = pcall(function() return r:InvokeServer("state") end)
            if ok2 and type(v) == "table" and v.live == true and type(v.quests) == "table" then
                QX.events[#QX.events + 1] = { r = r, st = v }
                for _, q in ipairs(v.quests) do
                    if not q.done and q.kind == "pull" then pull = math.max(pull, (q.goal or 0) - (q.progress or 0)) end
                    if not q.done and q.kind == "collect" then coll = math.max(coll, (q.goal or 0) - (q.progress or 0)) end
                    if not q.done then open[#open + 1] = ("%s %d/%d"):format(tostring(q.text), q.progress or 0, q.goal or 0) end
                end
            end
        end
    end
    QX.pullLeft, QX.collectLeft = pull, coll
    QX.msg = #open > 0 and ("open: " .. table.concat(open, ", ")) or "all quests done for today"
end
function QX.claim() -- finished event quests and the day's bonus: the same calls as the game's CLAIM buttons
    for _, e in ipairs(QX.events) do
        local name = e.r.Name:gsub("Action$", "")
        for _, q in ipairs(e.st.quests) do
            if q.done and not q.claimed then
                local ok, v = pcall(function() return e.r:InvokeServer("claimQuest", q.id) end)
                if ok and not (type(v) == "table" and v.ok == false) then
                    QX.claims = QX.claims + 1
                    note(("CLAIMED %s quest: %s (+%s)"):format(name, tostring(q.text), tostring(q.points or q.treats or "?")))
                end
                nap(0.4)
            end
        end
        if e.st.bonusReady == true then
            local ok = pcall(function() return e.r:InvokeServer("claimBonus") end)
            if ok then note(("CLAIMED %s daily quest bonus"):format(name)) end
            nap(0.4)
        end
    end
end
function QX.tick() -- every few seconds from the main loop
    if not (CFG.Quests and S.running) then
        if QX.arPaused then QX.resume("quests switched off") end
        return
    end
    if now() - QX.at < (QX.pullLeft > 0 and 20 or 90) then return end
    QX.refresh()
    pcall(QX.claim)
    if QX.pullLeft <= 0 and QX.arPaused then QX.resume("lever quests done") end
end
function QX.pullDue()
    return CFG.Quests and S.running and QX.pullLeft > 0 and now() >= QX.nextAt and not AR.busy
end
function QX.lever()
    local lv = S.plot and S.plot:FindFirstChild("Lever")
    local w = lv and lv:FindFirstChild("Wheel")
    return w and w:FindFirstChildWhichIsA("ProximityPrompt"), w
end
function QX.resume(why) -- Auto Roll back the way it was
    QX.arPaused = false
    if QX.arWas then
        QX.arWas = false
        CFG.AutoRoll = true
        task.spawn(AR.apply, why)
    end
end
function QX.pull()
    local p, w = QX.lever()
    if not p or not w or not w:IsA("BasePart") then QX.nextAt, QX.msg = now() + 300, "your lever was not found" return end
    if not QX.arPaused then
        QX.arPaused = true
        QX.arWas = CFG.AutoRoll
        if CFG.AutoRoll then
            CFG.AutoRoll = false -- so nothing switches it back on meanwhile
            AR.apply("pulling the lever for a quest", true)
            if AR.isOn() then QX.nextAt = now() + 30 return end
        end
        note(("QUEST: pulling the lever %d times (Auto Roll's own pulls do not count)"):format(QX.pullLeft))
    end
    if not p.Enabled then QX.nextAt = now() + 1 return end
    standNear(w, p)
    QX.asked = nil
    holdFire(p)
    QX.pulls = QX.pulls + 1
    QX.pullLeft = QX.pullLeft - 1 -- the next refresh corrects it
    nap(0.6)
    if QX.asked then
        QX.nextAt = now() + 600
        note(("QUEST: the game asks before rolling away your %s - not pulling for 10 min"):format(tostring(QX.asked)))
        QX.resume("a butter the game wants kept is on the pad")
        return
    end
    QX.nextAt = now() + 2.5 -- give the roll time to land and the farm a look at it
    if QX.pullLeft <= 0 then QX.at = 0 end -- check the quests again straight away
end

-- ---- helping other players' waxes
-- The game's own Help button (ClanHandler.Prompts) sends ClanRequest("help", owner, station). The
-- server only takes it from someone standing at the station ("Walk up to the wax station to help!",
-- range 18 studs, tested Nov 18), so the farm steps next to one wax at a time, between its own jobs,
-- and goes back where it was when none is left. A help takes 10% of their wax's full time off. The
-- game's rules for its Help prompt are kept: long waxes only, not one you helped, under 6 helpers,
-- over a minute left, not their 30% cap (PourFull), and not someone who turned helping off.
-- Guildmates' "Need help with a wax" calls are answered with the game's own callHelp, from anywhere.
HX.skip, HX.skipN, HX.n, HX.calls, HX.fails, HX.nextAt, HX.msg, HX.tries = {}, 0, 0, 0, 0, 0, "off", {}
function HX.can(st, t)
    local o = st:GetAttribute("PourOwner")
    if type(o) ~= "number" or o == PX.uid or not st:GetAttribute("HasSquishy") then return false end
    if st:GetAttribute("PourLong") ~= true or st:GetAttribute("PourFull") == true then return false end
    local id = st:GetAttribute("PourId")
    if id == nil or HX.skip[id] then return false end
    local hs, n, me = st:GetAttribute("Helpers"), 0, tostring(PX.uid)
    if type(hs) == "string" then
        for u in hs:gmatch("[^,%s]+") do
            n = n + 1
            if u == me then return false end
        end
    end
    if n >= 6 then return false end
    local left = TM.left(st)
    if not left then
        local e = tonumber(st:GetAttribute("PourEnd"))
        left = e and (e - t)
    end
    if not left or left <= 75 then return false end
    local p = game:GetService("Players"):GetPlayerByUserId(o)
    if not p or p:GetAttribute("WaxHelpOff") == true then return false end
    return true, p, id
end
function HX.list()
    local out, t = {}, PX.srv()
    local plots = WS:FindFirstChild("Plots")
    for _, plot in ipairs(plots and plots:GetChildren() or {}) do
        local ws = plot ~= S.plot and plot:FindFirstChild("WaxStations")
        for _, st in ipairs(ws and ws:GetChildren() or {}) do
            local ok, p, id = HX.can(st, t)
            local ph = ok and st:FindFirstChild("SquishyPlaceHolder")
            if ph and ph:IsA("BasePart") then out[#out + 1] = { st = st, p = p, id = id, part = ph } end
        end
    end
    return out
end
function HX.due() return CFG.Help and S.running and now() >= HX.nextAt end
function HX.skipIt(id, why)
    HX.skip[id], HX.skipN = why, HX.skipN + 1
    if HX.skipN > 600 then HX.skip, HX.skipN, HX.tries = { [id] = why }, 1, {} end
end
function HX.goHome()
    local c, h = char(), HX.home
    HX.home = nil
    if not (c and h) then return end -- no round was running: stay where you are (under or up)
    if CFG.Ghost and not CF.seat() then -- straight back under home, never up at their base
        PF.unpin(true)
        if not PF.parkHome() then pcall(teleport, c, h.Position, h.Position + h.LookVector) end
    elseif PF.hold or (c.HumanoidRootPart.Position - h.Position).Magnitude > 20 then
        PF.unpin(true)
        pcall(teleport, c, h.Position, h.Position + h.LookVector)
    end
end
function HX.step()
    local list, c = HX.list(), char()
    if #list == 0 or not c then
        HX.nextAt = now() + 15
        HX.msg = ("helped %d waxes here%s | none to help right now"):format(HX.n, HX.calls > 0 and (", " .. HX.calls .. " for the guild") or "")
        HX.goHome()
        return
    end
    local hrp = c.HumanoidRootPart
    local pos = hrp.Position
    table.sort(list, function(a, b) return (a.part.Position - pos).Magnitude < (b.part.Position - pos).Magnitude end)
    local w = list[1]
    HX.home = HX.home or (PF.hold and PF.surface) or hrp.CFrame -- where to go back to when the round is done
    local ph = w.part
    local mid = (ph.Position + w.st:GetPivot().Position) / 2 -- between the butter and the station's own centre
    local tries = HX.tries[w.id] or 0
    if (CFG.Ghost or CFG.GhostHelps) and tries == 0 and not CF.seat() then
        PF.pin(ph.CFrame, HX.home) -- inside their butter: hidden, and right at the station
    else
        PF.unpin(true)
        local g = tries == 0 and groundPos(mid.X, ph.Position.Y, mid.Z, { ph })
        if g and math.abs(g.Y - ph.Position.Y) < 8 then
            teleport(c, Vector3.new(mid.X, g.Y + hipH(c), mid.Z), ph.Position)
        else
            teleport(c, ph.Position + Vector3.new(0, ph.Size.Y / 2 + 3, 0), mid) -- on top of it: always in reach
        end
    end
    nap(0.3)
    local r = RS:FindFirstChild("Remotes")
    r = r and r:FindFirstChild("ClanRequest")
    if not r then HX.nextAt, HX.msg = now() + 60, "the game's help remote is missing" return end
    local ok, v = pcall(function() return r:InvokeServer("help", w.st:GetAttribute("PourOwner"), tonumber(w.st.Name)) end)
    if ok and type(v) == "table" and v.ok then
        HX.n, HX.fails = HX.n + 1, 0
        HX.skipIt(w.id, "helped")
        note(("HELPED %s's wax (station %s)"):format(w.p.DisplayName, w.st.Name))
        HX.msg = ("helped %d waxes here%s"):format(HX.n, HX.calls > 0 and (", " .. HX.calls .. " for the guild") or "")
    elseif ok and type(v) == "table" and tostring(v.reason or ""):lower():find("walk up", 1, true) and tries < 2 then
        HX.tries[w.id] = tries + 1 -- too far after all: next try from closer (on top of it)
        HX.nextAt = now() + 0.3
    elseif ok and type(v) == "table" and tostring(v.reason or ""):lower():find("moment", 1, true) then
        -- "One moment!": the server's pace limit (about one help a second and a half, seen live). Not
        -- a no for this wax: wait a little and ask again
        HX.waits = (HX.waits or 0) + 1
        HX.nextAt = now() + 1.6
    else
        local why = (ok and type(v) == "table" and tostring(v.reason or "refused")) or ("error: " .. tostring(v))
        HX.skipIt(w.id, why)
        HX.fails = HX.fails + 1
        if HX.fails <= 3 then note(("help refused for %s's wax: %s"):format(w.p.DisplayName, why)) end
        if HX.fails >= 5 then -- something is off: wait a minute, go home
            HX.fails, HX.nextAt, HX.msg = 0, now() + 60, "the server keeps refusing helps - trying again in a minute"
            HX.goHome()
        end
    end
    HX.nextAt = math.max(HX.nextAt, now() + 1.2)
end
function HX.onCall(c) -- ClanEvent("call", { p = preset, u = userId, n = name, ... })
    if not CFG.HelpGuild or type(c) ~= "table" or c.p ~= "help" or c.mine or c.u == PX.uid or not c.u then return end
    task.delay(1 + math.random() * 2, function()
        if not (S.alive and CFG.HelpGuild) then return end
        local r = RS:FindFirstChild("Remotes")
        r = r and r:FindFirstChild("ClanRequest")
        if not r then return end
        local ok, v = pcall(function() return r:InvokeServer("callHelp", c.u) end)
        local who = tostring(c.n or c.un or c.u)
        if ok and type(v) == "table" and v.ok then
            HX.calls = HX.calls + 1
            note(("HELPED guildmate %s's wax from here (their call)"):format(who))
        else
            note(("guild call from %s: %s"):format(who, (ok and type(v) == "table" and tostring(v.reason or "refused")) or tostring(v)))
        end
    end)
end
local function runAction(label, fn, ...)
    if S.busy then return end
    S.busy, S.busyText = true, label
    if PF.hold and fn ~= HX.step then pcall(PF.unpin) end -- up to the surface first: jobs need you there
    local ok, e = pcall(fn, ...)
    S.busy, S.busyText = false, ""
    if not ok and e ~= KILLED then note("ERR " .. tostring(e)) end
end
local function step()
    local act, txt, lvl = decide()
    S.reason, S.level = txt, lvl
    if act == "place" then runAction("waxing...", TM.place)
    elseif act == "crate" then runAction("opening crate...", doCrate, true)
    elseif act == "cratesmart" then runAction("opening crate...", CRATE.smart)
    elseif act == "cratewin" then runAction("opening the crate window...", summonCrate)
    elseif act == "nocrate" then runAction("discarding crate...", doCrate, false)
    elseif act == "cratedrop" then runAction("discarding a crate that would not open...", CRATE.drop)
    elseif act == "sell" then runAction("selling...", doSell)
    elseif act == "buy" then runAction("buying...", doBuy, false)
    elseif not act and not S.matchSince and SH.due() then
        runAction("grabbing a butter from the admin shower...", SH.grab)
    elseif not act and not S.matchSince and CF.due() then
        runAction("sitting at the campfire...", CF.sit)
    elseif not act and not S.matchSince and QX.pullDue() and not carriedName() and not (padInfo() and isTarget(padInfo().name)) then
        runAction("pulling the lever for a quest...", QX.pull)
    elseif CFG.Collect and not S.matchSince and now() - S.lastCollect >= (QX.collectLeft > 0 and CFG.Quests and math.min(CFG.Every, 15) or CFG.Every) then
        runAction("collecting money...", doCollect)
    elseif not act and not S.matchSince and HX.due() then
        runAction("helping a wax...", HX.step) -- only when the farm has nothing of its own to do
    elseif HX.home and not CFG.Help then
        runAction("coming back...", HX.goHome) -- HELP was switched off mid-round
    elseif not S.busy then
        PF.parkTick()
    end
end
function setRunning(v, quiet)
    if v == S.running then return end
    S.running = v
    if not quiet then CFG.AutoStart = v end -- so saving the config remembers this
    if v then
        S.capHit, S.placeFails, S.cashFails, S.sellFails, S.crateFails = false, 0, 0, 0, 0
        CRATE.lastFail, CRATE.summonFails, CRATE.ignoreUntil = 0, 0, 0
        S.noCashUntil, S.matchSince = 0, nil
        S.lastCollect = now()
        S.plot = findPlot() or S.plot
        note("START")
    else
        S.reason = "stopped"
        note("STOP")
    end
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
local U = { shown = setmetatable({}, { __mode = "k" }), lit = setmetatable({}, { __mode = "k" }) }
-- set a label's text only when it really changed: re-setting text makes Roblox lay it out again
function U.put(o, t)
    if o and U.shown[o] ~= t then U.shown[o] = t o.Text = t end
end
local pg = plr:FindFirstChildOfClass("PlayerGui") or plr:WaitForChild("PlayerGui")
local oldGui = pg:FindFirstChild("SABFarmGui")
if oldGui then oldGui:Destroy() end
local sg = mk("ScreenGui", { Name = "SABFarmGui", ResetOnSpawn = false, DisplayOrder = 999, IgnoreGuiInset = true }, pg)
-- sized to the screen it opens on (measured: your phone is 742 x 360 in landscape): ~44% of the width,
-- ~84% of the height, so the game stays visible beside it
local Z = { w = 320, h = 300, head = 28, strip = 34, tabs = 24 }
pcall(function()
    local vp = WS.CurrentCamera.ViewportSize
    if vp.X > 100 and vp.Y > 100 then
        Z.w = math.clamp(math.floor(vp.X * 0.44), 300, 360)
        Z.h = math.clamp(math.floor(vp.Y * 0.84), 240, 340)
    end
end)
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
S.dragMoved = {} -- how far the last press on each handle travelled (a tap is < 8 px)
-- handle = the object your finger actually lands on. A button covering a frame takes the touch, so
-- for a button the button itself has to be the handle (the frame under it never hears the touch).
local function makeDraggable(handle, target, onDrop)
    track(handle.InputBegan:Connect(function(i)
        if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
        local d = { start = i.Position, from = target.Position, moved = 0, target = target, input = i, onDrop = onDrop }
        dragging[handle], S.dragMoved[handle] = d, 0
        local cn
        cn = i.Changed:Connect(function()
            if i.UserInputState == Enum.UserInputState.End and dragging[handle] == d then
                dragging[handle] = nil
                if cn then cn:Disconnect() end
                if onDrop then onDrop(d.moved) end
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
            S.dragMoved[h] = d.moved
            tgt.Position = UDim2.new(d.from.X.Scale, d.from.X.Offset + dx, d.from.Y.Scale, d.from.Y.Offset + dy)
        end
    end
end))
track(UIS.InputEnded:Connect(function(i) -- backup: a release the input object itself never reported
    if i.UserInputType ~= Enum.UserInputType.MouseButton1 and i.UserInputType ~= Enum.UserInputType.Touch then return end
    for h, d in pairs(dragging) do
        if d.input == i or i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging[h] = nil
            if d.onDrop then d.onDrop(d.moved) end
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
U.tabFarm = button(U.tabs, "FARM", C.accent, 9, UDim2.new(0, 6, 0, 0), UDim2.new(1 / 6, -7, 1, -4))
U.tabBut = button(U.tabs, "BUTTERS", C.panel2, 9, UDim2.new(1 / 6, 1, 0, 0), UDim2.new(1 / 6, -2, 1, -4))
U.tabCrt = button(U.tabs, "CRATES", C.panel2, 9, UDim2.new(2 / 6, 1, 0, 0), UDim2.new(1 / 6, -2, 1, -4))
U.tabPet = button(U.tabs, "PETS", C.panel2, 9, UDim2.new(3 / 6, 1, 0, 0), UDim2.new(1 / 6, -2, 1, -4))
U.tabTeam = button(U.tabs, "TEAMS", C.panel2, 9, UDim2.new(4 / 6, 1, 0, 0), UDim2.new(1 / 6, -2, 1, -4))
U.tabSet = button(U.tabs, "SETUP", C.panel2, 9, UDim2.new(5 / 6, 1, 0, 0), UDim2.new(1 / 6, -7, 1, -4))
local function pane()
    local f = mk("ScrollingFrame", { Position = UDim2.new(0, 0, 0, Z.head + Z.strip + Z.tabs), Size = UDim2.new(1, 0, 1, -(Z.head + Z.strip + Z.tabs)),
        BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.line,
        CanvasSize = UDim2.new(0, 0, 0, 100) }, U.root)
    mk("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, f)
    mk("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 10), PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 8) }, f)
    return f
end
U.farm, U.but, U.set, U.crt = pane(), pane(), pane(), pane()
U.pet, U.team = pane(), pane()
U.but.Visible, U.set.Visible, U.crt.Visible, U.pet.Visible, U.team.Visible = false, false, false, false, false

-- ---- FARM tab
local order, total, rw = 0, 12, nil
local function row(h, parent)
    order, total = order + 1, total + h + 6
    return mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = order }, parent or U.farm)
end
local function caption(t) lbl(row(14), t, 10, C.dim, true) end
rw = row(32)
U.startB = button(rw, "START", C.good, 14, at(0, 0.68))
U.killB = button(rw, "KILL", C.bad, 14, at(0.68, 0.32))
do -- the five counters
local r2 = row(40)
local function cell(i, cap, n)
    local f = mk("Frame", { Position = UDim2.new((i - 1) / n, 0, 0, 0), Size = UDim2.new(1 / n, i < n and -4 or 0, 1, 0),
        BackgroundColor3 = C.panel, BorderSizePixel = 0 }, r2)
    round(f, 6)
    local v = lbl(f, "0", 14, C.text, true, UDim2.new(0, 0, 0, 3), UDim2.new(1, 0, 0, 20))
    local c = lbl(f, cap, 9, C.dim, false, UDim2.new(0, 0, 0, 23), UDim2.new(1, 0, 0, 13))
    v.TextXAlignment, c.TextXAlignment = Enum.TextXAlignment.Center, Enum.TextXAlignment.Center
    return v
end
U.sBought, U.sPlaced, U.sSold, U.sColl, U.sFree = cell(1, "BOUGHT", 5), cell(2, "WAXED", 5), cell(3, "SOLD", 5), cell(4, "MONEY", 5), cell(5, "FREE", 5)
end
U.info = lbl(row(40), "", 10, C.dim, false)
U.tgt = lbl(row(16), "", 10, C.good, false)
caption("SWITCHES")
do
local function pair(a1, a2) -- two switches side by side
    local f = row(26)
    return button(f, a1, C.panel2, 10, at(0, 0.5)), button(f, a2, C.panel2, 10, at(0.5, 0.5))
end
U.colT, U.sellT = pair("COLLECT: ON", "SELL THEM: ON")
U.crateT, U.arT = pair("OPEN CRATES: ON", "AUTO ROLL: OFF")
U.helpT, U.helpGT = pair("HELP WAXES: OFF", "GUILD CALLS: OFF")
U.campT, U.ghostT = pair("CAMPFIRE: OFF", "GHOST: OFF")
U.ixT, U.bestT = pair("AUTO INDEX: OFF", "BEST BUTTER: OFF")
U.bcT, U.shT = pair("BEST CRATE: OFF", "GRAB SHOWER: ON")
rw = row(26)
U.questT = button(rw, "QUESTS: OFF", C.panel2, 10, at(0, 0.5))
lbl(rw, "collect every", 9, C.dim, false, at(0.52, 0.2))
U.secB = textbox(rw, tostring(CFG.Every), "60", at(0.72, 0.13))
U.secB.TextSize = 11
U.secSet = button(rw, "SET", C.accent, 10, at(0.85, 0.15))
local st = mk("Frame", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0 }, row(76))
round(st, 6)
mk("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }, st)
mk("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingTop = UDim.new(0, 3) }, st)
local function sline(i) -- one status line per feature, cut short rather than wrapped
    local l = lbl(st, "", 9, C.dim, false, nil, UDim2.new(1, -6, 0, 14))
    l.LayoutOrder, l.TextWrapped, l.TextTruncate = i, false, Enum.TextTruncate.AtEnd
    return l
end
U.helpL, U.campL, U.questL, U.arL, U.ixL = sline(1), sline(2), sline(3), sline(4), sline(5)
end
caption("LOG")
U.log = mk("TextLabel", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0, Font = Enum.Font.Code,
    TextSize = 10, TextColor3 = C.text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true, Text = "" }, row(84))
round(U.log, 6)
mk("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingTop = UDim.new(0, 4), PaddingRight = UDim.new(0, 6) }, U.log)
U.farm.CanvasSize = UDim2.new(0, 0, 0, total)

-- ---- SETUP tab
order, total = 0, 12
local function srow(h) return row(h, U.set) end
local function scap(t) lbl(srow(14), t, 10, C.dim, true) end
scap("ONE-OFF ACTIONS")
rw = srow(26)
U.buyB = button(rw, "BUY THE PAD", C.warn, 10, at(0, 0.5))
U.plB = button(rw, "WAX WHAT I HOLD", C.good, 10, at(0.5, 0.5))
rw = srow(26)
U.sellB = button(rw, "SELL WHAT I HOLD", C.warn, 10, at(0, 0.5))
U.crateB = button(rw, "OPEN CRATE NOW", C.warn, 10, at(0.5, 0.5))
rw = srow(26)
U.padB = button(rw, "SET PAD (stand on it)", C.panel2, 10, at(0, 0.55))
U.padL = lbl(rw, "", 10, C.dim, false, at(0.56, 0.44))
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
scap("SMOOTHER RUNNING  (for long / overnight runs)")
rw = srow(28)
U.pfLite = button(rw, "LITE MODE: OFF", C.panel2, 10, at(0, 0.5))
U.pfHud = button(rw, "HIDE GAME HUD: OFF", C.panel2, 10, at(0.5, 0.5))
rw = srow(28)
U.pfFps = button(rw, "FPS CAP: GAME", C.panel2, 10, at(0, 0.5))
U.pfRender = button(rw, "STOP 3D: OFF", C.panel2, 10, at(0.5, 0.5))
rw = srow(28)
U.pfCalm = button(rw, "NO ANIMATIONS: OFF", C.panel2, 10, at(0, 1))
U.pfBases = button(srow(28), "BASES: ALL DRAWN", C.panel2, 10, at(0, 1))
rw = srow(28)
U.pfMem = textbox(rw, tostring(CFG.MemLimit), "2000", at(0, 0.24))
lbl(rw, "MB: rejoin this server above it (0 = never)", 9, C.dim, false, at(0.26, 0.52))
U.pfMemSet = button(rw, "SET", C.accent, 11, at(0.8, 0.2))
U.pfInfo = lbl(srow(18), "", 10, C.text, false)
lbl(srow(66), "LITE MODE turns off floating labels, sparkles and lighting extras; the screen stays normal. BASES: OTHERS HIDDEN stops drawing other players' bases and stacks, ALL HIDDEN yours too (nothing is removed, so helping and farming work). HIDE GAME HUD hides the game's own menus. A lower FPS CAP keeps the phone cooler overnight. STOP 3D blanks the world behind this window. All of it goes back to normal when switched off or on KILL.", 9, C.dim, false)
scap("THE ROUND SAB BUTTON")
lbl(srow(30), "Tap it to hide or show this window. Hold and drag it anywhere on screen. The farm keeps running either way.", 10, C.dim, false)
U.set.CanvasSize = UDim2.new(0, 0, 0, total)

-- ---- the floating button: hides and brings back the whole window, drag it anywhere
local tg = mk("ScreenGui", { Name = "SABToggle", ResetOnSpawn = false, DisplayOrder = 1000, IgnoreGuiInset = true }, pg)
U.tgRoot = mk("Frame", { Size = UDim2.new(0, 40, 0, 40),
    Position = S.togPos and UDim2.new(0, S.togPos[1], 0, S.togPos[2]) or UDim2.new(0, 10, 0.45, -20),
    BackgroundColor3 = C.accent, BorderSizePixel = 0, Active = true }, tg)
round(U.tgRoot, 20)
mk("UIStroke", { Color = C.line, Thickness = 1 }, U.tgRoot)
U.tgBtn = mk("TextButton", { Text = "SAB", Size = FILL, BackgroundTransparency = 1, Font = Enum.Font.GothamBold,
    TextSize = 11, TextColor3 = C.text, AutoButtonColor = false }, U.tgRoot)
U.tgDot = mk("Frame", { Size = UDim2.new(0, 7, 0, 7), Position = UDim2.new(1, -9, 0, 2), BackgroundColor3 = C.dim,
    BorderSizePixel = 0 }, U.tgRoot)
round(U.tgDot, 4)
-- ghost on/off without opening the window: OFF -> HELP -> FULL (it moves with the SAB button)
U.tgGhost = mk("TextButton", { Text = "G: OFF", Size = UDim2.new(0, 46, 0, 18), Position = UDim2.new(0.5, -23, 1, 4),
    BackgroundColor3 = C.panel2, Font = Enum.Font.GothamBold, TextSize = 9, TextColor3 = C.text, AutoButtonColor = false,
    BorderSizePixel = 0 }, U.tgRoot)
round(U.tgGhost, 6)
U.tgGhost.MouseButton1Click:Connect(function() PF.cycleGhost() end)
function PF.paintGhost() -- (here, after the colours exist)
    local m = PF.ghostMode()
    local col = m == 2 and C.accent or (m == 1 and C.warn or C.panel2)
    if U.ghostT then U.ghostT.Text, U.ghostT.BackgroundColor3 = PF.GHOST[m][1], col end
    if U.tgGhost then U.tgGhost.Text, U.tgGhost.BackgroundColor3 = PF.GHOST[m][2], col end
end

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
function CR.paint()
    for k, b in pairs(CR.boxes) do
        local on = CFG.CrateTicks[k] == true
        b.Text = on and "X" or ""
        b.BackgroundColor3 = on and C.good or C.panel2
    end
    if U.crtInfo then
        local n, t = 0, 0
        for _ in pairs(CR.boxes) do n = n + 1 end
        for _, on in pairs(CFG.CrateTicks) do if on then t = t + 1 end end
        U.crtInfo.Text = ("%d crates, %d ticked"):format(n, t)
    end
    if U.crtAll then
        U.crtAll.Text = CFG.Crates and "OPEN TICKED CRATES: ON" or "OPEN TICKED CRATES: OFF"
        U.crtAll.BackgroundColor3 = CFG.Crates and C.accent or C.panel2
    end
end
function CR.build()
    for _, ch in ipairs(U.crt:GetChildren()) do
        if ch:IsA("Frame") or ch:IsA("TextButton") then ch:Destroy() end
    end
    CR.boxes = {}
    local y, ord = 12, 0
    local function add(h)
        ord = ord + 1
        y = y + h + 6
        return mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = ord }, U.crt)
    end
    local hf = add(28)
    U.crtInfo = lbl(hf, "", 10, C.dim, false, at(0, 0.5))
    local cl = button(hf, "CLEAR", C.panel2, 10, at(0.5, 0.24))
    local rf = button(hf, "REFRESH", C.panel2, 10, at(0.74, 0.26))
    track(cl.MouseButton1Click:Connect(function() CFG.CrateTicks = {} CR.paint() end))
    track(rf.MouseButton1Click:Connect(function() CR.build() end))
    U.crtAll = button(add(28), "", C.accent, 11, at(0, 1))
    track(U.crtAll.MouseButton1Click:Connect(function() CFG.Crates = not CFG.Crates CR.paint() end))
    lbl(add(30), "Only ticked crates are opened. Any other crate is left alone - the game spins it away by itself.", 10, C.dim, false)
    for _, c in ipairs(CR.list()) do
        local row = add(24)
        local b = mk("TextButton", { Text = "", Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0, AutoButtonColor = true }, row)
        round(b, 5)
        lbl(b, "  " .. (c.title or c.name) .. (c.guess and "  (?)" or ""), 11, RC[c.rar or ""] or C.text, true,
            UDim2.new(0, 4, 0, 0), UDim2.new(0.62, 0, 1, 0))
        lbl(b, c.price and ("$" .. fmt(c.price)) or (c.rar or ""), 9, C.dim, false, UDim2.new(0.62, 0, 0, 0), UDim2.new(0.25, 0, 1, 0))
        local tick = mk("TextButton", { Text = "", Size = UDim2.new(0, 22, 0, 16), Position = UDim2.new(1, -28, 0.5, -8),
            BackgroundColor3 = C.panel2, BorderSizePixel = 0, Font = Enum.Font.GothamBold, TextSize = 10,
            TextColor3 = C.text, AutoButtonColor = false }, b)
        round(tick, 4)
        CR.boxes[c.k] = tick
        local kk = c.k
        local function toggle()
            CFG.CrateTicks[kk] = (not CFG.CrateTicks[kk]) or nil
            CR.paint()
        end
        track(b.MouseButton1Click:Connect(toggle))
        track(tick.MouseButton1Click:Connect(toggle))
    end
    U.crt.CanvasSize = UDim2.new(0, 0, 0, y + 10)
    CR.built = CR.at
    CR.paint()
end
local tab = "farm"
local function showTab(which)
    tab = which
    U.farm.Visible, U.but.Visible, U.set.Visible = (which == "farm"), (which == "but"), (which == "set")
    U.crt.Visible = (which == "crt")
    U.pet.Visible, U.team.Visible = (which == "pet"), (which == "team")
    U.tabCrt.BackgroundColor3 = (which == "crt") and C.accent or C.panel2
    U.tabPet.BackgroundColor3 = (which == "pet") and C.accent or C.panel2
    U.tabTeam.BackgroundColor3 = (which == "team") and C.accent or C.panel2
    if which == "pet" and not PX.built then pcall(PX.build) end
    if which == "team" and not TM.built then pcall(TM.build) end
    if which == "crt" and (CR.built ~= CR.at or not next(CR.boxes)) then CR.build() end
    U.tabFarm.BackgroundColor3 = (which == "farm") and C.accent or C.panel2
    U.tabBut.BackgroundColor3 = (which == "but") and C.accent or C.panel2
    U.tabSet.BackgroundColor3 = (which == "set") and C.accent or C.panel2
    if which == "but" then buildList(false) end
end

---------------------------------------------------------------- button handlers
local function setToggle(b, on, onText, offText)
    U.put(b, on and onText or offText)
    if U.lit[b] ~= on then U.lit[b] = on b.BackgroundColor3 = on and C.accent or C.panel2 end
end
-- ---- PETS tab: worst pet at the top, best at the bottom. BUY = adopt it when it is in the pen,
-- BIG = only its Big version, WISH = keep a wish running for it in this server.
PX.RC = { Common = Color3.fromRGB(120, 220, 120), Rare = Color3.fromRGB(90, 170, 255), Epic = Color3.fromRGB(190, 110, 255),
    Legendary = Color3.fromRGB(255, 215, 60), Mythic = Color3.fromRGB(255, 90, 150), Exotic = Color3.fromRGB(90, 235, 215) }
function PX.paintRow(name)
    local r = PX.rows and PX.rows[name]
    if not r then return end
    local w = CFG.Pets[name] or {}
    r.b.BackgroundColor3 = w.b and C.good or C.panel2
    r.g.BackgroundColor3 = w.g and C.accent or C.panel2
    r.g.Text = w.g and "BIG" or "ANY"
    r.w.BackgroundColor3 = w.w and C.warn or C.panel2
    local f = tonumber(w.f) or 0
    r.f.Text = f > 0 and (f .. " BIG") or "FUSE"
    r.f.BackgroundColor3 = f > 0 and C.good or C.panel2
end
function PX.flag(name, f)
    local w = CFG.Pets[name] or {}
    if f == "f" then
        local n = ((tonumber(w.f) or 0) + 1) % 4 -- FUSE -> 1 BIG -> 2 BIG -> 3 BIG -> FUSE
        w.f = n > 0 and n or nil
    elseif w[f] then w[f] = nil else w[f] = true end
    CFG.Pets[name] = (w.b or w.g or w.w or w.f) and w or nil
    PX.paintRow(name)
end
function PX.paintAll()
    for n in pairs(PX.rows or {}) do PX.paintRow(n) end
    if U.pbT then
        setToggle(U.pbT, CFG.PetBuy, "AUTO ADOPT: ON", "AUTO ADOPT: OFF")
        setToggle(U.pwT, CFG.PetWish, "AUTO WISH: ON", "AUTO WISH: OFF")
        setToggle(U.pfT, CFG.AutoFuse, "AUTO FUSE: ON", "AUTO FUSE: OFF")
    end
end
function PX.live() -- once a second while the tab is open: wish timers and status lines
    if not PX.built then PX.build() return end
    if now() - (PX.liveAt or 0) < 1 then return end
    PX.liveAt = now()
    local w = PX.wishes()
    local d = PX.data()
    for n, r in pairs(PX.rows) do
        r.name.Text = PX.nice(n) .. (w[n] and ("   * wish %dm"):format(math.ceil(w[n] / 60)) or "")
        local st = FU.status(n, d)
        r.desc.Text = st and (st .. " | " .. r.boostText) or r.boostText
    end
    local cr = tonumber(plr:GetAttribute("PetWishCredits")) or 0
    U.pInfo.Text = ("pets %d/%d | cash $%s%s\nadopt: %s\nwish: %s"):format(d and #(d.pets or {}) or 0, d and tonumber(d.maxOwned) or 60,
        fmt(PX.money()), cr > 0 and (" | free wishes " .. cr) or "", PX.buyMsg ~= "" and PX.buyMsg or "-", PX.wishMsg ~= "" and PX.wishMsg or "-")
end
function PX.build()
    local I = PX.info()
    for _, ch in ipairs(U.pet:GetChildren()) do
        if ch:IsA("Frame") or ch:IsA("TextLabel") then ch:Destroy() end
    end
    PX.rows = {}
    local ord, y = 0, 12
    local function add(h)
        ord, y = ord + 1, y + h + 6
        return mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = ord }, U.pet)
    end
    local f = add(28)
    U.pbT = button(f, "AUTO ADOPT: OFF", C.panel2, 9, at(0, 0.34))
    U.pwT = button(f, "AUTO WISH: OFF", C.panel2, 9, at(0.34, 0.33))
    U.pfT = button(f, "AUTO FUSE: OFF", C.panel2, 9, at(0.67, 0.33))
    U.pbT.MouseButton1Click:Connect(function() CFG.PetBuy = not CFG.PetBuy PX.paintAll() end)
    U.pwT.MouseButton1Click:Connect(function() CFG.PetWish = not CFG.PetWish PX.paintAll() end)
    U.pfT.MouseButton1Click:Connect(function() CFG.AutoFuse = not CFG.AutoFuse PX.paintAll() end)
    U.pInfo = lbl(add(44), "", 10, C.dim, false)
    lbl(add(52), "BUY: adopt it whenever it is in the pen.  ANY/BIG: BIG = only its Big version.  WISH: keep a wish on it here (2x its price, 20 min, one per pet per server).  FUSE: how many Bigs you want - buying and wishing stop once there is enough, and AUTO FUSE makes them.", 9, C.dim, false)
    if not I then
        lbl(add(30), "pet list not loaded yet - open this tab again in a moment", 11, C.warn, false)
        U.pet.CanvasSize = UDim2.new(0, 0, 0, y)
        PX.built = false
        return
    end
    local byR = {}
    for _, n in ipairs(PX.order()) do
        local r = I.Pets[n].rarity or "?"
        byR[r] = byR[r] or {}
        table.insert(byR[r], n)
    end
    local rars = {}
    for _, r in ipairs(I.Rarities or {}) do if byR[r] then rars[#rars + 1] = r end end
    for r in pairs(byR) do if not table.find(rars, r) then rars[#rars + 1] = r end end
    for _, r in ipairs(rars) do
        local hb = mk("Frame", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0 }, add(22))
        round(hb, 6)
        lbl(hb, "  " .. r:upper(), 11, PX.RC[r] or C.text, true)
        for _, n in ipairs(byR[r]) do
            local rowF = mk("Frame", { Size = FILL, BackgroundColor3 = C.bg, BorderSizePixel = 0 }, add(38))
            round(rowF, 5)
            local nm = lbl(rowF, PX.nice(n), 11, PX.RC[r] or C.text, true, UDim2.new(0, 6, 0, 2), UDim2.new(1, -150, 0, 17))
            local ok, ds = pcall(function() return I.describe(n) end)
            local bt = ok and tostring(ds) or ""
            local dl = lbl(rowF, bt, 9, C.dim, false, UDim2.new(0, 6, 0, 19), UDim2.new(1, -150, 0, 17))
            local b = button(rowF, "BUY", C.panel2, 8, UDim2.new(1, -144, 0.5, -11), UDim2.new(0, 32, 0, 22))
            local g = button(rowF, "ANY", C.panel2, 8, UDim2.new(1, -110, 0.5, -11), UDim2.new(0, 32, 0, 22))
            local wb = button(rowF, "WISH", C.panel2, 8, UDim2.new(1, -76, 0.5, -11), UDim2.new(0, 34, 0, 22))
            local fb = button(rowF, "FUSE", C.panel2, 8, UDim2.new(1, -40, 0.5, -11), UDim2.new(0, 38, 0, 22))
            local name = n
            b.MouseButton1Click:Connect(function() PX.flag(name, "b") end)
            g.MouseButton1Click:Connect(function() PX.flag(name, "g") end)
            wb.MouseButton1Click:Connect(function() PX.flag(name, "w") end)
            fb.MouseButton1Click:Connect(function() PX.flag(name, "f") end)
            PX.rows[n] = { b = b, g = g, w = wb, f = fb, name = nm, desc = dl, boostText = bt }
        end
    end
    U.pet.CanvasSize = UDim2.new(0, 0, 0, y + 10)
    PX.built = true
    PX.paintAll()
end

-- ---- SETUP: smoother running
function PF.paint()
    setToggle(U.pfLite, CFG.Lite, "LITE MODE: ON", "LITE MODE: OFF")
    setToggle(U.pfCalm, CFG.Calm, "NO ANIMATIONS: ON", "NO ANIMATIONS: OFF")
    setToggle(U.pfHud, CFG.HideHud, "HIDE GAME HUD: ON", "HIDE GAME HUD: OFF")
    setToggle(U.pfRender, CFG.NoRender, "STOP 3D: ON", "STOP 3D: OFF")
    setToggle(U.pfBases, CFG.HideBases, PF.BASES[PF.basesMode()], PF.BASES[0])
    setToggle(U.pfFps, (CFG.FpsCap or 0) ~= 0, "FPS CAP: " .. tostring(CFG.FpsCap), "FPS CAP: GAME")
    if not U.pfMem:IsFocused() then U.pfMem.Text = tostring(CFG.MemLimit) end
end
function PF.applyAll() -- after a config load: put every switch into effect
    if CFG.Lite then PF.lite(true) end
    if CFG.Calm then PF.calm(true) end
    if CFG.HideHud then PF.hideHud(true) end
    if CFG.NoRender then PF.render(true) end
    if CFG.HideBases then PF.bases(true) end
    if (CFG.FpsCap or 0) ~= 0 then PF.cap(CFG.FpsCap) end
    PF.paint()
end
track(U.pfLite.MouseButton1Click:Connect(function() PF.lite(not CFG.Lite) PF.paint() end))
track(U.pfCalm.MouseButton1Click:Connect(function() PF.calm(not CFG.Calm) PF.paint() end))
track(U.pfHud.MouseButton1Click:Connect(function() PF.hideHud(not CFG.HideHud) PF.paint() end))
track(U.pfRender.MouseButton1Click:Connect(function() PF.render(not CFG.NoRender) PF.paint() end))
track(U.pfBases.MouseButton1Click:Connect(function() PF.setBases((PF.basesMode() + 1) % 3) PF.paint() end))
track(U.pfFps.MouseButton1Click:Connect(function()
    local i = table.find(PF.CAPS, CFG.FpsCap or 0) or 1
    local n = PF.CAPS[(i % #PF.CAPS) + 1]
    if not PF.cap(n) and n ~= 0 then note("this executor cannot cap fps") end
    PF.paint()
end))
track(U.pfMemSet.MouseButton1Click:Connect(function()
    local n = tonumber(U.pfMem.Text)
    if n and n >= 0 then CFG.MemLimit = math.floor(n) end
    PF.paint()
end))

-- ---- TEAMS tab
function TM.names()
    local t = { "(none)" }
    for _, tm in ipairs((TM.teams())) do t[#t + 1] = tm.name end
    return t
end
function TM.cycle(k, dir)
    local opts = TM.names()
    local cur = CFG[k] ~= "" and CFG[k] or "(none)"
    local i = table.find(opts, cur) or 1
    i = ((i - 1 + dir) % #opts) + 1
    CFG[k] = opts[i] == "(none)" and "" or opts[i]
    TM.paint()
end
function TM.paint()
    if not TM.built then return end
    setToggle(U.tmT, CFG.Teams, "AUTO TEAMS: ON", "AUTO TEAMS: OFF")
    setToggle(U.tmBuild, CFG.AutoBuild, "AUTO BUILD TEAMS: ON", "AUTO BUILD TEAMS: OFF")
    local have = {}
    for _, tm in ipairs((TM.teams())) do have[tm.name] = true end
    for k, b in pairs(TM.pick) do
        local v = CFG[k]
        b.Text = v == "" and "(none)" or (have[v] and v or (v .. " (missing)"))
        b.TextColor3 = (v ~= "" and not have[v]) and C.bad or C.text
    end
    if not U.tmLead:IsFocused() then U.tmLead.Text = tostring(CFG.GlazeLead) end
    U.tmInfo.Text = (TM.msg or "") .. ("\nswitches %d | finished %d | glazed %d | fused %d"):format(TM.switches, TM.finished, TM.glazed, FU.fused)
        .. (FU.buildMsg ~= "" and ("\n" .. FU.buildMsg) or "")
    local t, L = PX.srv(), {}
    for _, w in ipairs(TM.list or {}) do
        L[#L + 1] = ("st %-2s %-22s %9s  helps %d"):format(w.st.Name, prettyOf(key(w.name)):sub(1, 22), TM.clock(w.ends - t), w.helps)
    end
    U.tmList.Text = #L > 0 and table.concat(L, "\n") or "no waxes running"
end
function TM.build()
    for _, ch in ipairs(U.team:GetChildren()) do
        if ch:IsA("Frame") or ch:IsA("TextLabel") then ch:Destroy() end
    end
    TM.pick = {}
    local ord, y = 0, 12
    local function add(h)
        ord, y = ord + 1, y + h + 6
        return mk("Frame", { Size = UDim2.new(1, 0, 0, h), BackgroundTransparency = 1, LayoutOrder = ord }, U.team)
    end
    local function cap(t) lbl(add(14), t, 10, C.dim, true) end
    local function picker(k)
        local f = add(26)
        local l = button(f, "<", C.panel2, 11, at(0, 0.14))
        local m = button(f, "(none)", C.panel, 10, at(0.14, 0.72))
        local r = button(f, ">", C.panel2, 11, at(0.86, 0.14))
        l.MouseButton1Click:Connect(function() TM.cycle(k, -1) end)
        r.MouseButton1Click:Connect(function() TM.cycle(k, 1) end)
        m.MouseButton1Click:Connect(function() TM.cycle(k, 1) end)
        TM.pick[k] = m
    end
    U.tmT = button(add(28), "AUTO TEAMS: OFF", C.panel2, 11, at(0, 1))
    U.tmT.MouseButton1Click:Connect(function()
        CFG.Teams = not CFG.Teams
        if CFG.Teams and CFG.TeamNormal == "" then CFG.TeamNormal = TM.current() end -- start from what you wear now
        TM.paint()
    end)
    U.tmInfo = lbl(add(42), "", 10, C.dim, false)
    local bf = add(26)
    U.tmBuild = button(bf, "AUTO BUILD TEAMS: OFF", C.panel2, 9, at(0, 0.62))
    U.tmBuildNow = button(bf, "BUILD NOW", C.warn, 9, at(0.62, 0.38))
    U.tmBuild.MouseButton1Click:Connect(function() CFG.AutoBuild = not CFG.AutoBuild TM.paint() end)
    U.tmBuildNow.MouseButton1Click:Connect(function()
        if TM.editing then return end
        FU.buildMsg = "building..."
        task.spawn(function() local ok, e = pcall(FU.rebuild, "you asked") if not ok then note("BUILD ERR " .. tostring(e)) end end)
    end)
    cap("NORMAL TEAM  (worn the rest of the time)")
    picker("TeamNormal")
    cap("FULL TEAM  (every station busy: money + wax speed)")
    picker("TeamFull")
    cap("GLAZE TEAM  (worn just before a wax finishes)")
    picker("TeamGlaze")
    local f = add(26)
    U.tmLead = textbox(f, tostring(CFG.GlazeLead), "45", at(0, 0.2))
    lbl(f, "sec before it finishes", 10, C.dim, false, at(0.22, 0.5))
    local setB = button(f, "SET", C.accent, 11, at(0.75, 0.25))
    setB.MouseButton1Click:Connect(function()
        local n = tonumber(U.tmLead.Text)
        if n and n >= 5 and n <= 600 then CFG.GlazeLead = math.floor(n) else U.tmLead.Text = tostring(CFG.GlazeLead) end
        TM.paint()
    end)
    cap("WAX TEAM  (worn while a butter is placed: head starts)")
    picker("TeamWax")
    cap("YOUR WAXES  (time left, helps)")
    U.tmList = mk("TextLabel", { Size = FILL, BackgroundColor3 = C.panel, BorderSizePixel = 0, Font = Enum.Font.Code,
        TextSize = 9, TextColor3 = C.text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = false, Text = "" }, add(150))
    round(U.tmList, 6)
    mk("UIPadding", { PaddingLeft = UDim.new(0, 6), PaddingTop = UDim.new(0, 4) }, U.tmList)
    lbl(add(92), "Teams are the loadouts you saved in the game's Teams page. Every running wax goes at the speed of the pets you wear right now (the times below are the stations' own countdowns), head starts are decided when a butter is placed, and the glaze is rolled when a wax finishes. So: WAX team (head starts) while placing, GLAZE team at a finish, FULL (money + wax speed) while every station is busy, NORMAL (money + luck) while stations wait for Apple Pies. The lead counts in glaze-team time. While AUTO TEAMS is on it keeps putting the right team back.", 9, C.dim, false)
    U.team.CanvasSize = UDim2.new(0, 0, 0, y + 10)
    TM.built = true
    TM.paint()
end

-- put a config that was just loaded onto the controls
local function applyLoaded()
    U.secB.Text = tostring(CFG.Every)
    setToggle(U.colT, CFG.Collect, "COLLECT: ON", "COLLECT: OFF")
    setToggle(U.sellT, CFG.SellJunk, "SELL THEM: ON", "SELL THEM: OFF")
    setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
    setToggle(U.helpT, CFG.Help, "HELP WAXES: ON", "HELP WAXES: OFF")
    setToggle(U.helpGT, CFG.HelpGuild, "GUILD CALLS: ON", "GUILD CALLS: OFF")
    setToggle(U.campT, CFG.Campfire, "CAMPFIRE: ON", "CAMPFIRE: OFF")
    PF.paintGhost()
    IX.paint()
    setToggle(U.questT, CFG.Quests, "QUESTS: ON", "QUESTS: OFF")
    if not CFG.Ghost then task.spawn(function() while S.busy do nap(0.1) end if not HX.home then pcall(PF.unpin) end end) end
    setToggle(U.arT, CFG.AutoRoll, "AUTO ROLL: ON", "AUTO ROLL: OFF")
    setToggle(U.rejT, CFG.Rejoin, "AUTO REJOIN: ON", "AUTO REJOIN: OFF")
    setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
    if CFG.AutoStart ~= S.running then setRunning(CFG.AutoStart, true) end -- a loaded config that was running starts again
    if S.winPos then U.root.Position = UDim2.new(0, S.winPos[1], 0, S.winPos[2]) end
    if S.togPos then U.tgRoot.Position = UDim2.new(0, S.togPos[1], 0, S.togPos[2]) end
    clampIn(U.root)
    clampIn(U.tgRoot)
    S.lastCollect = now()
    refreshTicks()
    CR.paint()
    pcall(PX.paintAll)
    pcall(TM.paint)
    pcall(PF.applyAll)
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
click(U.arT, function()
    CFG.AutoRoll = not CFG.AutoRoll
    task.spawn(AR.apply, "you asked", true)
end)
click(U.crateT, function()
    CFG.Crates = not CFG.Crates
    setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
end)
click(U.helpT, function()
    CFG.Help = not CFG.Help
    HX.nextAt, HX.msg = 0, CFG.Help and "looking for waxes to help" or "off"
    setToggle(U.helpT, CFG.Help, "HELP WAXES: ON", "HELP WAXES: OFF")
end)
click(U.helpGT, function()
    CFG.HelpGuild = not CFG.HelpGuild
    setToggle(U.helpGT, CFG.HelpGuild, "GUILD CALLS: ON", "GUILD CALLS: OFF")
end)
click(U.questT, function()
    CFG.Quests = not CFG.Quests
    QX.at = 0
    setToggle(U.questT, CFG.Quests, "QUESTS: ON", "QUESTS: OFF")
end)
click(U.campT, function()
    CFG.Campfire = not CFG.Campfire
    CF.nextAt, CF.fails, CF.lost = 0, 0, 0
    setToggle(U.campT, CFG.Campfire, "CAMPFIRE: ON", "CAMPFIRE: OFF")
end)
click(U.ghostT, PF.cycleGhost)
function IX.paint()
    setToggle(U.ixT, CFG.AutoIndex, "AUTO INDEX: ON", "AUTO INDEX: OFF")
    setToggle(U.bestT, (CFG.Best or 0) > 0, CFG.Best == 4 and "BEST: UPGRADES" or ("BEST: TOP " .. tostring(CFG.Best)), "BEST BUTTER: OFF")
    setToggle(U.bcT, CFG.BestCrate, "BEST CRATE: ON", "BEST CRATE: OFF")
    setToggle(U.shT, CFG.Shower, "GRAB SHOWER: ON", "GRAB SHOWER: OFF")
end
function IX.changed(wasOn) -- after a switch: work it out again now, and put your own choices back when all are off
    task.spawn(function()
        pcall(IX.tick)
        if wasOn and not IX.on() then IX.fails, IX.pauseUntil = 0, 0 pcall(IX.sync, true) end
    end)
    IX.paint()
end
click(U.ixT, function()
    local was = IX.on()
    CFG.AutoIndex = not CFG.AutoIndex
    IX.discAt = -100 -- read the Index again
    IX.changed(was)
end)
click(U.bestT, function()
    local was = IX.on()
    CFG.Best = ((CFG.Best or 0) + 1) % 5 -- off -> top 1 -> top 2 -> top 3 -> upgrades -> off
    IX.stackAt = -100
    IX.changed(was)
end)
click(U.bcT, function()
    local was = IX.on()
    CFG.BestCrate = not CFG.BestCrate
    IX.changed(was)
end)
click(U.shT, function()
    CFG.Shower = not CFG.Shower
    IX.paint()
end)
click(U.crateB, function()
    CRATE.lastFail, CRATE.summonFails, CRATE.ignoreUntil, S.crateFails = 0, 0, 0, 0
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
click(U.tabFarm, function() showTab("farm") end)
click(U.tabBut, function() showTab("but") end)
click(U.tabSet, function() showTab("set") end)
click(U.tabCrt, function() showTab("crt") end)
click(U.tabPet, function() showTab("pet") end)
click(U.tabTeam, function() showTab("team") end)

-- the floating button: tap to hide or show, drag to move
local function setHidden(v)
    S.hidden = v
    U.root.Visible = not v
    U.tgBtn.Text = v and "SAB+" or "SAB"
end
makeDraggable(U.tgBtn, U.tgRoot, function()
    clampIn(U.tgRoot)
    S.togPos = remember(U.tgRoot) or S.togPos
end)
click(U.tgBtn, function() -- the button's own tap; ignored when the press was really a drag
    if (S.dragMoved[U.tgBtn] or 0) < 8 then setHidden(not S.hidden) end
    S.dragMoved[U.tgBtn] = 0
end)

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
        task.spawn(AR.apply, "config " .. name)
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
        U.farm.Visible, U.but.Visible, U.set.Visible, U.crt.Visible = false, false, false, false
        U.pet.Visible, U.team.Visible = false, false
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
    pcall(PF.restoreAll)
    pcall(saveLearn)
    for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
    if CRATE.oldNC then pcall(function() hookmetamethod(game, "__namecall", CRATE.oldNC) end) end
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
    local dotC = S.running and C.good or (S.capHit and C.bad or C.dim)
    if U.lit.dot ~= dotC then U.lit.dot = dotC U.dot.BackgroundColor3, U.tgDot.BackgroundColor3 = dotC, dotC end
    if U.lit.tg ~= S.hidden then U.lit.tg = S.hidden U.tgRoot.BackgroundColor3 = S.hidden and C.panel2 or C.accent end
    if S.hidden then return end -- window away: only the little button's colours matter
    U.put(U.reason, txt)
    if U.lit.bar ~= lvl then U.lit.bar = lvl U.bar.BackgroundColor3 = LV[lvl] or C.dim end
    if minimized then return end -- only the header and the status line show
    if U.lit.run ~= S.running then
        U.lit.run = S.running
        U.startB.Text, U.startB.BackgroundColor3 = S.running and "STOP" or "START", S.running and C.warn or C.good
    end
    setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
    local tn = targetNames()
    if U.farm.Visible then
        local free, total2 = freeCount()
        U.put(U.sBought, tostring(S.bought)) U.put(U.sPlaced, tostring(S.placed)) U.put(U.sSold, tostring(S.sold))
        U.put(U.sColl, tostring(S.collected)) U.put(U.sFree, free .. "/" .. total2)
        local nxt = (S.running and CFG.Collect) and math.max(0, math.ceil(CFG.Every - (now() - S.lastCollect))) or nil
        local held = carriedName()
        U.put(U.info, ("cash $%s | rolls %d | gifts %d | crates %d\nin hands: %s%s\nnext collect: %s"):format(
            fmt(cash()), S.rolls, S.gifts, S.crates, held and prettyOf(key(held)) or "nothing",
            CRATE.on and ("   [" .. CRATE.title .. " window open]") or "",
            nxt and ("in " .. nxt .. "s") or "off"))
        U.put(U.tgt, (#tn == 0) and "NOTHING TICKED - open the BUTTERS tab"
            or ("buying: " .. ((#tn <= 3) and table.concat(tn, ", ") or (#tn .. " butters ticked"))))
        if U.lit.tgt ~= (#tn == 0) then U.lit.tgt = (#tn == 0) U.tgt.TextColor3 = (#tn == 0) and C.bad or C.good end
        if U.logN ~= S.logN then U.logN = S.logN U.log.Text = table.concat(logs, "\n") end
    end
    if U.set.Visible then
        U.put(U.padL, S.manualPad and "pad: saved" or (S.padPart and ("auto: " .. S.padPart.Name) or "pad: not found"))
    end
    if U.butInfo and U.but.Visible then
        U.put(U.butInfo, ("%d butters, %d rarities\n%d ticked"):format(CAT.n, #CAT.rarOrder, #tn))
    end
    if U.but.Visible and LST.at ~= CAT.at then buildList(false) end
    if U.crt.Visible then
        if CR.built ~= CR.at then CR.build() else CR.paint() end
    end
    if U.pet.Visible then PX.live() end
    if U.set.Visible then
        U.pfInfo.Text = ("%d fps | memory %d MB (peak %d)"):format(math.floor(PF.fps + 0.5), PF.mem, PF.memPeak)
    end
    if U.team.Visible then TM.paint() end
    if U.farm.Visible then
        U.put(U.helpL, "help: " .. ((CFG.Help or CFG.HelpGuild) and HX.msg or "off"))
        U.put(U.campL, "camp: " .. (CFG.Campfire and CF.msg or "off") .. (PF.ghostMode() > 0 and (PF.hold and " | ghost: hidden" or " | ghost: up") or ""))
        U.put(U.questL, "quests: " .. (CFG.Quests and (QX.msg ~= "" and QX.msg or "checking...") or "off"))
        U.put(U.ixL, IX.msg)
        setToggle(U.crateT, CFG.Crates, "OPEN CRATES: ON", "OPEN CRATES: OFF")
        setToggle(U.arT, CFG.AutoRoll, "AUTO ROLL: ON", "AUTO ROLL: OFF")
        local learned = (AR.rec.on and "on" or "") .. (AR.rec.off and ((AR.rec.on and "/" or "") .. "off") or "")
        U.put(U.arL, AR.msg ~= "" and AR.msg or ("auto roll: game %s | learned %s%s"):format(AR.isOn() and "ON" or "off",
            learned ~= "" and learned or "nothing yet", #AR.rec.rules > 0 and ", choices" or ""))
        if U.lit.arL ~= (AR.msg ~= "") then U.lit.arL = (AR.msg ~= "") U.arL.TextColor3 = AR.msg ~= "" and C.warn or C.dim end
    end
end
genv.SAB = { S = S, CFG = CFG, EV = EV, U = U, sg = sg, CAT = CAT, LEARN = LEARN, buildList = buildList,
    logAll = logAll, evAll = evAll, AR = AR, CR = CR, PF = PF,
    PX = PX, TM = TM, CRATE = CRATE, FU = FU, HX = HX, CF = CF, QX = QX, IX = IX, SH = SH }
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
setToggle(U.helpT, CFG.Help, "HELP WAXES: ON", "HELP WAXES: OFF")
setToggle(U.helpGT, CFG.HelpGuild, "GUILD CALLS: ON", "GUILD CALLS: OFF")
setToggle(U.campT, CFG.Campfire, "CAMPFIRE: ON", "CAMPFIRE: OFF")
PF.paintGhost()
IX.paint()
setToggle(U.questT, CFG.Quests, "QUESTS: ON", "QUESTS: OFF")
setToggle(U.rejT, CFG.Rejoin, "AUTO REJOIN: ON", "AUTO REJOIN: OFF")
setToggle(U.startT, CFG.AutoStart, "START FARMING ON LOAD: ON", "START FARMING ON LOAD: OFF")
U.secB.Text = tostring(CFG.Every)
pcall(PF.applyAll) -- a config loaded at launch brings its smoother-running switches with it
pcall(refresh)
task.spawn(function()
    local p = findSelfPath()
    U.rejMsg.Text = "after a rejoin it restarts with the newest version from GitHub" .. (p and ("\n(backup: " .. p .. ")") or "")
    local cur = readIf(F.exec)
    if cur and not cur:find("SAB autoloader v2", 1, true) then -- an older loader that looked for a saved file only
        writeTo(F.exec, F.stub)
        note("autoexec updated: it now loads the newest version from GitHub")
    end
    U.autoMsg.Text = (readIf(F.exec) ~= nil) and "autoexec loader is installed (loads from GitHub)" or "not installed yet"
    pcall(watchDisconnect)
end)
task.spawn(function()
    while S.alive do
        local ok, e = pcall(refresh)
        if not ok then note("UI ERR " .. tostring(e)) end
        task.wait((S.hidden or minimized) and 1.5 or 0.4) -- a hidden window needs far fewer redraws
    end
end)
task.spawn(function()
    local ok, e = pcall(hookRemotes)
    if not ok then note("HOOK ERR " .. tostring(e)) end
end)
task.spawn(function()
    pcall(loadLearn)
    if CRATE.loadSeq and not CRATE.learned then
        local seq = {}
        for i = 1, 20 do if CRATE.loadSeq[i] then seq[#seq + 1] = CRATE.loadSeq[i] end end
        if #seq > 0 then
            CRATE.learned = { seq = seq, mode = CRATE.loadMode }
            note("remembered how to open crates directly")
        end
    end
    if catReady() then note(("catalog: %d butters in %d rarities"):format(CAT.n, #CAT.rarOrder)) end
    local ok, cf = pcall(loadPad)
    if ok and cf and S.alive and not S.manualPad then S.manualPad = cf end
end)
task.spawn(function() -- pets: adopt from the pen and keep wishes going
    while S.alive do
        local ok, e = pcall(PX.buyTick)
        if not ok then note("PET ERR " .. tostring(e)) task.wait(5) end
        ok, e = pcall(PX.wishTick)
        if not ok then note("WISH ERR " .. tostring(e)) task.wait(5) end
        task.wait(0.75)
    end
end)
task.spawn(function() -- smoother running: fps, memory watchdog, labels added since
    local frames, t0 = 0, now()
    track(game:GetService("RunService").Heartbeat:Connect(function() frames = frames + 1 end))
    track(game:GetService("RunService").Heartbeat:Connect(function() if PF.hold then pcall(PF.pinTick) end end))
    PF.noteAt = now()
    while S.alive do
        task.wait(1)
        local t = now()
        PF.fps, frames, t0 = frames / math.max(t - t0, 0.001), 0, t
        local ok, e = pcall(PF.tick)
        if not ok then note("PERF ERR " .. tostring(e)) task.wait(5) end
    end
end)
task.spawn(function() -- fusing and team building
    task.wait(10)
    while S.alive do
        local ok, e = pcall(FU.tick)
        if not ok then note("FUSE ERR " .. tostring(e)) task.wait(10) end
        task.wait(4)
    end
end)
task.spawn(function() -- pet teams
    while S.alive do
        local ok, e = pcall(TM.tick)
        if not ok then note("TEAM ERR " .. tostring(e)) task.wait(3) end
        task.wait(0.25)
    end
end)
task.spawn(function() -- guildmates' "Need help with a wax" calls
    local r = RS:WaitForChild("Remotes", 30)
    local e = r and r:WaitForChild("ClanEvent", 30)
    if e and S.alive then
        track(e.OnClientEvent:Connect(function(k, a) if k == "call" then pcall(HX.onCall, a) end end))
    end
    local ask = r and r:FindFirstChild("RollConfirmAsk")
    if ask and S.alive then track(ask.OnClientEvent:Connect(function(n) QX.asked = n or "butter" end)) end
end)
task.spawn(function() -- NO ANIMATIONS: catch the loops the game starts again after a respawn
    while S.alive do
        task.wait(20)
        if CFG.Calm then pcall(PF.calmScan) end
    end
end)
task.spawn(function() -- index / best butter / best crate, and the admin show
    local r = RS:WaitForChild("Remotes", 30)
    if not (r and S.alive) then return end
    local function on(n, fn)
        local e = r:FindFirstChild(n)
        if e and e:IsA("RemoteEvent") then track(e.OnClientEvent:Connect(function(...) pcall(fn, ...) end)) end
    end
    on("NewSquishyDiscovered", function(n, glaze)
        if type(n) ~= "string" then return end
        IX.disc = IX.disc or {}
        IX.disc[key(n)] = true
        note(("INDEX: %s%s is in your Index now"):format(prettyOf(key(n)), glaze and (" (" .. tostring(glaze) .. ")") or ""))
    end)
    on("IndexRefresh", IX.loadDisc)
    on("IndexRowComplete", function(row) note("INDEX: the whole " .. tostring(row) .. " row is complete") end)
    on("AdminShow", IX.admin)
    local sync = r:FindFirstChild("AdminShowSync") -- shower butters already out when we joined
    if sync then
        local ok, list = pcall(function() return sync:InvokeServer() end)
        if ok and type(list) == "table" then for _, d in pairs(list) do pcall(SH.add, d) end end
    end
    while S.alive do
        local ok, e = pcall(IX.tick)
        if not ok then IX.msg = "index error: " .. tostring(e) task.wait(10) end
        task.wait(2)
    end
end)
task.spawn(function() -- quests: claims and what they ask for
    task.wait(8)
    while S.alive do
        local ok, e = pcall(QX.tick)
        if not ok then note("QUEST ERR " .. tostring(e)) task.wait(30) end
        task.wait(3)
    end
end)
task.spawn(function() -- keep what the crates taught us
    while S.alive do
        task.wait(20)
        pcall(saveLearn)
    end
end)
pcall(AR.watchCache)
if type(hookmetamethod) == "function" and type(getnamecallmethod) == "function" then
    pcall(function()
        local wrap = (type(newcclosure) == "function") and newcclosure or function(f) return f end
        local old
        -- Rule for this hook: before the game's call is passed on, nothing in here may call a method
        -- (no :GetAttribute, :FindFirstChild, ...). A method call replaces the call in progress, and the
        -- game's own message would be lost. Reading .Name and plain tables is fine.
        local setNC = (type(setnamecallmethod) == "function") and setnamecallmethod or nil
        old = hookmetamethod(game, "__namecall", wrap(function(self, ...)
            local m = getnamecallmethod()
            if S.alive and (m == "InvokeServer" or m == "FireServer") then
                local ok, nm = pcall(function() return self.Name end)
                if ok and nm == "CrateAction" and not CRATE.replaying then pcall(CRATE.saw, m, ...)
                elseif ok and nm == "AutoRollAction" and not AR.replaying then pcall(AR.saw, m, ...) end
                if setNC then setNC(m) end -- belt and braces: make sure the game's call is the one that goes
            end
            return old(self, ...)
        end))
        CRATE.oldNC = old
    end)
end
if VU then
    track(plr.Idled:Connect(function() pcall(function() VU:CaptureController() VU:ClickButton2(Vector2.new()) end) end))
end
task.spawn(function() -- the game's Auto Roll: back on after a join, and kept on
    for _ = 1, 90 do -- wait for the game to hand us our Auto Roll state
        if not S.alive then return end
        if plr:GetAttribute("AutoRollOn") ~= nil and char() and (S.plot or findPlot()) then break end
        task.wait(1)
    end
    task.wait(2)
    if CFG.AutoRoll then AR.apply("joined") end
    while S.alive do
        task.wait(30)
        -- the game switched it off on its own: switch it back, but never while something is on the
        -- pad, in your hands or in a crate, so nothing you want is rolled away
        local pad = padInfo()
        -- with AUTO INDEX / BEST on, what is on the pad can stop being wanted (its index wax just
        -- started): that one may be rolled away
        if pad and IX.on() and not isTarget(pad.name) then pad = nil end
        if S.alive and CFG.AutoRoll and S.running and not AR.isOn() and not pad and not carriedName()
            and not CRATE.waiting and not CRATE.on and not S.busy then
            AR.apply("it was off")
        end
    end
end)
task.spawn(function() -- start by myself, once the character and the plot exist
    if not CFG.AutoStart then return end
    S.reason, S.level = "waiting for the game to load, then starting", "wait"
    for _ = 1, 120 do
        if not S.alive then return end
        if S.running then return end -- you got there first
        S.plot = S.plot or findPlot()
        if char() and S.plot and IX.any() then
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
