# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "pxetool", primary: true do |pxetool|
    # PXE Tool port
    #pxetool.vm.network "forwarded_port", guest: 80, host: 8888
    pxetool.vm.box = "ubuntu-14-04-x64"
    pxetool.vm.host_name = "pxetool.test.local"
    pxetool.vm.network "private_network", ip: "192.168.50.10"
    pxetool.vm.provision :shell, path: "./bootstrap.sh"
    pxetool.vm.synced_folder "./puppet-manifests/hiera/", "/var/lib/hiera", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/modules/", "/usr/share/puppet/modules", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/manifests/", "/etc/puppet/manifests", owner: "root", group: "root"
    pxetool.vm.synced_folder "./puppet-manifests/bin", "/etc/puppet/bin", owner: "root", group: "root"

    pxetool.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "pxetool"]
      v.customize ["modifyvm", :id, "--memory", "1024"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave01" do |slave01|
   #slave01.vm.network "forwarded_port", guest: 8080, host: 8080
    slave01.vm.box = "ubuntu-14-04-x64"
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
   #slave02.vm.network "forwarded_port", guest: 80, host: 9081
    slave02.vm.box = "ubuntu-14-04-x64"
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

  config.vm.define "slave03" do |slave03|
    slave03.vm.box = "ubuntu-14-04-x64"
    slave03.vm.host_name = "slave-03.test.local"
    slave03.vm.network "private_network", ip: "192.168.50.13"
    slave03.vm.provision :shell, path: "./bootstrap.sh"

    slave03.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave03"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave04" do |slave04|
    slave04.vm.box = "ubuntu-14-04-x64"
    slave04.vm.host_name = "slave-04.test.local"
    slave04.vm.network "private_network", ip: "192.168.50.14"
    slave04.vm.provision :shell, path: "./bootstrap.sh"

    slave04.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave04"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave05" do |slave05|
    slave05.vm.box = "ubuntu-14-04-x64"
    slave05.vm.host_name = "slave-05.test.local"
    slave05.vm.network "private_network", ip: "192.168.50.15"
    slave05.vm.provision :shell, path: "./bootstrap.sh"

    slave05.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave05"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave06" do |slave06|
    slave06.vm.box = "ubuntu-14-04-x64"
    slave06.vm.host_name = "slave-06.test.local"
    slave06.vm.network "private_network", ip: "192.168.50.16"
    slave06.vm.provision :shell, path: "./bootstrap.sh"

    slave06.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave06"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave07" do |slave07|
    slave07.vm.box = "ubuntu-14-04-x64"
    slave07.vm.host_name = "slave-07.test.local"
    slave07.vm.network "private_network", ip: "192.168.50.17"
    slave07.vm.provision :shell, path: "./bootstrap.sh"

    slave07.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave07"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave08" do |slave08|
    #slave08.vm.network "forwarded_port", guest: 80, host: 9080
    slave08.vm.box = "ubuntu-14-04-x64"
    slave08.vm.host_name = "slave-08.test.local"
    slave08.vm.network "private_network", ip: "192.168.50.18"
    slave08.vm.provision :shell, path: "./bootstrap.sh"

    slave08.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave08"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave09" do |slave09|
    slave09.vm.box = "ubuntu-14-04-x64"
    slave09.vm.host_name = "slave-09.test.local"
    slave09.vm.network "private_network", ip: "192.168.50.19"
    slave09.vm.provision :shell, path: "./bootstrap.sh"

    slave09.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave09"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

  config.vm.define "slave10" do |slave10|
    slave10.vm.box = "ubuntu-14-04-x64"
    slave10.vm.host_name = "slave-10.test.local"
    slave10.vm.network "private_network", ip: "192.168.50.20"
    slave10.vm.provision :shell, path: "./bootstrap.sh"

    slave10.vm.provider "virtualbox" do |v|
      v.customize ["modifyvm", :id, "--name", "slave10"]
      v.customize ["modifyvm", :id, "--memory", "2048"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
  end

end
