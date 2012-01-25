#!/bin/bash

# openssl does not support out-of-source builds in a nice way
source install_scripts.bash

download_and_extract http://www.openssl.org/source/openssl-0.9.8s.tar.gz
# too new for ruby
# download_and_extract http://www.openssl.org/source/openssl-1.0.0f.tar.gz
cd $src_dir_name
./config --prefix="$PREFIX" shared
# the tests fail for some reason
# readonly EXTRA_MAKE_STEPS=(test)
make --jobs=1
# has problems with multiple jobs
make --jobs=1 install

