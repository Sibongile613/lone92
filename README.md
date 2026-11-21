# Lone Wolf Mech 33

A Python bot for Builders Mech Royale using the `mechfight/1` protocol.

## Files

- `lone_wolf_bot.py` contains the bot strategy.
- `mechfight.py` provides the standard-library JSON-lines protocol wrapper.
- `Dockerfile` builds the submission image.

## Build

Run this from the repository root:

```sh
docker build --platform linux/amd64 -t lone-wolf-mech33 .
```

## Run the conformance check

The Buildathon bot kit provides `check/check.py`, the schema, recorded observation stream, and arena map. From the kit directory, run:

```sh
python3 check/check.py -- python3 -u /path/to/lone-33new/lone_wolf_bot.py
```

Then check the Docker image with the same restrictions used for matches:

```sh
docker build --platform linux/amd64 -t lone-wolf-mech33 /path/to/lone-33new
python3 check/check.py --map-dir /arena -- docker run --rm -i --network none --cpus 1 --memory 512m --read-only --tmpfs /tmp:rw,size=64m --user 65534:65534 -v "$PWD/arena:/arena:ro" lone-wolf-mech33
```

Passing this check confirms protocol and runtime compliance. It does not measure gameplay strength; the leaderboard's practice matches provide the score.

## Strategy

The bot prioritizes zone movement, selects a nearby low-health opponent when available, strafes during combat, leads aim using the equipped gun's projectile speed, manages weapon firing and reloading, chooses upgrades, and can pick up a nearby secondary weapon.

## Current limitations

- Movement does not route around buildings.
- The bot does not deliberately seek cubes or supply drops.
- Score depends on the Buildathon's practice matches; no score is claimed by this README.

