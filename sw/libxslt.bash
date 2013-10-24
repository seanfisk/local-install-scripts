#!/usr/bin/env bash

source lib/autotools.bash

# Does not support out-of-source builds.
IN_SOURCE=true

autotools ftp://xmlsoft.org/libxslt/libxslt-1.1.26.tar.gz
