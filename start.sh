#!/bin/sh
# Script chạy lookbusy: 
# - CPU: tất cả core, mỗi core random 14–20%
# - RAM: random 14–20% tổng RAM hệ thống

# Đếm số core CPU
CORES=$(nproc)

# Lấy tổng RAM (MiB)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')

# Random phần trăm (14–20)
PERCENT=$((RANDOM % 7 + 14))

# RAM cần dùng (MiB)
MEM_TO_USE=$((TOTAL_MEM * PERCENT / 100))

# Tạo chuỗi CPU random 14–20 cho tất cả core
CPU_UTIL=$(yes "14-20" | head -n $CORES | paste -sd, -)

echo "👉 Phát hiện ${CORES} core CPU"
echo
