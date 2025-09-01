FROM alpine:3.19

WORKDIR /app

# Cài công cụ build
RUN apk update && apk add --no-cache build-base wget

# Tải source lookbusy từ SourceForge
RUN wget https://downloads.sourceforge.net/project/lookbusy/lookbusy/1.4/lookbusy-1.4.tar.gz \
    && tar -xzf lookbusy-1.4.tar.gz \
    && cd lookbusy-1.4 \
    && ./configure \
    && make \
    && make install

# Cleanup
RUN rm -rf /var/cache/apk/* /app/lookbusy-1.4 /app/lookbusy-1.4.tar.gz

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
