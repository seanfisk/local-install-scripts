#!/usr/bin/env bash

source build-systems/autotools.bash

#EXTRA_MAKE_STEPS=(verify)
autotools https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
