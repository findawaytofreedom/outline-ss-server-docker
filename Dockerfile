FROM golang:alpine as build
WORKDIR /app
COPY outline-ss-server /app
RUN go get
RUN CGO_ENABLED=0 go build -o shadowsocks-server

FROM alpine
COPY --from=build /app/config_example.yml /etc/shadowsocks/config.yml
COPY --from=build /app/shadowsocks-server /usr/bin/shadowsocks-server
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
