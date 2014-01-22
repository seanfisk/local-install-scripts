#!/usr/bin/env bash

source lib/build.bash

goto_src_dir

readonly ASTYLE_VERSION='2.04'
download_and_extract "http://sourceforge.net/projects/astyle/files/astyle/astyle%20$ASTYLE_VERSION/astyle_${ASTYLE_VERSION}_linux.tar.gz"
cd $src_dir_name/build/gcc

# Replace janked install command. The original version fails in our
# development environment.
sed \
	--in-place \
	's/INSTALL=install -o $(USER) -g $(USER)/INSTALL=install/' \
	Makefile

# Build and install.
EXTRA_MAKE_INSTALL_FLAGS=("prefix=$PREFIX")
make_install
