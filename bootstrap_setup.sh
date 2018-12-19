#!/usr/bin/env bash

apt-get update
apt-get install software-properties-common
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible

# configure hosts file for our internal network defined by Vagrantfile
sudo cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.57.3  lb
192.168.57.41  webserver1
192.168.57.42  webserver2

EOL