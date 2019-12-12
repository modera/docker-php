ARG VERSION_ARG=7.4-fpm

FROM cravler/php:${VERSION_ARG}

LABEL maintainer "Sergei Vizel <http://github.com/cravler>"

# Common environment variables
ENV TZ Europe/Tallinn

RUN \
\
# Immortal repo installing
    curl -L https://packagecloud.io/immortal/immortal/gpgkey 2> /dev/null | apt-key add - &>/dev/null && \
    echo 'deb https://packagecloud.io/immortal/immortal/ubuntu/ bionic main' > /etc/apt/sources.list.d/immortal_immortal.list && \
    echo 'deb-src https://packagecloud.io/immortal/immortal/ubuntu/ bionic main' >> /etc/apt/sources.list.d/immortal_immortal.list && \
\
# All our dependencies, in alphabetical order (to ease maintenance)
    apt-get update && apt-get install -y --no-install-recommends \
        cron \
        immortal \
        jq \
        libfcgi0ldbl \
        libfcgi-bin \
        mysql-client \
        openssh-client \
        wget && \
\
# Remove cache
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD cf-dry.sh /usr/local/bin/cf-dry
ADD cf-fix.sh /usr/local/bin/cf-fix
