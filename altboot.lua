--[[ SAB alt boot: one line per account after joining the private server.
  loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/dev/altboot.lua?t=" .. tick()))()
  Loads the bridge and CHURN, then the multi-account settings:
    o_oFlame3 (main): Auto Roll on, keeps Sushi + Dotonbori crates (its Sushi waxes are what the alts help)
    every other account (alt): see team.lua (quest-aware keep/sell, gifts never sold, campfire rules)
    all: help waxes, quests, memory limit 3000 MB, and NO automatic rejoins (scripts can't rejoin a private
    server, so CHURN's fallback would land in a public one)
]]
local MAIN = "o_oFlame3"
-- GitHub's raw links for a branch can be minutes stale, so the files are loaded by the branch's
-- newest commit (looked up once); the branch link is the fallback
local BRANCH = "dev" -- dev while the team build is tested
local REF = BRANCH
pcall(function()
  local body = game:HttpGet("https://api.github.com/repos/FlamingClaw/sab-farm/commits/" .. BRANCH)
  REF = body:match('"sha"%s*:%s*"(%x+)"') or BRANCH
end)
local function url(file) return "https://raw.githubusercontent.com/FlamingClaw/sab-farm/" .. REF .. "/" .. file .. (REF == BRANCH and ("?t=" .. tick()) or "") end
local BR, FARM, TEAM = url("bridge.lua"), url("SAB_Farm.lua"), url("team.lua")
if not game:IsLoaded() then game.Loaded:Wait() end
if game.PlaceId ~= 80959592833753 then return end -- only in Stack A Butter Squishy (safe in an autoexec folder)
local G = getgenv()
local LP = game:GetService("Players").LocalPlayer
if not (G.SAB_BRIDGE and G.SAB_BRIDGE.alive) then
  pcall(function() loadstring(game:HttpGet(BR))() end)
end
if not G.SAB then
  task.spawn(function() pcall(function() loadstring(game:HttpGet(FARM))() end) end)
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
-- pets: every account's four role teams under the same names (the main's saved teams are called
-- this; the alts' are made by AUTO BUILD the first time they have pets for them). The whole pet side
-- (plan, buying, fusing, building, switching) works only with these set.
CFG.TeamNormal, CFG.TeamFull, CFG.TeamGlaze, CFG.TeamWax = "farm", "full", "glaze", "wax"
CFG.Teams, CFG.AutoBuild = true, true
CFG.PetBuy, CFG.PetWish = true, true
CFG.SnapGlaze, CFG.Collect, CFG.SellJunk, CFG.AutoStart = true, true, true, true
CFG.Ghost, CFG.GhostHelps = false, false
CFG.Shower = false         -- as on the phone: no running off after falling butters
if LP.Name == MAIN then
  -- as the phone's "dotonbori sushi" config had it
  CFG.Every = 600          -- collect every 10 min (stays at the campfire longer)
  CFG.GhostHelps = true    -- hidden helps
  CFG.AutoFuse = true      -- the Fuse Pass: 3 copies a fuse
  CFG.HelpGuild = false
  CFG.AutoIndex = false
  CFG.Best = 0
else
  CFG.Every = 120          -- the alts need their cash for upgrades sooner
  CFG.AutoFuse = false     -- 7 copies without the pass: the copies wait for the main to fuse them
  CFG.HelpGuild = false
  CFG.AutoIndex = true     -- every index row is +1% income; quest pulls and gifts fill it
  CFG.Best = 0
  CFG.BestCrate = false
  CFG.AutoRoll = false     -- no Auto Roll pass on the alts
end
-- six game clients on one PC: everything that saves CPU / GPU / memory (each is a switch in SETUP)
CFG.Lite, CFG.Calm, CFG.NoRender, CFG.HideHud = true, true, true, true
CFG.HideBases, CFG.HideMine = true, true
CFG.FpsCap = 15
CFG.MainAccount = MAIN
if LP.Name == MAIN then CFG.AutoFuse, CFG.PetBuy, CFG.PetWish = true, true, true end
local SI = require(game:GetService("ReplicatedStorage").Modules.SquishyInfo)
local function k(n) return (n:lower():gsub("butter$", "")) end
if LP.Name == MAIN then
  CFG.AutoRoll = true
  CFG.BestCrate = true
  CFG.Targets.sushi = true
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
pcall(SAB.PF.applyAll)
-- saved as this account's own config, loaded on launch (CHURN starts with all of this even before
-- altboot runs; the autoload choice is per account)
if SAB.saveConfig then
  local name = "acct_" .. LP.Name
  pcall(SAB.saveConfig, name)
  pcall(SAB.setAutoload, name)
end
-- the team module: shared status between the accounts, the main's Sushi feeder, the alts' rules
pcall(function() loadstring(game:HttpGet(TEAM))() end)
G.SAB_ALT_BOOT = os.time()
G.SAB_ALT_REF = REF
print("altboot: " .. LP.Name .. (LP.Name == MAIN and " (main)" or " (alt)") .. " ready")
