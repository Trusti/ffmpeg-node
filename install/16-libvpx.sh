#!/bin/bash

# libvpx
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s https://codeload.github.com/webmproject/libvpx/tar.gz/v${VPX_VERSION} | tar zxvf - -C . && \
  cd libvpx-${VPX_VERSION} && \
  ./configure --prefix="${SRC}" --enable-vp8 --enable-vp9 --disable-examples && \
  make && \
  make install && \
  make clean && \
  rm -rf ${DIR}