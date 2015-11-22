#!/bin/sh

PASSWORD=qljhjpdnl
MYSQL_NAME=techmeetup-mysql
WORDPRESS_NAME=techmeetup-wordpress

# Start mysql, make sure the volumn isn't in the docker image.
docker run \
    -i \
    -d \
    -p 3306:3306 \
    --name ${MYSQL_NAME} \
    -e MYSQL_ROOT_PASSWORD=${PASSWORD} \
    -e MYSQL_DATABASE=wordpress \
    mysql:5.7

# Start wordpress, talking to the mysql we build up just now.
docker run \
    -d \
    --name ${WORDPRESS_NAME} \
    -e WORDPRESS_DB_PASSWORD=${PASSWORD} \
    -e WORDPRESS_DB_NAME=wordpress \
    --link ${MYSQL_NAME}:mysql \
    -p 80:80 \
    xfguo-wp
