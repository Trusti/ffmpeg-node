#!/bin/bash

# mplayer
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://mplayerhq.hu/MPlayer/releases/MPlayer-${MPLAYER_VERSION}.tar.gz | tar zxvf - -C . && \
  cd MPlayer-${MPLAYER_VERSION} && \
  ./configure --prefix="${SRC}" --extra-cflags="-I${SRC}/include"  --extra-ldflags="-L${SRC}/lib" --bindir="${SRC}/bin" && \
  make && \
  make install && \
  rm -rf ${DIR}

yum history -y undo last && yum clean all && rm -rf /var/lib/yum/*