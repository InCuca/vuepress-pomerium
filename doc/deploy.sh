#!/bin/bash
set -e

# config ssh keys
mkdir -p ~/.ssh
touch ~/.ssh/config
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config
eval $(ssh-agent -s)
cat .vuepress/interno.incuca.net.pem | ssh-add - > /dev/null

# execute in remote
ssh ubuntu@interno.incuca.net 'bash' <<EOF
set -e
cd doc

# stop instances
docker-compose -f .docker-compose.yml stop

# repo
git fetch --all
git reset --hard origin/master
git pull

# build
npm install --no-save
npm run build

# docker-compose
docker-compose -f .docker-compose.yml up -d
EOF