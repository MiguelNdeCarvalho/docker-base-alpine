# docker.io/matrixdotorg/base-alpine

A small base image based on [Alpine Linux](https://www.alpinelinux.org/) (current stable release) and
[s6](http://www.skarnet.org/software/s6/index.html). We do not support this further than needed for our usage, but feel free to use it if you want.

### Building on top of this

To build on top of this image, you can base a Dockerfile on this:

```dockerfile
FROM docker.io/matrixdotorg/base-alpine
LABEL maintainer="Your Name <your@mail.xyz>"

RUN echo "install stuff here"

ADD root /
```

The folder structure of root should look kinda like this, every of these parts is optional:
```
root
|-- etc
|   |-- s6
|   |   |-- your-service
|   |   |   |-- run
|   |   |   |-- finish
|   |   |   |-- crash
|   |-- periodic
|   |   |-- hourly
|   |   |   |-- somescript
```
The folder your-service should contain three executables:
 - `run`, is run when the service is started (container startup)
 - `finish`, is run when the service is stopped
 - `crash`, is run when the service crashes

Also, your-service is an example name, you should replace it with the name of the software running in there.

To play nice in a docker ecosystem, you want your container to stop when your main process dies,
so put this into your main services finish file:

```
#!/bin/sh
s6-svscanctl -t /etc/s6
```


Inside the `/etc/periodic` folder, there are 5 folders:
 - 15min
 - hourly
 - daily
 - weekly
 - monthly

Inside those, you can put executable shell scripts (starting with `#!/bin/sh`),
and they'll be executed regularly in the specified interval.
For custom intervals, you can always edit crontab.
