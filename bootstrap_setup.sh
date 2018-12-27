#!/usr/bin/env bash

sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -y update
sudo apt-get -y install ansible

#copy add_ssh_key.yml file 
sudo cp /home/vagrant/add_ssh_key.yml /etc/ansible/add_ssh_key.yml

#copy install_nginx_haproxy file 
sudo cp /home/vagrant/install_nginx_haproxy.yml /etc/ansible/install_nginx_haproxy.yml

#remove the ansible cfg 
sudo rm -rf /etc/ansible/ansible.cfg

#copy ansible config file 
sudo cp /home/vagrant/ansible.cfg /etc/ansible/ansible.cfg

#copy inventory.ini file 
sudo cp /home/vagrant/inventory.ini /etc/ansible/inventory.ini

#copy templates file
sudo cp -R /home/vagrant/templates /etc/ansible/templates/

# configure hosts file for our internal network defined by Vagrantfile
sudo cat >> /etc/hosts <<EOL

#vagrant environment nodes
192.168.57.3  lb
192.168.57.41  webServer1
192.168.57.42  webServer2

EOL