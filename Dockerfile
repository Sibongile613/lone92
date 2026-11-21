# Build from the repository root. Match sandbox settings are applied by the scorer.
FROM python:3.13-slim
WORKDIR /bot
COPY . .
ENTRYPOINT ["python3", "-u", "/bot/lone_wolf_bot.py"]

