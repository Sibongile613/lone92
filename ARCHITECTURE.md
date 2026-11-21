# Architecture

## Runtime flow

1. The `mechfight.py` wrapper reads newline-delimited protocol messages from standard input.
2. On `hello`, it constructs `Bot` with the match configuration and sends `ready`.
3. On each `obs`, it calls `Bot.act` and sends one action with the matching tick.
4. On `end`, the wrapper exits.

The wrapper handles JSON transport and protocol lifecycle. The strategy lives in `lone_wolf_bot.py`.

## Bot decisions

- **Zone movement:** computes a target using the current and next safe-zone circles.
- **Target selection:** scores visible mechs using distance and relative health.
- **Combat movement:** strafes around a nearby opponent while blending movement toward the zone.
- **Aiming:** leads the target using the equipped gun's live projectile speed and aims at its cube-scaled center of mass.
- **Weapons:** applies range, ammo, reload, cooldown, energy, and laser-charge checks.
- **Upgrades:** scores available choices using their IDs, effects, and descriptions.
- **Loot:** picks up an eligible special weapon when it is within pickup range and the second slot is empty.

## Runtime behavior

The container uses Python's standard library and runs `lone_wolf_bot.py` with unbuffered output. The wrapper writes protocol messages to stdout and tracebacks to stderr. The match runner supplies the map at `/arena`; the current bot does not read or pathfind against map geometry.

## Known gaps

- It has no building-aware pathfinding or cover planner.
- It does not deliberately navigate toward cubes or supply drops.
- It has no checked-in unit tests or continuous-integration workflow. Use the Buildathon kit's conformance script before submitting.

