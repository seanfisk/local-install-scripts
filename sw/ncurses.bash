#!/usr/bin/env bash

source lib/autotools.bash

EXTRA_CONFIGURE_FLAGS=(--with-shared)
autotools http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz
