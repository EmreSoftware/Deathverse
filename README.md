# Deathverse: Spatial Death Sounds, Death Messages, Killstreaks
Tired of bland death messages? It's time to elevate your game with our brainrot death system that brings chaos, laughter, and a dash of brutal honesty to every kill.

## License

[EmreSoftware Custom License v1.0](https://github.com/EmreSoftware/Deathverse/blob/main/LICENSE.md)


## Installation

Install [Deathverse on Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3428450850)

## Demo

https://youtu.be/FjCeoVTd0j0
## Features

- Death Messages

- Death Sounds 

- Killstreak Announcements

# Settings

| Settings             | cvar                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Disable Sounds (Server) | deathverse_enable_sounds 0 |
| Sound Volume (Client) | deathverse_volume X (Default = 0.5) |



## FAQ

**Q: Can I customize death sounds and messages?**  
A: Yes. You can assign specific sounds and messages to suicides, and kills - all locally for your server.

**Q: How are killstreaks tracked?**  
A: Killstreaks are tracked per-player and reset on death. You can define milestone thresholds (e.g., 3, 5, 10 kills) and set custom messages or sounds for each.

**Q: Does this addon affect performance?**  
A: Not at all. It’s fully event-driven with no `Think` loops or constant timers. Idle CPU usage is effectively zero.

**Q: Will this conflict with other addons?**  
A: Unlikely. It avoids overriding core GMod functions (like `GAMEMODE:PlayerDeath`) and uses clean, isolated hooks.

**Q: Can I disable specific features (e.g., sounds or messages)?**  
A: Currently, only death sounds can be disabled. More config options for toggling features like messages or killstreaks are planned in future updates.

**Q: Can I use this on my DarkRP or TTT server?**  
A: Yes. It works on any gamemode that uses `PlayerDeath` or `DoPlayerDeath`. Integration for custom kill logic can be added manually.

**Q: Can I upload this to the Workshop or rehost it?**  
A: No. Redistribution or reuploading is not allowed under the license. You must have explicit written permission from the author.

**Q: How do I add new sounds or kill messages?**  
A: You may edit the local config to add new sound paths or message templates for personal/server use only. Modified versions may not be shared or rehosted.

**Q: Is there a way to test it locally?**  
A: Yes. Launch a singleplayer game, spawn a bot (`bot` command in console), and try different weapons. Death messages and sounds should trigger normally.

## Optimizations

**Smart Event Hooking**  
Uses minimal and optimized hooks (`PlayerDeath`, `DoPlayerDeath`) without bloating the hook stack. No constant `Think` loops or wasteful polling.

**Lightweight Footprint**  
Efficient code footprint with no bloat, no unnecessary assets. Only loads what's needed at runtime.

**Zero Runtime File I/O**  
No disk read/write during gameplay. Sounds and killstreak data are preloaded or memory-managed to avoid lag spikes.

**Targeted Network Usage**  
Sends minimal and compressed net messages only to relevant clients (e.g., killer, victim, spectators).

**Idle-State CPU Zero Impact**  
Script remains idle unless a kill event occurs. Uses no cycles during normal gameplay.

**Sound Pre-Caching**  
All custom death/killstreak sounds are precached at map load to avoid first-time lag when played.

**Modular System**  
Separated client/server logic with clean, modular structure that doesn’t clutter global scope. Easy to disable/extend.

**Addon Conflict Resistant**  
Does not override or interfere with default GMod functions (e.g., no `GAMEMODE:PlayerDeath` overrides). Ensures compatibility with other addons.

## Roadmap

- **Additional NPC Support**  
  Extend support for NPC deaths, including kill messages and sounds triggered by NPC interactions.

- **Improved Configurability**  
  Add toggle options for kill messages, killstreaks, and other features via config files.

- **Addon Extension Compatibility**  
  Build support for modular third-party extensions (e.g., soundpacks, custom messages, killstreak modules), allowing creators to expand functionality without modifying core files.


- **Public Addon API**  
  Provide a clean and documented Lua API for developers to hook into kill events, override behaviors, or register custom killstreaks.

## Support

For support https://github.com/EmreSoftware/Deathverse/issues.


## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.

