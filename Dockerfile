FROM alpine:3.13.3

RUN echo "@edge-testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --no-cache update && apk --no-cache add squid confd@edge-testing bash

# Redirect squid access logs to stdout
RUN ln -sf /dev/stdout /var/log/squid/access.log

# Copy confd configuration
COPY confd /etc/confd

# Set entrypoint and default command arguments
COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["squid","-f","/etc/squid/squid.conf","-NYCd","1"]