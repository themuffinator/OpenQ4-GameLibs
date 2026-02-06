# OpenQ4-GameLibs

Open-source Quake 4 game libraries maintained for use with the OpenQ4 engine project.

## Overview
OpenQ4-GameLibs contains Quake4SDK-derived single-player and multiplayer game library code, maintained with a compatibility-first focus for modern development workflows.

## Included
- Game library source code in `source/game` and `source/mpgame`
- Shared SDK-era interfaces used by Quake 4 style game modules
- Legacy project/build files for Visual Studio and SCons workflows

## Not Included
- Retail Quake 4 assets (`.pk4`, textures, audio, media)
- A standalone engine executable

## Build
### Windows (Visual Studio)
1. Open `source/q4sdk.sln`.
2. Build `game` and/or `mpgame`.

### SCons (Legacy)
1. Open a shell in `source/`.
2. Run `scons` (or `scons -H` for options).

## Integration
- Intended to pair with OpenQ4 engine builds.
- Requires user-supplied Quake 4 game data.
- Companion engine repository: `https://github.com/themuffinator/OpenQ4`

## Project Goals
- Preserve original Quake 4 gameplay behavior.
- Maintain expected single-player and multiplayer parity.
- Improve long-term maintainability on modern systems.

## Credits
- Upstream Quake4SDK (Quake 4 v1.4.2 SDK baseline)
- id Software
- Raven Software
- OpenQ4 contributors

## License
GNU GPL v3. See `LICENSE`.
