ARG ALPINE_VERSION
ARG GOLANG_VERSION
# We need golang toolchain available
# This is so we can use `go env`
FROM docker.io/golang:${GOLANG_VERSION} AS go
ARG LEGO_VERSION

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

WORKDIR /dl
RUN GOOS="$(go env GOOS)" && GOARCH="$(go env GOARCH)" && \
  curl -fsSLo- "https://github.com/go-acme/lego/releases/download/${LEGO_VERSION}/lego_${LEGO_VERSION}_${GOOS}_${GOARCH}.tar.gz" \
  | tar -xvzf- 

FROM docker.io/alpine:${ALPINE_VERSION}

COPY --from=go /dl/lego /usr/bin/lego

# TODO: non-root user
COPY ./crontab /etc/crontabs/root
COPY ./*.sh /usr/bin/

ENTRYPOINT [ "entrypoint.sh" ]
