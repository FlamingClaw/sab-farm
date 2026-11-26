# CHURN

**CHURN** (v29) is a butter farm for **Stack A Butter Squishy [ASMR]** (place `80959592833753`). It runs on Delta (Android) and on Real (PC), on one account or as a team of several accounts in one server.

## Run it

Paste this one line into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua?t=" .. tick()))()
```

The `?t=` suffix defeats GitHub's CDN cache, so you always get the newest version.

It reacts to the Auto Roll pass. It never pulls the lever (except for lever quests you have turned on), never rolls, and never touches the Limited holder.

**It never spends Robux.** While it runs, every Robux prompt is dropped before Roblox shows it: the game's own Robux buttons, the remotes that ask the server for one (time skips, finish-wax offers, paid crates, gifts, the guild's paid quest Refresh and Robux guild making), and any prompt the server opens anyway, which is closed at once. It also never presses Buy without the money (a buy the server refuses for money opens a Robux offer).

**Limited butters** (Pecan Pie, Turkey, any event's own butter) are waxed only on the account set as `CFG.MainAccount`. On any other account one in hand is held: never waxed, sold or given to anyone else.

## The window

A dark window with a gold accent. Drag it by its top bar. The round gold **C** button hides or shows it; hold and drag the button anywhere. Its small **G:** chip switches ghost mode without opening the window.

- **Top bar:** the RUNNING / STOPPED pill, **-** to fold the window down to its status line, and **X** to close the script (same as KILL).
- **Status line:** what the farm is doing right now. It stays visible on every tab.
- **Rail:** ten tabs down the left side.

| tab | what is in it |
| --- | --- |
| 🏠 Home | START / STOP, KILL, today's numbers, what each system is doing, the activity log |
| 🌾 Farm | the buy - wax - collect loop, selling, Auto Roll, event quests, the by-hand buttons |
| 🧈 Butters | Auto Index, Best butter, and the butter list to tick |
| 📦 Crates | opening crates, Best crate, and the crate list to tick |
| 🐾 Pets | auto adopt, auto wish, auto fuse, and BUY / ANY / WISH / FUSE for every pet |
| 👥 Teams | auto teams, auto build, which saved team to wear when, and your running waxes |
| 🤝 Server | helping other players' waxes, guild calls, the campfire, ghost mode |
| ⚡ Admin | when the next admin show is, live boosts, the butter shower and the snap |
| ⚙ Settings | configs and load on launch, starting, auto rejoin, performance |
| 🔗 Alts | several accounts working together (filled in by `team.lua`, see below) |

## What it does

### 🌾 Farm
- **Buys only what you tick** on the Butters tab. It checks your hands before waxing: a butter someone gifts you, or anything else you did not tick, is never placed on a station. It is sold instead.
- **Collects money** on an interval and steps off the pad afterwards.
- **Quests** (on by default): claims finished event quests and the day's quest bonus (never the season pass's rank rewards).
  - "Pull the lever N times" quests (guild or event): Auto Roll pulls don't count, so it pauses Auto Roll, pulls the lever itself between its own jobs, and switches Auto Roll back on when they're done. An Apple Pie that rolls is still bought, and it never rolls away a butter the game asks about.
  - "Collect your cash N times" quests: it collects every 15 s until done.
  - Buy / wax / help quests are already covered by the farm.
- **Buys reliably:** it waits for the server after a long teleport, and retries quickly when cash is fine. It never presses Buy below the price, and a price it cannot read counts as too much.

### 🧈 Butters
- **Butter list:** every butter in the game, grouped by rarity, worst at the top down to the best at the bottom. The order is read from the game's own crate data and cached, so a new rarity sorts itself after an update.
- **AUTO INDEX:** a butter only counts in your Index once a wax of it has *finished*.
  - Every butter you have never finished is bought once and waxed, and not bought again while that wax runs.
  - It reads the game's own butter list, so a new rarity's butters are picked up the moment the update is live.
  - It never counts or buys Limited butters (Robux / event-only). It also leaves out the 4 Common butters, because Auto Roll can't stop on them.
- **BEST BUTTER** (tap to cycle OFF → TOP 1 → TOP 2 → TOP 3 → UPGRADES): buys the game's top 1–3 butters by income *instead of* your ticks. When an update adds a better butter, it takes over by itself. Turning it off puts your own ticks back.
  - **UPGRADES** buys only butters that earn more than the weakest one in your stack. Each one fills a new slot or replaces that weakest butter, so after an update the whole new rarity gets bought.
- While Auto Index, Best butter or Best crate is on, the farm sets the game's **Auto Roll choices** to stop on exactly what is wanted. Needs the Auto Roll pass.

### 📦 Crates
- **Opens the crates you tick**, with no window: it steps next to the crate stand, asks the server to open it, and steps back. Crates you did not tick are left alone.
- **BEST CRATE:** also opens the most expensive crate the game has, including a new one as soon as it exists.
- **Never stalls.** A crate that has not landed yet is not counted as a failure, the farm retries by itself after 45 s, and a crate that still won't open after 10 minutes is discarded.

### 🐾 Pets
- **BUY:** a pet with BUY ticked is adopted from Biscuit's pen the moment one shows up, from anywhere on the map. ANY / BIG picks whether only the Big version counts. It stops when your pet bag is full or you are short of cash.
- **WISH:** keeps a wish going on that pet in your server, re-wishing within about a second of the old one ending, and **stacks it to the game's 5** (wishing again on a running wish: x46 chance instead of x10, for a tiny share of your cash). Free wishes are used before cash.
- **The plan** (Pets tab): the best team for every role if you owned every pet in every size, using the game's own rules:
  - **Fuse passes:** 3 copies per fuse with the Fuse Pass (or Fuse Pass 4), 5 with Fuse Pass 5, else 7. The same number of Bigs makes a Huge.
  - **Huge boosts:** a Huge is x1.75 (a Big x1.5), and wearing a Huge raises the limit of its boost kind: income 50% → 60%, luck +3 → +4, Eagle find x3 → x3.5, roll speed 40% → 50%, glaze 25% → 30%, glaze-up 50% → 60%, head start 40% → 50%, wax speed 25% → 30%, long wax 30% → 40%. A Star Whale may also go 10% past the roll-speed limit.
  - Buying and wishing go on for a planned pet until you own what the plan needs (a Big = 3 copies, a Huge = 9 with the pass), plus one fuse's worth. A ticked pet that is in no best team is bought as you ticked it.
- **AUTO / KEEP** (each pet): AUTO fuses it into Bigs and Huges as the plan says. A fuse happens only when **every team is at least as good afterwards**: if fusing your 3 Big Goats into a Huge would drop the wax team's head start, it waits until there are more Goats. Spare copies are used first, and a fuse that takes a pet out of a team waits for a quiet moment. KEEP never fuses that pet.
- **Closes the "Name your pet" window** after each adopt, the way the game's Later button does.

### 👥 Teams
- **Wears the right saved team at each moment**, using the teams in the game's Teams page:
  - **GLAZE** from 45 s (adjustable) before a wax finishes, until it has.
  - **WAX** while a butter is being placed (head starts are decided at the drop).
  - **FULL** (money + wax speed) while every station is busy.
  - **NORMAL** (money + luck) the rest of the time.
- **AUTO BUILD TEAMS:** after a fuse or new pets it works out the best teams from everything you own and saves them again, never while a wax is about to finish.
- Every running wax goes at the speed of the pets you are wearing right now, so times come from each station's own countdown. The tab lists your running waxes with time left and helps.

### 🤝 Server
- **HELP WAXES:** between its own jobs it steps over to each wax in your server it is allowed to help and helps once (10% off their wax). It keeps the game's rules: long waxes only, one help each, under 6 helpers, over a minute left, and never someone who turned helping off.
- **GUILD CALLS:** answers guildmates' "Need help with a wax" calls from wherever you are.
- **CAMPFIRE** (on by default): every weather event brings a campfire with 6 log seats, and each camper adds +50% cash for everyone sitting (5 campers = +250%). The farm goes over to the fire (the logs only load near it), takes a free log and sits. The game's seat holds you in place, so jobs that need walking wait until the fire goes out (the money waits in the collector; pets, wishes and teams carry on).
- **GHOST:**
  - **OFF:** plain teleports.
  - **HELP:** helps are sent from inside the waxing butter.
  - **FULL:** also waits inside the ground under your base between jobs.

  Only your position can be hidden. Name tags and the leaderboard come from the server.

### ⚡ Admin
- **When:** a countdown to the next admin show, or "LIVE" with the time left.
- **Boosts now:** every admin boost running, with its multiplier and time left.
- **GRAB SHOWER** (on by default): during a butter shower it steps onto the falling pieces. Wanted ones go first (ticked, best, or missing from your Index), then the rarest. It holds one at a time, so each is waxed or sold before the next.
- **Glaze team for the snap:** when the admin's "every wax finishes" glow appears, the glaze team goes on for the snap (needs Teams on with a glaze team).
- **Show feed:** the show's effects as they happen.

### ⚙ Settings
- **Your game passes:** what you own (VIP, Auto Roll, Fast / Super Fast Wax, Fuse Pass tier, pet bag, pet slots, free wishes) and what the farm does with each.
- **Configs:** save and load named configs, and pick one to load on launch. The load-on-launch choice is kept per account (`SAB/autoload_<Name>.txt`), so several Roblox windows sharing one executor folder each load their own.
- **Starting:** START FARMING ON LOAD, and an autoexec loader that restarts the newest version after a rejoin.
- **AUTO REJOIN:** comes back by itself after a disconnect or a server restart.
- **Performance:**

  | switch | what it does |
  | --- | --- |
  | NO ANIMATIONS | switches off the game's per-frame eye candy: the stack squish, the glaze rainbow, the conveyor, bounce pads, pets walking, sign and skin animations. On a phone, about 36 fps became 48–55. Pets jump straight to where they were walking instead, so an adopted pet still reaches its owner's base (before, every adoption in the server stayed frozen at the pen). |
  | LITE MODE | switches off the game's heaviest extras: the roll reel (20-30 whole butters cloned for every roll), fireworks and confetti (each firework also shook the camera), toppings being re-added whenever you move between floors or bases (stacks are drawn plain instead), toppings being built for other players' bases as you walk up to them, fairy lights, the leaderboards, floating labels, sparkles and lighting extras. On a phone the worst frames went from 0.7 s to under 0.1 s. |
  | BASES (tap to cycle) | ALL DRAWN → OTHERS HIDDEN → ALL HIDDEN. While other bases are hidden, the butters in their stacks are also dropped from your phone's memory (43,000+ parts on a full server); they come back after a rejoin. Farming and helping keep working. |
  | FPS CAP | 30 / 15 / 10, keeps the phone cool |
  | HIDE GAME HUD | hides the game's own menus |
  | STOP 3D | blanks the world behind the window |

  A memory watchdog rejoins the same server if memory stays above the limit (1250 MB by default) for 20 s, or at once 250 MB above it: past about 1 GB Roblox starts dropping and reloading whole bases on a phone, which is where the freezes and app kills came from. Helping other players' waxes pauses while memory is over about 70% of the limit (900 MB at the default), since every help visit loads that whole base. Everything goes back to normal when switched off or on KILL.

## Several accounts on one PC (`team.lua`)

For a team of accounts in one (private) server, run this one line on every account (or put it in the executor's autoexec folder):

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/dev/altboot.lua?t=" .. tick()))()
```

`altboot.lua` loads the newest version of the bridge, CHURN and `team.lua`, sets every account up for its role (the main account is `o_oFlame3`), turns every performance saver on, and saves each account's config to load on launch. The accounts talk through the executor's shared folder (`SAB/team/`). What they do together:

- **The main feeds the alts:** it rolls (Auto Roll), keeps every Sushi / Dotonbori / Picnic butter, and walks it over to the alt that can use it with the game's Give prompt: a Sushi to the alt with the most free stations (waxed there), another good butter to an alt still missing it in its Index, else to the poorest alt still buying upgrades (which sells it for the cash). The main waxes nothing of its own, except a Limited or what a battle pass or guild quest asks for. Alts that have bought every upgrade roll their own levers and give to poorer alts too.
- **Every account** buys its next wax station, floor and stack pack with cash, claims the daily reward and offline earnings, does its quests, and claims its battle pass rank rewards one by one.
- **Limited butters go to the main:** an alt claims the pass's rank 20 butter only when the main is in the server with its hands free, pauses its farm, and walks the butter to the main (and nobody else), however long that takes. The main empties its hands for it and waxes it.
- **Guild:** an account in a guild is found by itself. Its guild quests are done on purpose (lever pulls, buys, and gives: a butter that comes in is passed on to one of the team that has not had one that day), it answers guildmates' help calls, spends guild points on Speedy Wax and Guild XP (never the main's points), and takes an invite to the main's guild (no other).
- **Pets, as one store:** every account adopts what the team needs and sends spare copies to the main, which fuses them with its Fuse Pass (3 a step) and hands the Bigs and Huges to the alts whose best teams lack them. Of the pets below Exotic the team keeps only what the accounts' best teams (of Huges) need; the rest is sold, never one in a team. Exotic and Cosmic pets are adopted and wished for good and fused on into a Huge stock on the main.
- **The game's pop-ups between the accounts** (gift reveals, Trade Complete, thank-yous, a guild helper's card) are closed by themselves.
- **The 🔗 Alts tab** shows this account's job, every account's stations, pass progress and guild, and the team log.

## Files

| file | what it is |
| --- | --- |
| `SAB_Farm.lua` | the script to run, compacted |
| `SAB_Farm_readable.lua` | the same code with names and comments intact |
| `loader.lua` | the one-line loader, for reference |
| `altboot.lua` | loads everything on each account of a team and sets it up for its role |
| `team.lua` | the accounts working together (above) |
| `bridge.lua` | the debugging bridge (below) |

Both Lua files compile to identical bytecode; the compact one is just smaller to download.

## Bridge (for debugging with Claude)

Lets Claude run investigation code in your game and read the results through a **private** repo (`FlamingClaw/sab-bridge`).
Your GitHub token is pasted once in-game and stored only in the executor's workspace (`SAB_bridge_token.txt`). Every account in a team can run it at once: each answers as itself.

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/bridge.lua?t=" .. tick()))()
```

A small "Bridge:" bar appears at the top (drag it anywhere; X stops it). Only run it while working with Claude.
