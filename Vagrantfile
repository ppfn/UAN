# -*- mode: ruby -*-
# vi: set ft=ruby :

PROVIDER = 'virtualbox'
SUBNET = '192.168.56'


Vagrant.configure("2") do |config|


  # LS-01: Debian 12
  config.vm.define "LS-01" do |ls01|
    ls01.vm.box = "debian/bookworm64"
    ls01.vm.hostname = "LS-01"
    ls01.vm.network "private_network", ip: "#{SUBNET}.21"

    ls01.vm.provider "#{PROVIDER}" do |vb|
      vb.name = "LS-01"
      vb.memory = "1024"
      vb.cpus = "1"
    end
  end


  config.vm.provision :ansible do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.groups = {
      "adservers" => ["WS-01", "WS-02"],
      "docker_webservers" => ["LS-01"],
      "docker_dhcpservers" => ["LS-01"],
      "dockerhosts:children" => ["docker_webservers", "docker_dnsservers", "docker_dhcpservers", "docker_monitoring"]
    }
  end

  # PC-01 Test machine
  config.vm.define "PC-01" do |pc01|
    pc01.vm.box = "debian/bookworm64"
    pc01.vm.hostname = "PC-01"
    pc01.vm.network "private_network", type: "dhcp"
    
    pc01.vm.provider "#{PROVIDER}" do |vb|
      vb.name = "PC-01"
      vb.memory = "1024"
      vb.cpus = "1"
    end
  end

end
