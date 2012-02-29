#!/bin/bash

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=("--with-qt4-dir=$PREFIX/usr/qt4/Desktop/Qt/474/gcc")
autotools ftp://ftp.lyx.org/pub/lyx/stable/2.0.x/lyx-2.0.3.tar.gz
