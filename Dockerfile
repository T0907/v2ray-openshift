FROM alpine:3.5
ENV CONFIG_JSON=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash \
 && curl https://install.direct/go.sh | bash \
 && rm -rf /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/geosite.dat \
 && chgrp -R 0 /etc/v2ray \
 && chmod -R g+rwX /etc/v2ray
RUN apk add --no-cache libstdc++ libbsd
ADD configure.sh /configure.sh
ADD server_linux_amd64 /server_linux_amd64
ADD kcptunserver /kcptunserver
ADD kubeseil/* /
RUN chmod +x /kcptunserver /server_linux_amd64
RUN chmod +x /configure.sh
ENTRYPOINT /configure.sh
EXPOSE 80 8080
