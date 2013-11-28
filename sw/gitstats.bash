#!/usr/bin/env bash

source lib/build.bash

goto_src_dir

# Download the tarball so we don't have a dependence on git. Also, we
# don't need the history AND we can use an already-written function.
download_and_extract https://github.com/hoxu/gitstats/archive/master.tar.gz

cd $src_dir_name

make install PREFIX="$PREFIX"
