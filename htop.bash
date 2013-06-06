#!/usr/bin/env bash

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=("CPPFLAGS=-I'$HOME/.local/include' -I'$HOME/.local/include/ncursesw'" "LDFLAGS=-L'$HOME/.local/lib' -L'$HOME/.local/lib64'")
autotools http://sourceforge.net/projects/htop/files/htop/0.9/htop-0.9.tar.gz
