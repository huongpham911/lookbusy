# lookbusy-16core

Dockerized version of lookbusy for simulating CPU and RAM load.

This image is configured to:
- Use all 16 CPU cores
- Keep each core at 14–20% utilization
- Consume about 10GB of RAM (~14–20% of a 62GiB system)

---

## 🚀 How to build

```bash
docker build -t lookbusy-16core .

▶️ How to run
docker run -d --name lookbusy lookbusy-16core

or with Compose:
docker compose up -d

---
