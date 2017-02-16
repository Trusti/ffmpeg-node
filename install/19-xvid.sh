#!/bin/bash

# xvid
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -L -s  http://downloads.xvid.org/downloads/xvidcore-${XVID_VERSION}.tar.gz | tar zxvf - -C .&& \
  cd xvidcore/build/generic && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" && \
  make && \
  make install&& \
  rm -rf ${DIR}