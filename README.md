# CHURN

**CHURN** is a butter farm for **Stack A Butter Squishy [ASMR]** (place `80959592833753`), built for Delta on Android.

## Run it

Paste this one line into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua?t=" .. tick()))()
```

The `?t=` suffix defeats GitHub's CDN cache, so you always get the newest version.

It reacts to the Auto Roll pass. It never pulls the lever (except for lever quests you have turned on), never rolls, and never touches the Limited holder.

## The window

A dark window with a gold accent. Drag it by its top bar. The round gold **C** button hides or shows it; hold and drag the button anywhere. Its small **G:** chip switches ghost mode without opening the window.

- **Top bar:** the RUNNING / STOPPED pill, **-** to fold the window down to its status line, and **X** to close the script (same as KILL).
- **Status line:** what the farm is doing right now. It stays visible on every tab.
- **Rail:** nine tabs down the left side.

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

## What it does

### 🌾 Farm
- **Buys only what you tick** on the Butters tab. It checks your hands before waxing: a butter someone gifts you, or anything else you did not tick, is never placed on a station. It is sold instead.
- **Collects money** on an interval and steps off the pad afterwards.
- **Quests** (on by default): claims finished event quests and the day's quest bonus (never the season pass's rank rewards).
  - "Pull the lever N times" quests (guild or event): Auto Roll pulls don't count, so it pauses Auto Roll, pulls the lever itself between its own jobs, and switches Auto Roll back on when they're done. An Apple Pie that rolls is still bought, and it never rolls away a butter the game asks about.
  - "Collect your cash N times" quests: it collects every 15 s until done.
  - Buy / wax / help quests are already covered by the farm.
- **Buys reliably:** it waits for the server after a long teleport, and retries quickly when cash is fine.

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
- **WISH:** keeps a wish going on that pet in your server, re-wishing within about a second of the old one ending. A pet someone else already wished on is left alone until their wish ends. Free wishes are used before cash.
- **FUSE** (1 / 2 / 3 / 7 Big): how many Big copies you want of that pet. Buying and wishing for it stop once there are enough copies for that goal. AUTO FUSE turns copies into Bigs, spare copies first and never one you are wearing if it can help it. 7 Bigs is what one Huge takes; you fuse the Huge yourself.
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
- **CAMPFIRE** (on by default): every weather event brings a campfire with 6 log seats, and each camper adds +50% cash for everyone sitting. The farm takes a free seat and carries on with everything else from it.
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
- **Configs:** save and load named configs, and pick one to load on launch.
- **Starting:** START FARMING ON LOAD, and an autoexec loader that restarts the newest version after a rejoin.
- **AUTO REJOIN:** comes back by itself after a disconnect or a server restart.
- **Performance:**

  | switch | what it does |
  | --- | --- |
  | NO ANIMATIONS | switches off the game's per-frame eye candy: the stack squish, the glaze rainbow, the conveyor, bounce pads, pets walking, sign and skin animations. On a phone, about 36 fps became 48–55. |
  | LITE MODE | switches off the game's heaviest extras: the roll reel (20-30 whole butters cloned for every roll), fireworks and confetti (each firework also shook the camera), toppings being re-added whenever you move between floors or bases (stacks are drawn plain instead), fairy lights, the leaderboard screens, floating labels, sparkles and lighting extras. On a phone the worst frames went from 0.7 s to under 0.1 s. |
  | BASES (tap to cycle) | ALL DRAWN → OTHERS HIDDEN → ALL HIDDEN. Nothing is removed, so farming keeps working. |
  | FPS CAP | 30 / 15 / 10, keeps the phone cool |
  | HIDE GAME HUD | hides the game's own menus |
  | STOP 3D | blanks the world behind the window |

  A memory watchdog rejoins the same server if memory stays above the limit (2000 MB by default) for 30 s. Everything goes back to normal when switched off or on KILL.

## Files

| file | what it is |
| --- | --- |
| `SAB_Farm.lua` | the script to run, compacted |
| `SAB_Farm_readable.lua` | the same code with names and comments intact |
| `loader.lua` | the one-line loader, for reference |

Both Lua files compile to identical bytecode; the compact one is just smaller to download.

## Bridge (for debugging with Claude)

Lets Claude run investigation code in your game and read the results through a **private** repo (`FlamingClaw/sab-bridge`).
Your GitHub token is pasted once in-game and stored only in Delta's workspace (`SAB_bridge_token.txt`).

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/bridge.lua?t=" .. tick()))()
```

A small "Bridge:" bar appears at the top (drag it anywhere; X stops it). Only run it while working with Claude.
