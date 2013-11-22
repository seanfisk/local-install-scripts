# Handle autotools projects.

source lib/build.bash

# Download, configure, make, and make install an autotools project.
#
# This defaults to an out-of-source build.
#
# $IN_SOURCE: do an in-source build, default is out-of-source
# $EXTRA_CONFIGURE_FLAGS: array of more flags to pass to configure; be aware that when passing these you override the default values of CPPFLAGS and LDFLAGS, so you must include the original values if necessary.
# $1: tarball URL
autotools()
{
	goto_src_dir
	download_and_extract $1
	configure_path="$PWD/$src_dir_name/configure"
	if [[ -z ${IN_SOURCE:+IN_SOURCE} ]]; then
		create_cd_build_dir $src_dir_name
	else
		cd $src_dir_name
	fi
	"$configure_path" \
		--prefix="$PREFIX" \
		CPPFLAGS="-I$PREFIX/include" \
		LDFLAGS="-L$PREFIX/lib -L$PREFIX/lib64 -Wl,-rpath,$PREFIX/lib" \
		"${EXTRA_CONFIGURE_FLAGS[@]:+${EXTRA_CONFIGURE_FLAGS[@]}}"
	make_install
}
