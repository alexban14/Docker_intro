# start from a base img and add files on top of it
FROM  node:alpine

# copy app program files
COPY . /app

# execute commands
WORKDIR /app
CMD node app.js

# to preapear the app for deployment we tell docker to build the application:
# docker build -t hello-docker .

#list docker images on the machine
#docker image ls

# docker run hello-world => run the app on any machine that has docker

#you can push the image on DockerHub, pull it on antoher maschine and run it there
#docker pull codewithmosh/hello-docker

# docker run ubuntu ( image locally ? run it : pull it from D.Hub )

# docker ps -a => list all running processes

#docker run -it ubunut (start a container and interact with it) => starts a linux command line

#ubuntu apt package manager
#when installing a package run => apt update => apt install x => apt remove nano

#Redirecting ( changing the source of the input / output )
# cat file1.txt file2.txt > combined.txt => combines 2 files into another ( > redirecton )
