#!/bin/sh

set -e

rm -f ~/.zshrc
ln ~/freebsd-setup/conf/zsh/zshrc ~/.zshrc

chsh -s /usr/local/bin/zsh
