FROM docker.io/alpine:3.7
MAINTAINER Jan Christian Grünhage <jan.christian@gruenhage.xyz>

RUN apk update \
 && apk upgrade \
 && apk add \
      s6 \
      su-exec
ADD root /

CMD ["/bin/s6-svscan", "/etc/s6.d"]
