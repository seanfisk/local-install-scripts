#!/bin/bash

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=(--enable-termcap --enable-widec)
autotools http://ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz

