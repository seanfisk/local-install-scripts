#!/usr/bin/env bash

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=(--with-shared)
autotools http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
