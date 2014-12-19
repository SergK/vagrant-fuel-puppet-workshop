#!/bin/bash -x

# use closer mirrors on nodes start
sed -i 's/us\./ua\./g' /etc/apt/sources.list

sudo tee -a /etc/hosts <<EOF

192.168.50.10 pxetool.test.local
# ensure from site.pp that you have jenkins master on this node
192.168.50.11 slave-01.test.local jenkins-master.test.local jenkins-product.test.local slave-01
192.168.50.12 slave-02.test.local slave-02
192.168.50.13 slave-03.test.local slave-03
192.168.50.14 slave-04.test.local slave-04
192.168.50.15 slave-05.test.local slave-05
192.168.50.16 slave-06.test.local slave-06
192.168.50.17 slave-07.test.local slave-07
192.168.50.18 slave-08.test.local slave-08
192.168.50.19 slave-09.test.local slave-09
192.168.50.20 slave-10.test.local slave-10
192.168.50.21 slave-11.test.local slave-11
192.168.50.22 slave-12.test.local slave-12
192.168.50.23 slave-13.test.local slave-13
192.168.50.24 slave-14.test.local slave-14
192.168.50.25 slave-15.test.local slave-15
192.168.50.26 slave-16.test.local slave-16
192.168.50.27 slave-17.test.local slave-17
192.168.50.28 slave-18.test.local slave-18
192.168.50.29 slave-19.test.local slave-19
192.168.50.30 slave-20.test.local slave-20

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
