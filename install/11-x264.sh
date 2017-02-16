#!/bin/bash

# x264  TODO : pin version
DIR=$(mktemp -d) && cd ${DIR} && \
  git clone --depth 1 git://git.videolan.org/x264 && \
  cd x264 && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" --enable-static && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}