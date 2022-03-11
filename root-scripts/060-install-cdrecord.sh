#!/bin/sh

set -e

pkg install -y \
    cdrtools

chown root /usr/local/bin/cdrecord
chmod 4711 /usr/local/bin/cdrecord
