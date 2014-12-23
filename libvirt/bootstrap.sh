#!/bin/bash -x

# use closer mirrors on nodes start
sed -i 's/archive\./ua\.archive\./g' /etc/apt/sources.list

# update everything
sudo apt-get update && sudo apt-get upgrade -y

sudo chown vagrant:vagrant -R /home/vagrant/

# install packages
sudo apt-get install -y puppet

sudo mkdir -p /etc/puppet/bin

# add server to config
sed -i '/ssldir/a \server=pxetool.test.local' /etc/puppet/puppet.conf

if grep "^pxetool" /etc/hostname; then
  # install git
  sudo apt-get install -y git

  # create dir for
  sudo mkdir -p /var/lib/hiera
  sudo chown root:root -R /var/lib/hiera

  # install puppet master
  sudo /etc/puppet/bin/install_puppet_master.sh
else
  # we are working with slaves
  sudo tail /var/log/syslog
  # let's wait a little
  sleep 5
  sudo puppet agent --enable
  sudo puppet agent -tvd
fi
