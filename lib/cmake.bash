# Handle CMake projects.

source lib/build.bash

# Download, CMake, and make a CMake project.
#
# This defaults to an out-of-source build.
#
# $IN_SOURCE: do an in-source build, default is out-of-source
# $EXTRA_CMAKE_FLAGS: array of more flags to pass to cmake
# $1: tarball URL
cmake_install()
{
	goto_src_dir
	download_and_extract $1
	source_path="$PWD/$src_dir_name"
	if [[ -z ${IN_SOURCE:+IN_SOURCE} ]]; then
		create_cd_build_dir $src_dir_name
	else
		cd $src_dir_name
	fi
	cmake \
		-DCMAKE_INSTALL_PREFIX="$PREFIX" \
		"${EXTRA_CMAKE_FLAGS[@]:+${EXTRA_CMAKE_FLAGS[@]}}" \
		"$source_path"
	make_install
}
