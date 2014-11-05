vagrant-fuel-puppet-workshop
============================

Provides Vagrant cluster deployment (using Virtualbox provisioner) and configuring environment for working with fuel puppet manifests

1. Clone the environment ``git clone https://github.com/SergK/vagrant-fuel-puppet-workshop``
2. ``cd vagrant-fuel-puppet-workshop`` and put here ``puppet-manifests``
3. create ``./puppet-manifests/hiera/common.yaml`` file, you can use ``./puppet-manifests/hiera/example-common.yaml as example``
4. Start pxetool node from cluster ``vagrant up pxetool``, this will install puppet master and pxetool
5. Then you can define "roles" for each node from ``./puppet-manifests/manifests/site.pp``
6. ``vagrant ssh`` (by default you will enter _pxetool.test.local_):

ToDo:
-----

Implement libvirt provisioner

