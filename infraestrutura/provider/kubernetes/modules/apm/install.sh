#!/bin/bash
set -e

if [ -n $"NEW_RELIC_LICENSE_KEY" ]; then
    # Install.
    apt-get update && apt-get install -y wget gnupg
    echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

    apt-get update -y
    apt-get install newrelic-php5 -y

    NR_INSTALL_SILENT=1 newrelic-install install

    # Cleanup.
    apt-get remove -y wget gnupg

else
    echo "Skipping New Relic installation stage..."

fi
