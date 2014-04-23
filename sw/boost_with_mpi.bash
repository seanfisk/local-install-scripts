#!/usr/bin/env bash

source lib/build.bash

readonly BOOST_VERSION=1.55.0
readonly BOOST_VERSION_UNDERSCORE=${BOOST_VERSION//./_}
readonly BOOST_DIRECTORY=boost_$BOOST_VERSION_UNDERSCORE

goto_src_dir
[[ -d "$BOOST_DIRECTORY" ]] && rm -r "$BOOST_DIRECTORY"
download_and_extract "http://sourceforge.net/projects/boost/files/boost/$BOOST_VERSION/$BOOST_DIRECTORY.tar.bz2"

cd $src_dir_name

./bootstrap.sh

# Setup our user-config.jam. We don't really need to copy this, since everything is commented out, but it's nice if someone looks back.
cp tools/build/v2/user-config.jam .
cat <<EOF >> user-config.jam

# ---------------------
# MPI configuration.
# ---------------------

# Configure MPI (find automatically).
using mpi ;

EOF

# Specify that we want to use our user-config.jam.
# Enable building single-threaded and multi-threaded versions of each library.
# Enable building static and shared versions of each library.
# Build with all available CPUs.
# --layout=tagged is very important to allow for both single and multi-threaded versions of the libraries to coexist. See the --layout option in /Jamroot in the boost distribution for more information.
# MPI isn't available on EOS right now :(
readonly NUM_PROCS=$(grep --extended-regexp 'processor[[:space:]]+: [[:digit:]]+' /proc/cpuinfo | wc --lines)
./b2 \
	--prefix="$PREFIX" \
	--layout=tagged \
	--user-config=user-config.jam \
	--without-mpi \
	-j"$NUM_PROCS" \
	install \
	link=shared,static \
	threading=multi,single
