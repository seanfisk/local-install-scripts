#!/usr/bin/env bash

source lib/build.bash

goto_src_dir

# Since we're downloading the master branch, we don't want caching.
readonly ARCHIVE=autojump-master.tar.gz
[[ -f $ARCHIVE ]] && rm "$ARCHIVE"
download_and_extract 'https://github.com/joelthelion/autojump/archive/master.tar.gz' "$ARCHIVE"

cd $src_dir_name

# This command DOESN'T obey the $PREFIX. It just installs everything
# to the home directory in the ~/.autojump directory. Since this is
# almost always what we want, that's fine.
./install.sh --local
