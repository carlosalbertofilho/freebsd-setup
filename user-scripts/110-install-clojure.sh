#!/bin/sh

set -e

curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > ~/bin/lein
chmod a+x ~/bin/lein
~/bin/lein

