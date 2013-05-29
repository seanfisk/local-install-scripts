#!/bin/bash

# ./protobuf.bash

source build-systems/autotools.bash

# Mosh needs to be able to find `protobuf.pc' in the pkg-config path,
# so export this environment variable.
export PKG_CONFIG_PATH=~/.local/lib/pkgconfig

autotools http://mosh.mit.edu/mosh-1.2.4.tar.gz
