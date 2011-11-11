#!/bin/bash

# fish does not support out-of-source builds
source install_scripts.bash

download_and_extract http://fishshell.com/files/1.23.1/fish-1.23.1.tar.bz2
cd $src_dir_name
./configure --prefix="$PREFIX" CPPFLAGS="-I'$PREFIX/include' -I'$PREFIX/include/ncursesw'" LDFLAGS="-L'$PREFIX/lib' -L'$PREFIX/lib64'"
make_install
