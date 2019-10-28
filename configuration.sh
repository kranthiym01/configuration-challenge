#!/bin/bash

echo -n "choose an environment: dev or prod"
read environment

if [ "$environment" == "dev" ]
then
  scp app-config-dev.conf username@dev.linux.box:/tmp
  ssh -t username@dev.linux.box "sudo mv /tmp/app-config-dev.conf /etc/app-config.conf"
  ssh -t username@dev.linux.box "sudo chmod 0644 /etc/app-config.conf"
  ssh -t username@dev.linux.box "sudo chown -R root:users /etc/app-config.conf"
  echo "app-config.conf is copied to dev env"

elif [ "$environment" == "prod" ]
then
  scp app-config-prod.conf username@prod.linux.box:/tmp
  ssh -t username@prod.linux.box "sudo mv /tmp/app-config-prod.conf /etc/app-config.conf"
  ssh -t username@prod.linux.box "sudo chmod 0644 /etc/app-config.conf"
  ssh -t username@prod.linux.box "sudo chown -R root:users /etc/app-config.conf"
  ehco "app-config.conf is copied to prod env"

else
  echo "Please choose the correct environment"
fi
