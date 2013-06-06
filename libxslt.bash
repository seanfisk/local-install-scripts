#!/usr/bin/env bash

# does not support out-of-source builds
source install_scripts.bash

download_and_extract ftp://xmlsoft.org/libxslt/libxslt-1.1.26.tar.gz
cd $src_dir_name
./configure --prefix="$PREFIX"
make_install
