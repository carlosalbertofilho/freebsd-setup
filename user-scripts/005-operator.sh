#!/bin/sh

set -e

sudo pw groupmod operator -m "$USER"
