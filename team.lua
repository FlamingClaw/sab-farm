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
local T = { alive = true, me = LP.Name, role = LP.Name == MAIN and "main" or "alt", gifts = 0, log = {}, version = 26 }
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
local LIMITED = { pecanpie = true, turkey = true } -- (known by heart too, should the catalogue not say)
for n, v in pairs(SI) do if type(v) == "table" and v.rarity == "Limited" then LIMITED[key(n)] = true end end
pcall(function() -- an event's free / paid butter (ThanksgivingConfig.freeButter = "PecanPieButter")
  for _, m in ipairs(RS.Modules:GetChildren()) do
    if m:IsA("ModuleScript") and m.Name:match("^%u%a+Config$") then
      local ok, c = pcall(require, m)
      for _, f in ipairs({ "freeButter", "paidButter" }) do
        if ok and type(c) == "table" and type(c[f]) == "string" and c[f] ~= "" then LIMITED[key(c[f])] = true end
      end
    end
  end
end)
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
    "gname=" .. tostring(T.clan.inClan and T.clan.name or ""),
    "gpts=" .. tostring(T.clan.points or 0),
    "gid=" .. tostring(T.clan.inClan and T.clan.id or ""),
    "graw=" .. tostring(T.clan.inClan and T.clan.raw or ""),
    "plan=" .. table.concat(T.planList and T.planList() or {}, ","),
    "goal=" .. (T.goalText and T.goalText() or ""),
    "pets=" .. tostring(#((G.SAB and G.SAB.PX.data() or {}).pets or {})),
    "petMax=" .. tostring((G.SAB and G.SAB.PX.data() or {}).maxOwned or 60),
    "petScore=" .. tostring(T.petScore and T.petScore() or 0),
    "slots=" .. tostring(G.SAB and G.SAB.FU and G.SAB.FU.slots() or 3),
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
    if name and name ~= T.me and not name:find("^trade_") and not name:find("^given_") and name ~= "owed" then
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
-- The pass's rank 20 reward is a butter: Pecan Pie, a Limited (ThanksgivingConfig.ranks[20].free).
-- It lands in the claiming account's HAND (the user, Nov 26; on the main CHURN then waxed it into
-- the stack at once, which first looked like "straight into the stack"). The user's top rule: every
-- Limited goes to o_oFlame3 and is waxed and stacked there only - never waxed, sold, given to anyone
-- else or left to AUTO INDEX on an alt. So an alt claims rank 20 only when the main is here with its
-- hands free and nobody else is bringing one; CHURN is paused first, the butter is walked to the
-- main at once (limitedToMain), and CHURN stays paused for as long as it is in this alt's hands.
-- Every other rank reward is claimed one by one as before.
T.claimAltPecan = true
local PASS_CLAIM_END = 1796112000 -- ThanksgivingConfig.claimEndsAt (Dec 1, 08:00 UTC)
local function claimRanks()
  local n = tonumber(LP:GetAttribute("ThanksgivingReady")) or 0
  if n <= 0 then return end
  if T.role == "alt" then -- (never claimAll on an alt: rank 20 only through T.claimPecan)
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
    if got > 0 then T.claimed = T.claimed + got note("TEAM: claimed " .. got .. " pass rank reward(s)") T.refreshPass() end
    if (tonumber(st.rank) or 0) >= 20 and not claimed[20] and not claimed["20"] then T.claimPecan(r) end
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
-- Read Nov 26 (ClanHandler + ClanConfig): ClanRequest("state") -> { ok, data = { inClan, clan = { name,
-- tag, level, perks }, points (this player's guild points), tasks = { list, done, bonus, resetsAt },
-- shop = { daily, list } } }. Six quests a day; they count by themselves (no claim), the guild perks
-- (income, offline, luck) apply by themselves. The kinds and who does them here:
--   minutes / together  time in the server / with a guildmate (all our accounts share one server)
--   help                CHURN's Help (alts in a guild also answer guildmates' calls: HelpGuild)
--   stack / rare        waxing (the farm; in the last 3 h before the reset an alt waxes anything)
--   pull                CHURN's quest pulls (the account stays off the campfire meanwhile)
--   buy                 an alt buys whatever its pad shows (cash checked) and sells it again
--   give / giveTo       "give a butter" / "to N different players": the team passes butters on (below)
-- The quests' "Refresh" button costs Robux: CHURN's Robux guard drops it. Points buy shop items
-- (points only, never Robux): an alt spends them on Speedy Wax while it waxes, and Guild XP above that.
T.clan = { at = -1e9, need = false, open = 0, done = 0, n = 0, inClan = false, left = {}, name = "", points = 0, resetsAt = 0, texts = {} }
T.g = { given = {}, at = 0, gives = 0, buys = 0, pulls = 0, shopAt = 0, bought = 0, idleSince = nil, msg = "" }
-- who got a butter from this account since the guild quests reset outlives a reload: SAB/team/given_<Name>.txt
local GIVEN = DIR .. "/given_" .. T.me .. ".txt"
pcall(function()
  for n, r in tostring(readfile(GIVEN)):gmatch("([%w_]+)=(%d+)") do T.g.given[n] = tonumber(r) end
end)
function T.saveGiven()
  local t = {}
  for n, r in pairs(T.g.given) do if r and r > 0 then t[#t + 1] = n .. "=" .. ("%d"):format(r) end end
  pcall(writefile, GIVEN, table.concat(t, "\n"))
end
-- rarities from weakest up (the game's order; Dotonbori is the newest and best)
local RANKS = { "Common", "Rare", "Epic", "Legendary", "Mythic", "Celestial", "Divine", "Dream", "Sugar Rush", "Picnic", "Dotonbori" }
local RANK = {} for i, r in ipairs(RANKS) do RANK[r] = i end
T.RANK = RANK
local function clanState()
  local Cn = T.clan
  if os.clock() - Cn.at < 60 then return Cn end
  Cn.at = os.clock()
  local r = RS.Remotes:FindFirstChild("ClanRequest")
  local ok, v = pcall(function() return r:InvokeServer("state") end)
  local d = ok and type(v) == "table" and type(v.data) == "table" and v.data or nil
  if not d then return Cn end -- a failed call keeps what was known
  local t = d.tasks
  Cn.need, Cn.open, Cn.done, Cn.n, Cn.left, Cn.texts, Cn.giveRar = false, 0, 0, 0, {}, {}, nil
  local clan = type(d.clan) == "table" and d.clan or nil
  Cn.inClan = d.inClan == true or (clan ~= nil and clan.name ~= nil)
  Cn.name = clan and (tostring(clan.name or "") .. (clan.tag and (" [" .. tostring(clan.tag) .. "]") or "") .. (clan.level and (" lv" .. tostring(clan.level)) or "")) or ""
  Cn.points = tonumber(d.points) or 0
  Cn.shop = d.shop
  Cn.id, Cn.raw = clan and clan.id and tostring(clan.id) or "", clan and tostring(clan.name or "") or ""
  Cn.invites = type(d.invites) == "table" and d.invites or {}
  if Cn.inClan and type(t) == "table" then
    Cn.resetsAt = tonumber(t.resetsAt) or 0
    for _, x in ipairs(t.list or {}) do
      Cn.n = Cn.n + 1
      if x.done then Cn.done = Cn.done + 1 else
        Cn.open = Cn.open + 1
        local kind = tostring(x.kind)
        if kind == "stack" or kind == "rare" then Cn.need = true end
        -- "Give someone a Sugar Rush butter or rarer": only a butter that rare counts (kept apart as giveRare)
        local rr = kind == "give" and tostring(x.desc or ""):match("a (.-) butter or rarer")
        if rr and RANK[rr] then Cn.giveRar, kind = rr, "giveRare" end
        Cn.left[kind] = math.max(Cn.left[kind] or 0, math.max(1, (tonumber(x.goal) or 1) - (tonumber(x.progress) or 0)))
        Cn.texts[#Cn.texts + 1] = ("%s %d/%d"):format(tostring(x.desc or x.text or kind), tonumber(x.progress) or 0, tonumber(x.goal) or 0)
      end
    end
  end
  return Cn
end
T.clanState = clanState
function T.refreshClan() T.clan.at = -1e9 return clanState() end

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
  -- a guild stack / rare quest still open in the last 3 h before the reset: wax whatever comes
  local Cn = clanState()
  local guildLate = Cn.inClan and Cn.need and Cn.resetsAt > 0 and Cn.resetsAt - os.time() < 3 * 3600
  -- an alt in a guild answers guildmates' "help my wax" calls (helps count for its quests and the guild)
  C.HelpGuild = Cn.inClan == true
  if P.need or guildLate then for k in pairs(ALL) do Tg[k] = true end end
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
  local gWalk = Cn.inClan and ((Cn.left.pull or 0) + (Cn.left.give or 0) + (Cn.left.giveTo or 0) + (Cn.left.buy or 0)) > 0
  local wantUp = (P.live and P.open > 0) or (held ~= nil and held ~= "") or gWalk
  if wantUp then
    if C.Campfire then C.Campfire = false end
    if seated() then standUp() end
  elseif not C.Campfire then
    C.Campfire = true
    SAB.CF.nextAt = 0
  end
  T.mode = ((P.need or guildLate) and "keep+wax (quest)" or "sell (pulls go on)") .. (giftWaiting and (C.Targets[key(held)] and ", gift to wax" or ", gift to sell") or "")
    .. (wantUp and ", campfire waits" or ", campfire on")
end

T.altTick = altTick

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
  local all = {}
  for _, s in ipairs(T.peers()) do
    if s.fresh and s.player and s.role == "alt" and (s.stations or 0) >= 3
      and (s.holding == nil or s.holding == "") and os.clock() >= (T.feed.wait[s.name] or 0) then
      all[#all + 1] = s
    end
  end
  local function choose(ready)
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
  -- a guild quest "give butters to N different players" is open: the alts not given to since the
  -- quests reset come first
  if T.clan.inClan and (T.clan.left.giveTo or 0) > 0 then
    local new = {}
    for _, s in ipairs(all) do if T.g.given[s.name] ~= T.clan.resetsAt then new[#new + 1] = s end end
    local a = #new > 0 and choose(new) or nil
    if a then return a end
  end
  return choose(all)
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
    T.g.given[s.name] = T.clan.resetsAt
    T.saveGiven()
    if T.clan.inClan and ((T.clan.left.give or 0) + (T.clan.left.giveTo or 0) + (T.clan.left.giveRare or 0)) > 0 then T.clan.at = math.min(T.clan.at, os.clock() - 50) end
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
  local held = LP:GetAttribute("SquishyEquipped")
  -- keep (never sell) every good butter: they go to the alts (but one that nobody could take, being
  -- sold); Limited ones stay with the main
  for k in pairs(GOOD) do if not (T.feed.soldNote and held and key(held) == k) then C.Targets[k] = true end end
  for k in pairs(LIMITED) do C.Targets[k] = true end
  -- an alt is bringing a Limited (Pecan Pie): the hands are emptied and kept empty for it - a good
  -- butter goes to an alt (sold after a minute if none can take it), anything else CHURN sells; with
  -- empty hands CHURN is paused so it buys nothing before the Limited is in. Once it is, CHURN runs
  -- and waxes it here (the only account that waxes a Limited).
  local bringing
  for _, s in ipairs(T.peers()) do if s.fresh and isLimited(s.holding) then bringing = s end end
  if bringing and not isLimited(held) then
    T.mode = bringing.name .. " is bringing " .. tostring(bringing.holding) .. " - hands kept free"
    if held and held ~= "" then
      SAB.S.running = true
      if isGood(held) then
        local a = os.clock() >= (T.feed.globalWait or 0) and pickAlt(held) or nil
        if a then give(a) return end
        T.feed.limHeld = T.feed.limHeld or os.clock()
        if os.clock() - T.feed.limHeld > 60 then -- nobody takes it: CHURN sells it
          C.Targets[key(held)] = nil
          if not T.feed.soldNote then T.feed.soldNote = true note("TEAM: nobody can take " .. tostring(held) .. " and a Limited is waiting - selling it") end
        end
      end
      return
    end
    T.feed.limHeld, T.feed.soldNote = nil, nil
    if not T.feed.limPause then T.feed.limPause = true note("TEAM LIMITED: hands kept free for " .. bringing.name .. "'s " .. tostring(bringing.holding) .. " (farm paused)") end
    SAB.S.running = false
    return
  end
  T.feed.limHeld = nil
  if T.feed.limPause then
    T.feed.limPause = false
    SAB.S.running = true
    note("TEAM LIMITED: " .. (isLimited(held) and (tostring(held) .. " is in - waxing it here") or "nobody is bringing one any more") .. " (farm on)")
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
    if Cn.inClan and (Cn.left.pull or 0) > 0 then
      -- a guild "pull the lever" quest: CHURN pulls it itself, which the campfire seat would hold up
      if C.Campfire then C.Campfire = false end
      if seated() then standUp() end
      T.mode = "guild quest: pulling the lever"
      return
    end
    if not C.Campfire then C.Campfire = true SAB.CF.nextAt = 0 end
    T.mode = isGood(held) and ("holding " .. tostring(held) .. ", no alt has room") or "campfire"
  end
end


T.mainTick = mainTick


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
-- Rarity: Common < Rare < Epic < Legendary < Mythic < Exotic < Cosmic (PetInfo.Rarities).
-- The user's rule (Nov 26): of the low ones (below Exotic) the team keeps only what the accounts' best
-- teams need - their plans' Huges, and the copies / Bigs still on the way to those Huges; the rest is
-- sold (it only takes room). Exotic and Cosmic are never sold: every account adopts and wishes them
-- for good and the main fuses them on to Huges (the Huge stock).
local function rarityRank(n)
  local S0 = SABx()
  local I = S0 and S0.PX.info()
  local p = I and I.Pets and I.Pets[n]
  if not p then return nil end
  for i, r in ipairs(I.Rarities or {}) do if r == p.rarity then return i, I.Rarities end end
  return nil
end
local function isHigh(n)
  local i, list = rarityRank(n)
  if not i then return false end
  local ex = 6
  for j, r in ipairs(list) do if r == "Exotic" then ex = j end end
  return i >= ex
end
T.isHigh = isHigh
-- what the main worked out (SAB/team/econ.txt): the pets wanted, what each account sells, which spare
-- pets would better another account's teams
local ECON = DIR .. "/econ.txt"
local function econRead()
  local ok, body = pcall(readfile, ECON)
  if not ok or type(body) ~= "string" then return nil end
  local e = { wanted = {}, sell = {}, useful = {}, short = {} }
  for k, v in body:gmatch("([%w_]+)=([^\n]*)") do
    if k == "t" then e.t = tonumber(v)
    elseif k == "wanted" then for n in v:gmatch("[^,]+") do e.wanted[n] = true end
    elseif k == "useful" then for id, who in v:gmatch("([^,:]+):([^,]+)") do e.useful[id] = who end
    elseif k == "short" then for n, a, h, b in v:gmatch("([%w_]+):([%w_]+):(%d+):(%d+)") do e.short[n] = e.short[n] or {} e.short[n][a] = { H = tonumber(h), B = tonumber(b) } end
    elseif k:find("^sell_") then local l = {} for id in v:gmatch("[^,]+") do l[#l + 1] = id end e.sell[k:sub(6)] = l end
  end
  e.fresh = e.t ~= nil and os.time() - e.t < 600
  return e
end
T.econRead = econRead
-- the pets the team adopts / trades / fuses: what the main says (else Exotic+Cosmic and this account's plan)
local function targets()
  local e = T.role == "main" and T.econ or econRead()
  if e and e.t and os.time() - e.t < 600 then return e.wanted end
  local names = {}
  for _, n in ipairs(planList()) do names[n] = true end
  local S0 = SABx()
  local I = S0 and S0.PX.info()
  for n in pairs(I and I.Pets or {}) do if isHigh(n) then names[n] = true end end
  return names
end
T.targets = targets
local function petTicks()
  if os.clock() - T.pet.tickAt < 60 then return end
  T.pet.tickAt = os.clock()
  local S0 = SABx()
  local P, I = S0.CFG.Pets, S0.PX.info()
  if not (I and I.Pets) then return end
  local want = targets()
  local on, off = 0, 0
  for n in pairs(I.Pets) do
    local w = P[n] or {}
    if tonumber(w.f) ~= -1 then -- (a pet the user marked KEEP is left as it is)
      local yes = want[n] == true
      if yes and not (w.b and w.w) then on = on + 1 elseif not yes and (w.b or w.w) then off = off + 1 end
      w.b, w.w = yes or nil, yes or nil
      w.s = (yes and isHigh(n)) or nil -- Exotic / Cosmic: adopted for good, not only up to the plan
      P[n] = (w.b or w.w or w.g or w.f or w.s) and w or nil
    end
  end
  if on + off > 0 then note(("TEAM PETS: adopt + wish on %d pet(s), off on %d (not needed)"):format(on, off)) end
end
T.petTicks = petTicks

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

---------------------------------------------------------------- the team's pets as one store (worked out on the main)
-- Every 90 s the main reads every account's pets (PetsData replicates), saved teams, plan (its goal:
-- regular/Big/Huge per pet) and team slots, and works out, per pet:
--   shortfall  each account's plan Huges / Bigs it does not have yet;
--   spare      not in a saved team or worn, not named, beyond its own plan, and not in a team its own
--              pets would make right now (a pet that just came, not saved in a team yet);
--   wanted     Exotic / Cosmic always; a lower pet only while the shortfalls need more than is spare;
--   reserved   spare lower pets kept as the material for the shortfalls (the main's own first);
--   useful     a spare lower pet past that which would better another account's teams goes there;
--   sold       every other spare lower pet (the user's rule: they only take room).
-- Exotic / Cosmic are never sold: spare ones go to the main, which fuses them on (the Huge stock) and
-- hands Huges to the alts whose plans want them. SAB/team/econ.txt tells the alts the outcome.
local function petList(d)
  local arriving, out = {}, {}
  for _, id in ipairs(d and d.arriving or {}) do arriving[tostring(id)] = true end
  for _, p in ipairs(d and d.pets or {}) do
    if not arriving[tostring(p.id)] then out[#out + 1] = { id = tostring(p.id), name = p.name, variant = p.variant or "" } end
  end
  return out
end
local function bestIds(list, slots)
  local FU = SABx().FU
  local chosen = {}
  for _, r in ipairs({ "farm", "full", "glaze", "wax" }) do
    local ok, ids = pcall(FU.best, r, list, slots)
    for _, id in ipairs(ok and ids or {}) do chosen[tostring(id)] = true end
  end
  return chosen
end
T.bestIds = bestIds
local function accounts()
  local S0 = SABx()
  local out = {}
  local d = petD()
  if d then out[#out + 1] = { name = T.me, role = T.role, d = d, goal = parseGoal(goalText()), slots = S0.FU.slots(), score = petScore() } end
  for _, s in ipairs(T.peers()) do
    if s.fresh and s.player then
      local dd = decodePets(s.player)
      if dd then out[#out + 1] = { name = s.name, role = s.role, d = dd, goal = parseGoal(s.goal), slots = tonumber(s.slots) or 3, score = tonumber(s.petScore) or 0, s = s } end
    end
  end
  for _, a in ipairs(out) do
    a.inv, a.keep, a.list = inventory(a.d), teamSet(a.d), petList(a.d)
    a.n, a.max = #(a.d.pets or {}), tonumber(a.d.maxOwned) or 60
  end
  return out
end
local UNIT = { [""] = 1, Big = 3, Huge = 9 } -- in copies (the main fuses with the Fuse Pass: 3 a step)
local ZERO = { [""] = 0, Big = 0, Huge = 0 }
T.sellOn = not G.SAB_TEAM_SELL_OFF -- (a dry run: set getgenv().SAB_TEAM_SELL_OFF before loading)
local function econCompute()
  local acc = accounts()
  if #acc == 0 then return nil end
  local I = SABx().PX.info()
  local e = { t = os.time(), wanted = {}, sell = {}, useful = {}, short = {}, move = {}, reserved = 0, mainBest = {} }
  for _, a in ipairs(acc) do
    a.best = bestIds(a.list, a.slots)
    if a.role == "main" then e.mainBest = a.best end
  end
  local names = {}
  for _, a in ipairs(acc) do for n in pairs(a.inv) do names[n] = true end for n in pairs(a.goal) do names[n] = true end end
  local surplus = {}
  local function moveTo(a, id) if a.role == "alt" then e.move[a.name] = e.move[a.name] or {} table.insert(e.move[a.name], id) end end
  for n in pairs(names) do
    if I and I.Pets and I.Pets[n] then
      local high = isHigh(n)
      local needU, short = 0, {}
      for _, a in ipairs(acc) do
        local g = a.goal[n] or ZERO
        local al = (a.inv[n] and a.inv[n].all) or ZERO
        local sH = math.max(0, (g.Huge or 0) - al.Huge)
        local xH = math.max(0, al.Huge - (g.Huge or 0))
        local sB = math.max(0, (g.Big or 0) - al.Big - xH)
        local xB = math.max(0, al.Big + xH - (g.Big or 0))
        local sP = math.max(0, (g[""] or 0) - al[""] - xB)
        if sH + sB > 0 then short[a.name] = { H = sH, B = sB } end
        needU = needU + sH * UNIT.Huge + sB * UNIT.Big + sP
      end
      if next(short) then e.short[n] = short end
      local pool = {}
      for _, a in ipairs(acc) do
        local inv = a.inv[n]
        if inv then
          local g = a.goal[n] or ZERO
          for _, v in ipairs({ "Huge", "Big", "" }) do
            local keepMore = math.max(0, (g[v] or 0) - (inv.all[v] - #inv.spare[v]))
            for i, id in ipairs(inv.spare[v]) do
              if i > keepMore and not a.best[id] then pool[#pool + 1] = { a = a, id = id, v = v, u = UNIT[v] } end
            end
          end
        end
      end
      table.sort(pool, function(x, y) if (x.a.role == "main") ~= (y.a.role == "main") then return x.a.role == "main" end return x.u > y.u end)
      local have = 0
      for _, x in ipairs(pool) do have = have + x.u end
      if high or needU > have then e.wanted[n] = true end
      local res = 0
      for _, x in ipairs(pool) do
        if high then moveTo(x.a, x.id) -- Exotic / Cosmic: to the main (fused on, the Huge stock)
        elseif res < needU then res = res + x.u e.reserved = e.reserved + 1 moveTo(x.a, x.id)
        else surplus[x.id] = { a = x.a, name = n, v = x.v } end
      end
    end
  end
  -- a spare lower pet that would better an alt's teams goes there (the weakest accounts first)
  table.sort(acc, function(x, y) return (x.score or 0) < (y.score or 0) end)
  for _, a in ipairs(acc) do
    if a.role == "alt" and a.n < a.max - 2 then
      local list, from = {}, {}
      for _, p in ipairs(a.list) do list[#list + 1] = p end
      for id, x in pairs(surplus) do
        if x.a ~= a then list[#list + 1] = { id = "x" .. id, name = x.name, variant = x.v } from["x" .. id] = id end
      end
      for cid in pairs(bestIds(list, a.slots)) do
        local id = from[cid]
        local x = id and surplus[id]
        if x then
          surplus[id] = nil
          if x.a.role == "main" then e.useful[id] = a.name else moveTo(x.a, id) end
        end
      end
    end
  end
  for id, x in pairs(surplus) do
    e.sell[x.a.name] = e.sell[x.a.name] or {}
    table.insert(e.sell[x.a.name], id)
    e.sellNames = e.sellNames or {}
    local k = x.a.name .. ": " .. SABx().PX.nice(x.name, x.v)
    e.sellNames[k] = (e.sellNames[k] or 0) + 1
  end
  -- Huges owed for Bigs an alt sent: only while that alt still lacks one
  local o = owedRead()
  local changed = false
  for who, t in pairs(o) do
    for n, c in pairs(t) do
      local sh = e.short[n] and e.short[n][who]
      if c > 0 and not (sh and sh.H > 0) then t[n] = 0 changed = true end
    end
  end
  if changed then owedWrite(o) end
  local L = { "t=" .. e.t }
  local w = {} for n in pairs(e.wanted) do w[#w + 1] = n end table.sort(w)
  L[#L + 1] = "wanted=" .. table.concat(w, ",")
  local sh = {} for n, t in pairs(e.short) do for who, v in pairs(t) do sh[#sh + 1] = ("%s:%s:%d:%d"):format(n, who, v.H, v.B) end end
  L[#L + 1] = "short=" .. table.concat(sh, ",")
  for who, l in pairs(e.sell) do L[#L + 1] = "sell_" .. who .. "=" .. table.concat(l, ",") end
  for who, l in pairs(e.move) do L[#L + 1] = "move_" .. who .. "=" .. table.concat(l, ",") end
  pcall(writefile, ECON, table.concat(L, "\n"))
  return e
end
T.econCompute = econCompute
local function econ()
  if T.role ~= "main" then return T.econ end
  if T.econBusy or (T.econ and not T.econ.dirty and os.time() - (T.econ.t or 0) < 90) then return T.econ end
  T.econBusy = true
  local ok, e = pcall(econCompute)
  T.econBusy = false
  if ok and e then T.econ = e elseif not ok then note("TEAM PETS: working out the pets failed: " .. tostring(e)) end
  return T.econ
end
T.econNow = function() if T.econ then T.econ.dirty = true end return econ() end

-- selling (every account, its own pets only): what the main's list says, checked again here first
T.sold = { n = 0, at = 0, cash = 0 }
local function sellTick()
  if not T.sellOn or T.tr.active or os.clock() < T.sold.at then return end
  T.sold.at = os.clock() + 40
  local e = T.role == "main" and T.econ or econRead()
  if not (e and e.t and os.time() - e.t < 300) then return end
  local list = e.sell[T.me]
  if not list or #list == 0 then return end
  local S0 = SABx()
  local d = petD()
  if not d then return end
  local keep = teamSet(d)
  local byId = {}
  for _, p in ipairs(d.pets or {}) do byId[tostring(p.id)] = p end
  local mine = bestIds(petList(d), S0.FU.slots())
  local ids, what = {}, {}
  for _, id in ipairs(list) do
    local p = byId[tostring(id)]
    -- never: in a team / worn, named, Exotic or Cosmic, an unknown pet, or one this account's teams would take
    if p and #ids < 20 and not keep[tostring(id)] and not mine[tostring(id)] and not p.named and not (p.nickname and p.nickname ~= "")
      and rarityRank(p.name) and not isHigh(p.name) then
      ids[#ids + 1] = tostring(id)
      local k = S0.PX.nice(p.name, p.variant or "")
      what[k] = (what[k] or 0) + 1
    end
  end
  if #ids == 0 then return end
  local before = money()
  local r = S0.PX.call("sellMany", { ids = ids })
  if type(r) == "table" and r.ok then
    T.sold.n = T.sold.n + #ids
    local parts = {} for k, c in pairs(what) do parts[#parts + 1] = c .. "x " .. k end table.sort(parts)
    note(("TEAM PETS: sold %d spare pet(s): %s"):format(#ids, table.concat(parts, ", ")))
    T.sold.cash = T.sold.cash + math.max(0, money() - before)
    if T.role == "main" and T.econ then T.econ.dirty = true end
  else
    note("TEAM PETS: selling refused: " .. tostring(type(r) == "table" and (r.reason or r.text) or r))
    T.sold.at = os.clock() + 300
  end
end
T.sellTick = sellTick

-- the main's fusing: one fuse a tick, its own spare pets only (never one in a team or its best teams)
local function mainFuse()
  local S0 = SABx()
  local FU, PX, TM = S0.FU, S0.PX, S0.TM
  if TM.editing then return false end
  local d = PX.data()
  local e = T.econ
  if not (d and e) then return false end
  local inv = inventory(d)
  local needR, needB = FU.needFor(""), FU.needFor("Big")
  local owed = owedRead()
  local myGoal = parseGoal(goalText())
  local function fuse(ids, name, v, nv, why)
    TM.editing, TM.editingSince = true, os.clock()
    local r = PX.call("fuse", { ids = ids })
    TM.editing, TM.nextTry = false, 0
    if type(r) == "table" and r.ok then
      T.pet.fused = T.pet.fused + 1
      note(("TEAM FUSE: %d %s -> %s (%s)"):format(#ids, PX.nice(name, v), PX.nice(name, nv), why))
      T.econ.dirty = true -- (the store changed)
      return true
    end
    note(("TEAM FUSE: %s failed: %s"):format(PX.nice(name, v), type(r) == "table" and tostring(r.reason) or "no answer"))
    T.pet.nextAt = os.clock() + 30
    return false
  end
  for name, en in pairs(inv) do
    local high = isHigh(name)
    local sh = e.short[name] or {}
    local hShort, bShort = 0, 0
    for _, x in pairs(sh) do hShort, bShort = hShort + x.H, bShort + x.B end
    if high or hShort + bShort > 0 then
      local g = myGoal[name] or ZERO
      local function spare(v)
        local l = {}
        local keepMore = math.max(0, (g[v] or 0) - (en.all[v] - #en.spare[v]))
        for i, id in ipairs(en.spare[v]) do if i > keepMore and not e.mainBest[id] then l[#l + 1] = id end end
        return l
      end
      local sP, sB, sH = spare(""), spare("Big"), spare("Huge")
      local uncovered = math.max(0, hShort + math.max(0, owedFor(owed, name) - hShort) - #sH)
      if #sB >= needB and (high or uncovered > 0) then
        local ids = {}
        for i = 1, needB do ids[i] = sB[i] end
        return fuse(ids, name, "Big", "Huge", high and (uncovered > 0 and "for an account's plan" or "Huge stock") or "for an account's plan")
      end
      if #sP >= needR and (high or uncovered * needB + bShort > #sB) then
        local ids = {}
        for i = 1, needR do ids[i] = sP[i] end
        return fuse(ids, name, "", "Big", "copies from the team")
      end
    end
  end
  return false
end
T.mainFuse = mainFuse

-- the trade with one alt. It gives what the main's list says should come to the main (material for
-- the plans, spare Exotic / Cosmic, pets that better another account's teams); it gets the Huges and
-- Bigs its plan lacks, and spare pets that better its teams.
local function planTrade(s, mainInv, owed, designated)
  local d = decodePets(s.player)
  if not d then return nil end
  local e = T.econ
  local keep = teamSet(d)
  local owned = {}
  for _, p in ipairs(d.pets or {}) do owned[tostring(p.id)] = true end
  local give, get, gave = {}, {}, {}
  for _, id in ipairs(e and e.move[s.name] or {}) do
    if #give < 6 and owned[id] and not keep[id] and not gave[id] then give[#give + 1] = id gave[id] = true end
  end
  for _, x in ipairs(designated) do if #get < 6 then get[#get + 1] = x.id end end
  return { alt = s, give = give, get = get, hugeFor = nil, size = #give + #get }
end
-- which spare pets of the main go to which alt: ones that better its teams, then the Huges (and Bigs)
-- its plan lacks - the biggest shortfall first, then the weakest pets
local function designate(mainInv, owed)
  local e = T.econ
  if not e then return {} end
  local needB = SABx().FU.needFor("Big")
  local out, taken, room, score = {}, {}, {}, {}
  for _, s in ipairs(T.peers()) do
    if s.role == "alt" and s.fresh and s.player then
      local dd = decodePets(s.player)
      room[s.name] = dd and ((tonumber(dd.maxOwned) or 60) - #(dd.pets or {}) - 1) or 0
      score[s.name] = tonumber(s.petScore) or 0
    end
  end
  local function hand(id, to, name, v)
    if room[to] and room[to] > 0 and not taken[id] then
      taken[id], room[to] = true, room[to] - 1
      out[#out + 1] = { alt = to, id = id, name = name, v = v }
      return true
    end
    return false
  end
  for id, to in pairs(e.useful) do hand(id, to) end
  local myGoal = parseGoal(goalText())
  for name, sh in pairs(e.short) do
    local en = mainInv[name]
    if en then
      local g = myGoal[name] or ZERO
      local hGiven = 0
      local hNeed = 0
      for who, x in pairs(sh) do if who ~= T.me then hNeed = hNeed + x.H end end
      for _, v in ipairs({ "Huge", "Big" }) do
        local keepMore = math.max(0, (g[v] or 0) - (en.all[v] - #en.spare[v]))
        local free = {}
        for i, id in ipairs(en.spare[v]) do if i > keepMore and not e.mainBest[id] and not taken[id] then free[#free + 1] = id end end
        if v == "Big" then
          -- the Bigs the main fuses on into the Huges still missing stay here
          local keepB = needB * math.max(0, hNeed - hGiven)
          for _ = 1, math.min(#free, keepB) do table.remove(free, 1) end
        end
        local list = {}
        for who, x in pairs(sh) do
          local n = v == "Huge" and x.H or x.B
          if who ~= T.me and room[who] and n > 0 then list[#list + 1] = { who = who, n = n } end
        end
        table.sort(list, function(a, b) if a.n ~= b.n then return a.n > b.n end return (score[a.who] or 0) < (score[b.who] or 0) end)
        local k = 1
        for _, x in ipairs(list) do
          for _ = 1, x.n do
            while free[k] and taken[free[k]] do k = k + 1 end
            if free[k] and hand(free[k], x.who, name, v) then k = k + 1 if v == "Huge" then hGiven = hGiven + 1 end end
          end
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
    if T.econ then T.econ.dirty = true end -- (pets moved, or what was planned is stale: work it out again)
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
  if not T.econBusy and (not T.econ or T.econ.dirty or os.time() - (T.econ.t or 0) >= 90) then task.spawn(econ) end
  if not T.econ then T.pet.msg = "working out the team's pets" return end
  for _, s in ipairs(T.peers()) do if s.fresh and isLimited(s.holding) then T.pet.msg = "waiting: " .. s.name .. " is bringing a Limited" return end end
  if isLimited(LP:GetAttribute("SquishyEquipped")) then return end
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
      -- an alt at its pet limit first (it cannot adopt until some go), then the biggest trade, then
      -- the alt with the most pets
      if pl and pl.size > 0 then
        local n, mx = tonumber(s.pets) or 0, tonumber(s.petMax) or 60
        pl.rank = (n >= mx - 2 and 1000 or 0) + pl.size * 10 + n / 100
        if not best or pl.rank > best.rank then best = pl end
      end
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
T.lim = { busy = false, tries = 0, msg = "" }
local function mainHere()
  local main = Players:FindFirstChild(MAIN)
  local st
  for _, s in ipairs(T.peers()) do if s.name == MAIN then st = s end end
  return main, st
end
T.mainHere = mainHere
local function limitedToMain()
  if T.role ~= "alt" or T.lim.busy or not isLimited(LP:GetAttribute("SquishyEquipped")) then return end
  T.lim.busy = true
  local SAB = G.SAB
  local held = LP:GetAttribute("SquishyEquipped")
  local function say(m) if m ~= T.lim.msg then T.lim.msg = m note("TEAM LIMITED: " .. m) end end
  local ok, err = pcall(function()
    while T.alive and isLimited(LP:GetAttribute("SquishyEquipped")) do
      SAB.S.running = false -- (held for the whole time: nothing of the farm's may touch it)
      local main, st = mainHere()
      if not main then
        say("holding " .. tostring(held) .. " for " .. MAIN .. " - the main is not in this server, waiting")
      elseif not (st and st.fresh) then
        say("holding " .. tostring(held) .. " - waiting for the main's farm to report")
      elseif st.holding and st.holding ~= "" and not isLimited(st.holding) then
        say("holding " .. tostring(held) .. " - waiting for the main's hands to be free (" .. tostring(st.holding) .. ")")
      elseif isLimited(st.holding) then
        say("holding " .. tostring(held) .. " - the main is busy with another Limited, waiting")
      else
        standUp()
        local th = nearTo(main)
        task.wait(0.8)
        local gp = th and th:FindFirstChild("GivePrompt")
        if gp and gp.Enabled then pcall(fireproximityprompt, gp) else pcall(function() RS.Remotes.GiveSquishy:FireServer(main) end) end
        local t0 = os.clock()
        repeat task.wait(0.2) until not isLimited(LP:GetAttribute("SquishyEquipped")) or os.clock() - t0 > 5
        if not isLimited(LP:GetAttribute("SquishyEquipped")) then
          T.toMain = T.toMain + 1
          T.lim.tries = 0
          note("TEAM LIMITED: gave " .. tostring(held) .. " to the main (" .. MAIN .. ")")
          T.lim.msg = ""
          break
        end
        T.lim.tries = T.lim.tries + 1
        say(("the main did not take %s yet (try %d) - trying again"):format(tostring(held), T.lim.tries))
      end
      task.wait(T.lim.tries > 0 and 12 or 4)
    end
  end)
  if not ok then note("TEAM LIMITED error: " .. tostring(err)) end
  T.lim.busy = false
  -- the farm runs again only once the Limited is out of this account's hands
  if not isLimited(LP:GetAttribute("SquishyEquipped")) then SAB.S.running = true end
end
T.limitedToMain = limitedToMain
-- rank 20 (Pecan Pie) on an alt: only with the main here, its hands free and no other Limited on the way
function T.claimPecan(r)
  if T.role ~= "alt" or not T.claimAltPecan or os.time() >= PASS_CLAIM_END then return end
  if os.clock() < (T.lim.claimAt or 0) then return end
  T.lim.claimAt = os.clock() + 30
  local held = LP:GetAttribute("SquishyEquipped")
  local main, st = mainHere()
  local why
  if not main or not (st and st.fresh) then why = "the main is not here"
  elseif st.holding and st.holding ~= "" then why = "the main's hands are full"
  elseif T.tr.active then why = "a pet trade is on"
  elseif held and held ~= "" then why = "this account's hands are full"
  else
    for _, s in ipairs(T.peers()) do if s.fresh and isLimited(s.holding) then why = s.name .. " is bringing one already" end end
  end
  if why then T.lim.msg = "rank 20 waits: " .. why return end
  local SAB = G.SAB
  SAB.S.running = false
  local t0 = os.clock()
  while SAB.S.busy and os.clock() - t0 < 15 do task.wait(0.2) end
  held = LP:GetAttribute("SquishyEquipped")
  if SAB.S.busy or (held and held ~= "") then SAB.S.running = true T.lim.msg = "rank 20 waits: the farm was busy" return end
  local ok, res = pcall(function() return r:InvokeServer("claim", 20, "free") end)
  if not (ok and type(res) == "table" and res.ok) then
    SAB.S.running = true
    note("TEAM LIMITED: rank 20 claim refused: " .. tostring(type(res) == "table" and (res.reason or res.text) or res))
    return
  end
  T.claimed = T.claimed + 1
  t0 = os.clock()
  repeat task.wait(0.2) until isLimited(LP:GetAttribute("SquishyEquipped")) or os.clock() - t0 > 8
  local got = LP:GetAttribute("SquishyEquipped")
  if isLimited(got) then
    note("TEAM LIMITED: claimed rank 20 - " .. tostring(got) .. " is in hand, taking it to the main")
    limitedToMain()
  else
    note("TEAM LIMITED: claimed rank 20 - the butter did not come to the hand (" .. tostring(got) .. ")")
    SAB.S.running = true
  end
  T.refreshPass()
end
T.conns = T.conns or {}
T.conns[#T.conns + 1] = LP:GetAttributeChangedSignal("SquishyEquipped"):Connect(function()
  local held = LP:GetAttribute("SquishyEquipped")
  if T.alive and isLimited(held) and T.role == "alt" then
    local SAB = G.SAB
    if SAB then SAB.S.running = false end -- at once, before CHURN carries it to a station
    task.spawn(limitedToMain)
  elseif T.alive and held and held ~= "" and T.role == "alt" and T.guildPass and T.guildPass(held) then
    -- a butter came in while a guild give quest is open and one of ours can take it: passed on at
    -- once (CHURN would have it on a station within seconds)
    local SAB = G.SAB
    if SAB then SAB.S.running = false end
    task.spawn(function()
      task.wait(0.3)
      local ok, did = pcall(T.guildTick, true)
      if not (ok and did) and SAB then SAB.S.running = true end
    end)
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
  -- a reload of this module leaves the old cards behind: clear them first
  for _, c in ipairs(U.alt:GetChildren()) do if c:GetAttribute("SABTeam") then c:Destroy() end end
  local C = U.C
  local me = U.card(U.alt, "This account", T.role == "main" and "MAIN" or "ALT")
  me:SetAttribute("SABTeam", true)
  T.ui.root = me
  T.ui.mode = U.line(me, C.accent)
  T.ui.stats = U.line(me, C.good)
  T.ui.pass = U.line(me, C.info)
  T.ui.guild = U.line(me, C.info)
  if T.role == "main" then
    local r = U.row(me, 26)
    T.ui.feedB = U.button(r, "", C.panel2, 10, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0))
    U.click(T.ui.feedB, function() T.feed.on = not T.feed.on note("TEAM: Sushi feeder " .. (T.feed.on and "on" or "off")) end)
  end
  local all = U.card(U.alt, "Accounts in this server", "from SAB/team")
  all:SetAttribute("SABTeam", true)
  T.ui.rows = {}
  for i = 1, 8 do
    local l, d = U.line(all, C.dim)
    l.Parent.Visible = false
    T.ui.rows[i] = { l = l, d = d }
  end
  local ps = U.card(U.alt, "Thanksgiving pass", "rank 20 = Pecan Pie Butter")
  ps:SetAttribute("SABTeam", true)
  T.ui.passRows = {}
  for i = 1, 8 do
    local l = U.line(ps, C.accent2)
    l.Parent.Visible = false
    T.ui.passRows[i] = l
  end
  local lg = U.card(U.alt, "Team log")
  lg:SetAttribute("SABTeam", true)
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
  local Cn = T.clan
  if Cn.inClan then
    U.put(T.ui.guild, ("guild %s: quests %d/%d, %d pts%s%s%s"):format(Cn.name, Cn.done, Cn.n, Cn.points,
      T.g.gives > 0 and (" | passed on " .. T.g.gives) or "", T.g.bought > 0 and (" | shop " .. T.g.bought) or "",
      Cn.open > 0 and (" | open: " .. table.concat(Cn.texts, "; ")) or " | all done today"))
  else
    U.put(T.ui.guild, "guild: not in one (joining is picked up by itself)")
  end
  if T.ui.feedB then
    U.put(T.ui.feedB, T.feed.on and "SUSHI FEEDER: ON (gives Dotonbori/Picnic butters to alts with room)" or "SUSHI FEEDER: OFF")
    T.ui.feedB.BackgroundColor3 = T.feed.on and C.good or C.panel2
    T.ui.feedB.TextColor3 = T.feed.on and C.ink or C.dim
  end
  local list = { { name = T.me, role = T.role, free = nil, stations = LP:GetAttribute("WaxStations"), holding = LP:GetAttribute("SquishyEquipped"),
    seated = tostring(seated()), rank = P.rank, points = P.points, open = P.open, fresh = true, mode = T.mode,
    guild = T.clan.n > 0 and (T.clan.done .. "/" .. T.clan.n) or "none" } }
  for _, s in ipairs(T.peers()) do list[#list + 1] = s end
  table.sort(list, function(a, b) if a.role ~= b.role then return a.role == "main" end return a.name < b.name end)
  for i, r in ipairs(T.ui.rows) do
    local s = list[i]
    r.l.Parent.Visible = s ~= nil
    if s then
      local hold = (s.holding and s.holding ~= "") and (" | holding " .. tostring(s.holding):gsub("Butter$", "")) or ""
      U.put(r.l, ("%s%s  %s%s%s"):format(s.name, s.role == "main" and " (main)" or "",
        s.fresh and "" or "OFFLINE ", s.free and ("free " .. s.free .. "/" .. tostring(s.stations)) or ("stations " .. tostring(s.stations)),
        hold .. (s.seated == "true" and " | at the campfire" or "") .. ((s.guild and s.guild ~= "none") and (" | guild " .. tostring(s.guild)) or "")))
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


---------------------------------------------------------------- guild quests an alt does on purpose
-- give / giveTo: a butter in hand is passed on to one of ours that has not had one from this account
-- since the reset - a Sushi or another good butter only to an alt with a free station (it waxes it, so
-- nothing is lost), anything else to the poorest (it sells it). With nothing to pass for 5 min, and for
-- a buy quest, the alt buys what its pad shows (never without the money) and rolls its lever for more.
local function rarityOf(n) local v = n and SI[n] return type(v) == "table" and v.rarity or nil end
local function guildTo(held)
  local Cn = T.clan
  local good = isGood(held)
  local best
  for _, s in ipairs(T.peers()) do
    if s.fresh and s.player and (s.holding == nil or s.holding == "") and tostring(s.trading) ~= "true"
      and os.clock() >= (T.feed.wait[s.name] or 0) and T.g.given[s.name] ~= Cn.resetsAt then
      if good then
        -- an alt that waxes it
        if s.role == "alt" and (s.free or 0) > 0 and (s.stations or 0) >= 3 and (not best or (s.free or 0) > (best.free or 0)) then best = s end
      elseif s.role == "alt" or not best then
        -- anything else: the poorest alt sells it (the main only when no alt is there)
        if not best or best.role == "main" or (tonumber(s.cash) or 0) < (tonumber(best.cash) or 0) then best = s end
      end
    end
  end
  return best
end
local function guildTick(now)
  if T.role ~= "alt" or T.tr.active then return false end
  local Cn = clanState()
  if not Cn.inClan or Cn.open == 0 then T.g.msg = Cn.inClan and "all guild quests done" or "" return false end
  local SAB = G.SAB
  local plainLeft = (Cn.left.give or 0) + (Cn.left.giveTo or 0)
  local giveLeft = plainLeft + (Cn.left.giveRare or 0)
  local buyLeft = Cn.left.buy or 0
  if giveLeft <= 0 and buyLeft <= 0 then T.g.idleSince = nil return false end
  if (not now and os.clock() < T.g.at) or os.clock() < (T.feed.globalWait or 0) then return false end
  local held = LP:GetAttribute("SquishyEquipped")
  if held and held ~= "" then
    T.g.idleSince = nil
    if isLimited(held) or giveLeft <= 0 then return false end
    -- a butter this account keeps for its battle pass quests (waxing) stays, unless bought for this
    if T.pass.live and T.pass.need and not isGood(held) and held ~= T.g.mine then return false end
    -- only the "give a <rarity> butter or rarer" quest left: only a butter that rare counts
    if plainLeft <= 0 then
      local r = RANK[rarityOf(held) or ""]
      if not (Cn.giveRar and r and r >= RANK[Cn.giveRar]) then return false end
    end
    local s = guildTo(held)
    if not s then T.g.msg = "guild give: nobody to pass the " .. tostring(held) .. " to yet" return false end
    T.g.at = os.clock() + 3
    if give(s) then
      T.g.gives = T.g.gives + 1
      note(("TEAM GUILD: passed %s to %s for the guild quest"):format(tostring(held), s.name))
    end
    return true
  end
  -- nothing in hand: wait a while for a butter to pass on (the main's Sushis), then make one
  T.g.idleSince = T.g.idleSince or os.clock()
  -- (a bought butter is almost never rare enough for the rare one: that one waits for a Sushi)
  if buyLeft <= 0 and (plainLeft <= 0 or os.clock() - T.g.idleSince < 300) then
    T.g.msg = "guild give: waiting for a butter to pass on"
    return false
  end
  T.g.at = os.clock() + 4
  local pn = padName()
  if pn and not isLimited(pn) then
    local price = SI[pn] and tonumber(SI[pn].price)
    local b = buyPrompt()
    -- never without the money (a short buy opens a Robux offer): twice the price at least
    if b and b.Enabled and price and money() >= price * 2 then
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
        T.g.buys = T.g.buys + 1
        T.g.mine = LP:GetAttribute("SquishyEquipped")
        T.g.msg = ("guild quest: bought %s (%d bought)"):format(tostring(pn), T.g.buys)
        if buyLeft > 0 then T.clan.at = math.min(T.clan.at, os.clock() - 50) end
      end
      return true
    end
  end
  local lp, w = SAB.QX.lever()
  if lp and w then
    SAB.S.running = false
    standUp()
    local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if hrp then hrp.CFrame = w.CFrame * CFrame.new(0, 0, -4) end
    task.wait(0.4)
    pcall(fireproximityprompt, lp)
    T.g.pulls = T.g.pulls + 1
    task.wait(1.2)
    SAB.S.running = true
    T.g.msg = "guild quest: rolling for a butter to " .. (buyLeft > 0 and "buy" or "give")
    return true
  end
  return false
end
T.guildTick = guildTick
-- would a butter that just came in be passed on for an open guild give quest? (no server calls)
function T.guildPass(held)
  local Cn = T.clan
  if T.role ~= "alt" or T.tr.active or not Cn.inClan or isLimited(held) then return false end
  if T.pass.live and T.pass.need and not isGood(held) and held ~= T.g.mine then return false end
  local plain = (Cn.left.give or 0) + (Cn.left.giveTo or 0)
  if plain + (Cn.left.giveRare or 0) <= 0 then return false end
  if plain <= 0 then
    local r = RANK[rarityOf(held) or ""]
    if not (Cn.giveRar and r and r >= RANK[Cn.giveRar]) then return false end
  end
  if os.clock() < (T.feed.globalWait or 0) then return false end
  return guildTo(held) ~= nil
end
-- points: shop items cost guild points only. An alt (never the main: its points are the user's) buys
-- Speedy Wax while 3+ of its waxes run, and Guild XP with what is over 300 points.
local SHOP_ORDER = { "d_wax15", "wax10", "d_xp600", "xp300", "xp1000" }
local function guildShop()
  local Cn = T.clan
  if T.role ~= "alt" or not Cn.inClan or T.shopOff or os.clock() < T.g.shopAt then return end
  T.g.shopAt = os.clock() + 90
  local shop = Cn.shop
  if type(shop) ~= "table" then return end
  local items = {}
  for _, it in ipairs(type(shop.daily) == "table" and shop.daily or {}) do if type(it) == "table" and it.id then items[it.id] = it end end
  for _, it in ipairs(type(shop.list) == "table" and shop.list or {}) do if type(it) == "table" and it.id then items[it.id] = it end end
  local waxing = tonumber(LP:GetAttribute("WaxingCount")) or 0
  for _, id in ipairs(SHOP_ORDER) do
    local it = items[id]
    local price = it and tonumber(it.price)
    if it and price and not it.bought and not it.locked and not it.party and not it.exclusive and price <= Cn.points then
      local useful
      if it.kind == "perk" and it.perk == "wax" then useful = waxing >= 3 and os.time() >= (T.g.waxUntil or 0)
      elseif it.kind == "xp" then useful = Cn.points - price >= 300 end
      if useful then
        local ok, v = pcall(function() return RS.Remotes.ClanRequest:InvokeServer("buy", id) end)
        if ok and type(v) == "table" and v.ok then
          T.g.bought = T.g.bought + 1
          if it.kind == "perk" then T.g.waxUntil = os.time() + (tonumber(it.minutes) or 10) * 60 end
          note(("TEAM GUILD: bought %s for %d points"):format(tostring(it.text or id), price))
        else
          note(("TEAM GUILD: shop said no to %s: %s"):format(tostring(it.text or id), tostring(type(v) == "table" and (v.reason or v.text) or v)))
          T.g.shopAt = os.clock() + 600
        end
        T.refreshClan()
        return
      end
    end
  end
end
T.guildShop = guildShop
-- an invite from the main's own guild is taken (the user invites the alts there; nothing else is joined)
local function guildJoin()
  local Cn = T.clan
  if T.role ~= "alt" or Cn.inClan or #Cn.invites == 0 or os.clock() < (T.g.joinAt or 0) then return end
  T.g.joinAt = os.clock() + 60
  local main
  for _, s in ipairs(T.peers()) do if s.role == "main" and s.fresh then main = s end end
  local gid, graw = main and tostring(main.gid or "") or "", main and tostring(main.graw or "") or ""
  if gid == "" then return end
  for _, iv in ipairs(Cn.invites) do
    local id = iv.id or iv.c
    if type(iv) == "table" and id and (tostring(id) == gid or (graw ~= "" and tostring(iv.name or iv.nm or "") == graw)) then
      local ok, v = pcall(function() return RS.Remotes.ClanRequest:InvokeServer("respond", id, true) end)
      note(("TEAM GUILD: invited to the main's guild %s by %s - %s"):format(tostring(iv.name or graw), tostring(iv.from or iv.f or "?"),
        (ok and type(v) == "table" and v.ok) and "joined" or ("not joined: " .. tostring(type(v) == "table" and (v.reason or v.text) or v))))
      T.refreshClan()
      return
    end
  end
end
T.guildJoin = guildJoin


---------------------------------------------------------------- the game's pop-ups between our own accounts
-- (all these accounts are ours: nothing to read) - "Trade Complete!" -> OK, a gift's reveal -> Close
-- (not "Say Thanks": that would put a thank-you pop-up on the giver's screen), a thank-you -> hidden
T.pops = { n = 0 }
local function press(btn)
  if not btn then return false end
  local done = false
  for _, sig in ipairs({ "Activated", "MouseButton1Click" }) do
    pcall(function()
      if type(firesignal) == "function" then firesignal(btn[sig]) done = true
      elseif type(getconnections) == "function" then
        for _, c in ipairs(getconnections(btn[sig])) do pcall(function() c:Fire() end) done = true end
      end
    end)
    if done then break end
  end
  return done
end
local POPS = {
  { name = "TradeResultGui", button = { "Well", "OkButton" } },
  { name = "GiftRevealGui", button = { "Stage", "CloseButton" } },
  { name = "GiftThanksGui" },
}
local function popupTick()
  local pg = LP:FindFirstChild("PlayerGui")
  -- "<name> helped your wax!" (a guild member, or anyone): the card's own "Thank" button
  local hn = pg and pg:FindFirstChild("HelpNoteGui")
  local card = hn and hn:FindFirstChild("Card")
  if card and card.Visible and card:FindFirstChild("ThanksButton") then
    press(card.ThanksButton)
    T.pops.thanks = (T.pops.thanks or 0) + 1
  end
  local mg = pg and pg:FindFirstChild("MainGui")
  if not mg then return end
  -- the guild's own cards: one with a single button ("Yay!", "Got it!", "Yes" on a welcome) is only news
  -- and is closed with it; one with a choice (an invite, "join a guild", a friend's guild) is left alone
  local cp = mg:FindFirstChild("ClanPopupGui")
  if cp and cp.Visible then
    local pb, sb = cp:FindFirstChild("PrimaryButton", true), cp:FindFirstChild("SecondaryButton", true)
    if pb and not (sb and sb.Visible) and os.clock() >= (T.pops.clanAt or 0) then
      T.pops.clanAt = os.clock() + 2
      press(pb)
      T.pops.clan = (T.pops.clan or 0) + 1
    end
  end
  for _, pp in ipairs(POPS) do
    local g = mg:FindFirstChild(pp.name)
    if g and g:IsA("GuiObject") and g.Visible then
      local btn = g
      for _, part in ipairs(pp.button or {}) do btn = btn and btn:FindFirstChild(part) end
      if pp.button and btn ~= g then press(btn) end
      task.delay(0.8, function() if g.Visible then g.Visible = false end end) -- in case the press did nothing
      T.pops.n = T.pops.n + 1
    end
  end
end
T.popupTick = popupTick

---------------------------------------------------------------- loop
task.spawn(function()
  note("TEAM v" .. T.version .. ": " .. T.me .. " as " .. T.role)
  while T.alive and G.SAB_TEAM == T do
    local SAB = G.SAB
    if SAB and SAB.S and SAB.S.alive and T.role == "alt" and isLimited(LP:GetAttribute("SquishyEquipped")) then
      -- a Limited in hand: the farm stays paused and the one job is taking it to the main
      SAB.S.running = false
      T.mode = "holding " .. tostring(LP:GetAttribute("SquishyEquipped")) .. " for the main: " .. (T.lim.msg ~= "" and T.lim.msg or "on the way")
      if not T.lim.busy then task.spawn(limitedToMain) end
      pcall(writeMe)
      pcall(popupTick)
      local U = SAB.U
      if U and U.alt and U.alt.Visible then pcall(T.paint) end
    elseif SAB and SAB.S and SAB.S.alive then
      pcall(passState)
      pcall(clanState)
      pcall(claimRanks)
      local okU, errU = pcall(upgrades)
      if not okU then note("TEAM UP error: " .. tostring(errU)) end
      pcall(freebies)
      pcall(popupTick)
      local okP, errP = pcall(T.petTick)
      if not okP then note("TEAM PETS error: " .. tostring(errP)) end
      local ok, err = pcall(T.role == "main" and mainTick or altTick)
      pcall(guildShop)
      pcall(guildJoin)
      local okSell, errSell = pcall(T.sellTick)
      if not okSell then note("TEAM PETS sell error: " .. tostring(errSell)) end
      local okG, didG = true, false
      if ok and T.role == "alt" and not T.tr.active then
        okG, didG = pcall(guildTick)
        if not okG then note("TEAM GUILD error: " .. tostring(didG)) didG = false end
      end
      if ok and T.role == "alt" and not T.tr.active and not didG then
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
