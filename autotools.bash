#!/bin/bash

source install_scripts.bash

autotools()
{
	download_and_extract $1
  configure_path=$(readlink --canonicalize-existing "$src_dir_name/configure")
	create_build_dir $src_dir_name
  "$configure_path" --prefix="$PREFIX" ${EXTRA_CONFIGURE_FLAGS:+$EXTRA_CONFIGURE_FLAGS}
	make_install
}