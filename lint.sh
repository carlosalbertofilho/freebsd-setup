#!/bin/sh

set -e

shellcheck --version || pkg install -y hs-ShellCheck

find . -name '*.sh' -not -path './roswell/*' -not -path './conf/*' -not -path './lint.sh' | xargs shellcheck
