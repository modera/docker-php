ARG VERSION_ARG=8.4-fpm

FROM cravler/php:${VERSION_ARG}

LABEL maintainer="Sergei Vizel <http://github.com/cravler>"

# Common environment variables
ENV TZ=Europe/Tallinn

RUN \
\
# Immortal repo installing
    curl -s https://packagecloud.io/install/repositories/immortal/immortal/script.deb.sh | os=ubuntu dist=jammy bash && \
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
