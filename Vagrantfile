# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
		
	#Load Balancer (Machine 1)
	config.vm.define "lb_mgt" do |loadBalancer|
		loadBalancer.vm.box = "ubuntu/trusty64"
		loadBalancer.vm.box_url  = "trusty-server-cloudimg-amd64-vagrant-disk1.box"
		loadBalancer.vm.hostname= "loadBalancer"
		loadBalancer.vm.network "private_network", ip:"192.168.57.3"
		loadBalancer.vm.network "forwarded_port", guest: 80, host: 8080
		loadBalancer.vm.provider "virtualbox" do |vb|
			vb.memory = 1024
		end
		
		loadBalancer.vm.provision "file", source: "add_ssh_key.yml", destination: "/home/vagrant/add_ssh_key.yml"
		loadBalancer.vm.provision "file", source: "ansible.cfg", destination: "/home/vagrant/ansible.cfg"
		loadBalancer.vm.provision "file", source: "install_nginx_haproxy.yml", destination: "/home/vagrant/install_nginx_haproxy.yml"
		loadBalancer.vm.provision "file", source: "inventory.ini", destination: "/home/vagrant/inventory.ini"		
		loadBalancer.vm.provision "file", source: "templates/", destination: "/home/vagrant/templates"
		loadBalancer.vm.provision :shell, path: "bootstrap_setup.sh"
	end 
	
	#Web01 and web02 (machine 2 and Machine 3 webservers)
	(1..2).each do |i|
    config.vm.define "webServer#{i}" do |web_node|
        web_node.vm.box = "ubuntu/trusty64"
		web_node.vm.box_url  = "trusty-server-cloudimg-amd64-vagrant-disk1.box"
        web_node.vm.hostname = "webServer#{i}"
        web_node.vm.network :private_network, ip: "192.168.57.4#{i}"
        web_node.vm.network "forwarded_port", guest: 8080, host: "808#{i}"
        web_node.vm.provider "virtualbox" do |vb|
          vb.memory = "256"
        end
    end
  end
	
end