# lookbusy-docker (optimized)

Dockerized version of lookbusy with auto CPU/RAM detection.

## Features
- Detects number of CPU cores automatically
- Randomizes CPU utilization between 14–20% per core
- Randomizes RAM utilization between 14–20% of total system memory

## Run with Docker Compose

```bash
docker compose up -d
