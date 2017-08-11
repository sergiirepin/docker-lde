Docker Local development Environment
===================================

- html - root directory
- mysq/dump.sql - database will be imported
- webdevops/php-apache-dev:5.6 - 5.6 tag can be changed to 7.0 or 7.1 (  http://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache-dev.html  )
- docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id -container ip for etc/hosts
- up.sh - script for start containers
- down.sh - script for down contaiers ( name far should be changed )
- app env variables according to description ( http://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache-dev.html )


TODO:
- Cron
- Email
