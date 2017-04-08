#!/bin/bash
SCRIPT_DIR=$HOME/scripts
SOURCE_DIR=$(dirname $(realpath $0))
SCRIPT_FILE='jumpdir.sh'
BASH_RC=$HOME/.bashrc
mkdir -vp $SCRIPT_DIR
cp $SOURCE_DIR/$SCRIPT_FILE $SCRIPT_DIR/.

if [ ! -f $BASH_RC ]; then
    echo "Error! Cannot find .bashrc file!"
    exit 1
fi

LINE="source $SCRIPT_DIR/$SCRIPT_FILE"
grep -q -F "$LINE" $BASH_RC || echo "$LINE" >> $BASH_RC && source $BASH_RC

