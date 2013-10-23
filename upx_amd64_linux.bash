#!/usr/bin/env bash

source lib/common.bash

download_and_extract 'http://upx.sourceforge.net/download/upx-3.91-amd64_linux.tar.bz2'

cd $src_dir_name

install upx "$PREFIX/bin"
install -m 644 upx.1 "$PREFIX/share/man/man1"
