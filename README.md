# SAB farm

Farm script for **Stack A Butter Squishy [ASMR]** (place `80959592833753`), built for Delta on Android.

## Run it

Paste this one line into your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamingClaw/sab-farm/main/SAB_Farm.lua?t=" .. tick()))()
```

The `?t=` suffix defeats GitHub's CDN cache, so you always get the newest version.

## What it does

It reacts to the Auto Roll pass. It never pulls the lever, never rolls, and never touches the Limited holder.

- **Buys only what you tick.** The BUTTERS tab lists every butter in the game grouped by rarity, worst at the top down to the best at the bottom. The ordering is read from the game's own crate data (drop chance = rank, crate price = rarity rank) and cached, so a new rarity sorts itself after an update.
- **Checks your hands before waxing.** A butter someone gifts you, or anything else you did not tick, is never placed on a station. It is sold instead.
- **Opens crates** you tick in the CRATES tab, with no window: it steps next to the crate stand, asks the server to open it, and steps back (since the November update the server only opens a crate for someone standing at it). Crates you did not tick are left alone.
- **Adopts pets** (PETS tab): tick BUY on any pet and it is adopted from Biscuit's pen the moment one shows up, from anywhere on the map. ANY/BIG picks whether only the Big version counts. Stops when your pet bag is full or you are short of cash.
- **Fuses Bigs and stops buying when it has enough** (PETS tab): FUSE sets how many Big copies you want of a pet. Buying and wishing for it stop once there are enough copies for that goal, and AUTO FUSE turns every 7 copies into a Big (spare copies first, never one you are wearing if it can help it).
- **Builds the teams from your pets** (TEAMS tab, AUTO BUILD TEAMS): after a fuse or new pets it works out the best farm, full, glaze and wax teams from everything you own and re-saves them (never while a wax is about to finish).
- **Keeps wishes running** (PETS tab): tick WISH and it keeps a wish going on that pet in your server, re-wishing within about a second of the old one ending. A pet someone else already wished on is left alone until their wish ends (one wish per pet per server). Free wishes are used before cash.
- **Switches pet teams** (TEAMS tab), using the teams you saved in the game's Teams page. Every running wax goes at the speed of the pets you are wearing right now (measured: putting the wax team on cut every station's time by x1.71 at once), so the times come from each station's own countdown, not from when the butter was placed. The GLAZE team goes on 45 s (adjustable, counted at the glaze team's speed) before a wax finishes and stays until it has; the WAX team (head starts, which are decided at the drop) while a butter is placed; the FULL team (money + wax speed) while every station is busy; the NORMAL team (money + luck for Apple Pies) the rest of the time. Each finish is counted once. The tab lists your running waxes with time left and helps.
- **Closes the "Name your pet" window** after each adopt, the way the game's Later button does, so it never sits on the screen with the keyboard up. You can name pets later from the pet menu.
- **Helps other players' waxes** (FARM tab, HELP WAXES): between its own jobs it steps next to each wax in your server it is allowed to help, helps it once (10% off their wax, the game's own Help request), and goes back where it was when there is none left. The server only takes a help from someone standing at the station, so it has to step over; it keeps the game's rules (long waxes, one help each, under 6 helpers, over a minute left, not someone who turned helping off). GUILD CALLS answers guildmates' "Need help with a wax" calls from wherever you are.
- **Sits at the event campfire** (FARM tab, CAMPFIRE, on by default): every weather event brings a campfire with 6 log seats; each camper adds +50% cash for everyone sitting. The farm takes a free seat and carries on with everything else from it (the seat and the boost stay while it moves around).
- **GHOST** (FARM tab, or the small "G:" button under the floating SAB button), three settings: **OFF** plain teleports, and you can walk around freely between jobs. **HELP** helps are sent from inside the waxing butter, then you are put back where you were. **FULL** also waits inside the solid ground under your base between jobs. Only your position can be hidden: name tags, the leaderboard and the name over your head come from the server and the other players' screens.
- **Quests** (FARM tab, QUESTS, on by default): claims finished event quests and the day's quest bonus (never the season pass's rank rewards). For "Pull the lever N times" quests (guild or event) it pauses Auto Roll, whose pulls don't count, pulls the lever itself between its own jobs (an Apple Pie that rolls is still bought), and switches Auto Roll back on when they're done. It never rolls away a butter the game asks about. For "Collect your cash N times" it collects every 15 s until done. Buy / wax / help quests are covered by the farm already.
- **BASES** switch (SETUP tab, tap to cycle): **ALL DRAWN** → **OTHERS HIDDEN** (other players' bases, stacks and butters aren't drawn) → **ALL HIDDEN** (your own base and stack tower too). Much less for the phone to draw. Nothing is removed, so farming, buying and helping waxes all keep working; tap back to ALL DRAWN and everything reappears.
- **AUTO INDEX** (FARM tab): a butter only counts in your Index once a wax of it has *finished*. With this on, every butter you have never finished is bought once and waxed, and not bought again while that wax runs. It reads the game's own butter list, so a new rarity's butters are picked up the moment the update is live. Limited butters (Robux / event-only) are never counted or bought, and the 4 Common butters are left out too (Auto Roll can't stop on them).
- **BEST BUTTER** (FARM tab, tap to cycle OFF → TOP 1 → TOP 2 → TOP 3 → UPGRADES): buys the game's top 1–3 butters by income *instead of* your BUTTERS ticks. When an update adds a better butter, it takes over by itself. **UPGRADES** buys the top butter plus, once your stack is full, every butter that earns more than the weakest one in it (so after an update the whole new rarity is bought, each one replacing a weaker butter). Turning it off puts your own ticks back.
- **BEST CRATE** (FARM tab): opens the most expensive crate the game has (a new one counts as soon as it exists), on top of anything ticked in CRATES.
- While any of those three is on, the farm sets the game's **Auto Roll choices** to stop on exactly what is wanted (and takes a butter off the list as soon as its index wax starts). Needs the Auto Roll pass.
- **GRAB SHOWER** (FARM tab, on by default): during an admin "butter shower" it steps onto the falling butters' pieces to grab them: wanted ones first (ticked / best / missing from your Index), then the rarest; one in hand at a time, so each is waxed or sold before the next.
- **Admin snap**: when the admin shows the "every wax finishes" glow, the glaze team goes on for the moment of the snap (needs TEAMS on with a glaze team).
- **Collects money** on an interval and steps off the pad afterwards.
- **Runs smoother overnight** (SETUP tab): LITE MODE switches off floating labels (including wax timers the game turns on later), sparkles and lighting extras (about +5 fps on a phone, the screen stays normal); HIDE GAME HUD hides the game's own menus; FPS CAP (30 / 15 / 10) keeps the phone cool; STOP 3D blanks the world behind the window. A memory watchdog rejoins the same server if memory stays above the limit (2000 MB by default) for 30 s, and a health line goes in the log every 30 min. Everything goes back to normal when switched off or on KILL.
- **Comes back by itself** after a disconnect or a server restart.

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
