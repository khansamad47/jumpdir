#!/bin/bash
BIN_DIR=$HOME/bin
SCRIPT_DIR=$(dirname $(realpath $0))
SCRIPT_FILE='jumpdir.sh'
BASH_RC=$HOME/.bashrc
mkdir -vp $BIN_DIR
cp $SCRIPT_DIR/$SCRIPT_FILE $BIN_DIR/.

if [ ! -f $BASH_RC ]; then
    echo "Cannot find bash rc!"
    exit 1
fi

LINE="source $BIN_DIR/$SCRIPT_FILE"
grep -q -F "$LINE" $BASH_RC || echo "$LINE" >> $BASH_RC || source $BASH_RC

