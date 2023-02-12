#!/bin/bash
echo "* Add host ... "
echo "192.168.99.100 master.practice master" >> /etc/hosts

echo "* Add Docker repository ..."
sudo apt-get -y update &&
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt-get -y update && apt-cache policy docker-ce &&
sudo apt-get -y install docker-ce docker-ce-cli