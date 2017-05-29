# Supported tags and respective `Dockerfile` links

- 7.1, 7, latest [(Dockerfile.7.1)](https://github.com/modera/docker-php/tree/master/Dockerfile.7.1)
- 7.0 [(Dockerfile.7.0)](https://github.com/modera/docker-php/tree/master/Dockerfile.7.0)
- 5.6, 5 [(Dockerfile.5.6)](https://github.com/modera/docker-php/tree/master/Dockerfile.5.6)

# Environment variables

The following environment variables are also honored for configuring your PHP instance:

- -e `PHP_DATE_TIMEZONE=...` (defaults to Europe/Tallinn)
- -e `PHP_FPM_MAX_EXECUTION_TIME=...` (defaults to 30)
- -e `PHP_FPM_MAX_INPUT_TIME=...` (defaults to 60)
- -e `PHP_FPM_MEMORY_LIMIT=...` (defaults to 128M)
- -e `PHP_FPM_LOG_LEVEL=...` (defaults to notice, available: alert, error, warning, notice, debug)
