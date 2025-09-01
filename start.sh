#!/bin/sh
# Khởi chạy lookbusy với CPU random 14–20% và RAM 9000–10930 MiB

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')

# Random CPU %
CPU_PERCENT=$((RANDOM % 7 + 14))   # 14–20 %

# Random RAM (9000–10930 MiB)
MEM_TO_USE=$((RANDOM % 1931 + 9000))   # 9000–10930

echo "==== Lookbusy Auto Load Generator ===="
echo "Detected CPU cores : ${CORES}"
echo "Total RAM          : ${TOTAL_MEM} MiB"
echo "Using RAM          : ~${MEM_TO_USE} MiB"
echo "CPU Util           : ~${CPU_PERCENT}% trên ${CORES} cores"
echo "======================================"

# Chạy lookbusy trực tiếp làm PID 1
exec lookbusy \
  --ncpus=${CORES} \
  --cpu-util=${CPU_PERCENT} \
  --mem-util=${MEM_TO_USE}M
