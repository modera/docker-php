#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
WORKDIR="$(dirname $SCRIPT_DIR)"

REPOSITORY=modera/php
PUSH_IMAGE=NO
ADD_TAGS=NO

for i in "$@"; do
case $i in
    --repository=*)
        REPOSITORY="${i#*=}"
        shift
    ;;
    --push)
        PUSH_IMAGE=YES
        shift
    ;;
    --add-tags)
        ADD_TAGS=YES
        shift
    ;;
    *)
        # unknown option
    ;;
esac
done

build_docker_image() {
    TAG=$1
    shift
    docker build --pull --no-cache --rm --build-arg VERSION_ARG="${TAG}-fpm" -f $WORKDIR/Dockerfile -t $REPOSITORY:$TAG "$WORKDIR"
    if [ "YES" = "$PUSH_IMAGE" ]; then
        docker push $REPOSITORY:$TAG
    fi
    if [ "YES" = "$ADD_TAGS" ]; then
        for ADD_TAG in $@; do
            docker tag $REPOSITORY:$TAG $REPOSITORY:$ADD_TAG
            if [ "YES" = "$PUSH_IMAGE" ]; then
                docker push $REPOSITORY:$ADD_TAG
            fi
        done
    fi
}

#build_docker_image 5.6    5
#build_docker_image 7.0
#build_docker_image 7.1
#build_docker_image 7.2
#build_docker_image 7.3

build_docker_image 7.4    7
build_docker_image 8.0
build_docker_image 8.1    8 latest
