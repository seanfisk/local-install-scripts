#!/usr/bin/env bash

source lib/autotools.bash

# xclip does not support out-of-source builds.
IN_SOURCE=true
readonly XCLIP_VERSION=0.12
autotools "http://sourceforge.net/projects/xclip/files/xclip/$XCLIP_VERSION/xclip-$XCLIP_VERSION.tar.gz"
