#!/bin/bash

# x265
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s https://bitbucket.org/multicoreware/x265/get/${X265_VERSION}.tar.gz | tar zxvf - -C . && \
  cd multicoreware-*/source && \
  cmake -G "Unix Makefiles" . && \
  cmake . && \
  make && \
  make install && \
  rm -rf ${DIR}