#!/bin/bash -x

sudo tee -a /etc/hosts <<EOF

192.168.50.10 pxetool.test.local
# ensure from site.pp that you have jenkins master on this node
192.168.50.11 slave-01.test.local jenkins-master.test.local jenkins-product.test.local
192.168.50.12 slave-02.test.local
192.168.50.13 slave-03.test.local
192.168.50.14 slave-04.test.local
192.168.50.15 slave-05.test.local
192.168.50.16 slave-06.test.local
192.168.50.17 slave-07.test.local
192.168.50.18 slave-08.test.local
192.168.50.19 slave-09.test.local
192.168.50.20 slave-10.test.local


172.18.210.134 fuel-mirror.kha.mirantis.net

EOF

# update everything
sudo apt-get update && sudo apt-get upgrade -y

sudo chown vagrant:vagrant -R /home/vagrant/

sudo mkdir -p /var/lib/hiera
sudo chown root:root -R /var/lib/hiera

# install packages
sudo apt-get install -y puppet git

sudo mkdir -p /etc/puppet/bin

# add server to config
sed -i '/ssldir/a \server=pxetool.test.local' /etc/puppet/puppet.conf

if ! grep "^slave" /etc/hostname; then
  # install puppet master
  sudo /etc/puppet/bin/install_puppet_master.sh
fi
