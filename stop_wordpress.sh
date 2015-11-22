#!/bin/sh

PASSWORD=qljhjpdnl
MYSQL_NAME=techmeetup-mysql
WORDPRESS_NAME=techmeetup-wordpress

docker stop ${WORDPRESS_NAME}
docker rm ${WORDPRESS_NAME}

docker stop ${MYSQL_NAME}
docker rm ${MYSQL_NAME}

