#!/bin/bash

# libmp3lame
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -L -s http://downloads.sourceforge.net/project/lame/lame/${LAME_VERSION%.*}/lame-${LAME_VERSION}.tar.gz | tar zxvf - -C . && \
  cd lame-${LAME_VERSION} && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" --disable-shared --enable-nasm && \
  make && \
  make install && \
  make distclean&& \
  rm -rf ${DIR}