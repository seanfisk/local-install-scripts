#!/usr/bin/env bash

source lib/autotools.bash

readonly GNUPLOT_VERSION=4.6.4
autotools "http://sourceforge.net/projects/gnuplot/files/gnuplot/$GNUPLOT_VERSION/gnuplot-$GNUPLOT_VERSION.tar.gz"
