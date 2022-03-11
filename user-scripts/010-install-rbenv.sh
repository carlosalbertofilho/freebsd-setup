#!/bin/sh

set -e

RUBY_VERSION=3.0.2

git clone https://github.com/rbenv/rbenv.git ~/.rbenv

export PATH="$HOME/.rbenv/bin:$PATH"
export RUBY_CONFIGURE_OPTS=--disable-dtrace

eval "$(rbenv init -)"

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv install "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"
