# lookbusy
- Detects number of CPU cores automatically and runs load on all cores
- Randomizes CPU utilization between 14–20% per core
- Randomizes RAM utilization between 14–20% of total system memory

Dockerized version of lookbusy for simulating CPU and RAM load.

This image is configured to:
- Keep each core at 14–20% utilization
- Consume about 10GB of RAM (~14–20% of a 62GiB system)

---

🚀 How to build

```bash
docker build -t lookbusy.

▶️ How to run
docker run -d --name lookbusy lookbusy-16core

or with Compose:
docker compose up -d

---
