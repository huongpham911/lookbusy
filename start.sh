#!/bin/sh
# Khởi chạy lookbusy với CPU random 14–20% và RAM 14–17%

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')

# Random CPU và RAM %
CPU_PERCENT=$((RANDOM % 7 + 14))   # 14–20
RAM_PERCENT=$((RANDOM % 4 + 14))   # 14–17

echo "==== Lookbusy Auto Load Generator ===="
echo "Detected CPU cores : ${CORES}"
echo "Total RAM          : ${TOTAL_MEM} MiB"
echo "Using RAM          : ~${RAM_PERCENT}%"
echo "CPU Util           : ~${CPU_PERCENT}% trên ${CORES} cores"
echo "======================================"

# Chạy lookbusy trực tiếp làm PID 1
exec lookbusy \
  --ncpus=${CORES} \
  --cpu-util=${CPU_PERCENT} \
  --mem-util=${RAM_PERCENT}%
