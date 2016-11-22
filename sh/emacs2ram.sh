#!/bin/sh
if [ -z "$1" ]; then
    echo "Usage:"
    echo "  emacs2ram start"
    echo "  emacs2ram restore"
    exit 1
fi

backup=/home/thom/.emacs.d-backup
link=/home/thom/.emacs.d
volatile=/run/thom/.emacs.d-$USER

if [ "$1" = "start" ]; then
    IFS=
    set -efu
    if [ ! -r $volatile ]; then
        mkdir -m0700 $volatile
    fi
    # link -> volatie does not exist
    if [ "$(readlink $link)" != "$volatile" ]; then
        # backup project at first
        mv $link $backup
        # create the link
        ln -s $volatile $link
    fi
    if [ -e $link/.unpacked ]; then
        echo "Sync .emacs.d from memory to backup ..."
        rsync -avq --delete --exclude $link/.unpacked $link/ $backup/
        echo "DONE!"
    else
        echo "Sync .emacs.d from disk to memory ..."
        rsync -avq $backup/ $link/
        touch $link/.unpacked
        echo "DONE!"
    fi
elif [ "$1" = "restore" ]; then
    echo "Moving .emacs.d back to disk ..."
    if [ -e $link/.unpacked ]; then
        rm -rf $link && mv $backup $link && rm -rf $volatile
    else
        echo ".emacs.d not to memory"
    fi
    echo "DONE!"
fi
