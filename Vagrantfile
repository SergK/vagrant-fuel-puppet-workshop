# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "puppet_master", primary: true do |puppet_master|
    # PXE Tool port
    puppet_master.vm.network "forwarded_port", guest: 80, host: 8888
    puppet_master.vm.box = "ubuntu-14.04"
    puppet_master.vm.host_name = "pxetool.test.local"
    puppet_master.vm.network "private_network", ip: "192.168.50.10"
    puppet_master.vm.provision :shell, path: "./bootstrap.sh"
    puppet_master.vm.synced_folder "./puppet-manifests/src/hiera/", "/var/lib/hiera", owner: "root", group: "root"
    puppet_master.vm.synced_folder "./puppet-manifests/src/modules/", "/usr/share/puppet/modules", owner: "root", group: "root"
    puppet_master.vm.synced_folder "./puppet-manifests/src/manifests/", "/etc/puppet/manifests", owner: "root", group: "root"
    puppet_master.vm.synced_folder "./puppet-manifests/src/bin", "/etc/puppet/bin", owner: "root", group: "root"

    puppet_master.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "puppet_master"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "puppet_agent" do |puppet_agent|
    puppet_agent.vm.network "forwarded_port", guest: 80, host: 9999
    puppet_agent.vm.box = "ubuntu-14.04"
    puppet_agent.vm.host_name = "slave-01.test.local"
    puppet_agent.vm.network "private_network", ip: "192.168.50.11"
    puppet_agent.vm.provision :shell, path: "./bootstrap.sh"

    puppet_agent.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "puppet_agent"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "puppet_agent1" do |puppet_agent1|

    puppet_agent1.vm.box = "ubuntu-14.04"
    puppet_agent1.vm.host_name = "slave-02.test.local"
    puppet_agent1.vm.network "private_network", ip: "192.168.50.12"
    puppet_agent1.vm.provision :shell, path: "./bootstrap.sh"

    puppet_agent1.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "puppet_agent1"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end
end
