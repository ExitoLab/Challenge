This repo contains answers to the challenge 

Task:
Create three virtual machines using Vagrant. Machine 1 should serve as a Load balancing. Machines 2 and 3 should serve as web servers.
Setup the load balancing machine and the web server machines using Ansible.
On the web servers create an index file there with a "Hello world" text. Traffic should be distributed to the web servers via the Load balancer in the most appropriate way.

Expected solution: Push the Vagrant and Ansible scripts to a publicly accessible github repo and share the repo URL.

Recommended Packages: Use Linux vagrant boxes, Nginx web server and HaProxy load balancer.

The challenge was done using the following technologies
1. Vagrant for server provision 
2. Ansible for configuation 
3. Nginx for webserver 
4. Haproxy for loadbalancing 

3 servers were provisioned, hostname lb represents load balancer, hostname webserver1 represents first webserver and hostname webServer2 represents second webserver
 
The repo contains the following files 

1.Vagrantfile contains config for server provision 
2. inventory.ini contains inventory for the servers  
3. install_nginx_haproxy.yml contains the playbook for installing and configuring nginx and haproxy
4. bootstrap_setup.sh contains setup files for installing ansible and other dependencies
5. ansible.cfg config file for ansible 
6. add_ssh_key.yml contains the playbook for configuring passwordless ssh among the three servers  
7. templates folder contains all the templates files for nginx and haproxy

Ha proxy was also tested by stop nginx service on 1 instance (webserver1) and noticed that the second instance (webserver2) was receiving traffic  


add_header X-Backend-Server $hostname which is a config in nginx.conf will display the hostname of originating traffic when executing a curl command 


To run the script do the following. Run the following commands 

Do a git clone on the repo and cd into the newly pulled repo 

Run the following commands 

vagrant up
vagrant ssh lb_mgt 
ssh-keyscan lb webServer1 webServer2  >> /home/vagrant/.ssh/known_hosts
ssh-keygen -t rsa -b 2048  
ansible all -m ping --ask-pass  
ansible all -m ping  

Run cd /etc/ansible 
And run  
ansible-playbook add_ssh_key.yml --ask-pass 
ansible-playbook add_ssh_key.yml 
ansible-playbook install_nginx_haproxy.yml