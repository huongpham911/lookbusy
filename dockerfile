FROM alpine:3.19

WORKDIR /app

# Cài dependency để build
RUN apk update && apk add --no-cache build-base git cmake

# Clone source lookbusy chính thức từ SourceForge
RUN git clone https://git.code.sf.net/p/lookbusy/code lookbusy \
    && cd lookbusy \
    && ./configure \
    && make \
    && make install

# Xoá bớt dependency để image nhẹ hơn
RUN apk del build-base git cmake

# Copy script start.sh
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
