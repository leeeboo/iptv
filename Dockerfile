FROM alpine:3

EXPOSE 8090

COPY iptv /

ENTRYPOINT ["/iptv"]