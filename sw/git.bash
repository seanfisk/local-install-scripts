#!/usr/bin/env bash

# Git requires the Expat XML parser. If not already present, run sw/expat.bash.

source lib/build.bash

readonly GIT_VERSION=1.8.4.1

# Download and install git itself.

goto_src_dir

download_and_extract "https://git-core.googlecode.com/files/git-$GIT_VERSION.tar.gz"

pushd $src_dir_name
readonly MAKE_FLAGS=("prefix=$PREFIX" V=1 CPPFLAGS="-I$PREFIX/include" LDFLAGS="-L$PREFIX/lib")
EXTRA_MAKE_FLAGS=("${MAKE_FLAGS[@]}")
EXTRA_MAKE_INSTALL_FLAGS=("${MAKE_FLAGS[@]}")

make_install
popd # $src_dir_name

# Download git man pages. Strange these don't come with git.

pushd $PREFIX/share/man
wget "https://git-core.googlecode.com/files/git-manpages-$GIT_VERSION.tar.gz" --output-document - | \
	tar -xz
popd # $PREFIX/share/man
