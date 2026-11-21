# Submission Checklist

## Repository

- [ ] Repository is public.
- [ ] `Dockerfile`, `lone_wolf_bot.py`, and `mechfight.py` are at the repository root.
- [ ] Dockerfile entry point names `/bot/lone_wolf_bot.py`.
- [ ] Repository is under the 20 MB submission limit.

## Build and protocol check

From the bot-kit directory:

- [ ] Run `check/check.py` against the Python bot.
- [ ] Build the image for `linux/amd64`.
- [ ] Run `check/check.py --map-dir /arena` against the Docker image with the scorer's no-network, read-only, unprivileged runtime flags.
- [ ] Confirm the bot responds within the protocol's 50 ms per-observation budget.

## Scoring

- [ ] Submit the repository URL on the Mech Royale track page.
- [ ] Review the resulting practice-match score.
- [ ] Keep the highest-scoring submission selected as the final entry.

