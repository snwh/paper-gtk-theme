#!/bin/sh

set -e

dpkg -l | grep -qw autoreconf || apt-get install dh-autoreconf

autoreconf --force --install --symlink --warnings=all

if test -z "${NOCONFIGURE}"; then
    set -x
    ./configure --prefix=/usr "$@"
    make clean
fi
