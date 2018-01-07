FROM docker.io/alpine:3.7
MAINTAINER Jan Christian Grünhage <jan.christian@gruenhage.xyz>

ENV UID=1337 \
    GID=1337

RUN apk update \
 && apk upgrade \
 && apk add \
      s6 \
      su-exec
ADD root /

CMD ["/bin/s6-svscan", "/etc/s6.d"]
