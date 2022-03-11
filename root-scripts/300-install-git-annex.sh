#!/bin/sh

set -e

pkg install -y hs-stack

git clone git://git-annex.branchable.com/ /tmp/git-annex
cd /tmp/git-annex

stack setup
stack install
