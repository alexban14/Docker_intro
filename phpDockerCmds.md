# Docker commands related to php

-e => we can define env var in docker run commands

docker run --name db -e MYSQL_ROOT_PASSWORD=somewordpress -e MYSQL_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -d mariadb:10.6.4-focal --default-authentication-plugin=mysql_native_password

docker run --name phpmyadmin -d -p 8081:80 -e PME_ARBITRARY=1 phpmyadmin/phpmyadmin

mariadb id e496336c2f60

docker inspect e496336c2f60 => "IPAddress": "172.17.0.3", will be used to access the database server from php myAdmin

## bind mounts, bind a folder to a docker host into a container

docker run --name db -e MYSQL_ROOT_PASSWORD=somewordpress -e MYSQL_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --mount type=bind,source="$(pwd)"/mariadb_data,target=/var/lib/mysql -d mariadb:10.6.4-focal --default-authentication-plugin=mysql_native_password

## Docker volumes

docker volume create mariadb_data
docker volume inspect mariadb_data
docker volume rm mariadb_data

## run command that also creates docker volume

docker run --name db -e MYSQL_ROOT_PASSWORD=somewordpress -e MYSQL_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --mount source=mariadb_data,target=/var/lib/mysql -d mariadb:10.6.4-focal --default-authentication-plugin=mysql_native_password

## run command that specifies what volume a container should use

docker run --name db -e MYSQL_ROOT_PASSWORD=somewordpress -e MYSQL_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -v mariadb_data:/var/lib/mysql -d mariadb:10.6.4-focal --default-authentication-plugin=mysql_native_password

## running an application of multiple services with Docker

docker compose up -d => in the dir of the compose.yaml file

docker compose down => stops and removes any containers mentioned in the compose file

## Laravel docker (Laravel sail package)

- php artisan sail:install => provides you a docker.compose.yaml file with all the needed configs
- wsl --install -d Ubuntu (first you need to have a linux distro installed via WSL)
- wsl -s Ubuntu (sets the default distro)
- wsl
- ./vendor/bin/sail up -d

## connection to the sail mysql conatiner

- you must configure the .env file with the following fields:
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=shared_docs
DB_USERNAME=root
DB_PASSWORD=password

- run the sail build command
- ./vendor/bin/sail mysql -p'password-from-env'
