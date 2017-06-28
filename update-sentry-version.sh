#!/bin/bash

if [[ "x$1" = "x" ]]
then
    echo "Usage: $0 <version number>"
    echo " e.g. $0 0.1.0"
    exit 1
fi

sed -i.bak "s/\(FROM sentry:\)\(.*\)\($\)/\1$1\3/" Dockerfile
./calculate-hash.sh Dockerfile

sed -i.bak "s/\(docker run sentry:\)\(.*\)\( cat.*$\)/\1$1\3/" update-config-files.sh
./calculate-hash.sh update-config-files.sh

./update-config-files.sh
