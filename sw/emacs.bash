#!/usr/bin/env bash

source lib/autotools.bash

# On EOS, Emacs needs libXpm (specifically, for nyan-mode). The libraries are there but the headers aren't. So make sure you run `libXpm.bash' before building Emacs. We also need to manually the include and library paths so that Emacs finds libXpm. Usually this would happen automatically, but it doesn't work for this build.
#
# Also build without gif support.
EXTRA_CONFIGURE_FLAGS=("CPPFLAGS=-I$PREFIX/include" "LDFLAGS=-L$PREFIX/lib" --with-gif=no)

autotools http://ftp.gnu.org/gnu/emacs/emacs-24.3.tar.gz
