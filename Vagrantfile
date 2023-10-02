# -*- mode: ruby -*-
# vi: set ft=ruby :

PROVIDER = 'hyperv'
SUBNET = '192.168.100'
LINUX_SERVERS_BOX = 'generic/debian12'
LINUX_PCS_BOX = 'generic/debian12'

Vagrant.configure("2") do |config|


  # LS-01: Debian 12
  config.vm.define "LS-01" do |ls01|
    ls01.vm.box = "#{LINUX_SERVERS_BOX}"
    ls01.vm.hostname = "LS-01"
    ls01.vm.network "private_network", ip: "#{SUBNET}.21"

    ls01.vm.provider "#{PROVIDER}" do |vb|
      vb.vmname = "LS-01"
      vb.memory = "1024"
      vb.cpus = "1"
    end
  end


  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.groups = {
      "docker_webservers" => ["LS-01"],
      "dockerhosts:children" => ["docker_webservers", "docker_dnsservers", "docker_dhcpservers", "docker_monitoring"]
    }
  end

  # PC-01 Test machine
  config.vm.define "PC-01" do |pc01|
    pc01.vm.box = "#{LINUX_PCS_BOX}"
    pc01.vm.hostname = "PC-01"
    pc01.vm.network "private_network", type: "dhcp"
    
    pc01.vm.provider "#{PROVIDER}" do |vb|
      vb.vmname = "PC-01"
      vb.memory = "1024"
      vb.cpus = "1"
    end
  end

end
