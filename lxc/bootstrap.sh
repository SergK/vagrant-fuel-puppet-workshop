#!/bin/bash -x

# use Ukrainian mirrors, but then will be overwritten by puppet apt module
sudo sed -i 's/archive/ua\.archive/g' /etc/apt/sources.list

sudo tee -a /etc/hosts <<EOF

# most of the things resolved by lxc dnsmasq service

# some custom record (only for Kharkov location)
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
else
  # we are working with slaves
  sudo tail /var/log/syslog
  # let's wait a little
  sleep 5
  # and restart puppet agent
  sudo /etc/init.d/puppet restart
  sudo tail /var/log/syslog
  # enable and run apply
  sleep 3
  sudo puppet agent --enable
  sudo puppet agent -tvd
fi
