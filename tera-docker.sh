#!/bin/bash

HTTP_PORT=8090
NODE_PORT=30000
NODE_PASS=changeme321

# update and install docker
sudo apt update; \
sudo apt install docker.io

# create TERA dir and DATA dir
cd ~
mkdir TERA
cd TERA
mkdir DATA
sudo chmod -R 777 DATA

sudo docker pull nunoferro/tera:latest

sudo docker run -d --restart always -p $HTTP_PORT:$HTTP_PORT -p $NODE_PORT:$NODE_PORT \
   -v $(pwd)/DATA:/DATA \
   -e PASSWORD=$NODE_PASS \
   -e PORT=$HTTP_PORT \
   -e NODE_PORT=$NODE_PORT \
   --name tera nunoferro/tera:latest

sudo docker logs -f tera
