#!/bin/bash
set -o nounset
set -o errexit
set -o xtrace

SUBVERSION_WITH_VERSION=subversion-1.6.17
wget "http://subversion.tigris.org/downloads/$SUBVERSION_WITH_VERSION.tar.bz2"
tar -xf "$SUBVERSION_WITH_VERSION.tar.bz2"
cd "$SUBVERSION_WITH_VERSION"
./get-deps.sh
SQLITE_AMALGAMATION_WITH_VERSION=sqlite-amalgamation-3070701
wget "http://www.sqlite.org/$SQLITE_AMALGAMATION_WITH_VERSION.zip"
unzip "$SQLITE_AMALGAMATION_WITH_VERSION.zip"
mv "$SQLITE_AMALGAMATION_WITH_VERSION" sqlite-amalgamation
./configure "--prefix=$HOME/.local" --with-ssl --without-berkeley-db --without-serf "CPPFLAGS=-I$HOME/.local/include" "LDFLAGS=-L$HOME/.local/lib -L$HOME/.local/lib64"
make
make install