# OpenQ4-GameLibs Agent Guide

This file describes project goals, rules, and upstream credits for anyone working on OpenQ4-GameLibs.

**Project Metadata**
- Name: OpenQ4-GameLibs
- Author: themuffinator
- Company: DarkMatter Productions
- Version: 0.0.1
- Website: `www.darkmatter-quake.com`
- Repository: `https://github.com/themuffinator/OpenQ4-GameLibs`
- Companion Engine Repo (local): `E:\Repositories\OpenQ4`

**Goals**
- Deliver compatibility-focused Quake 4 game libraries for OpenQ4 integration.
- Preserve behavior required by original Quake 4 SDK expectations and shipped game data.
- Maintain single-player and multiplayer parity where behavior should remain shared.
- Modernize build and maintenance workflows for current systems while avoiding gameplay regressions.
- Keep documentation and attribution current as upstream work is incorporated.

**Repository Rules (Agent-Only)**
- Compatibility with Quake 4 SDK behavior is the primary requirement.
- Treat public game-library interfaces used by the engine as stability boundaries unless coordinated cross-repo changes are intentional.
- Prefer engine or code fixes over shipping replacement content files when resolving compatibility issues.
- Keep `README.md` end-user focused: no local machine paths, no maintainer-only rules, and no internal-only process notes.
- Keep local references and maintainer procedures in `AGENTS.md`.
- Keep `README.md` and this file aligned when project direction changes.
- Retain both single-player and multiplayer build targets unless an explicit deprecation plan exists.
- Keep credits accurate and append attributions for newly integrated upstream/third-party work.

**Development Procedure (Recommended)**
1. Build game libraries from `source/q4sdk.sln` (Windows) or `source/SConstruct` (legacy/portability path).
2. Validate behavior using OpenQ4 (`E:\Repositories\OpenQ4`) against original Quake 4 assets.
3. Review runtime logs in the active Quake 4 install.
4. Iterate until compatibility and stability targets are met.

**Local References (Agent-Only, Not Included In Repo)**
- OpenQ4 engine project: `E:\Repositories\OpenQ4`
- Quake 4 SDK: `E:\_SOURCE\_CODE\Quake4-1.4.2-SDK`
- Upstream engine base (local folder name retained): `E:\_SOURCE\_CODE\Quake4Doom-master`
- Quake 4 BSE (Basic Set of Effects): `E:\_SOURCE\_CODE\Quake4BSE-master`
- Quake 4 engine decompiled (Hex-Rays): `E:\_SOURCE\_CODE\Quake4Decompiled-main`

**Upstream Credits**
- Upstream Quake4SDK (Quake 4 v1.4.2 SDK baseline).
- id Software.
- Raven Software.
- OpenQ4 contributors.
- Justin Marshall.
- Robert Backebans.
