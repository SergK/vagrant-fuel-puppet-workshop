vagrant-fuel-puppet-workshop
============================

Description:
* Provides Vagrant cluster deployment (using Virtualbox and LXC provisioner);
* configures environment for working with puppet manifests for Fuel CI environment.

Requires (depends on virtualization technology):
* vagrant;
* virtualbox
* lxc  (+ vagrant-lxc plugin)

HowTo:
------
1. Clone the environment ``git clone https://github.com/SergK/vagrant-fuel-puppet-workshop``
2. ``cd vagrant-fuel-puppet-workshop`` and put manifests in ``puppet-manifests`` directory
3. create ``./puppet-manifests/hiera/common.yaml`` file, you can use ``./puppet-manifests/hiera/example-common.yaml`` as example
5. Choose the virtualization type: virtualbox or lxc (``cd virtualbox`` or ``cd lxc``).
6. Start pxetool node ``vagrant up pxetool``, this will install puppet master and pxetool
7. You can define "roles" for each node from ``./puppet-manifests/manifests/site.pp`` and the start it ``vagrant up NODE_NAME``
8. ``vagrant ssh`` (by default you will enter _pxetool.test.local_):

ToDo:
-----

Implement libvirt provisioner
