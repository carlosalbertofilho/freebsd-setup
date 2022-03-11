#!/bin/sh

set -e

pkg install -y \
    node \
    www/npm \

npm install -g marked
