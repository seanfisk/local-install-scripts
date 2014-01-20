# General utilities helpful in building software.

source lib/config.bash

# Go into the src/ directory, the sandbox directory for downloading sources. Create if it doesn't exist.
goto_src_dir() {
	[[ ! -d $SOURCE_DIR ]] && mkdir -p "$SOURCE_DIR"
	cd $SOURCE_DIR
}

# Download and extract a source tarball in the current directory.
# INPUT
# $1: tarball URL
# $2: [optional] desired destination archive name (useful for Github master branch downloads)
# OUTPUT VARS
# $src_dir_name: name of the source directory
download_and_extract()
{
	local archive_name
	if [[ $# -eq 2 ]]; then
		archive_name=$2
	else
		archive_name=${1##*/}
	fi
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

# Create a project-specific build directory and make it the working directory.
# INPUT
# $1: name of the directory to create
create_cd_build_dir()
{
	local build_dir=$BUILD_DIR/$1
	[[ -d $build_dir ]] && rm -r "$build_dir"
	mkdir -p "$build_dir"
	cd $build_dir
}

# Check to see if an executable is in the path.
# INPUT
# $1: the executable name to find
# RETURN VALUE
# 0 if found
is_executable_in_path() {
	builtin hash $1 2>/dev/null
}


# Run make and make install.
# INPUT VARS
# $EXTRA_MAKE_FLAGS: array of more flags to pass to make
# $EXTRA_MAKE_STEPS: array of more make steps to run, e.g. ("make check")
# $EXTRA_MAKE_INSTALL_FLAGS: array of more flags to pass to make install
make_install()
{
	make "${EXTRA_MAKE_FLAGS[@]:+${EXTRA_MAKE_FLAGS[@]}}"
	for step in ${EXTRA_MAKE_STEPS[@]:+${EXTRA_MAKE_STEPS[@]}}; do
		make "$step"
	done
	make "${EXTRA_MAKE_INSTALL_FLAGS[@]:+${EXTRA_MAKE_INSTALL_FLAGS[@]}}" install
}
