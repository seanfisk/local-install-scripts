#!/usr/bin/env bash

source lib/common.bash

download_and_extract 'http://sourceforge.net/projects/astyle/files/astyle/astyle%202.03/astyle_2.03_linux.tar.gz'
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
