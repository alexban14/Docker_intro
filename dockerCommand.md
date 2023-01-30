# to preapear the app for deployment we tell docker to build the application

docker build -t hello-docker

List docker images on the machine
docker image ls

Docker run hello-world => run the app on any machine that has docker

## Push image on DockerHub, pull it on antoher maschine and run it there

docker pull codewithmosh/hello-docker

docker run ubuntu ( image locally ? run it : pull it from D.Hub )
docker run <- container id -> => creates a new container for that
docker start <- id -> => strats that container
docker run -d => runs container in detached mode
docker run -p 6000:6379 => creates a binding between the machines port and containers port

docker ps -a => list all running processes, runnning or not

docker stop <- id -> => stops an running container

docker run -it ubunut (start a container and interact with it) => starts a linux command line

ubuntu apt package manager
when installing a package run => apt update => apt install x => apt remove nano

Redirecting ( changing the source of the input / output )
cat file1.txt file2.txt > combined.txt => combines 2 files into another ( > redirecton )

## Troubleshooting docker

docker logs <- container id / name>
docker exec -it <- id -> /bin/bash

## Isolated Docker Nerwork

docker network ls
docker network create <- name ->

## Dev Process

running mongodb in the container

docker run -p 27017:27017 -d -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret --name mongodb --net mongo-network mongo

Connect mongo-express container with mongodb container via Isolated Docker network

docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=mongoadmin -e ME_CONFIG_MONGODB_ADMINPASSWORD=secret --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express

## Run compose.yaml files

docker-compose -f mongo_docker.yaml up
=> creates a new network for running the container
docker-compose -f mongo_docker.yaml up
=> shuts down all containers and deletes the network

## Dockerfile => to create an image from your app

docker build -t yelp_camp:1.0 .
docker run yelp_camp:1.0

docker rmi <- id -> => delete an image

## Docker volumes

1) Host volumes => docker run -v /home/mount/data:/var/lib/mysql/data
