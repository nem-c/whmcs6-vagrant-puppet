# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "etlwhmcs"
    config.vm.box_url = "https://dl.dropbox.com/s/3fgr7lbvcpn51py/centos_6-5_i386.box"
    config.vm.box_check_update = false
    config.vm.hostname = "whmcs.dev"

    config.vm.synced_folder "whmcs/", "/var/www/public_html/whmcs", :owner => "vagrant"

    config.vm.provider "virtualbox" do |v|
        v.name = "whmcs.dev"
        v.memory = 1024
        v.cpus = 1
    end

    config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "default.pp"
        puppet.module_path = "puppet/modules"
    end

    config.vm.network "private_network", ip: "192.168.56.101"

    config.ssh.forward_agent = true
end
