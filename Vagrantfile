# -*- mode: ruby -*-
# vi: set ft=ruby :

PROVIDER = 'virtualbox'
SUBNET = '192.168.56'


Vagrant.configure("2") do |config|

  # WS-01: Windows Server 2022
  config.vm.define "WS-01" do |ws01|
    ws01.vm.box = "gusztavvargadr/windows-server"
    ws01.vm.network "private_network", ip: "#{SUBNET}.11"

    ws01.vm.provider "#{PROVIDER}" do |vb|
      vb.name = "WS-01"
      vb.memory = "2048"
      vb.cpus = "2"
    end
  end

  # WS-02: Windows Server 2022
  config.vm.define "WS-02" do |ws02|
    ws02.vm.box = "gusztavvargadr/windows-server"
    ws02.vm.network "private_network", ip: "#{SUBNET}.12"

    ws02.vm.provider "#{PROVIDER}" do |vb|
      vb.name = "WS-02"
      vb.memory = "2048"
      vb.cpus = "2"
    end
  end

  # LS-01: Debian 12
  config.vm.define "LS-01" do |ls01|
    ls01.vm.box = "debian/bookworm64"
    ls01.vm.hostname = "WS-01"
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
      "dockerhosts" => ["LS-01"]
    }
  end


end
