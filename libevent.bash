#!/bin/bash

source build-systems/autotools.bash

EXTRA_MAKE_STEPS=(verify)
autotools https://github.com/downloads/libevent/libevent/libevent-2.0.16-stable.tar.gz
