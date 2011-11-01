#!/bin/bash
set -o nounset
set -o errexit
set -o xtrace

readonly PREFIX=$HOME/.local
readonly BOOST_VERSION=1.47.0
readonly BOOST_VERSION_UNDERSCORE=${BOOST_VERSION//./_}
readonly BOOST_DIR=boost_$BOOST_VERSION_UNDERSCORE
readonly BOOST_ARCHIVE=$BOOST_DIR.tar.bz2

# rm -r "$BOOST_DIR" "$BOOST_ARCHIVE"
# wget "http://sourceforge.net/projects/boost/files/boost/$BOOST_VERSION/$BOOST_ARCHIVE/download"
# tar -xf "$BOOST_ARCHIVE"
cd "$BOOST_DIR"

./bootstrap.sh
./b2 install "--prefix=$PREFIX"