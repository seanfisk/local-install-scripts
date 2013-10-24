#!/usr/bin/env bash

source lib/build.bash

goto_src_dir
download_and_extract http://mercurial.selenic.com/release/mercurial-2.0.2.tar.gz
cd $src_dir_name
make PREFIX="$PREFIX" install
