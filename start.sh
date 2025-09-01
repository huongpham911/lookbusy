#!/bin/sh
# start.sh - script để chạy lookbusy với cấu hình 16 core + 14-20% CPU mỗi core + 10GB RAM

/app/lookbusy \
  --cpu-util=14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20, \
  14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20 \
  --mem-util=10GB
