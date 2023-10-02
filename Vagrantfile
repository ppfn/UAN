# -*- mode: ruby -*-
# vi: set ft=ruby :

SUBNET = '192.168.100'
LINUX_SERVERS_BOX = 'generic/debian12'
LINUX_PCS_BOX = 'generic/debian12'

Vagrant.configure("2") do |config|


  # LS-01: Debian 12
  config.vm.define "LS-01" do |ls01|
    ls01.vm.box = "#{LINUX_SERVERS_BOX}"
    ls01.vm.hostname = "LS-01"
    ls01.vm.synced_folder ".", "/vagrant"
    ls01.vm.network "private_network", ip: "#{SUBNET}.21"
    
    ls01.vm.provider "virtualbox" do |vb|
      
      vb.name = "LS-01"
      vb.memory = "1024"
      vb.cpus = "1"
    end

    ls01.vm.provider "hyperv" do |hv|
      hv.vmname = "LS-01"
      hv.memory = "1024"
      hv.cpus = "1"
      hv.enable_enhanced_session_mode = true
    end

  end


  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "provisioning/dockerhosts.yml"
  end

end
