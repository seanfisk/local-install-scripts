#!/usr/bin/env bash

source lib/build.bash

goto_src_dir

# Since we're downloading the master branch, we don't want caching.
rm aha-master.tar.gz
download_and_extract 'https://github.com/theZiz/aha/archive/master.tar.gz' aha-master.tar.gz
cd $src_dir_name

make
install -d "$PREFIX/bin"
install aha "$PREFIX/bin"
install -d "$PREFIX/share/man/man1"
install -m 644 aha.1 "$PREFIX/share/man/man1"
