# -*- mode: ruby -*-
# vi: set ft=ruby :
# Laga tå ein som bruka bridler og anbefala av ein som rir på einhjørningar
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |master_config|
    master_config.vm.box = "bento/ubuntu-14.04"
    if Vagrant.has_plugin?("vagrant-cachier")
    	config.cache.scope = :box
    end
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
#    master_config.vm.synced_folder ".", "/srv/salt"
#    master_config.vm.synced_folder "pillar/", "/srv/pillar"
    master_config.ssh.username = "vagrant"
    master_config.ssh.password = "vagrant"
    master_config.vm.provision :salt do |salt|
      salt.master_config = "vagrant/etc/master"
      salt.master_key = "vagrant/keys/master_minion.pem"
      salt.master_pub = "vagrant/keys/master_minion.pub"
      salt.minion_key = "vagrant/keys/master_minion.pem"
      salt.minion_pub = "vagrant/keys/master_minion.pub"
      salt.seed_master = {
                          "minion1" => "vagrant/keys/minion1.pub",
                          "minion2" => "vagrant/keys/minion2.pub"
                         }

      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = false
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "bento/ubuntu-14.04"
    if Vagrant.has_plugin?("vagrant-cachier")
    	config.cache.scope = :box
    end
    minion_config.vm.host_name = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.11"
    minion_config.ssh.username = "vagrant"
    minion_config.ssh.password = "vagrant"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "vagrant/etc/minion1"
      salt.minion_key = "vagrant/keys/minion1.pem"
      salt.minion_pub = "vagrant/keys/minion1.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = "bento/centos-7.3"
    # minion_config.vm.box = "bento/ubuntu-14.04"
    if Vagrant.has_plugin?("vagrant-cachier")
      	config.cache.scope = :box
    end
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "chef/centos-6.5"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.50.12"
    minion_config.ssh.username = "vagrant"
    minion_config.ssh.password = "vagrant"

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "vagrant/etc/minion2"
      salt.minion_key = "vagrant/keys/minion2.pem"
      salt.minion_pub = "vagrant/keys/minion2.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

end
