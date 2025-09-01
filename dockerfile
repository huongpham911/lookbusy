FROM debian:bullseye-slim

# Cài công cụ cần thiết
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    build-essential \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Tải và build lookbusy 1.4
WORKDIR /opt
RUN wget "https://www.dropbox.com/scl/fi/sj9be9whx3swuz47rmukq/lookbusy-1.4.tar.gz?rlkey=41q6jwgecyqcgp028al3hpz77&st=apua0ng5&dl=1" -O lookbusy-1.4.tar.gz \
    && tar -zxvf lookbusy-1.4.tar.gz \
    && cd lookbusy-1.4 \
    && ./configure \
    && make \
    && make install

# Copy script start
WORKDIR /
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
