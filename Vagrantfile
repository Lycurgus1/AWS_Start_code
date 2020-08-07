Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.10.100"
  config.hostsupdater.aliases = ["development.local"]
  # Syncing a folder that contains needed files for the machine
  config.vm.synced_folder "environment", "/home/ubuntu/environment"
  # These files are then provisioned(autoloaded) into the server upon start up
  config.vm.provision "shell", path: "environment/provision.sh", privileged: false

end
