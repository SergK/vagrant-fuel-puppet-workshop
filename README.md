vagrant-fuel-puppet-workshop
============================

Description:
* Provides Vagrant cluster deployment (using Virtualbox, LXC, libvirt+KVM/QEMU provisioners);
* Configures environment for working with puppet manifests for Fuel CI environment.

## Tested environment
```
Distributor ID: LinuxMint
Description:  Linux Mint 17 Qiana
Release:  17
Codename: qiana
```

```
Distributor ID: Ubuntu
Description:  Ubuntu 14.04.1 LTS
Release:  14.04
Codename: trusty
```

## Orchestration
* vagrant ( > 1.6.5);

## Virtualization
You can choose any virtualization approach for deploying cluster:
* virtualbox ( > 4.2)
* lxc ( > 1.0.6) + vagrant-lxc plugin (1.0.1)
* libvirt (1.2.2) + qemu-kvm (2.0.0) + vagrant-libvirt plugin (0.0.24) + NFS server (allows to modify code on puppet master directly)

## HowTo:

1. Clone the environment ``git clone https://github.com/SergK/vagrant-fuel-puppet-workshop``
2. ``cd vagrant-fuel-puppet-workshop`` and put manifests in ``puppet-manifests`` directory
3. create ``./puppet-manifests/hiera/common.yaml`` file, you can use ``./puppet-manifests/hiera/example-common.yaml`` as example
4. Choose the virtualization type: virtualbox, lxc or libvirt
 * `cd virtualbox/`
 * `cd lxc/`
 * `cd libvirt/`

Each of the above folders contain Vagrantfile and bootstrap.sh

   > For customization, please check documentation for each vagrant plugin (sync folders, vms, network, etc)

5. Start pxetool node ``vagrant up pxetool`` (by default virtualbox), this will install puppet master and pxetool

 > use `--provider=lxc` or `--provider=libvirt`, if you are going to start other types of vm

6. You can define "roles" for each node from ``./puppet-manifests/manifests/site.pp`` and the start it ``vagrant up NODE_NAME``
7. ``vagrant ssh`` (by default you will enter _pxetool.test.local_), or ``vagrant ssh NODE_NAME``

## Limitations
Please keep in mind, that there might be some limitations while working with virtual machines (technologies):

1. in case on `--provider=libvirt`, rsync method was replaced by NFS server, for now manifests appear inside pxetool.test.local over nfs. If you still want to use rsync method, please check [vagrant-libvirt plugin](https://github.com/pradels/vagrant-libvirt) documentation

### Project tree structure


```
.
├── libvirt
│   ├── bootstrap.sh
│   └── Vagrantfile
├── lxc
│   ├── bootstrap.sh
│   └── Vagrantfile
├── puppet-manifests
│   ├── bin
│   │   ├── install_modules.sh
│   │   └── install_puppet_master.sh
│   ├── hiera
│   │   ├── common-example.yaml
│   │   └── common.yaml -> common-example.yaml
│   ├── LICENSE
│   ├── manifests
│   │   └── site.pp
│   ├── modules
│   │   ├── apt
│   │   ├── ...
│   │   ├── ...
│   │   ├── ...
│   │   ├── ...
│   │   ├── ...
│   │   └── zypprepo
│   └── tests
│       ├── helpers
│       ├── rc.local
│       ├── run_tests.py
│       ├── run_tests.sh
│       └── tests
├── README.md
└── virtualbox
    ├── bootstrap.sh
    └── Vagrantfile

```