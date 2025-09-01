FROM alpine:3.19

WORKDIR /app

# Cài tool build
RUN apk update && apk add --no-cache build-base git autoconf automake

# Clone source lookbusy từ repo riêng của bạn (thay vì Shawnxm hay SourceForge)
RUN git clone https://github.com/huongpham911/lookbusy.git lookbusy-src \
    && cd lookbusy-src \
    && ./autogen.sh || true \
    && ./configure \
    && make \
    && make install

# Cleanup để nhẹ image
RUN apk del build-base git autoconf automake

# Copy script start.sh
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
