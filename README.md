vagrant-fuel-puppet-workshop
=====================

Provides Vagrant cluster deployment (using Virtualbox provisioner) and configuring environment for working with fuel puppet manifests

1. Clone the environment ``git clone https://github.com/SergK/vagrant-fuel-puppet-workshop``
2. ``cd vagrant-fuel-puppet-workshop`` and put here ``config-puppet-manifests``
3. Start cluster ``vagrant up``
4. ``vagrant ssh`` (by default you will enter _pxetool.test.local_):

	* all operations should be run under root: ``sudo su -``
	* create ``/var/lib/hiera/common.yaml`` file, you can use /var/lib/hiera/example-common.yaml as example
	* then install master ``cd /etc/puppet/bin/ && ./install_puppet_master.sh``

ToDo:
-----

Implement libvirt provisioner

