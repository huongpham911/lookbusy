#!/bin/sh
# Tự động detect CPU core + RAM
# Random 14–20% CPU và RAM

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')
PERCENT=$((RANDOM % 7 + 14))
MEM_TO_USE=$((TOTAL_MEM * PERCENT / 100))
CPU_UTIL=$(yes "14-20" | head -n $CORES | paste -sd, -)

echo "👉 ${CORES} cores | RAM ${TOTAL_MEM} MiB | Using ${PERCENT}% (~${MEM_TO_USE} MiB)"
echo "👉 CPU Util: ${CPU_UTIL}"

lookbusy --cpu-util=${CPU_UTIL} --mem-util=${MEM_TO_USE}M
