#!/bin/bash
set -e

export GNUPGHOME="$(mktemp -d)";

NGINX_VERSION=1.23.4
NJS_VERSION=0.7.11
PKG_RELEASE=1~bullseye
NGINX_GPGKEY=573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
NGINX_GPGKEY_PATH=/usr/share/keyrings/nginx-archive-keyring.gpg

# Install required certificates.
apt-get update
apt-get install --no-install-recommends --no-install-suggests -y gnupg1 ca-certificates

found=''
for server in hkp://keyserver.ubuntu.com:80 pgp.mit.edu; do
    echo "Fetching GPG key $NGINX_GPGKEY from $server"
    gpg1 --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break
done

test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1;

gpg1 --export "$NGINX_GPGKEY" > "$NGINX_GPGKEY_PATH" ;
rm -rf "$GNUPGHOME"
apt-get remove --purge --auto-remove -y gnupg1 && rm -rf /var/lib/apt/lists/*

echo "deb [signed-by=$NGINX_GPGKEY_PATH] https://nginx.org/packages/mainline/debian/ bullseye nginx" >> /etc/apt/sources.list.d/nginx.list
apt-get update
apt-get install -y wget
wget "http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb"
dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
apt-get install --no-install-recommends --no-install-suggests -y \
    nginx=${NGINX_VERSION}-${PKG_RELEASE} \
    nginx-module-xslt=${NGINX_VERSION}-${PKG_RELEASE} \
    nginx-module-geoip=${NGINX_VERSION}-${PKG_RELEASE} \
    nginx-module-image-filter=${NGINX_VERSION}-${PKG_RELEASE} \
    nginx-module-njs=${NGINX_VERSION}+${NJS_VERSION}-${PKG_RELEASE} \
    gettext-base \
    curl

apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/nginx.list

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log
