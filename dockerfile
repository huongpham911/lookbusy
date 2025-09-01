FROM alpine:3.19

# Cài lookbusy từ Alpine official repo
RUN apk update && apk add --no-cache lookbusy

# Tính toán: 
# - CPU: 16 core, mỗi core 14–20%
# - RAM: khoảng 10GiB (trung bình 14–20% của 62GiB)
#
# lookbusy sẽ random load theo tham số -c (CPU) và -m (memory)

CMD ["lookbusy", \
     "--cpu-util=14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20,14-20", \
     "--mem-util=10GB"]
