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
 * `cd libvirt/` [recomended]

Each of the above folders contain Vagrantfile and bootstrap.sh

   > For customization, please check documentation for each vagrant plugin (sync folders, vms, network, etc)

5. Start pxetool node ``vagrant up pxetool`` (by default virtualbox), this will install puppet master and pxetool

 > use `--provider=lxc` or `--provider=libvirt`, if you are going to start other types of vm

6. You can define "roles" (check hiera/roles) for each node from environment variable ``FACTER_ROLE=jenkins_slave vagrant up NODE_NAME  --provider=libvirt``
7. ``vagrant ssh`` (by default you will enter _pxetool.test.local_), or ``vagrant ssh NODE_NAME``

## Limitations/Notes
Please keep in mind, that there might be some limitations while working with virtual machines (technologies):

1. in case on `--provider=libvirt`, rsync method was replaced by NFS server, for now manifests appear inside pxetool.test.local over nfs. If you still want to use rsync method, please check [vagrant-libvirt plugin](https://github.com/pradels/vagrant-libvirt) documentation

2. in case on `--provider=libvirt`, dnsmasq should be correctly configured, at least you need to add the domain `test.local` (`virsh net-edit default`), for example:

```
<network ipv6='yes'>
  <name>vagrant-libvirt</name>
  <uuid>3b74c6db-8134-47a0-8d01-c9d56a10d560</uuid>
  <forward mode='nat'/>
  <bridge name='virbr1' stp='on' delay='0'/>
  <mac address='52:54:00:ed:f2:06'/>
  <domain name='test.local'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
```

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