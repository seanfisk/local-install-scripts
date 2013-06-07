#!/usr/bin/env bash

source lib/autotools.bash

# xclip does not support out-of-source builds.
IN_SOURCE=true
autotools http://sourceforge.net/projects/xclip/files/xclip/0.12/xclip-0.12.tar.gz
