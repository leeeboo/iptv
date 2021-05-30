FROM arm32v7/alpine:3

EXPOSE 8090

COPY iptv /

ENTRYPOINT ["/iptv"]