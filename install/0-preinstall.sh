#!/bin/bash
set -euo pipefail

echo "/usr/local/lib" > /etc/ld.so.conf.d/libc.conf

export MAKEFLAGS="-j$[$(nproc) + 1]"
export SRC=/usr/local
export PKG_CONFIG_PATH=${SRC}/lib/pkgconfig

yum install -y autoconf automake gcc gcc-c++ git libtool make nasm zlib-devel \
  openssl-devel tar cmake perl which bzip2