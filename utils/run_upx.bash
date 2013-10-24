#!/usr/bin/env bash
# Compress all executables in the bin/ directory using UPX.

source lib/config.bash
set +o nounset

compressed_files=()
failed_files=()

find "$PREFIX/bin" -type f -executable -print0 | while read -r -d $'\0' exe; do
	# If UPX refuses to compress the executable (due to permissions, file type, etc.) the executable will be unchanged but UPX will still exit with failure. Don't exit the script if this happens.
	set -o errexit
	if upx --best "$exe"; then
		compressed_files=("${compressed_files[@]}" "$exe")
	else
		failed_files=("${failed_files[@]}" "$exe")
	fi
	set +o errexit
done

echo 'Compressed successfully'
IFS=$'\n' echo "${compressed_files[*]}"

echo

echo 'Compression failure'
IFS=$'\n' echo "${failed_files[*]}"
