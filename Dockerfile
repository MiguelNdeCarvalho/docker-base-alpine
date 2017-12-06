FROM    docker.io/alpine
MAINTAINER Jan Christian Grünhage <jan.christian

RUN     apk update \
        && apk upgrade \
        && apk add \
            s6 \
	apk cache clean
ADD     root    /

CMD     ["/bin/s6-svscan", "/etc/s6.d"]
