DIR_PATH=$(dirname $(readlink -f ${BASH_SOURCE:-$0}))

build_image() {
    docker build \
        -t ${1:-api-tm} \
        -f $DIR_PATH/Dockerfile \
        --build-arg NEW_RELIC_LICENSE_KEY=$NEW_RELIC_LICENSE_KEY \
        --build-arg NEWRELIC_APP_NAME=$NEWRELIC_APP_NAME \
        .
}

build_image $1
