#!/bin/bash

# libogg
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://downloads.xiph.org/releases/ogg/libogg-${OGG_VERSION}.tar.gz | tar zxvf - -C . && \
  cd libogg-${OGG_VERSION} && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" --disable-shared --docdir=/dev/null && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}