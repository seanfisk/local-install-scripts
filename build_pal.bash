#!/bin/sh
#	-D PAL_STATIC=true \
cmake \
	-D PAL_BUILD_BENCHMARK=false \
	-D PAL_BUILD_BULLET=true \
	-D BULLET_INCLUDE_DIR=/home/fiskse/.local/include/bullet \
	-D BULLET_LIBRARY_BulletSoftBody=/home/fiskse/.local/lib/libBulletSoftBody.a \
	-D BULLET_LIBRARY_BulletDynamics=/home/fiskse/.local/lib/libBulletDynamics.a \
	-D BULLET_LIBRARY_BulletCollision=/home/fiskse/.local/lib/libBulletCollision.a \
	-D BULLET_LIBRARY_LinearMath=/home/fiskse/.local/lib/libLinearMath.a \
	-D CMAKE_INSTALL_PREFIX=~/.local \
	-D CMAKE_INSTALL_RPATH=~/.local/lib \
	. -G "Unix Makefiles"
