#!/usr/bin/env bash

source lib/autotools.bash

# patchelf make check does not support out-of-source builds.
IN_SOURCE=true

EXTRA_CONFIGURE_FLAGS=("CPPFLAGS=-I'$PREFIX/include'" "LDFLAGS=-L'$PREFIX/lib' -L'$PREFIX/lib64'")

EXTRA_MAKE_STEPS=(check)

autotools http://hydra.nixos.org/build/1524660/download/2/patchelf-0.6.tar.bz2
