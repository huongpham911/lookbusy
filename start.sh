#!/bin/sh
# Khởi chạy lookbusy với CPU random 14–20% và RAM 14–17%

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')

# Random phần trăm RAM (14–17)
RAM_PERCENT=$((RANDOM % 4 + 14))

echo "==== Lookbusy Auto Load Generator ===="
echo "Detected CPU cores : ${CORES}"
echo "Total RAM          : ${TOTAL_MEM} MiB"
echo "Using RAM          : ~${RAM_PERCENT}%"
echo "CPU Util           : Random 14–20% trên ${CORES} cores"
echo "======================================"

# Chạy lookbusy trực tiếp làm PID 1 (exec) → an toàn hơn
exec lookbusy \
  --ncpus=${CORES} \
  --cpu-util=RANDOM \
  --cpu-util-min=14 \
  --cpu-util-max=20 \
  --mem-util=${RAM_PERCENT}%
