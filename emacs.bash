#!/usr/bin/env bash

source lib/autotools.bash
EXTRA_CONFIGURE_FLAGS=(--with-gif=no --with-xpm=no)
autotools ftp://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.xz
