#!/bin/bash
set -e

# config ssh keys
mkdir -p ~/.ssh
touch ~/.ssh/config
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config
eval $(ssh-agent -s)
cat certs/interno.incuca.net.pem | ssh-add - > /dev/null

# execute in remote
ssh ubuntu@interno.incuca.net 'bash' <<EOF
set -e
cd proxy

# stop instances
docker-compose stop

# repo
git fetch --all
git reset --hard origin/master
git pull

# docker-compose
docker-compose up -d
EOF