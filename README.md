vagrant-fuel-puppet-workshop
============================

Description:
* Provides Vagrant cluster deployment (using Virtualbox, LXC, libvirt+KVM/QEMU provisioner);
* configures environment for working with puppet manifests for Fuel CI environment.

## Orchestration
* vagrant;

## virtualization
Requires (depends on virtualization technology):
* virtualbox
* lxc  (need vagrant-lxc plugin)
* libvirt+kvm (need vagrant-libvirt plugin)

## HowTo:

1. Clone the environment ``git clone https://github.com/SergK/vagrant-fuel-puppet-workshop``
2. ``cd vagrant-fuel-puppet-workshop`` and put manifests in ``puppet-manifests`` directory
3. create ``./puppet-manifests/hiera/common.yaml`` file, you can use ``./puppet-manifests/hiera/example-common.yaml`` as example
4. Choose the virtualization type: virtualbox or lxc or libvirt
 * `cd virtualbox/`
 * `cd lxc/`
 * `cd libvirt/`

   > For customization, please, have a look at each vagrant plugin options (sync folders, vms, network, etc)

5. Start pxetool node ``vagrant up pxetool`` (works for virtualbox), this will install puppet master and pxetool

 > use `--provider=lxc` or `--provider=libvirt`, if you are going to start other types of vm

6. You can define "roles" for each node from ``./puppet-manifests/manifests/site.pp`` and the start it ``vagrant up NODE_NAME``
7. ``vagrant ssh`` (by default you will enter _pxetool.test.local_):

## Limitations
Please keep in mind, that there might be some limitations while working with virtual machines (technologies):

1. in case on `--provider=libvirt`, rsync will be used to put manifests on pxetool.test.local
