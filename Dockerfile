FROM golang:alpine AS golang

ENV V2RAY_PLUGIN_VERSION v1.2.0
ENV GO111MODULE on

# Build v2ray-plugin
RUN apk add --no-cache git build-base \
    && mkdir -p /go/src/github.com/shadowsocks \
    && cd /go/src/github.com/shadowsocks \
    && git clone https://github.com/shadowsocks/v2ray-plugin.git \
    && cd v2ray-plugin \
    && git checkout "$V2RAY_PLUGIN_VERSION" \
    && go get -d \
    && go build

FROM alpine

ENV SHADOWSOCKS_LIBEV_VERSION v3.3.3

# Build shadowsocks-libev
RUN set -ex \
    # Install dependencies
    && apk add --no-cache --virtual .build-deps \
               autoconf \
               automake \
               build-base \
               libev-dev \
               libtool \
               linux-headers \
               udns-dev \
               libsodium-dev \
               mbedtls-dev \
               pcre-dev \
               tar \
               udns-dev \
               c-ares-dev \
               git \
    # Build shadowsocks-libev
    && mkdir -p /tmp/build-shadowsocks-libev \
    && cd /tmp/build-shadowsocks-libev \
    && git clone https://github.com/shadowsocks/shadowsocks-libev.git \
    && cd shadowsocks-libev \
    && git checkout "$SHADOWSOCKS_LIBEV_VERSION" \
    && git submodule update --init --recursive \
    && ./autogen.sh \
    && ./configure --disable-documentation \
    && make install \
    && ssRunDeps="$( \
        scanelf --needed --nobanner /usr/local/bin/ss-server \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" \
    && apk add --no-cache --virtual .ss-rundeps $ssRunDeps \
    && cd / \
    && rm -rf /tmp/build-shadowsocks-libev \
    # Delete dependencies
    && apk del .build-deps

# Copy v2ray-plugin
COPY --from=golang /go/src/github.com/shadowsocks/v2ray-plugin/v2ray-plugin /usr/local/bin

# Start shadowsocks-libev server
ENTRYPOINT ["ss-manager"]