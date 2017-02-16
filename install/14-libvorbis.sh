#!/bin/bash

# libvorbis
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://downloads.xiph.org/releases/vorbis/libvorbis-${VORBIS_VERSION}.tar.gz | tar zxvf - -C . && \
  cd libvorbis-${VORBIS_VERSION} && \
  ./configure --prefix="${SRC}" --with-ogg="${SRC}" --bindir="${SRC}/bin" \
    --disable-shared --datadir=${DIR} && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}