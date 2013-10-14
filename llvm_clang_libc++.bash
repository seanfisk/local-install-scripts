#!/usr/bin/env bash

# Install LLVM and Clang.

usage() {
	cat >&1 <<EOF
Usage: $0 [--llvm-clang-only] [--libc++-only]
EOF
	exit 1
}

build_llvm_clang=false
build_libcxx=false

if [[ $# -gt 2 ]]; then
	usage
elif [[ $# -eq 1 ]]; then
	case $1 in
		--llvm-clang-only)
			build_llvm_clang=true
			;;
		--libc++-only)
			build_libcxx=true
			;;
		*)
			usage
			;;
	esac
else
	build_llvm_clang=true
	build_libcxx=true
fi

readonly LLVM_VERSION=3.3

# cmake.bash also sources common.bash
source lib/cmake.bash

# $1: the package to download
llvm_package_url() {
	echo "http://llvm.org/releases/$LLVM_VERSION/$1-$LLVM_VERSION.src.tar.gz"
}

# $1: the package to download
download_and_extract_llvm_package() {
	download_and_extract "$(llvm_package_url $1)"
}

if $build_llvm_clang; then

	# This uses autotools and is mostly copied from autotools. However, we need to download extra dependencies so it is not possible to use autotools directly.

	# Download LLVM.
	download_and_extract_llvm_package llvm
	llvm_dir=$src_dir_name
	configure_path=$(readlink --canonicalize-existing "$llvm_dir/configure")

	# Download Clang.
	pushd $llvm_dir/tools
	# For 3.3, `clang-' was changed to `cfe-' (for Clang Front-End).
	download_and_extract_llvm_package cfe
	mv "$src_dir_name" clang
	popd

	# Download Compiler-RT.
	pushd $llvm_dir/projects
	download_and_extract_llvm_package compiler-rt
	mv "$src_dir_name" compiler-rt
	popd

	# Build and install.
	create_build_dir $llvm_dir
	CC="$(which gcc)" CXX="$(which g++)" "$configure_path" --prefix="$PREFIX"

	make_install
fi

if $build_libcxx; then

	# Install libc++. This is in the same script so that the versions
	# can be consistent.

	# Based on "Build on Linux using CMake and libsupc++." section at
	# <http://libcxx.llvm.org/>.

	# Find necessary headers. This is probably not portable, so just
	# test it on every machine first. This was run on Yellowstone.
	headers_arr=($(echo | g++ -Wp,-v -x c++ - -fsyntax-only >/dev/null 2>&1 | grep -F c++ | head -2))

	# Convert it to a colon-separated path.
	IFS=';'
	# The nounset option flips out here for some reason.
	set +o nounset
	headers_path="${headers_arr[*]}"
	set -o nounset
	unset IFS

	# Build and install.
	export CC=clang
	export CXX=clang++
	# I think Unix Makefiles is the default, but let's include it anyway.
	EXTRA_CMAKE_FLAGS=('-G', 'Unix Makefiles', '-DLIBCXX_CXX_ABI=libsupc++', '-DCMAKE_BUILD_TYPE=Release', "-DLIBCXX_LIBSUPCXX_INCLUDE_PATHS='$headers_path'")
	cmake_install "$(llvm_package_url libcxx)"
fi
