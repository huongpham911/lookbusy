#!/bin/sh
# Script chạy lookbusy với 16 core, mỗi core ~14-20%, RAM ~10GB

lookbusy \
  --cpu-util=14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,\
14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20 \
  --mem-util=10GB
