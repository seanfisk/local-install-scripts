#!/bin/bash
set -o nounset
set -o errexit
set -o xtrace

readonly PREFIX=$HOME/.local
readonly VERSION=libxslt-1.1.26
readonly ARCHIVE_TYPE=.tar.gz
readonly URL_PREFIX=ftp://xmlsoft.org/libxslt/

readonly ARCHIVE=$VERSION$ARCHIVE_TYPE
rm -r $VERSION $ARCHIVE
wget "$URL_PREFIX$ARCHIVE"
tar -xf "$ARCHIVE"
cd $VERSION
./configure "--prefix=$PREFIX"
make
make install









