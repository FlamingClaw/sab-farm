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
local T = { alive = true, me = LP.Name, role = LP.Name == MAIN and "main" or "alt", gifts = 0, log = {}, version = 12 }
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
-- Limited butters (the pass's Pecan Pie, the paid Turkey): never sold anywhere, never given to an
-- alt; an alt hands them straight to the main
local LIMITED = {}
for n, v in pairs(SI) do if type(v) == "table" and v.rarity == "Limited" then LIMITED[key(n)] = true end end
local function isLimited(n) return n ~= nil and LIMITED[key(n)] == true end
T.LIMITED = LIMITED

---------------------------------------------------------------- my status
local function myPlot() local SAB = G.SAB return SAB and SAB.S and SAB.S.plot end
local function freeStations()
  local p = myPlot()
  local ws = p and p:FindFirstChild("WaxStations")
  -- the plot has a slot for every station the game sells; only WaxStations of them are owned
  local busy = 0
  for _, st in ipairs(ws and ws:GetChildren() or {}) do if st:GetAttribute("HasSquishy") then busy = busy + 1 end end
  return math.max(0, (tonumber(LP:GetAttribute("WaxStations")) or 0) - busy)
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
    "mode=" .. tostring(T.mode or ""), "ready=" .. tostring(LP:GetAttribute("ThanksgivingReady") or 0),
    -- (these two are defined further down: reached through T)
    "cash=" .. tostring(T.money()), "upmax=" .. tostring(T.up.max == true),
    "want=" .. (T.role == "alt" and table.concat(T.wantIdx(), ",") or ""),
    "guild=" .. (T.clan.n > 0 and (T.clan.done .. "/" .. T.clan.n) or "none"),
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


---------------------------------------------------------------- upgrades (every account; cash only)
-- next wax station (6 per floor; a new floor first when the next station is on it), stack packs once
-- their floor is open, the daily reward, offline earnings. All with in-game cash: nothing here can
-- reach Robux (and CHURN drops any Robux prompt anyway).
local WaxPrices = require(RS.Modules.WaxPrices)
local PlotInfo = require(RS.Modules.PlotInfo)
local okSS, StackSlots = pcall(require, RS.Modules.StackSlots)
T.up = { at = 0, bought = 0, dailyAt = 0, offline = false, msg = "" }
local function money()
  local v = LP:FindFirstChild("MoneyValue")
  return v and tonumber(v.Value) or 0
end
local function inv(remote, ...)
  local r = RS.Remotes:FindFirstChild(remote)
  if not r then return false, "no " .. remote end
  local res = table.pack(pcall(r.InvokeServer, r, ...))
  if not res[1] then return false, tostring(res[2]) end
  return res[2] ~= false, tostring(res[3] or res[2] or "")
end
local function upgrades()
  local U = T.up
  if os.clock() < U.at then return end
  U.at = os.clock() + 12
  local plot = myPlot()
  if not plot then return end
  local cash = money()
  local stations = tonumber(LP:GetAttribute("WaxStations")) or 0
  local floors = tonumber(plot:GetAttribute("FloorsUnlocked")) or 1
  local per = PlotInfo.stationsPerFloor or 6
  -- 1. the next station (or the floor it stands on)
  local n = stations + 1
  if n <= (PlotInfo.totalWaxStationCount or 24) then
    local needFloor = math.ceil(n / per)
    if needFloor > floors then
      local f = PlotInfo.floors[floors + 1]
      if f and cash >= f.price then
        local ok, m = inv("BuyFloor")
        note(("TEAM UP: floor %d for $%s - %s"):format(floors + 1, tostring(f.price), ok and "bought" or ("no: " .. m)))
        if ok then U.bought = U.bought + 1 end
        return
      end
      U.msg = ("saving for floor %d ($%.3g)"):format(floors + 1, f and f.price or 0)
    else
      local price = WaxPrices[n]
      if price and cash >= price then
        local ok, m = inv("BuyWax", n)
        note(("TEAM UP: wax station %d for $%.3g - %s"):format(n, price, ok and "bought" or ("no: " .. m)))
        if ok then U.bought = U.bought + 1 end
        U.at = os.clock() + 2 -- quickly on to the next one
        return
      end
      U.msg = ("saving for station %d ($%.3g)"):format(n, price or 0)
    end
  else
    U.msg = "all 24 stations"
  end
  do
    local pk = okSS and StackSlots.getNextPack and StackSlots.getNextPack(tonumber(LP:GetAttribute("StackPacks")) or 0)
    U.max = n > (PlotInfo.totalWaxStationCount or 24) and floors >= 4 and pk == nil
  end
  -- 2. stack packs (bigger stack) once their floor is open
  if okSS and StackSlots.getNextPack then
    local pk = StackSlots.getNextPack(tonumber(LP:GetAttribute("StackPacks")) or 0)
    if pk and floors >= (pk.floor or 99) and cash >= pk.price then
      local ok, m = inv("BuyStackSlots")
      note(("TEAM UP: stack pack for $%.3g - %s"):format(pk.price, ok and "bought" or ("no: " .. m)))
      if ok then U.bought = U.bought + 1 end
      return
    end
  end
end
local function freebies()
  local U = T.up
  if os.clock() >= U.dailyAt then
    U.dailyAt = os.clock() + 900
    local ok, m = inv("ClaimDaily")
    if ok and m ~= "" and not m:lower():find("already") and not m:lower():find("wait") then note("TEAM: daily reward - " .. m) end
  end
  if not U.offline then
    U.offline = true
    local r = RS.Remotes:FindFirstChild("ClaimOfflineEarnings")
    if r then pcall(function() r:FireServer() end) end
  end
end
T.upgrades, T.freebies, T.money = upgrades, freebies, money

---------------------------------------------------------------- rank rewards (every account)
T.claimed = 0
local function claimRanks()
  local n = tonumber(LP:GetAttribute("ThanksgivingReady")) or 0
  if n <= 0 then return end
  local r = RS.Remotes:FindFirstChild("ThanksgivingAction")
  local ok, res = pcall(function() return r:InvokeServer("claimAll") end)
  if ok and type(res) == "table" and res.ok then
    T.claimed = T.claimed + n
    note("TEAM: claimed " .. n .. " pass rank reward(s): " .. tostring(res.text or ""))
    T.refreshPass()
  else
    note("TEAM: rank reward claim failed: " .. tostring(type(res) == "table" and (res.reason or res.text) or res))
  end
end

---------------------------------------------------------------- guild (clan) quests
T.clan = { at = -1e9, need = false, open = 0, done = 0, n = 0 }
local function clanState()
  local Cn = T.clan
  if os.clock() - Cn.at < 60 then return Cn end
  Cn.at = os.clock()
  local r = RS.Remotes:FindFirstChild("ClanRequest")
  local ok, v = pcall(function() return r:InvokeServer("state") end)
  local t = ok and type(v) == "table" and type(v.data) == "table" and v.data.tasks
  Cn.need, Cn.open, Cn.done, Cn.n = false, 0, 0, 0
  if type(t) == "table" then
    for _, x in ipairs(t.list or {}) do
      Cn.n = Cn.n + 1
      if x.done then Cn.done = Cn.done + 1 else
        Cn.open = Cn.open + 1
        if x.kind == "stack" or x.kind == "rare" then Cn.need = true end
      end
    end
  end
  return Cn
end
T.clanState = clanState

---------------------------------------------------------------- index (what this account has discovered)
T.idx = { at = -1e9 }
local function indexNow()
  local SAB = G.SAB
  local IX = SAB and SAB.IX
  if not IX then return {}, {} end
  if os.clock() - T.idx.at > 60 or not IX.disc then T.idx.at = os.clock() pcall(IX.fetch) end
  pcall(IX.scanWax)
  return IX.disc or {}, IX.waxing or {}
end
-- the good butters this account still needs for its index and is not already waxing
local function wantIdx()
  local disc, waxing = indexNow()
  local w = {}
  for k in pairs(GOOD) do if not disc[k] and not waxing[k] then w[#w + 1] = k end end
  table.sort(w)
  return w
end
T.wantIdx = wantIdx

---------------------------------------------------------------- alt rules
local function altTick()
  local SAB = G.SAB
  local C = SAB.CFG
  local P = passState()
  local held = LP:GetAttribute("SquishyEquipped")
  local giftWaiting = isGood(held)
  -- targets: always keep good butters; everything else only while a quest needs waxing/buying
  -- gifts from the main: Sushi is always waxed; another good butter only while this account still
  -- needs it for its index (and has a station for it) - otherwise it is sold for the cash
  local Tg = C.Targets
  local free = freeStations()
  local need = {}
  for _, k in ipairs(wantIdx()) do need[k] = true end
  for k in pairs(Tg) do Tg[k] = nil end
  if P.need then for k in pairs(ALL) do Tg[k] = true end end
  for k in pairs(GOOD) do
    if k == "sushi" or (need[k] and free > 0) then Tg[k] = true elseif not P.need then Tg[k] = nil end
  end
  for k in pairs(LIMITED) do Tg[k] = true end
  C.NoWax = false
  -- the campfire seat holds every walking job: up while quests are open or a gift waits for a station
  -- anything in hand (a gift to wax or to sell) needs the account on its feet
  local wantUp = (P.live and P.open > 0) or (held ~= nil and held ~= "")
  if wantUp then
    if C.Campfire then C.Campfire = false end
    if seated() then standUp() end
  elseif not C.Campfire then
    C.Campfire = true
    SAB.CF.nextAt = 0
  end
  T.mode = (P.need and "keep+wax (quest)" or "sell (pulls go on)") .. (giftWaiting and (C.Targets[key(held)] and ", gift to wax" or ", gift to sell") or "")
    .. (wantUp and ", campfire waits" or ", campfire on")
end

---------------------------------------------------------------- main: the Sushi feeder
T.feed = { on = true, target = nil, since = 0, standing = false, wait = {} }
local function nearTo(plr)
  local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  local th = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
  if not (hrp and th) then return nil end
  hrp.CFrame = th.CFrame * CFrame.new(0, 0, -3)
  return th
end
-- who should get this butter: Sushi -> the alt with most free stations (it waxes it); another good
-- butter -> an alt that still needs it for its index and has a station, else the poorest alt that is
-- still buying upgrades (it sells it); nil = nobody right now. k = nil asks "would anybody take
-- something" (the main then stands up to roll).
local function pickAlt(k)
  k = k and key(k) or nil
  local ready = {}
  for _, s in ipairs(T.peers()) do
    if s.fresh and s.player and s.role == "alt" and (s.stations or 0) >= 3
      and (s.holding == nil or s.holding == "") and os.clock() >= (T.feed.wait[s.name] or 0) then
      ready[#ready + 1] = s
    end
  end
  local function most(f) local b for _, s in ipairs(ready) do if f(s) and (not b or (s.free or 0) > (b.free or 0)) then b = s end end return b end
  local function poorest(f) local b for _, s in ipairs(ready) do if f(s) and (not b or (tonumber(s.cash) or 0) < (tonumber(b.cash) or 0)) then b = s end end return b end
  if k == "sushi" or k == nil then
    local a = most(function(s) return (s.free or 0) > 0 end)
    if a or k == "sushi" then return a end
  end
  if k then
    local a = most(function(s) return (s.free or 0) > 0 and ("," .. tostring(s.want) .. ","):find("," .. k .. ",", 1, true) ~= nil end)
    if a then return a end
  end
  return poorest(function(s) return tostring(s.upmax) ~= "true" end)
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
  -- the game refuses a second gift to the same player for a while: try the others meanwhile
  T.feed.wait[s.name] = os.clock() + (ok and 8 or 30)
  if not ok then T.feed.globalWait = os.clock() + 12 end -- the game's gift cooldown: hold it a moment
  if ok then
    T.gifts = T.gifts + 1
    note(("TEAM: gave %s to %s (%d given)"):format(tostring(held), s.name, T.gifts))
  else
    note(("TEAM: could not give %s to %s"):format(tostring(held), s.name))
  end
  SAB.S.running = true
  return ok
end
local function padName()
  local p = myPlot()
  local m = p and p:FindFirstChild("RolledSquishy")
  local c = m and m:GetChildren()[1]
  return c and c.Name
end
local function buyPrompt()
  local p = myPlot()
  local h = p and p:FindFirstChild("RolledSquishyPlaceHolder")
  local a = h and h:FindFirstChild("BuyPromptAttachment")
  local b = (a and a:FindFirstChild("BuyPrompt")) or (h and h:FindFirstChild("BuyPrompt", true))
  return b and b:IsA("ProximityPrompt") and b or nil
end
local function mainTick()
  local SAB = G.SAB
  local C = SAB.CFG
  -- keep (never sell) every good butter: they go to the alts; Limited ones stay with the main
  for k in pairs(GOOD) do C.Targets[k] = true end
  for k in pairs(LIMITED) do C.Targets[k] = true end
  local held = LP:GetAttribute("SquishyEquipped")
  -- an alt is bringing a Limited (Pecan Pie): keep the hands free for it, no feeding meanwhile
  for _, s in ipairs(T.peers()) do
    if s.fresh and isLimited(s.holding) then
      T.mode = s.name .. " is bringing " .. tostring(s.holding) .. " - hands kept free"
      if held and isGood(held) then local a = pickAlt() if a then give(a) end end
      return
    end
  end
  -- the main waxes nothing of its own (it all goes to the alts) - except while a battle pass or guild
  -- quest asks for waxing, and a Limited (Pecan Pie) for its own stack
  local P, Cn = T.pass, clanState()
  local questWax = (P.live and P.need) or Cn.need
  C.NoWax = not (isLimited(held) or questWax)
  -- its Auto Roll stops on Sushi only while some alt has a free station for one
  local sushiRoom = T.feed.on and pickAlt("sushi") ~= nil
  local changed = false
  for k in pairs(GOOD) do
    local want = (k ~= "sushi") or sushiRoom
    if (C.Targets[k] == true) ~= want then C.Targets[k] = want or nil changed = true end
  end
  if changed and os.clock() - (T.feed.syncAt or 0) > 20 then T.feed.syncAt = os.clock() pcall(SAB.IX.compute) pcall(SAB.IX.sync, true) end
  if isGood(held) and os.clock() >= (T.feed.globalWait or 0) then
    local to = T.feed.on and pickAlt(held) or nil
    if to then give(to) return end
  end
  local alt = T.feed.on and pickAlt() or nil
  -- a good butter on the pad while every station of mine is busy: CHURN will not buy it (nowhere to
  -- wax), so the feeder buys it and carries it to the alt
  local pn = padName()
  if not held and isGood(pn) then alt = T.feed.on and pickAlt(pn) or nil end
  if alt and not held and isGood(pn) then
    local b = buyPrompt()
    -- never without the money: a short buy makes the server offer the butter for Robux
    local price = SI[pn] and tonumber(SI[pn].price)
    if price and money() < price then b = nil T.mode = "saving for the " .. tostring(pn) end
    if b and b.Enabled then
      SAB.S.running = false
      standUp()
      task.wait(0.3)
      local part = b.Parent:IsA("Attachment") and b.Parent.Parent or b.Parent
      local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
      if hrp and part:IsA("BasePart") then hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 2, 3)) end
      task.wait(0.6)
      pcall(fireproximityprompt, b)
      local t0 = os.clock()
      repeat task.wait(0.2) until LP:GetAttribute("SquishyEquipped") or os.clock() - t0 > 5
      SAB.S.running = true
      held = LP:GetAttribute("SquishyEquipped")
      if held then note("TEAM: bought " .. tostring(held) .. " for " .. alt.name) give(alt) return end
      note("TEAM: could not buy the " .. tostring(pn) .. " on the pad")
    end
  end
  if alt and not held then
    -- an alt can use one: stand up so the crate opens and Auto Roll rolls; the next good one is bought
    if not T.feed.standing then
      T.feed.standing, T.feed.since = true, os.clock()
      note(("TEAM: rolling for %s (%d free station(s), $%.3g)"):format(alt.name, alt.free or 0, tonumber(alt.cash) or 0))
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

---------------------------------------------------------------- alt: a Limited in hand goes to the main
T.toMain = 0
local function limitedToMain()
  local held = LP:GetAttribute("SquishyEquipped")
  if T.role ~= "alt" or not isLimited(held) then return end
  local SAB = G.SAB
  SAB.S.running = false
  local main = Players:FindFirstChild(MAIN)
  if not main then note("TEAM: holding " .. tostring(held) .. " for the main, but the main is not here - holding it") return end
  for _ = 1, 8 do
    if not isLimited(LP:GetAttribute("SquishyEquipped")) then break end
    standUp()
    local th = nearTo(main)
    task.wait(0.8)
    local gp = th and th:FindFirstChild("GivePrompt")
    if gp and gp.Enabled then pcall(fireproximityprompt, gp) else pcall(function() RS.Remotes.GiveSquishy:FireServer(main) end) end
    local t0 = os.clock()
    repeat task.wait(0.2) until not isLimited(LP:GetAttribute("SquishyEquipped")) or os.clock() - t0 > 4
    if not isLimited(LP:GetAttribute("SquishyEquipped")) then
      T.toMain = T.toMain + 1
      note("TEAM: gave " .. tostring(held) .. " to the main (" .. MAIN .. ")")
      break
    end
    task.wait(10)
  end
  if isLimited(LP:GetAttribute("SquishyEquipped")) then
    note("TEAM: the main would not take " .. tostring(held) .. " - holding it (CHURN paused so it is not waxed here)")
    return
  end
  SAB.S.running = true
end
T.conns = {}
T.conns[#T.conns + 1] = LP:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
  if T.alive and isLimited(LP:GetAttribute("SquishyEquipped")) and T.role == "alt" then
    local SAB = G.SAB
    if SAB then SAB.S.running = false end -- at once, before CHURN carries it to a station
    task.spawn(limitedToMain)
  end
end)
local stop0 = T.stop
function T.stop() stop0() for _, c in ipairs(T.conns) do pcall(function() c:Disconnect() end) end end


---------------------------------------------------------------- the ALTS tab in CHURN
local PASS_END = 1796083200 -- Thanksgiving pass: Dec 1 00:00 UTC (Nov 30, 5 PM in Calgary)
local RANK20 = 4300
local function paceText(points, open)
  points = tonumber(points)
  if not points then return "?" end
  if points >= RANK20 then return "rank 20 reached" end
  local days = math.max(0, PASS_END - workspace:GetServerTimeNow()) / 86400
  local need = RANK20 - points
  -- one set of quests per (UTC) day left; today's only counts while some of it is still open
  local quests = math.ceil(days) - ((tonumber(open) or 0) == 0 and 1 or 0)
  if quests <= 0 then return need .. " short, no quest days left" end
  return ("%d to go, %d/day for %d day(s)"):format(need, math.ceil(need / quests), quests)
end
T.ui = {}
local function buildUI()
  local SAB = G.SAB
  local U = SAB and SAB.U
  if not (U and U.alt and U.mk and U.card) then return false end
  if T.ui.built and T.ui.root and T.ui.root.Parent then return true end
  if U.altNote then U.altNote.Text = "" U.altNote.Parent.Parent.Visible = false end
  local C = U.C
  local me = U.card(U.alt, "This account", T.role == "main" and "MAIN" or "ALT")
  T.ui.root = me
  T.ui.mode = U.line(me, C.accent)
  T.ui.stats = U.line(me, C.good)
  T.ui.pass = U.line(me, C.info)
  if T.role == "main" then
    local r = U.row(me, 26)
    T.ui.feedB = U.button(r, "", C.panel2, 10, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0))
    U.click(T.ui.feedB, function() T.feed.on = not T.feed.on note("TEAM: Sushi feeder " .. (T.feed.on and "on" or "off")) end)
  end
  local all = U.card(U.alt, "Accounts in this server", "from SAB/team")
  T.ui.rows = {}
  for i = 1, 8 do
    local l, d = U.line(all, C.dim)
    l.Parent.Visible = false
    T.ui.rows[i] = { l = l, d = d }
  end
  local ps = U.card(U.alt, "Thanksgiving pass", "rank 20 = Pecan Pie Butter")
  T.ui.passRows = {}
  for i = 1, 8 do
    local l = U.line(ps, C.accent2)
    l.Parent.Visible = false
    T.ui.passRows[i] = l
  end
  local lg = U.card(U.alt, "Team log")
  T.ui.log = U.grow(lg, 9, C.dim)
  T.ui.log.Visible = true
  T.ui.built = true
  U.altShown = function() pcall(T.paint) end
  return true
end
function T.paint()
  if not buildUI() then return end
  local SAB = G.SAB
  local U, C = SAB.U, SAB.U.C
  local P = T.pass
  U.put(T.ui.mode, "doing: " .. tostring(T.mode or "starting"))
  U.put(T.ui.stats, ("gifts given %d | Limited to main %d | rank rewards %d | upgrades %d (%s) | boost +%s%%"):format(
    T.gifts, T.toMain or 0, T.claimed or 0, T.up.bought, T.up.msg, tostring(LP:GetAttribute("FriendBoost") or 0)))
  U.put(T.ui.pass, ("pass: rank %s, %s points | %s"):format(tostring(P.rank or "?"), tostring(P.points or "?"), paceText(P.points, P.open)))
  if T.ui.feedB then
    U.put(T.ui.feedB, T.feed.on and "SUSHI FEEDER: ON (gives Dotonbori/Picnic butters to alts with room)" or "SUSHI FEEDER: OFF")
    T.ui.feedB.BackgroundColor3 = T.feed.on and C.good or C.panel2
    T.ui.feedB.TextColor3 = T.feed.on and C.ink or C.dim
  end
  local list = { { name = T.me, role = T.role, free = nil, stations = LP:GetAttribute("WaxStations"), holding = LP:GetAttribute("SquishyEquipped"),
    seated = tostring(seated()), rank = P.rank, points = P.points, open = P.open, fresh = true, mode = T.mode } }
  for _, s in ipairs(T.peers()) do list[#list + 1] = s end
  table.sort(list, function(a, b) if a.role ~= b.role then return a.role == "main" end return a.name < b.name end)
  for i, r in ipairs(T.ui.rows) do
    local s = list[i]
    r.l.Parent.Visible = s ~= nil
    if s then
      local hold = (s.holding and s.holding ~= "") and (" | holding " .. tostring(s.holding):gsub("Butter$", "")) or ""
      U.put(r.l, ("%s%s  %s%s%s"):format(s.name, s.role == "main" and " (main)" or "",
        s.fresh and "" or "OFFLINE ", s.free and ("free " .. s.free .. "/" .. tostring(s.stations)) or ("stations " .. tostring(s.stations)),
        hold .. (s.seated == "true" and " | at the campfire" or "")))
      r.d.BackgroundColor3 = not s.fresh and C.bad or (s.role == "main" and C.accent or C.good)
    end
  end
  for i, l in ipairs(T.ui.passRows) do
    local s = list[i]
    l.Parent.Visible = s ~= nil
    if s then U.put(l, ("%s: rank %s, %s pts - %s"):format(s.name, tostring(s.rank or "?"), tostring(s.points or "?"), paceText(s.points, s.open))) end
  end
  local n = #T.log
  U.put(T.ui.log, table.concat(T.log, "\n", math.max(1, n - 9), n))
end

---------------------------------------------------------------- loop
task.spawn(function()
  note("TEAM v" .. T.version .. ": " .. T.me .. " as " .. T.role)
  while T.alive and G.SAB_TEAM == T do
    local SAB = G.SAB
    if SAB and SAB.S and SAB.S.alive then
      pcall(passState)
      pcall(clanState)
      pcall(claimRanks)
      local okU, errU = pcall(upgrades)
      if not okU then note("TEAM UP error: " .. tostring(errU)) end
      pcall(freebies)
      local ok, err = pcall(T.role == "main" and mainTick or altTick)
      if not ok then note("TEAM error: " .. tostring(err)) end
      local okW, errW = pcall(writeMe)
      if not okW and T.lastWriteErr ~= tostring(errW) then T.lastWriteErr = tostring(errW) note("TEAM status write error: " .. T.lastWriteErr) end
      local U = SAB.U
      if U and U.alt and (U.alt.Visible or not T.ui.built) then pcall(T.paint) end
    end
    task.wait(T.role == "main" and 4 or 6)
  end
end)
return T
