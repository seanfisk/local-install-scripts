#!/usr/bin/env bash

source lib/autotools.bash
readonly ARIA2_VERSION=1.17.1
autotools "http://sourceforge.net/projects/aria2/files/stable/aria2-$ARIA2_VERSION/aria2-$ARIA2_VERSION.tar.xz"
