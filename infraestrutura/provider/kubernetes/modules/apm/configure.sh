#!/bin/bash
set -e

if [ -n $"NEW_RELIC_LICENSE_KEY" ]; then
    # Configure.
    sed -i -e "s/REPLACE_WITH_REAL_KEY/${NEW_RELIC_LICENSE_KEY}/" \
        -e "s/newrelic.appname[[:space:]]=[[:space:]].*/newrelic.appname=\"${NEWRELIC_APP_NAME}\"/" \
        $(php -r "echo(PHP_CONFIG_FILE_SCAN_DIR);")/newrelic.ini
else
    echo "Skipping New Relic installation stage..."

fi
