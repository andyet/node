FROM alpine:edge

ENV NODE_VER 7.5.0

RUN apk --update add build-base python linux-headers binutils-gold && \
    wget -qO /tmp/node.tar.gz http://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}.tar.gz && \
    cd /tmp && \
    tar zxf node.tar.gz && \
    cd node-v${NODE_VER} && \
    ./configure && \
    make && \
    make install && \
    npm i -g npm && \
    apk del linux-headers && \
    rm -rf /var/cache/apk/* /tmp/*
