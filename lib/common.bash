set -o nounset
set -o errexit
set -o xtrace

readonly PREFIX=$HOME/.local
readonly SOURCE_DIR=$PREFIX/src

# Sandbox directory for downloading sources
[[ ! -d $SOURCE_DIR ]] && mkdir -p "$SOURCE_DIR"
cd $SOURCE_DIR

# Download and extract a source archive (tarball).
# $1: tarball URL
# returns
# $src_dir_name: name of the source directory
download_and_extract()
{
	local archive_name=${1##*/}
	if [[ ! -f $archive_name ]]; then
		# Use downloaded archives if they exist. May not be the safest option, but is certainly the fastest.

		# Added the `--output-document' mainly to tame the messy Github URLs.
		wget "$1" --output-document="$archive_name"
	fi
	# Get the name of the directory created by untarring. The `-t' flag lists the contents of the tarfile.
	src_dir_name=$(tar -tf "$archive_name" | head -n 1)
	# Remove trailing slash.
	src_dir_name=${src_dir_name%%/*}
	# Now actually extract the files.
	tar -xf "$archive_name"
}

# Create the build directory and change to it.
# $1: name of the directory to create
create_build_dir()
{
	local build_dir=$PREFIX/build/$1
	[[ -d $build_dir ]] && rm -r "$build_dir"
	mkdir -p "$build_dir"
	cd $build_dir
}

# Patches all binaries in the current directory with the $PREFIX
# rpath.
set_rpath()
{
	find . -type f -executable -print0 | while read -r -d $'\0' binary; do
		if [[ "$(file --brief "$binary")" == ELF* ]]; then
			patchelf --set-rpath "$(patchelf --print-rpath "$binary"):$PREFIX/lib:$PREFIX/lib64" "$binary"
		fi
	done
}

# Check to see if an executable is in the path.
# $1: the executable name to find
is_executable_in_path() {
	builtin hash $1 2>/dev/null
}


# Run make and make install.
# $EXTRA_MAKE_FLAGS: array of more flags to pass to make
# $EXTRA_MAKE_STEPS: array of more make steps to run, e.g. ("make check")
# $EXTRA_MAKE_INSTALL_FLAGS: array of more flags to pass to make install
make_install()
{
	make "${EXTRA_MAKE_FLAGS[@]:+${EXTRA_MAKE_FLAGS[@]}}"
	for step in ${EXTRA_MAKE_STEPS[@]:+${EXTRA_MAKE_STEPS[@]}}; do
		make "$step"
	done
	# Patch rpath in binaries if patchelf is available.
	if is_executable_in_path patchelf; then
		set_rpath
	fi
	make "${EXTRA_MAKE_INSTALL_FLAGS[@]:+${EXTRA_MAKE_INSTALL_FLAGS[@]}}" install
}
