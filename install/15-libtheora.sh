#!/bin/bash

# libtheora
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://downloads.xiph.org/releases/theora/libtheora-${THEORA_VERSION}.tar.bz2 | tar jxvf - -C . && \
  cd libtheora-${THEORA_VERSION} && \
  ./configure --prefix="${SRC}" --with-ogg="${SRC}" --bindir="${SRC}/bin" \
  --disable-shared --datadir=${DIR} && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}