#!/bin/bash

yum clean all
rm -rf /var/lib/yum/yumdb/*
echo "/usr/local/lib" > /etc/ld.so.conf.d/libc.conf