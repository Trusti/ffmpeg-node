#!/bin/bash

# yasm
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://www.tortall.net/projects/yasm/releases/yasm-${YASM_VERSION}.tar.gz | \
  tar zxvf - -C . && \
  cd ${DIR}/yasm-${YASM_VERSION} && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" --docdir=${DIR} -mandir=${DIR}&& \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}