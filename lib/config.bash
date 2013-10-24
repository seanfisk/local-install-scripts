# Don't allow unset variables.
set -o nounset
# Crash on error of any programs.
set -o errexit
# Show what we are doing at every step.
set -o xtrace

readonly PREFIX=$HOME/.local
readonly SOURCE_DIR=$PREFIX/src
readonly BUILD_DIR=$PREFIX/build
