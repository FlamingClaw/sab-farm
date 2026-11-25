--[[ SAB alt boot: one line per account after joining the private server.
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/dev/altboot.lua?t=" .. tick()))()
  Loads the bridge and CHURN, then the multi-account settings:
    o_oFlame3 (main): Auto Roll on, keeps Sushi + Dotonbori crates, plus Divine butters so alts always have a wax to help
    every other account (alt): keeps + waxes every butter it pulls except Limited ones (wax quests, help targets)
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
local SI = require(game:GetService("ReplicatedStorage").Modules.SquishyInfo)
local function k(n) return (n:lower():gsub("butter$", "")) end
if LP.Name == MAIN then
  CFG.AutoRoll = true
  CFG.BestCrate = true
  CFG.Targets.sushi = true
  for n, v in pairs(SI) do if type(v) == "table" and v.rarity == "Divine" then CFG.Targets[k(n)] = true end end
else
  for n, v in pairs(SI) do if type(v) == "table" and v.rarity ~= "Limited" then CFG.Targets[k(n)] = true end end
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
