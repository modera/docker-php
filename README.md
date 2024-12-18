# Supported tags and respective `Dockerfile` links

- 8.4, 8, latest [(Dockerfile)](https://github.com/modera/docker-php/tree/master/Dockerfile)
- 8.3
- 8.2
- 8.1

# End of life

- 8.0
- 7.4, 7
- 7.3
- 7.2
- 7.1
- 7.0
- 5.6, 5

# Environment variables

The following environment variables are also honored for configuring your PHP instance:

- -e `PHP_DATE_TIMEZONE=...` (defaults to Europe/Tallinn)
- -e `PHP_FPM_MAX_EXECUTION_TIME=...` (defaults to 30)
- -e `PHP_FPM_MAX_INPUT_TIME=...` (defaults to 60)
- -e `PHP_FPM_MEMORY_LIMIT=...` (defaults to 128M)
- -e `PHP_FPM_LOG_LEVEL=...` (defaults to notice, available: alert, error, warning, notice, debug)
