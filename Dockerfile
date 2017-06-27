FROM    alpine:edge
MAINTAINER Jan Christian Grünhage <jan.christian

RUN     apk update \
        && apk upgrade \
        && apk add \
            s6
ADD     root    /

CMD     ["/bin/s6-svscan", "/etc/s6.d"]