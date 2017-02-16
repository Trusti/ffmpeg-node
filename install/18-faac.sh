#!/bin/bash

# faac + http://stackoverflow.com/a/4320377
DIR=$(mktemp -d) &&  cd ${DIR} && \
  curl -L -s http://downloads.sourceforge.net/faac/faac-${FAAC_VERSION}.tar.gz | tar zxvf - -C . && \
  cd faac-${FAAC_VERSION} && \
  sed -i '126d' common/mp4v2/mpeg4ip.h && \
  ./bootstrap && \
  ./configure --prefix="${SRC}" --bindir="${SRC}/bin" && \
  make && \
  make install &&\
  rm -rf ${DIR}