#!/bin/sh
# Auto detect CPU cores + RAM, chạy lookbusy với tải CPU (14–20%) và RAM (14–17%)

CORES=$(nproc)
TOTAL_MEM=$(free -m | awk '/Mem:/ {print $2}')

# chọn random % RAM trong khoảng 14–17
RAM_PERCENT=$((RANDOM % 4 + 14))

echo "Detected CPU cores: ${CORES}"
echo "Total RAM: ${TOTAL_MEM} MiB"
echo "Using ~${RAM_PERCENT}% RAM"

# chạy lookbusy: CPU random 14–20% trên tất cả core + RAM giữ % đã chọn
lookbusy \
  --ncpus=${CORES} \
  --cpu-util=RANDOM \
  --cpu-util-min=14 \
  --cpu-util-max=20 \
  --mem-util=${RAM_PERCENT}% &
  
# giữ container sống
tail -f /dev/null
