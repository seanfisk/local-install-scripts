#!/usr/bin/env bash

# Install LLVM and Clang.

readonly LLVM_VERSION=3.3

source lib/common.bash

# This uses autotools and is mostly copied from autotools. However, we need to download extra dependencies so it is not possible to use autotools directly.

# Download LLVM.
download_and_extract "http://llvm.org/releases/$LLVM_VERSION/llvm-$LLVM_VERSION.src.tar.gz"
llvm_dir=$src_dir_name
configure_path=$(readlink --canonicalize-existing "$llvm_dir/configure")

# Download Clang.
pushd $llvm_dir/tools
# For 3.3, `clang-' was changed to `cfe-' (for Clang Front-End).
download_and_extract "http://llvm.org/releases/$LLVM_VERSION/cfe-$LLVM_VERSION.src.tar.gz"
mv "$src_dir_name" clang
popd

# Download Compiler-RT.
pushd $llvm_dir/projects
download_and_extract "http://llvm.org/releases/$LLVM_VERSION/compiler-rt-$LLVM_VERSION.src.tar.gz"
mv "$src_dir_name" compiler-rt
popd

# Build and install.
create_build_dir $llvm_dir
"$configure_path" --prefix="$PREFIX"
make
make install
