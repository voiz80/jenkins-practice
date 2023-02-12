# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
    config.ssh.insert_key = false
  
    config.vm.define "master" do |master|
      master.vm.box="bento/ubuntu-18.04"
      master.vm.hostname = "master.practice"
      master.vm.network "private_network", ip: "192.168.99.100"
      master.vm.network "forwarded_port", guest: 50000, host: 50000
      master.vm.network "forwarded_port", guest: 8080, host: 8080
      master.vm.provision "shell", path: "install.sh"
      master.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
      end
    end
    
  end