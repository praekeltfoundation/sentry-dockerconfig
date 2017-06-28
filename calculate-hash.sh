#!/bin/bash

if [[ "x$1" = "x" ]]
then
    echo "Usage: $0 <file>"
    echo " e.g. $0 myfile.txt"
    exit 1
fi

if command -v md5sum > /dev/null
then
    md5sum $1 > $1.md5
else
    if command -v md5 > /dev/null
    then
        md5 -r $1 > $1.md5
    else
        echo "md5 or md5sum not found. Aborting."
        exit 1
    fi
fi
