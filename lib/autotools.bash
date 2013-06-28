source lib/common.bash

# Download, configure, make, and make install an autotools project.
#
# This defaults to an out-of-source build.
#
# $IN_SOURCE: do an in-source build, default is out-of-source
# $EXTRA_CONFIGURE_FLAGS: array of more flags to pass to configure
# $1: tarball URL
autotools()
{
	download_and_extract $1
	configure_path=$(readlink --canonicalize-existing "$src_dir_name/configure")
	if [[ -z ${IN_SOURCE:+IN_SOURCE} ]]; then
		create_build_dir $src_dir_name
	else
		cd $src_dir_name
	fi
	"$configure_path" --prefix="$PREFIX" "${EXTRA_CONFIGURE_FLAGS[@]:+${EXTRA_CONFIGURE_FLAGS[@]}}"
	make_install
}
