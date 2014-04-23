#!/usr/bin/env bash

source lib/config.bash

readonly DEST_FILE=$PREFIX/bin/ack
wget http://beyondgrep.com/ack-2.10-single-file -O "$DEST_FILE"
chmod +x "$DEST_FILE"
