#!/usr/bin/env bash

source lib/build.bash

readonly QT_VERSION=4.8.5

goto_src_dir

download_and_extract "http://download.qt-project.org/official_releases/qt/4.8/$QT_VERSION/qt-everywhere-opensource-src-$QT_VERSION.tar.gz"
configure_path="$PWD/$src_dir_name/configure"

create_cd_build_dir $src_dir_name

"$configure_path" \
	-prefix "$PREFIX" \
	-opensource \
	-confirm-license \
	-shared \
	-fast \
	-no-qt3support \
	-no-audio-backend \
	-no-phonon \
	-no-phonon-backend \
	-no-svg \
	-no-webkit \
	-no-javascript-jit \
	-no-script \
	-no-scripttools \
	-no-declarative \
	-no-declarative-debug \
	-no-nis \
	-no-cups \
	-no-dbus \
	-opengl \
	-no-openvg

make
make install
