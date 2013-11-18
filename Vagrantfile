Vagrant.configure("2") do |config|
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.provision :shell, :path => "bootstrap.sh"
    config.vm.network :private_network, ip: '192.168.10.100'
    config.vm.hostname = "geoDESA"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        vb.customize ["modifyvm", :id, "--memory", "512"]
	    #vb.gui = true
    end
end
