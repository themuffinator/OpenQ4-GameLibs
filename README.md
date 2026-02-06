# OpenQ4-GameLibs

Open-source Quake 4 game libraries maintained for use with the OpenQ4 engine project.

## Overview
OpenQ4-GameLibs contains Quake4SDK-derived single-player and multiplayer game library code, maintained with a compatibility-first focus for modern development workflows.

## Included
- Game library source code in `source/game` and `source/mpgame`
- Shared SDK-era interfaces used by Quake 4 style game modules
- Meson/Ninja build configuration for modern local builds

## Not Included
- Retail Quake 4 assets (`.pk4`, textures, audio, media)
- A standalone engine executable

## Build
### Windows (Meson + Ninja)
Meson/Ninja is the primary and only supported build workflow in this repository.

Requirements:
- Visual Studio C++ toolchain (`cl.exe`) in an **x86 Native Tools** environment
- Meson and Ninja

1. Configure:
   `meson setup builddir --backend ninja --buildtype release --vsenv`
2. Build:
   `meson compile -C builddir`
3. Outputs:
   `builddir/source/Gamex86.dll` and `builddir/source/MPGamex86.dll`

### Useful Configure Options
- Build single-player only:
  `meson setup builddir -Dbuild_mpgame=false`
- Build multiplayer only:
  `meson setup builddir -Dbuild_spgame=false`
- Enable legacy DebugInline behavior:
  `meson setup builddir --buildtype debug -Dinline_debug=true`

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
