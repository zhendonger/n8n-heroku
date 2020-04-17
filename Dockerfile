FROM ubuntu:latest

RUN adduser --disabled-password docker
USER docker

# Install Node.js
RUN apt-get -y --no-install-recommends install \
  curl 
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
RUN apt-get install --yes nodejs
RUN apt-get install --yes build-essential

# Bundle app source
# Trouble with COPY http://stackoverflow.com/a/30405787/2926832
COPY . /src

# Install app dependencies
RUN cd /src; npm install; npm install -g n8n;

# Binds to port 8080
EXPOSE  8080

#  Defines your runtime(define default command)
# These commands unlike RUN (they are carried out in the construction of the container) are run when the container
# CMD ["node", "/src/index.js"]

RUN n8n