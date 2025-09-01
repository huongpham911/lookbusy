#!/bin/sh
# Tự động detect CPU cores + RAM, chạy lookbusy với 14-20% tải CPU và RAM

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
PERCENT=$((RANDOM % 7 + 14))
MEM_TO_USE=$((TOTAL_MEM * PERCENT / 100))
CPU_UTIL=$(yes "14-20" | head -n $CORES | paste -sd, -)

echo "Detected CPU cores: ${CORES}"
echo "Total RAM: ${TOTAL_MEM} MiB"
echo "Using ~${PERCENT}% RAM (~${MEM_TO_USE} MiB)"
echo "CPU Util Pattern: ${CPU_UTIL}"

# Chạy lookbusy ngầm nền để giữ CPU + RAM
lookbusy --cpu-util=${CPU_UTIL} --mem-util=${MEM_TO_USE}M
