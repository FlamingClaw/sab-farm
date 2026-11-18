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
- **Keeps wishes running** (PETS tab): tick WISH and it keeps a wish going on that pet in your server, re-wishing within about a second of the old one ending. A pet someone else already wished on is left alone until their wish ends (one wish per pet per server). Free wishes are used before cash.
- **Switches pet teams** (TEAMS tab), using the teams you saved in the game's Teams page: the GLAZE team from 45 s (adjustable) before any of your waxes finishes until it has, the WAX team while a butter is being placed (it waits for social pets like the Elephant to take effect), the FULL team while every station is busy (money + wax-stir pets), and the NORMAL team the rest of the time. A wax's time is fixed when it is placed and its glaze is rolled when it finishes, so that is all that is needed. The tab also lists your running waxes with time left and helps.
- **Collects money** on an interval and steps off the pad afterwards.
- **Runs smoother overnight** (SETUP tab): LITE MODE switches off floating labels, sparkles and lighting extras (about +5 fps on a phone, the screen stays normal); HIDE GAME HUD hides the game's own menus; FPS CAP (30 / 15 / 10) keeps the phone cool; STOP 3D blanks the world behind the window. A memory watchdog rejoins the same server if memory stays above the limit (2000 MB by default) for 30 s, and a health line goes in the log every 30 min. Everything goes back to normal when switched off or on KILL.
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
