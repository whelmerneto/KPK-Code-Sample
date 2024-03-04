#!/bin/bash
set -e

start_nginx() {
    entrypoint_log() {
        if [ -z "${NGINX_ENTRYPOINT_QUIET_LOGS:-}" ]; then
            echo "$@"
        fi
    }

    if /usr/bin/find "build-modules/nginx/entrypoint.d/" -mindepth 1 -maxdepth 1 -type f -print -quit 2>/dev/null | read v; then
        entrypoint_log "$0: build-modules/nginx/entrypoint.d/ is not empty, will attempt to perform configuration"

        entrypoint_log "$0: Looking for shell scripts in build-modules/nginx/entrypoint.d/"
        find "build-modules/nginx/entrypoint.d/" -follow -type f -print | sort -V | while read -r f; do
            if [ -x "$f" ]; then
                entrypoint_log "$0: Launching $f";
                "$f"
            else
                # warn on shell scripts without exec bit
                entrypoint_log "$0: Ignoring $f, not executable";
            fi
        done

        entrypoint_log "$0: Configuration complete; ready for start up"
    else
        entrypoint_log "$0: No files found in build-modules/nginx/entrypoint.d/, skipping configuration"
    fi

    service nginx start
}

setup_newrelic() {

    response=$(curl -X 'GET' \
      'https://api.newrelic.com/v2/applications/'${NEW_RELIC_APP_ID}'/hosts.json' \
      -H 'accept: application/json' \
      -H 'X-Api-Key: '${NEW_RELIC_API_KEY}'')

    echo "\n $response \n"
    NEW_RELIC_HOSTS_NUMBER=$(echo $response | jq '.application_hosts | length')
    echo "Number of hosts running with newrelic: ${NEW_RELIC_HOSTS_NUMBER}"
    if [ $NEW_RELIC_HOSTS_NUMBER -lt 2 ]; then
        echo "configuring new relic"
        sed -i -e "s/REPLACE_WITH_REAL_KEY/${NEW_RELIC_LICENSE_KEY}/" \
        -e "s/newrelic.appname[[:space:]]=[[:space:]].*/newrelic.appname=\"${NEWRELIC_APP_NAME}\"/" \
        $(php -r "echo(PHP_CONFIG_FILE_SCAN_DIR);")/newrelic.ini
    else
        echo "Skipping new relic"
    fi
}

setup_newrelic
start_nginx

# Run migrations on Production
php artisan migrate --force

php-fpm -R
