# start from a base img and add files on top of it
FROM  node:alpine

# copy app program files
COPY . /app

# execute commands
WORKDIR /app
CMD node app.js