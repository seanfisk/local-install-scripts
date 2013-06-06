#!/usr/bin/env bash

# xclip does not support out-of-source builds

source install_scripts.bash

download_and_extract http://sourceforge.net/projects/xclip/files/xclip/0.12/xclip-0.12.tar.gz

cd $src_dir_name
./configure --prefix="$PREFIX"
make_install
