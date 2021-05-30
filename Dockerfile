FROM balenalib/raspberry-pi-alpine:latest

RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*

EXPOSE 8090

COPY iptv /

ENTRYPOINT ["/iptv"]