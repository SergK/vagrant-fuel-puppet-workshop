# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "pxetool", primary: true do |pxetool|
    # PXE Tool port
    pxetool.vm.network "forwarded_port", guest: 80, host: 8888
    pxetool.vm.box = "ubuntu-14.04"
    pxetool.vm.host_name = "pxetool.test.local"
    pxetool.vm.network "private_network", ip: "192.168.50.10"
    pxetool.vm.provision :shell, path: "./bootstrap.sh"
    pxetool.vm.synced_folder "./puppet-manifests/hiera/", "/var/lib/hiera", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/modules/", "/usr/share/puppet/modules", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/manifests/", "/etc/puppet/manifests", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/bin", "/etc/puppet/bin", owner: "root", group: "root"

    pxetool.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "pxetool"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave01" do |slave01|
    slave01.vm.network "forwarded_port", guest: 80, host: 9999
    slave01.vm.box = "ubuntu-14.04"
    slave01.vm.host_name = "slave-01.test.local"
    slave01.vm.network "private_network", ip: "192.168.50.11"
    slave01.vm.provision :shell, path: "./bootstrap.sh"

    slave01.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave01"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave02" do |slave02|

    slave02.vm.box = "ubuntu-14.04"
    slave02.vm.host_name = "slave-02.test.local"
    slave02.vm.network "private_network", ip: "192.168.50.12"
    slave02.vm.provision :shell, path: "./bootstrap.sh"

    slave02.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave02"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end
end
