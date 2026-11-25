--[[ SAB alt boot: one line per account after joining the private server.
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/dev/altboot.lua?t=" .. tick()))()
  Loads the bridge and CHURN, then the multi-account settings:
    o_oFlame3 (main): Auto Roll on, keeps Sushi + Dotonbori crates, plus Divine butters so alts always have a wax to help
    every other account (alt): keeps + waxes what it pulls only while a quest needs waxing/buying, campfire
    only once the day's quests are done
    all: help waxes, quests, memory limit 3000 MB, and NO automatic rejoins (scripts can't rejoin a private
    server, so CHURN's fallback would land in a public one)
]]
local MAIN = "o_oFlame3"
local BR = "https://raw.githubusercontent.com/FlamingClaw/sab-farm/dev/bridge.lua"
local FARM = "https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua"
if not game:IsLoaded() then game.Loaded:Wait() end
if game.PlaceId ~= 80959592833753 then return end -- only in Stack A Butter Squishy (safe in an autoexec folder)
local G = getgenv()
local LP = game:GetService("Players").LocalPlayer
if not (G.SAB_BRIDGE and G.SAB_BRIDGE.alive) then
  pcall(function() loadstring(game:HttpGet(BR .. "?t=" .. tick()))() end)
end
if not G.SAB then
  task.spawn(function() pcall(function() loadstring(game:HttpGet(FARM .. "?t=" .. tick()))() end) end)
end
local t0 = os.clock()
while not (G.SAB and G.SAB.CFG and G.SAB.S) and os.clock() - t0 < 120 do task.wait(1) end
local SAB = G.SAB
if not SAB then warn("altboot: CHURN did not load") return end
local CFG, S, HX, PF = SAB.CFG, SAB.S, SAB.HX, SAB.PF
CFG.Rejoin = false
S.rejoining = true
CFG.Help = true
CFG.Quests = true
CFG.MemLimit = 3000
CFG.Teams, CFG.AutoBuild, CFG.Lite, CFG.Calm = true, true, true, true
if LP.Name == MAIN then CFG.AutoFuse, CFG.PetBuy, CFG.PetWish = true, true, true end
local SI = require(game:GetService("ReplicatedStorage").Modules.SquishyInfo)
local function k(n) return (n:lower():gsub("butter$", "")) end
if LP.Name == MAIN then
  CFG.AutoRoll = true
  CFG.BestCrate = true
  CFG.Targets.sushi = true
  for n, v in pairs(SI) do if type(v) == "table" and v.rarity == "Divine" then CFG.Targets[k(n)] = true end end
else
  -- alts: keep + wax butters only while a quest needs it (wax / rare / buy), otherwise sell so the
  -- lever pulls keep going; the campfire (its seat holds every walking job) waits for the day's quests
  local ALL = {}
  for n, v in pairs(SI) do if type(v) == "table" and v.rarity ~= "Limited" then ALL[k(n)] = true end end
  local r = game:GetService("ReplicatedStorage").Remotes.ThanksgivingAction
  G.SAB_ALT_LOOP = (G.SAB_ALT_LOOP or 0) + 1
  local me = G.SAB_ALT_LOOP
  task.spawn(function()
  while G.SAB_ALT_LOOP == me and G.SAB and G.SAB.S.alive do
    local ok, st = pcall(function() return r:InvokeServer("state") end)
    local need, open = false, false
    if ok and type(st) == "table" and st.live then
      for _, q in ipairs(st.quests or {}) do
        if not q.done then open = true end
        if not q.done and (q.kind == "stack" or q.kind == "rare" or q.kind == "buy") then need = true end
      end
    end
    -- the campfire seat holds every walking job, so it waits until the day's quests are done
    local C = G.SAB.CFG
    if open and C.Campfire then
      C.Campfire = false
      local hum = game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
      pcall(function() game:GetService("ReplicatedStorage").Remotes.LeaveSeat:FireServer() end)
      if hum and hum.Sit then hum.Sit = false; hum.Jump = true end
    elseif not open and ok and not C.Campfire then
      C.Campfire = true; G.SAB.CF.nextAt = 0
    end
    local T = G.SAB.CFG.Targets
    if need then for k in pairs(ALL) do T[k] = true end else for k in pairs(T) do T[k] = nil end end
    G.SAB_ALT_MODE = (need and "keep+wax (quest)" or "sell (pulls go on)") .. (open and ", campfire waits" or ", campfire on")
    task.wait(20)
  end
end)
end
-- help pause at 72% of the memory limit (the live build still has a fixed 900 MB)
if not HX._due0 then HX._due0 = HX.due end
HX.due = function()
  local m = PF.mem
  local cap = (CFG.MemLimit or 0) > 0 and math.floor(CFG.MemLimit * 0.72) or 900
  if m and m <= cap then PF.mem = 0 end
  local ok, r = pcall(HX._due0)
  PF.mem = m
  return ok and r or false
end
pcall(SAB.IX.compute); pcall(SAB.IX.sync, true)
G.SAB_ALT_BOOT = os.time()
print("altboot: " .. LP.Name .. (LP.Name == MAIN and " (main)" or " (alt)") .. " ready")
