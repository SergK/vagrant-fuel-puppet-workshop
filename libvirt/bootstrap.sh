#!/bin/bash -x

# use closer mirrors on nodes start
sed -i 's/us\./ua\./g' /etc/apt/sources.list

sudo tee -a /etc/hosts <<EOF

10.20.30.10 pxetool.test.local
# ensure from site.pp that you have jenkins master on this node
10.20.30.11 slave-01.test.local jenkins-master.test.local jenkins-product.test.local
10.20.30.12 slave-02.test.local
10.20.30.13 slave-03.test.local
10.20.30.14 slave-04.test.local
10.20.30.15 slave-05.test.local
10.20.30.16 slave-06.test.local
10.20.30.17 slave-07.test.local
10.20.30.18 slave-08.test.local
10.20.30.19 slave-09.test.local
10.20.30.20 slave-10.test.local
10.20.30.21 slave-11.test.local
10.20.30.22 slave-12.test.local
10.20.30.23 slave-13.test.local
10.20.30.24 slave-14.test.local
10.20.30.25 slave-15.test.local
10.20.30.26 slave-16.test.local
10.20.30.27 slave-17.test.local
10.20.30.28 slave-18.test.local
10.20.30.29 slave-19.test.local
10.20.30.30 slave-20.test.local

EOF

# update everything
sudo apt-get update && sudo apt-get upgrade -y

sudo chown vagrant:vagrant -R /home/vagrant/

sudo mkdir -p /var/lib/hiera
sudo chown root:root -R /var/lib/hiera

# install packages
sudo apt-get install -y puppet

sudo mkdir -p /etc/puppet/bin

# add server to config
sed -i '/ssldir/a \server=pxetool.test.local' /etc/puppet/puppet.conf

if ! grep "^slave" /etc/hostname; then
  # install git
  sudo apt-get install -y git
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
