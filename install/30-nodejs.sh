#!/bin/bash

# nodejs
yum install make gcc gcc-c++ -y
DIR=$(mktemp -d) && cd ${DIR} && \
  curl -s http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}.tar.gz | tar zxvf - -C . && \
  cd node-v* && \
  ./configure && \
  make && \
  make install && \
  rm -rf ${DIR}