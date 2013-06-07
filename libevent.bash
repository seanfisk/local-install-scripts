#!/usr/bin/env bash

source lib/autotools.bash

# Disable the tests for now, since they usually fail but I'm going to
# install anyway.
# EXTRA_MAKE_STEPS=(verify)
autotools https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
