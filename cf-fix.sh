#!/bin/sh

if [ ! -e ${COMPOSER_HOME}/vendor/bin/php-cs-fixer ]; then
    composer global require friendsofphp/php-cs-fixer
fi

p="$@"
if [ -z "$p" ]; then
    p=`pwd`;
fi

php-cs-fixer fix $p --diff
