# -*- mode: ruby -*-
# vi: set ft=ruby :

SUBNET = '192.168.0'
LINUX_SERVERS_BOX = 'generic/debian12'

Vagrant.configure("2") do |config|


  # LS-01: Debian 12
  config.vm.define "LS-01" do |ls01|
    ls01.vm.box = "#{LINUX_SERVERS_BOX}"
    ls01.vm.hostname = "LS-01"
    ls01.vm.synced_folder ".", "/vagrant"
    ls01.vm.network "public_network", ip: "#{SUBNET}.21"

    ls01.vm.provider "virtualbox" do |vb|
      vb.name = "LS-01"
      vb.memory = "2048"
      vb.cpus = "1"
    end

    ls01.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "provisioning/dockerhost.yml"
    end

  end



end
