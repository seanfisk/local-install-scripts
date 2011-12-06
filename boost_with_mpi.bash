#!/bin/bash

source install_scripts.bash

readonly BOOST_VERSION=1.48.0
readonly BOOST_VERSION_UNDERSCORE=${BOOST_VERSION//./_}

download_and_extract "http://sourceforge.net/projects/boost/files/boost/$BOOST_VERSION/boost_$BOOST_VERSION_UNDERSCORE.tar.bz2"

cd $src_dir_name
cp tools/build/v2/user-config.jam .
(
cat <<<EOF

# ---------------------
# MPI configuration.
# ---------------------

# Configure MPI (find automatically).
# using mpi ;
EOF
) >> user-config.jam

./bootstrap.sh
./b2 --prefix="$PREFIX" --with-mpi install