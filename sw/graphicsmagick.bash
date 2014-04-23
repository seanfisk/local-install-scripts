#!/usr/bin/env bash

readonly GM_VERSION=1.3.19

source lib/autotools.bash
autotools "http://sourceforge.net/projects/graphicsmagick/files/graphicsmagick/$GM_VERSION/GraphicsMagick-$GM_VERSION.tar.gz"
