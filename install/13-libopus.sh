#!/bin/bash

# libopus
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://downloads.xiph.org/releases/opus/opus-${OPUS_VERSION}.tar.gz | tar zxvf - -C . && \
  cd opus-${OPUS_VERSION} && \
  autoreconf -fiv && \
  ./configure --prefix="${SRC}" --disable-shared && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}