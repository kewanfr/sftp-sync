FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add lftp openssh-client && \
    rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]



FROM alpine:3.15

RUN apk add openssh-client lftp

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]