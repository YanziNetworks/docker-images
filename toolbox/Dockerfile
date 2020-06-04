ARG SRCTAG=latest
FROM yanzinetworks/alpine:${SRCTAG}

# OCI Annotation: https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="toolbox"
LABEL org.opencontainers.image.description="glibc-capable Alpine with a minimal set of essential utilities"
LABEL org.opencontainers.image.authors="Emmanuel Frecon <efrecon+github@gmail.com>"
LABEL org.opencontainers.image.url="https://github.com/YanziNetworks/docker-images/tree/master/toolbox"
LABEL org.opencontainers.image.documentation="https://github.com/YanziNetworks/docker-images/tree/master/toolbox/README.md"
LABEL org.opencontainers.image.source="https://github.com/YanziNetworks/docker-images/tree/master/toolbox"
LABEL org.opencontainers.image.version="$SRCTAG"
LABEL org.opencontainers.image.created="$BUILD_DATE"
LABEL org.opencontainers.image.vendor="Yanzi Networks AB"
LABEL org.opencontainers.image.licenses="MIT"

RUN apk --no-cache add \
        curl bind-tools netcat-openbsd jq rsync