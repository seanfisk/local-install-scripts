#!/bin/bash

source install_scripts.bash

download_and_extract http://git-core.googlecode.com/files/git-1.7.8.tar.gz

cd $src_dir_name
readonly MAKE_FLAGS=("prefix=$PREFIX")
EXTRA_MAKE_FLAGS=${MAKE_FLAGS[@]}
EXTRA_MAKE_INSTALL_FLAGS=${MAKE_FLAGS[@]}

make_install