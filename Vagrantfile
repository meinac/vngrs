Vagrant.configure('2') do |config|
  config.vm.box      = 'precise32'
  config.vm.box_url  = 'http://files.vagrantup.com/precise32.box'
  config.vm.hostname = 'vngrs'

  config.vm.network :private_network, ip: "33.33.33.33"

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
end
