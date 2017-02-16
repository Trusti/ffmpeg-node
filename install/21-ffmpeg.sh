#!/bin/bash

# ffmpeg
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz | tar zxvf - -C . && \
  cd ffmpeg-${FFMPEG_VERSION} && \
  ./configure --prefix="${SRC}" --extra-cflags="-I${SRC}/include" \
  --extra-ldflags="-L${SRC}/lib" --bindir="${SRC}/bin" \
  --extra-libs=-ldl --enable-version3 --enable-libfaac --enable-libmp3lame \
  --enable-libx264 --enable-libxvid --enable-gpl \
  --enable-postproc --enable-nonfree --enable-avresample --enable-libfdk_aac \
  --disable-debug --enable-small --enable-openssl --enable-libtheora \
  --enable-libx265 --enable-libopus --enable-libvorbis --enable-libvpx && \
  make && \
  make install && \
  make distclean && \
  hash -r && \
  cd tools && \
  make qt-faststart && \
  cp qt-faststart ${SRC}/bin && \
  rm -rf ${DIR}