#!/bin/bash

# note: I used this script for building on Seawolf in the DEN at GVSU

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=(--with-gif=no --with-xpm=no)
autotools ftp://ftp.gnu.org/gnu/emacs/emacs-24.2.tar.xz