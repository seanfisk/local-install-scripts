#!/usr/bin/env bash

source lib/build.bash

goto_src_dir

repo=gitflow
rm -rf "$repo"
git clone --recursive "git://github.com/nvie/$repo.git"
cd $repo
make prefix="$PREFIX" install
