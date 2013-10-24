#!/usr/bin/env bash

source lib/autotools.bash

EXTRA_CONFIGURE_FLAGS=("CPPFLAGS=-I'$HOME/.local/include' -I'$HOME/.local/include/ncursesw'" "LDFLAGS=-L'$HOME/.local/lib' -L'$HOME/.local/lib64'")
readonly HTOP_VERSION=0.9
autotools "http://sourceforge.net/projects/htop/files/htop/$HTOP_VERSION/htop-$HTOP_VERSION.tar.gz"
