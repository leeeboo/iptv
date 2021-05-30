FROM alpine:3

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --update ca-certificates && rm -rf /var/cache/apk/*

EXPOSE 8090

COPY iptv /

ENTRYPOINT ["/iptv"]