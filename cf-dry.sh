#!/bin/sh

p="$@"
if [ -z "$p" ]; then
    p=`pwd`;
fi

php-cs-fixer fix $p --dry-run --diff
