#!/bin/sh

set -e

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | /usr/local/bin/bash

export NVM_DIR=~/.nvm
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node

