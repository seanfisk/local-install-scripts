#!/bin/bash

source install_scripts.bash

cmake_install()
{
	download_and_extract $1
  source_path=$(readlink --canonicalize-existing "$src_dir_name")
	create_build_dir $src_dir_name
	cmake -DCMAKE_INSTALL_PREFIX="$PREFIX" ${EXTRA_CMAKE_FLAGS:+EXTRA_CMAKE_FLAGS} "$source_path"
	make_install
}