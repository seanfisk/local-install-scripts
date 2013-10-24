#!/usr/bin/env bash
# Patch all executables in the bin/ directory with the $PREFIX rpath.

source lib/config.bash

find "$PREFIX/bin" -type f -executable -print0 | while read -r -d $'\0' exe; do
	if [[ "$(file --brief "$exe")" == ELF*dynamically* ]]; then
		current_rpath=$(patchelf --print-rpath "$exe")
		patchelf --set-rpath "$PREFIX/lib:$current_rpath" "$exe"
		# Strip all unnecessary rpath entries.
		patchelf --shrink-path "$exe"
	fi
done
