#!/bin/bash

docker run sentry:8.3 cat /etc/sentry/sentry.conf.py > sentry.conf.py
echo "SENTRY_FEATURES['auth:register'] = False" >> sentry.conf.py
./calculate-hash.sh sentry.conf.py
