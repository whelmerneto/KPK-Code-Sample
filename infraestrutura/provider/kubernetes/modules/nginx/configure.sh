#!/bin/bash
set -e

cp -r ./build-modules/nginx/conf.d/* /etc/nginx/conf.d/

mkdir -p /etc/nginx/ssl
cp -r ./build-modules/nginx/ssl/* /etc/nginx/ssl/
