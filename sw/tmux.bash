#!/usr/bin/env bash

# tmux depends on libevent
./libevent.bash

source lib/autotools.bash

# Alter the compiler flags so it picks up on libevent.
EXTRA_CONFIGURE_FLAGS=("CPPFLAGS=-I$PREFIX/include" "LDFLAGS=-L$PREFIX/lib -L$PREFIX/lib64 -Wl,-rpath,$PREFIX/lib")
readonly TMUX_VERSION=1.8
autotools "http://sourceforge.net/projects/tmux/files/tmux/tmux-$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz"
