#!/bin/bash -x

sudo tee -a /etc/hosts <<EOF

192.168.50.10 pxetool.test.local
192.168.50.11 slave-01.test.local
192.168.50.12 slave-02.test.local
192.168.50.13 slave-08.test.local
192.168.50.14 slave-10.test.local

172.18.210.134 fuel-mirror.kha.mirantis.net

EOF

# update everything
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y
sudo apt-get install git -y

sudo chown vagrant.vagrant -R /home/vagrant/

sudo mkdir -p /var/lib/hiera
sudo chown root:root -R /var/lib/hiera

# install packages
sudo apt-get install -y puppet

sudo mkdir -p /etc/puppet/bin

# add server to config
sed -i '/ssldir/a \server=pxetool.test.local' /etc/puppet/puppet.conf

if ! grep "^slave" /etc/hostname; then
  # install puppet master
  sudo /etc/puppet/bin/install_puppet_master.sh
fi
