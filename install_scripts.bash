#!/bin/bash
set -o nounset
set -o errexit
set -o xtrace

readonly PREFIX=$HOME/.local

download_and_extract()
{
  local archive_name=${1##*/}
	[[ -f $archive_name ]] && rm "$archive_name"
	wget "$1"
	extracted_files=$(tar -xvf "$archive_name")
	src_dir_name=$(head --lines=1 <<< "$extracted_files")
	# remove trailing slash
	src_dir_name=${src_dir_name%/}
}

create_build_dir()
{
  local build_dir=$PREFIX/build/$1
	[[ -d $build_dir ]] && rm -r "$build_dir"
  mkdir -p "$build_dir"
  cd $build_dir
}

make_install()
{
  make ${EXTRA_MAKE_FLAGS[@]:+$EXTRA_MAKE_FLAGS[@]}
  for step in ${EXTRA_MAKE_STEPS[@]:+$EXTRA_MAKE_FLAGS[@]}; do
    make $step
  done
  make ${EXTRA_MAKE_INSTALL_FLAGS[@]:+$EXTRA_MAKE_INSTALL_FLAGS[@]} install
}