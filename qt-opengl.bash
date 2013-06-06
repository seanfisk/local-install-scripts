#!/usr/bin/env bash

source build-systems/autotools.bash

EXTRA_CONFIGURE_FLAGS=(
	-opensource
	-shared
	-fast
	-no-qt3support
	-no-xmlpatterns
	-no-multimedia
	-no-audio-backend
	-no-phonon
	-no-phonon-backend
	-no-svg
	-no-webkit
	-no-javascript-jit
	-no-script
	-no-scripttools
	-no-declarative
	-no-declarative-debug
	-no-nis
	-no-cups
	-no-dbus
	-opengl
	-no-openvg
)
autotools http://releases.qt-project.org/qt4/source/qt-everywhere-opensource-src-4.8.4.tar.gz
