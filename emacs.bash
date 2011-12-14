#!/bin/bash

# note: I used this script for building on Seawolf in the DEN at GVSU

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=(--with-gif=no)
autotools http://ftp.gnu.org/pub/gnu/emacs/emacs-23.3b.tar.bz2