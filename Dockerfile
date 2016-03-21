FROM alpine:edge

ENV NODE_VER 0.10.43

RUN apk --update add build-base python linux-headers && \
    wget -qO /tmp/node.tar.gz http://nodejs.org/dist/v${NODE_VER}/node-v${NODE_VER}.tar.gz && \
    cd /tmp && \
    tar zxf node.tar.gz && \
    cd node-v${NODE_VER} && \
    ./configure && \
    sed -i 's/__USE_MISC/_GNU_SOURCE/g' deps/uv/src/fs-poll.c && \
    make && \
    make install && \
    npm i -g npm && \
    apk del linux-headers && \
    rm -rf /var/cache/apk/* /tmp/*
