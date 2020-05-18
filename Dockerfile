FROM alpine:3.11

RUN apk --no-cache update && apk --no-cache add squid

ADD squid.conf /etc/squid/squid.conf
ADD entrypoint.sh /usr/local/bin

ENTRYPOINT entrypoint.sh
