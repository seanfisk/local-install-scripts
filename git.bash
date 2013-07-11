#!/usr/bin/env bash

source lib/common.bash

download_and_extract https://git-core.googlecode.com/files/git-1.8.3.2.tar.gz

cd $src_dir_name
readonly MAKE_FLAGS=("prefix=$PREFIX")
EXTRA_MAKE_FLAGS=${MAKE_FLAGS[@]}
EXTRA_MAKE_INSTALL_FLAGS=${MAKE_FLAGS[@]}

make_install
