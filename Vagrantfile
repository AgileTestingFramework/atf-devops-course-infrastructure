# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vb|
   # Display the VirtualBox GUI when booting the machine
   # vb.gui = true
   # Customize the amount of memory on the VM:
   vb.memory = "512"
  end

  config.vm.box = "bento/ubuntu-14.04"
  config.omnibus.chef_version = "12.12.15"

  config.vm.define "main" do |main|
    main.vm.provider "virtualbox" do |main_vb|
      main_vb.memory = "2048"
    end
    main.vm.hostname = "main"
    # Jenkins
    main.vm.network :forwarded_port, guest: 8080, host: 8080

    #Nexus
    main.vm.network :forwarded_port, guest: 8081, host: 8081

    config.vm.provision "chef_zero" do |chef|
      chef.install = false
      chef.cookbooks_path = "chef/cookbooks"
      chef.data_bags_path = "chef/data_bags"
      chef.nodes_path = "chef/nodes"
      chef.roles_path = "chef/roles"

      chef.add_recipe "base"
      chef.add_recipe "docker"
    end

    main.vm.provision "shell", path: "shell/setup-jenkins.sh"
    main.vm.provision "shell", path: "shell/setup-nexus.sh"

  end

end
# apt-get install docker.io docker-compose docker-registry
# docker pull jenkins
