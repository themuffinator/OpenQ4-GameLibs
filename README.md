# OpenQ4-GameLibs

Open-source Quake 4 game libraries maintained for use with the OpenQ4 engine project.

## Overview
OpenQ4-GameLibs contains Quake4SDK-derived single-player and multiplayer game library code, maintained with a compatibility-first focus for modern development workflows.
This repository is the canonical home for SDK/game-library source used by the OpenQ4 workspace.

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
   `powershell -ExecutionPolicy Bypass -File tools/build/meson_setup.ps1 setup --wipe builddir . --backend ninja --buildtype release --vsenv`
2. Build:
   `powershell -ExecutionPolicy Bypass -File tools/build/meson_setup.ps1 compile -C builddir`
3. Outputs:
   `builddir/source/Gamex86.dll` and `builddir/source/MPGamex86.dll`

From OpenQ4, you can invoke this same flow with:
`powershell -ExecutionPolicy Bypass -File tools/build/build_gamelibs.ps1`

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
- Default local companion path: `..\OpenQ4` (sibling repo layout).
- OpenQ4 build wrappers can invoke this repository directly from `..\OpenQ4-GameLibs`.

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
