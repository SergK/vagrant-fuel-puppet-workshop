#!/bin/bash -x

sudo tee -a /etc/hosts <<EOF

192.168.50.10 pxetool.test.local
192.168.50.11 slave-01.test.local
192.168.50.12 slave-02.test.local

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

# we need devops mirror to install our features (puppet/apt doesn't work correctrly)
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D5A05778
echo "deb http://mirror.fuel-infra.org/devops/ubuntu/ ./" | sudo tee /etc/apt/sources.list.d/fuel-devops.list
sudo apt-get update

if ! grep "^slave" /etc/hostname; then
  # install puppet master
sudo /etc/puppet/bin/install_puppet_master.sh
fi
