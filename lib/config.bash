# Don't allow unset variables.
set -o nounset
# Crash on error of any programs.
set -o errexit
# Show what we are doing at every step.
set -o xtrace

readonly PREFIX=$HOME/.local
readonly SOURCE_DIR=$PREFIX/src
readonly BUILD_DIR=$PREFIX/build

# Set this for pkg-config so that our local packages are found.
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig:${PKG_CONFIG_PATH:+PKG_CONFIG_PATH}
