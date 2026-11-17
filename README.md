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
- **Opens crates** when a butter you ticked can come out of one, and discards the rest so the roll loop is not left blocked.
- **Collects money** on an interval and steps off the pad afterwards.
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
