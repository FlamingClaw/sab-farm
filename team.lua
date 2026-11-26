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
local T = { alive = true, me = LP.Name, role = LP.Name == MAIN and "main" or "alt", gifts = 0, log = {}, version = 19 }
G.SAB_TEAM = T
function T.stop() T.alive = false end
T.conns = {}
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
    "plan=" .. table.concat(T.planList and T.planList() or {}, ","),
    "goal=" .. (T.goalText and T.goalText() or ""),
    "pets=" .. tostring(#((G.SAB and G.SAB.PX.data() or {}).pets or {})),
    "petMax=" .. tostring((G.SAB and G.SAB.PX.data() or {}).maxOwned or 60),
    "petScore=" .. tostring(T.petScore and T.petScore() or 0),
    "trading=" .. tostring(T.tr and T.tr.active == true),
  }
  pcall(writefile, DIR .. "/" .. T.me .. ".txt", table.concat(L, "\n"))
end
function T.peers()
  local out = {}
  local ok, fs = pcall(listfiles, DIR)
  for _, f in ipairs(ok and fs or {}) do
    local name = tostring(f):match("([^/\\]+)%.txt$")
    -- (the folder also holds trade orders and the owed list: only account names count)
    if name and name ~= T.me and not name:find("^trade_") and name ~= "owed" then
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
-- The pass's rank 20 reward (Pecan Pie, a Limited) goes straight into the claiming account's STACK
-- (seen on the main Nov 26) - a stacked butter cannot be given or traded. The user's rule is that
-- Limiteds belong to the main, so an alt leaves rank 20 unclaimed (until Dec 1, 01:00 UTC) unless
-- T.claimAltPecan is switched on; every other rank reward is claimed one by one.
T.claimAltPecan = false
local function claimRanks()
  local n = tonumber(LP:GetAttribute("ThanksgivingReady")) or 0
  if n <= 0 then return end
  if T.role == "alt" and not T.claimAltPecan then
    local r = RS.Remotes:FindFirstChild("ThanksgivingAction")
    local ok, st = pcall(function() return r:InvokeServer("state") end)
    if not (ok and type(st) == "table") then return end
    local claimed = st.claimed and st.claimed.free or {}
    local got = 0
    for rank = 1, math.min(tonumber(st.rank) or 0, 30) do
      if rank ~= 20 and not claimed[rank] and not claimed[tostring(rank)] then
        local okc, res = pcall(function() return r:InvokeServer("claim", rank, "free") end)
        if okc and type(res) == "table" and res.ok then got = got + 1 end
      end
    end
    if got > 0 then T.claimed = T.claimed + got note("TEAM: claimed " .. got .. " pass rank reward(s) (rank 20 left for you to decide)") T.refreshPass() end
    return
  end
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
    -- Sushi always; another good butter for the index, or - once every upgrade is bought - for the
    -- stack (a full stack drops its weakest earner, so it is an upgrade); else it is sold for cash
    if k == "sushi" or ((need[k] or T.up.max) and free > 0) then Tg[k] = true elseif not P.need then Tg[k] = nil end
  end
  -- once every upgrade is bought: UPGRADES - anything earning more than the weakest in the stack is
  -- kept and waxed (the alt rolls its own lever below)
  C.Best = T.up.max and 4 or 0
  for k in pairs(LIMITED) do Tg[k] = true end
  C.NoWax = false
  -- holding something with no station free (a gift to wax, an index butter): after 60 s it is sold
  -- rather than blocking everything else (never a Sushi or a Limited - those wait for a station)
  local hk = held and held ~= "" and key(held) or nil
  if hk and free == 0 and hk ~= "sushi" and not isLimited(held) then
    T.stuckSince = T.stuckSince or os.clock()
    if os.clock() - T.stuckSince > 60 then
      Tg[hk] = nil
      C.AutoIndex = false -- (auto index would keep it as a missing butter)
      if not T.stuckNoted then T.stuckNoted = true note("TEAM: no free station for " .. tostring(held) .. " - selling it") end
    end
  else
    T.stuckSince, T.stuckNoted = nil, nil
    C.AutoIndex = true
  end
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
  local p = poorest(function(s) return tostring(s.upmax) ~= "true" end)
  if p then return p end
  -- everybody has bought everything: the one with most free stations waxes it (a stack upgrade)
  return most(function(s) return (s.free or 0) > 0 end)
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
    local want = ((k ~= "sushi") or sushiRoom) and not (T.feed.soldNote and held and key(held) == k)
    if (C.Targets[k] == true) ~= want then C.Targets[k] = want or nil changed = true end
  end
  if changed and os.clock() - (T.feed.syncAt or 0) > 20 then T.feed.syncAt = os.clock() pcall(SAB.IX.compute) pcall(SAB.IX.sync, true) end
  if isGood(held) and os.clock() >= (T.feed.globalWait or 0) then
    local to = T.feed.on and pickAlt(held) or nil
    if to then give(to) T.feed.heldSince = nil return end
  end
  if isGood(held) then
    T.feed.heldSince = T.feed.heldSince or os.clock()
    if os.clock() - T.feed.heldSince > 90 then
      -- nobody can take it: let CHURN sell it rather than block the crate and Auto Roll
      C.Targets[key(held)] = nil
      if not T.feed.soldNote then T.feed.soldNote = true note("TEAM: nobody can take " .. tostring(held) .. " - selling it") end
      T.mode = "selling " .. tostring(held) .. " (no alt can take it)"
      return
    end
  else
    T.feed.heldSince, T.feed.soldNote = nil, nil
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


---------------------------------------------------------------- pets: the factory on the main
-- The user's plan (Nov 26):
--  * every account adopts (and wishes) the target pets = every account's plan pets together;
--  * the alts' spare copies go to the main, which fuses each 3 into a Big (Fuse Pass);
--  * a Big stays on the main only while its own plan wants one; otherwise it goes to the alt with
--    the fewest of that pet (then the one with the weakest pets);
--  * an alt with 3 spare Bigs of a pet sends them; the main fuses the Huge and sends it back to it
--    (owed, remembered in SAB/team/owed.txt);
--  * "spare" = not in any saved team, not worn, not named: a team is never weakened by a trade;
--    a saved team left pointing at a pet that is gone is re-saved by CHURN's AUTO BUILD.
-- The main is the only one that starts trades: it reads every account's pets (each Player's
-- PetsData is visible to every client), writes the order to SAB/team/trade_<alt>.txt, invites,
-- and both sides add exactly what the order says. An alt adds only spare pets, only for the main.
T.pet = { tickAt = -1e9, msg = "", sent = 0, got = 0, trades = 0, fused = 0, nextAt = 0, auto = true }
T.tr = { active = false, state = nil, closed = nil }
local HS = game:GetService("HttpService")
local function SABx() return G.SAB end
local function petD() local S0 = SABx() return S0 and S0.PX and S0.PX.data() end
local function trRemote(n) return RS:FindFirstChild(n, true) end
local function trReq(...)
  local r = trRemote("TradeRequest")
  if not r then return nil end
  local ok, v = pcall(r.InvokeServer, r, ...)
  return ok and v or nil
end
local function decodePets(pl) -- any player's pets (the attribute replicates to every client)
  local raw = pl and pl:GetAttribute("PetsData")
  if type(raw) ~= "string" then return nil end
  local ok, d = pcall(function() return HS:JSONDecode(raw) end)
  return ok and type(d) == "table" and d or nil
end
local function teamSet(d) -- ids in a saved team or worn: never traded or fused away by the factory
  local s = {}
  for _, tm in ipairs(d and d.teams or {}) do for _, id in ipairs(tm.pets or {}) do s[tostring(id)] = true end end
  for _, id in ipairs(d and d.equipped or {}) do s[tostring(id)] = true end
  return s
end
-- this account's pets by name and size: all ids, and the spare ones
local function inventory(d)
  local keep = teamSet(d)
  local arriving = {}
  for _, id in ipairs(d and d.arriving or {}) do arriving[tostring(id)] = true end
  local inv = {}
  for _, p in ipairs(d and d.pets or {}) do
    local id = tostring(p.id)
    if not arriving[id] then
      local v = p.variant or ""
      local e = inv[p.name] or { all = { [""] = 0, Big = 0, Huge = 0 }, spare = { [""] = {}, Big = {}, Huge = {} } }
      inv[p.name] = e
      e.all[v] = (e.all[v] or 0) + 1
      if not keep[id] and not (p.nickname and p.nickname ~= "") and not p.named and e.spare[v] then table.insert(e.spare[v], id) end
    end
  end
  return inv
end
T.inventory = inventory
local function isOurs(userId)
  local pl = Players:GetPlayerByUserId(tonumber(userId) or -1)
  if not pl then return false end
  if pl.Name == MAIN then return true end
  local ok = pcall(readfile, DIR .. "/" .. pl.Name .. ".txt")
  return ok
end
local function planList()
  local S0 = SABx()
  local plan = S0 and S0.FU and S0.FU.dream()
  local t = {}
  for n in pairs(plan or {}) do t[#t + 1] = n end
  table.sort(t)
  return t
end
T.planList = planList
local function goalText() -- this account's plan as pet:regular/Big/Huge counts (read by the main)
  local S0 = SABx()
  local out = {}
  for _, n in ipairs(planList()) do
    local g = S0.FU.goal(n)
    if g then out[#out + 1] = ("%s:%d/%d/%d"):format(n, g[""] or 0, g.Big or 0, g.Huge or 0) end
  end
  return table.concat(out, ";")
end
T.goalText = goalText
local function parseGoal(txt)
  local g = {}
  for n, r, b, h in tostring(txt or ""):gmatch("([%w_]+):(%d+)/(%d+)/(%d+)") do g[n] = { [""] = tonumber(r), Big = tonumber(b), Huge = tonumber(h) } end
  return g
end
local VW = { [""] = 1, Big = 3, Huge = 9 }
local function petScore()
  local d = petD()
  local I = SABx() and SABx().PX.info()
  local sc = 0
  for _, p in ipairs(d and d.pets or {}) do
    local inf = I and I.Pets[p.name]
    sc = sc + (VW[p.variant or ""] or 1) * math.max(1, math.log10(math.max(10, tonumber(inf and inf.price) or 10)))
  end
  return math.floor(sc)
end
T.petScore = petScore
-- the target pets: every account's plan pets together
local function targets()
  local names = {}
  for _, n in ipairs(planList()) do names[n] = true end
  for _, s in ipairs(T.peers()) do
    for n in tostring(s.plan or ""):gmatch("[^,]+") do names[n] = true end
  end
  return names
end
T.targets = targets
local function petTicks()
  if os.clock() - T.pet.tickAt < 60 then return end
  T.pet.tickAt = os.clock()
  local P = SABx().CFG.Pets
  local added = 0
  for n in pairs(targets()) do
    local w = P[n] or {}
    if not w.b or not w.w then added = added + 1 end
    w.b, w.w = true, true
    P[n] = w
  end
  if added > 0 then note("TEAM PETS: adopt + wish ticked on " .. added .. " target pet(s)") end
end

-- what the main owes an alt (Huges for the Bigs it sent): SAB/team/owed.txt  "alt|pet|count"
local OWED = DIR .. "/owed.txt"
local function owedRead()
  local o = {}
  local ok, body = pcall(readfile, OWED)
  for a, n, c in tostring(ok and body or ""):gmatch("([%w_]+)|([%w_]+)|(%d+)") do
    o[a] = o[a] or {}
    o[a][n] = tonumber(c)
  end
  return o
end
local function owedWrite(o)
  local L = {}
  for a, t in pairs(o) do for n, c in pairs(t) do if c > 0 then L[#L + 1] = a .. "|" .. n .. "|" .. c end end end
  pcall(writefile, OWED, table.concat(L, "\n"))
end
T.owedRead = owedRead
local function owedFor(o, name) local c = 0 for _, t in pairs(o) do c = c + (t[name] or 0) end return c end

-- the main's fusing: one fuse a tick, spare pets only (so no team is ever weakened)
local function mainFuse()
  local S0 = SABx()
  local FU, PX, TM = S0.FU, S0.PX, S0.TM
  if TM.editing then return false end
  local d = PX.data()
  if not d then return false end
  local inv = inventory(d)
  local needR, needB = FU.needFor(""), FU.needFor("Big")
  local owed = owedRead()
  local function fuse(ids, name, v, nv, why)
    TM.editing, TM.editingSince = true, os.clock()
    local r = PX.call("fuse", { ids = ids })
    TM.editing, TM.nextTry = false, 0
    if type(r) == "table" and r.ok then
      T.pet.fused = T.pet.fused + 1
      note(("TEAM FUSE: %d %s -> %s (%s)"):format(#ids, PX.nice(name, v), PX.nice(name, nv), why))
      return true
    end
    note(("TEAM FUSE: %s failed: %s"):format(PX.nice(name, v), type(r) == "table" and tostring(r.reason) or "no answer"))
    T.pet.nextAt = os.clock() + 30
    return false
  end
  for name in pairs(targets()) do
    local e = inv[name]
    if e then
      local g = FU.goal(name) or { [""] = 0, Big = 0, Huge = 0 }
      -- Huge: one owed to an alt first, then one the main's own plan wants
      if #e.spare.Big >= needB then
        local forAlt = owedFor(owed, name) > 0 and #e.spare.Huge < owedFor(owed, name)
        local forMe = e.all.Huge < (g.Huge or 0)
        -- a pet no alt's plan uses: its Bigs go on to Huges (the Huge stock; also frees pet slots)
        local altWants = false
        for _, s in ipairs(T.peers()) do
          if s.role == "alt" and parseGoal(s.goal)[name] then altWants = true end
        end
        if forAlt or forMe or not altWants then
          local ids = {}
          for i = 1, needB do ids[i] = e.spare.Big[i] end
          return fuse(ids, name, "Big", "Huge", forAlt and "owed to an alt" or (forMe and "for the main's plan" or "Huge stock"))
        end
      end
      -- Big from spare copies: always (that is what the copies come for)
      if #e.spare[""] >= needR then
        local ids = {}
        for i = 1, needR do ids[i] = e.spare[""][i] end
        return fuse(ids, name, "", "Big", "copies from the team")
      end
    end
  end
  return false
end
T.mainFuse = mainFuse

-- the trade with one alt: what it gives (spare copies, 3 spare Bigs for a Huge) and what it gets
-- (the Huge it is owed, Bigs / Huges the main can spare that its plan wants)
local function planTrade(s, mainInv, owed, designated)
  local S0 = SABx()
  local needB = S0.FU.needFor("Big")
  local d = decodePets(s.player)
  if not d then return nil end
  local inv = inventory(d)
  local tg = targets()
  local give, get, hugeFor = {}, {}, nil
  -- 1. its spare copies of target pets
  for name in pairs(tg) do
    local e = inv[name]
    if e then for _, id in ipairs(e.spare[""]) do if #give < 6 then give[#give + 1] = id end end end
  end
  -- 2. three spare Bigs of one pet -> a Huge for it
  if #give <= 6 - needB then
    for name in pairs(tg) do
      local e = inv[name]
      if not hugeFor and e and #e.spare.Big >= needB then
        for i = 1, needB do give[#give + 1] = e.spare.Big[i] end
        hugeFor = name
      end
    end
  end
  -- 3. what the main hands back: owed Huges, then pets the main can spare that this alt's plan wants
  local mine = owed[s.name] or {}
  for name, c in pairs(mine) do
    local e = mainInv[name]
    for i = 1, math.min(c, e and #e.spare.Huge or 0) do if #get < 6 then get[#get + 1] = e.spare.Huge[i] end end
  end
  for name, who in pairs(designated) do
    if who.alt == s.name and #get < 6 then get[#get + 1] = who.id end
  end
  return { alt = s, give = give, get = get, hugeFor = hugeFor, size = #give + #get }
end
-- which spare Big / Huge of the main goes to which alt: the alt with the fewest of that pet whose
-- plan wants more of it (ties: the weakest pets)
local function designate(mainInv, owed)
  local S0 = SABx()
  local FU = S0.FU
  local d = petD()
  local needB = FU.needFor("Big")
  local out = {}
  local alts = {}
  for _, s in ipairs(T.peers()) do
    if s.role == "alt" and s.fresh and s.player then
      local dd = decodePets(s.player)
      alts[#alts + 1] = { s = s, inv = dd and inventory(dd) or {}, goal = parseGoal(s.goal), n = dd and #(dd.pets or {}) or 0, max = dd and dd.maxOwned or 60 }
    end
  end
  for name, e in pairs(mainInv) do
    local g = FU.goal(name) or { [""] = 0, Big = 0, Huge = 0 }
    local o = owedFor(owed, name)
    -- the main keeps what its own plan still wants, and Bigs for Huges it owes
    local keepH = math.max(0, (g.Huge or 0) - (e.all.Huge - #e.spare.Huge)) + o
    local keepB = math.max(0, (g.Big or 0) + needB * math.max(0, (g.Huge or 0) - e.all.Huge) - (e.all.Big - #e.spare.Big)) + needB * math.max(0, o - #e.spare.Huge)
    for _, v in ipairs({ "Huge", "Big" }) do
      local free = #e.spare[v] - (v == "Huge" and keepH or keepB)
      for i = 1, math.max(0, free) do
        local best, bestHave
        for _, a in ipairs(alts) do
          local ga = a.goal[name]
          local ai = a.inv[name] or { all = { [""] = 0, Big = 0, Huge = 0 } }
          local units = ai.all.Big + needB * ai.all.Huge
          local wantUnits = ga and ((ga.Big or 0) + needB * (ga.Huge or 0)) or 0
          if ga and units < wantUnits and a.n < a.max - 1 then
            if not best or units < bestHave or (units == bestHave and (tonumber(a.s.petScore) or 0) < (tonumber(best.s.petScore) or 0)) then best, bestHave = a, units end
          end
        end
        if best then
          out[#out + 1] = { alt = best.s.name, id = e.spare[v][i], name = name, v = v }
          local ai = best.inv[name] or { all = { [""] = 0, Big = 0, Huge = 0 } }
          best.inv[name] = ai
          ai.all[v] = ai.all[v] + 1 -- counted, so the next one goes to whoever is lowest then
        end
      end
    end
  end
  return out
end
T.designate = designate

-- the game's trade events (both sides)
local function trListen()
  local ev = trRemote("TradeEvent")
  if not ev then return end
  T.conns[#T.conns + 1] = ev.OnClientEvent:Connect(function(a1, a2, a3, a4)
    if not T.alive then return end
    if a1 == "invite" then
      -- an alt answers only the main, and only with an order of its own waiting
      local pl = Players:GetPlayerByUserId(tonumber(a2) or -1)
      if T.role == "alt" and pl and pl.Name == MAIN and not T.tr.active then
        local ok, body = pcall(readfile, DIR .. "/trade_" .. T.me .. ".txt")
        local o = {}
        for k, v in tostring(ok and body or ""):gmatch("(%w+)=([^\n]*)") do o[k] = v end
        if tonumber(o.t) and os.time() - tonumber(o.t) < 90 then
          o.giveL, o.getL = {}, {}
          for id in tostring(o.give or ""):gmatch("[^,]+") do o.giveL[#o.giveL + 1] = id end
          for id in tostring(o.get or ""):gmatch("[^,]+") do o.getL[#o.getL + 1] = id end
          T.tr.active, T.tr.role, T.tr.order, T.tr.state, T.tr.closed, T.tr.since, T.tr.added = true, "alt", o, nil, nil, os.clock(), {}
          task.spawn(function() trReq("answer", a2, true) end)
        end
      end
    elseif a1 == "state" and type(a2) == "table" then
      T.tr.state = a2
      if T.tr.role == "alt" and T.tr.order then
        local o = T.tr.order
        local d = petD()
        local keep = teamSet(d)
        local owned = {}
        for _, p in ipairs(d and d.pets or {}) do owned[tostring(p.id)] = true end
        local inMine = {}
        for _, it in ipairs(a2.mine or {}) do inMine[tostring(type(it) == "table" and it.id or it)] = true end
        -- add what the order asks of us (spare pets only)
        for _, id in ipairs(o.giveL) do
          if owned[id] and not keep[id] and not inMine[id] and not T.tr.added[id] then
            T.tr.added[id] = true
            task.spawn(function() trReq("add", id) end)
          end
        end
        -- ready when what we expect from the main is in, nothing of ours from a team is offered
        local inTheirs = {}
        for _, it in ipairs(a2.theirs or {}) do inTheirs[tostring(type(it) == "table" and it.id or it)] = true end
        local allIn = true
        for _, id in ipairs(o.getL) do if not inTheirs[id] then allIn = false end end
        local teamOffered = false
        for id in pairs(inMine) do if keep[id] then teamOffered = true end end
        if allIn and not teamOffered and not a2.myReady and (a2.lockedUntil or 0) <= workspace:GetServerTimeNow() then
          task.spawn(function() trReq("ready", true, a2.revision) end)
        end
      end
    elseif a1 == "closed" then
      T.tr.closed = { text = a2, ok = a3 == true, items = a4 }
      if T.tr.role == "alt" then
        if a3 == true then T.pet.got = T.pet.got + 1 note("TEAM TRADE with the main: " .. tostring(a2)) end
        T.tr.active, T.tr.role, T.tr.order = false, nil, nil
      end
    end
  end)
end

-- the main runs one trade: order file, invite, its own side, ready, done
local function runTrade(plan)
  local s = plan.alt
  T.tr.active, T.tr.role, T.tr.state, T.tr.closed, T.tr.since = true, "main", nil, nil, os.clock()
  local path = DIR .. "/trade_" .. s.name .. ".txt"
  pcall(writefile, path, ("t=%d\ngive=%s\nget=%s\n"):format(os.time(), table.concat(plan.give, ","), table.concat(plan.get, ",")))
  local function finish(ok, why)
    if not ok then trReq("cancel") note("TEAM TRADE with " .. s.name .. " stopped: " .. tostring(why)) end
    pcall(writefile, path, "")
    T.tr.active, T.tr.role = false, nil
    return ok
  end
  trReq("invite", s.player)
  local t0 = os.clock()
  while not T.tr.state and os.clock() - t0 < 25 do task.wait(0.3) end
  if not T.tr.state then return finish(false, "no answer to the invite") end
  for _, id in ipairs(plan.get) do trReq("add", id) task.wait(0.35) end
  -- wait for the alt's side (up to 25 s), then ready with whatever is in
  t0 = os.clock()
  local st
  repeat
    task.wait(0.5)
    st = T.tr.state
    local n = #(st and st.theirs or {})
  until (n >= #plan.give and #(st.mine or {}) >= #plan.get) or os.clock() - t0 > 25
  st = T.tr.state
  if #(st.theirs or {}) + #(st.mine or {}) == 0 then return finish(false, "nothing went in") end
  local cameBigs = 0
  if plan.hugeFor then
    for _, it in ipairs(st.theirs or {}) do
      local nm = type(it) == "table" and it.name
      local v = type(it) == "table" and it.variant
      if nm == plan.hugeFor and v == "Big" then cameBigs = cameBigs + 1 end
    end
  end
  t0 = os.clock()
  while os.clock() - t0 < 45 and not T.tr.closed do
    st = T.tr.state
    if st and not st.myReady and (st.lockedUntil or 0) <= workspace:GetServerTimeNow() then trReq("ready", true, st.revision) end
    task.wait(0.8)
  end
  local c = T.tr.closed
  if not (c and c.ok) then return finish(false, c and c.text or "it did not complete") end
  -- book-keeping: Huges handed over, Huges now owed for the Bigs that came
  local o = owedRead()
  local mainInvNow = {}
  for _, id in ipairs(plan.get) do mainInvNow[id] = true end
  for name, cnt in pairs(o[s.name] or {}) do
    local given = 0
    for _, it in ipairs(st.mine or {}) do
      if type(it) == "table" and it.name == name and it.variant == "Huge" then given = given + 1 end
    end
    o[s.name][name] = math.max(0, cnt - given)
  end
  if plan.hugeFor and cameBigs >= SABx().FU.needFor("Big") then
    o[s.name] = o[s.name] or {}
    o[s.name][plan.hugeFor] = (o[s.name][plan.hugeFor] or 0) + 1
    note(("TEAM PETS: owe %s a Huge %s for its Bigs"):format(s.name, plan.hugeFor))
  end
  owedWrite(o)
  T.pet.trades = T.pet.trades + 1
  T.pet.got = T.pet.got + #(st.theirs or {})
  T.pet.sent = T.pet.sent + #(st.mine or {})
  note(("TEAM TRADE with %s: got %d, gave %d"):format(s.name, #(st.theirs or {}), #(st.mine or {})))
  return finish(true)
end
T.runTrade = runTrade

-- the main's pet tick: a fuse if one is due, else the biggest trade waiting
local function petTick()
  local S0 = SABx()
  if not (S0 and S0.FU and S0.PX) then return end
  pcall(petTicks)
  if T.tr.active then
    if os.clock() - (T.tr.since or 0) > 120 then trReq("cancel") T.tr.active, T.tr.role = false, nil note("TEAM TRADE: gave up a stuck trade") end
    return
  end
  if T.role ~= "main" or not T.pet.auto or os.clock() < T.pet.nextAt then return end
  T.pet.nextAt = os.clock() + 12
  if mainFuse() then T.pet.nextAt = os.clock() + 6 return end
  local d = petD()
  if not d or #(d.pets or {}) >= (d.maxOwned or 210) - 6 then T.pet.msg = "the main's pets are full" return end
  local mainInv = inventory(d)
  local owed = owedRead()
  local des = designate(mainInv, owed)
  local byAlt = {}
  for _, x in ipairs(des) do byAlt[x.alt] = byAlt[x.alt] or {} table.insert(byAlt[x.alt], x) end
  local best
  for _, s in ipairs(T.peers()) do
    if s.role == "alt" and s.fresh and s.player and tostring(s.trading) ~= "true" then
      local dmap = {}
      for i, x in ipairs(byAlt[s.name] or {}) do dmap[i] = { alt = s.name, id = x.id } end
      local pl = planTrade(s, mainInv, owed, dmap)
      if pl and pl.size > 0 and (not best or pl.size > best.size) then best = pl end
    end
  end
  if not best then T.pet.msg = "nothing to trade" return end
  T.pet.msg = ("trading with %s (gets %d, gives %d)"):format(best.alt.name, #best.get, #best.give)
  task.spawn(runTrade, best)
end
T.petTick = petTick
trListen()

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
T.conns = T.conns or {}
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


---------------------------------------------------------------- an alt that has bought everything gives too
-- (several givers = several gift cooldowns at once). It pulls its own lever (no Auto Roll pass) and
-- hands a butter to a poorer alt that still buys upgrades when that alt needs it for its index, or
-- when it at least doubles that alt's cash (the alt sells it). Never a Limited, never to the main.
T.cas = { at = 0, gifts = 0, pulls = 0 }
local function poorerFor(k, price)
  local mine = money()
  local best
  for _, s in ipairs(T.peers()) do
    if s.role == "alt" and s.fresh and s.player and tostring(s.upmax) ~= "true" and (s.stations or 0) >= 3
      and (s.holding == nil or s.holding == "") and (tonumber(s.cash) or 0) * 10 < mine
      and os.clock() >= (T.feed.wait[s.name] or 0) and tostring(s.trading) ~= "true" then
      local wants = ("," .. tostring(s.want) .. ","):find("," .. k .. ",", 1, true) ~= nil and (s.free or 0) > 0
      local doubles = price and price >= (tonumber(s.cash) or 0)
      if wants or doubles then
        if not best or (tonumber(s.cash) or 0) < (tonumber(best.cash) or 0) then best = s end
      end
    end
  end
  return best
end
T.self = { at = 0, pulls = 0 }
local function selfRoll()
  -- a maxed alt with stations to spare rolls its own lever; CHURN (UPGRADES) buys and waxes what
  -- beats the weakest butter in its stack. 6 stations stay free for the main's Sushis.
  if T.role ~= "alt" or not T.up.max or os.clock() < T.self.at then return false end
  local held = LP:GetAttribute("SquishyEquipped")
  if (held and held ~= "") or freeStations() <= 6 then return false end
  local SAB = G.SAB
  if SAB.S.reason and tostring(SAB.S.reason):find("cash short") then T.self.at = os.clock() + 30 return false end
  T.self.at = os.clock() + 5
  local lp, w = SAB.QX.lever()
  if not (lp and w) then return false end
  SAB.S.running = false
  standUp()
  local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  if hrp then hrp.CFrame = w.CFrame * CFrame.new(0, 0, -4) end
  task.wait(0.4)
  pcall(fireproximityprompt, lp)
  T.self.pulls = T.self.pulls + 1
  task.wait(1)
  SAB.S.running = true
  return true
end
T.selfRoll = selfRoll
local function cascadeTick()
  if T.role ~= "alt" or not T.up.max then return false end
  local SAB = G.SAB
  local held = LP:GetAttribute("SquishyEquipped")
  if held and held ~= "" then
    if isLimited(held) then return false end
    local s = poorerFor(key(held), SI[held] and tonumber(SI[held].price))
    if s and os.clock() >= (T.feed.globalWait or 0) then give(s) T.cas.gifts = T.cas.gifts + 1 return true end
    return false
  end
  -- anyone to give to at all?
  local any = false
  for _, s in ipairs(T.peers()) do
    if s.role == "alt" and s.fresh and tostring(s.upmax) ~= "true" and (tonumber(s.cash) or 0) * 10 < money() then any = true end
  end
  if not any or os.clock() < T.cas.at then return false end
  T.cas.at = os.clock() + 4
  local pn = padName()
  if pn and not isLimited(pn) then
    local price = SI[pn] and tonumber(SI[pn].price)
    local s = poorerFor(key(pn), price)
    local b = buyPrompt()
    if s and b and b.Enabled and price and money() >= price then
      SAB.S.running = false
      standUp()
      local part = b.Parent:IsA("Attachment") and b.Parent.Parent or b.Parent
      local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
      if hrp and part:IsA("BasePart") then hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 2, 3)) end
      task.wait(0.6)
      pcall(fireproximityprompt, b)
      local t0 = os.clock()
      repeat task.wait(0.2) until LP:GetAttribute("SquishyEquipped") or os.clock() - t0 > 5
      SAB.S.running = true
      if LP:GetAttribute("SquishyEquipped") then
        note("TEAM GIVE: bought " .. tostring(pn) .. " for " .. s.name)
        give(s)
        T.cas.gifts = T.cas.gifts + 1
      end
      return true
    end
  end
  -- roll: the lever (the same direct trigger CHURN's quest pulls use)
  local lp, w = SAB.QX.lever()
  if lp and w then
    SAB.S.running = false
    standUp()
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = w.CFrame * CFrame.new(0, 0, -4) end
    task.wait(0.4)
    pcall(fireproximityprompt, lp)
    T.cas.pulls = T.cas.pulls + 1
    task.wait(1.5)
    SAB.S.running = true
  end
  T.mode = "giving to poorer alts (" .. T.cas.gifts .. " given)"
  return true
end
T.cascadeTick = cascadeTick

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
      local okP, errP = pcall(T.petTick)
      if not okP then note("TEAM PETS error: " .. tostring(errP)) end
      local ok, err = pcall(T.role == "main" and mainTick or altTick)
      if ok and T.role == "alt" and not T.tr.active then
        local okC, errC = pcall(cascadeTick)
        if not okC then note("TEAM GIVE error: " .. tostring(errC)) end
        if okC and not errC then
          local okS, errS = pcall(selfRoll)
          if not okS then note("TEAM ROLL error: " .. tostring(errS)) end
        end
      end
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
