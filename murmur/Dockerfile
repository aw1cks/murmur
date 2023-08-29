ARG ALPINE_VERSION

FROM docker.io/alpine:${ALPINE_VERSION}
ARG MURMUR_VERSION

RUN apk add --no-cache "murmur=${MURMUR_VERSION}"

EXPOSE 64738/tcp
EXPOSE 64738/udp

# TODO: non-root user

COPY ./entrypoint.sh /usr/bin/
ENTRYPOINT [ "entrypoint.sh" ]
