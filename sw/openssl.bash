#!/usr/bin/env bash

source lib/autotools.bash

# openssl does not support out-of-source builds in a nice way.
IN_SOURCE=true

readonly OPENSSL_VERSION=0.9.8s
# too new for Ruby
# readonly OPENSSL_VERSION=1.0.0f

EXTRA_CONFIGURE_FLAGS=(shared)

# readonly EXTRA_MAKE_STEPS=(test)
# Has problems with multiple jobs.
EXTRA_MAKE_FLAGS=(--jobs=1)
EXTRA_MAKE_INSTALL_FLAGS=(--jobs=1)

autotools "http://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz"
