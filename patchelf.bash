#!/usr/bin/env bash

# patchelf make check does not support out-of-source builds
source install_scripts.bash

download_and_extract http://hydra.nixos.org/build/1524660/download/2/patchelf-0.6.tar.bz2
cd $src_dir_name
./configure --prefix="$PREFIX" CPPFLAGS="-I'$PREFIX/include'" LDFLAGS="-L'$PREFIX/lib' -L'$PREFIX/lib64'"
EXTRA_MAKE_STEPS=(check)
make_install
