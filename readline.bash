#!/bin/bash

source build-systems/autotools.bash

readonly EXTRA_CONFIGURE_FLAGS=(--with-curses)
autotools http://ftp.gnu.org/gnu/readline/readline-6.2.tar.gz