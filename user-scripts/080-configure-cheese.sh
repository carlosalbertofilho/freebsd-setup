#!/bin/sh

set -e

sudo pw groupmod webcamd -m "$USER"
