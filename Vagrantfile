# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/trusty32"
  config.vm.box_url = "http://172.23.238.13/vagrant/boxes/trusty-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provision :puppet
end
