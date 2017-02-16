#!/bin/bash

# fdk-aac
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s https://codeload.github.com/mstorsjo/fdk-aac/tar.gz/v${FDKAAC_VERSION} | tar zxvf - -C . && \
  cd fdk-aac-${FDKAAC_VERSION} && \
  autoreconf -fiv && \
  ./configure --prefix="${SRC}" --disable-shared && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}