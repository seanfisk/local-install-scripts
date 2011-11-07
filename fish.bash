#!/bin/bash

# fish does not support out-of-source builds
source install_scripts.bash

download_and_extract http://fishshell.com/files/1.23.1/fish-1.23.1.tar.bz2
cd $src_dir_name
./configure --prefix="$HOME/.local" CPPFLAGS="-I'$HOME/.local/include' -I'$HOME/.local/include/ncursesw'" LDFLAGS="-L'$HOME/.local/lib' -L'$HOME/.local/lib64'"
make_install
