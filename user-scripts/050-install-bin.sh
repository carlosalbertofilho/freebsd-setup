#!/bin/sh

set -e

rm -f ~/bin
ln -s ~/freebsd-setup/conf/bin ~/bin

curl https://raw.githubusercontent.com/mhagger/git-test/master/bin/git-test > ~/bin/git-test
chmod a+x ~/bin/git-test
