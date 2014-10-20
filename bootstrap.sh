#!/bin/bash -x

sudo echo "192.168.50.10 pxetool.test.local" >> /etc/hosts
sudo echo "192.168.50.11 slave-01.test.local" >> /etc/hosts
sudo echo "192.168.50.12 slave-02.test.local" >> /etc/hosts

#sudo apt-mark hold grub-pc
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
