# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "yungsang/boot2docker"
  config.vm.provision :shell, path: "bootstrap.sh"

  config.vm.network "private_network", ip: "192.168.50.4"

  # influx ports
  config.vm.network "forwarded_port", guest: 8083, host: 8083
  config.vm.network "forwarded_port", guest: 8086, host: 8086

  # graphana ports
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
