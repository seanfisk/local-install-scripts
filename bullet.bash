#!/bin/sh
#	-D INSTALL_LIBS=on \
#	-D BUILD_SHARED_LIBS=on \
cmake \
	-D CMAKE_CXX_FLAGS=-fPIC \
	-D CMAKE_INSTALL_PREFIX=~/.local \
	-D CMAKE_INSTALL_RPATH=~/.local/lib \
	. -G "Unix Makefiles"
