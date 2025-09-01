# lookbusy-docker (optimized)

Dockerized version of **lookbusy** that simulates random CPU and RAM load.

##  Features

- Auto-detect all CPU cores and use them
- Randomizes CPU utilization between **14–20% per core**
- Randomizes RAM utilization between **14–20% of total system memory**

##  Usage

### Build
```bash
docker build -t lookbusy-optimized .
