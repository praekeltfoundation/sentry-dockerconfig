#!/bin/bash

# Check for any hash mismatches
for f in Dockerfile sentry.conf.py update-config-files.sh
do
    if command -v md5sum > /dev/null
    then
        if ! md5sum -c $f.md5
        then
            echo "Hash for $f does not match. File has been changed outside of the scripts."
            echo "Please either use the scripts to update the file, or, if you are certain of the change, run the calculate-hash.sh command to update the hash"
            exit 1
        fi
    else
        if command -v md5 > /dev/null
        then
            if ! [[ `md5 -r $f` = `cat $f.md5` ]]
            then
                echo "Hash for $f does not match. File has been changed outside of the scripts."
                echo "Please either use the scripts to update the file, or, if you are certain of the change, run the calculate-hash.sh command to update the hash"
                exit 1
            fi
        else
            echo "md5 or md5sum not found. Aborting."
            exit 1
        fi
    fi
done
