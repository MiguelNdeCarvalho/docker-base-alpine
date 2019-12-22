FROM docker.io/alpine:3.7
LABEL maintainer="MiguelNdeCarvalho <geral@miguelndecarvalho.pt>"

ENV UID=1337 \
    GID=1337

RUN apk upgrade --no-cache \
 && apk add --no-cache \
      s6 \
      su-exec
ADD root /

CMD ["/bin/s6-svscan", "/etc/s6.d"]
