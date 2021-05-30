FROM alpine:3

RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*

EXPOSE 8090

COPY iptv /

ENTRYPOINT ["/iptv"]