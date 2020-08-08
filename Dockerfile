ARG DOCKER_VERSION=19.03

FROM docker:$DOCKER_VERSION AS docker

FROM alpine:3.10

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

RUN apk --no-cache add bash

COPY ./docker-gc /docker-gc

VOLUME /var/lib/docker-gc

CMD ["/docker-gc"]
