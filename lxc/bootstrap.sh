#!/bin/bash -x

# use Ukrainian mirrors
sudo sed -i 's/archive\./ua.archive\./g' /etc/apt/sources.list

sudo tee -a /etc/hosts <<EOF

172.18.198.42 osci-mirror-kha.kha.mirantis.net

EOF

# update everything
sudo apt-get update && sudo apt-get upgrade -y

sudo chown vagrant:vagrant -R /home/vagrant/

sudo mkdir -p /var/lib/hiera
sudo chown root:root -R /var/lib/hiera

# install packages
sudo apt-get install -y puppet git apt-transport-https

sudo mkdir -p /etc/puppet/bin

# add server to config
sed -i '/ssldir/a \server=pxetool.test.local' /etc/puppet/puppet.conf

if ! grep "^slave" /etc/hostname; then
  # install puppet master
  sudo /etc/puppet/bin/install_puppet_master.sh
fi
