#!/usr/bin/env bash

# NOTE:
# tmux depends on libevent
# run sw/libevent.bash to install it if not present

source lib/autotools.bash

readonly TMUX_VERSION=1.8
autotools "http://sourceforge.net/projects/tmux/files/tmux/tmux-$TMUX_VERSION/tmux-$TMUX_VERSION.tar.gz"
