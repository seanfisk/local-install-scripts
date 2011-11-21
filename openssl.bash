#!/bin/bash

# openssl does not support out-of-source builds in a nice way
source install_scripts.bash

download_and_extract http://www.openssl.org/source/openssl-1.0.0e.tar.gz
cd $src_dir_name
./config --prefix="$PREFIX"
readonly EXTRA_MAKE_STEPS=(test)
make_install

