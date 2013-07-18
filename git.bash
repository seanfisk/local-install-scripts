#!/usr/bin/env bash

source lib/common.bash

readonly GIT_VERSION=1.8.3.2

# Download and install git itself.

download_and_extract "https://git-core.googlecode.com/files/git-$GIT_VERSION.tar.gz"

pushd $src_dir_name
readonly MAKE_FLAGS=("prefix=$PREFIX")
EXTRA_MAKE_FLAGS=${MAKE_FLAGS[@]}
EXTRA_MAKE_INSTALL_FLAGS=${MAKE_FLAGS[@]}

make_install
popd # $src_dir_name

# Download git man pages. Strange these don't come with git.

pushd $PREFIX/share/man
wget "https://git-core.googlecode.com/files/git-manpages-$GIT_VERSION.tar.gz" --output-document - | \
	tar -xz
popd # $PREFIX/share/man
