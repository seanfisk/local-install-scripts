#!/usr/bin/env bash

source lib/autotools.bash

readonly EXPAT_VERSION=2.1.0

autotools "http://downloads.sourceforge.net/project/expat/expat/$EXPAT_VERSION/expat-$EXPAT_VERSION.tar.gz"
