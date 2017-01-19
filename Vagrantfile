# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "bento/ubuntu-16.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network :private_network, ip: "192.168.33.123"
  config.hostsupdater.aliases = ['dev.capistrano-lightning-talk', 'capistrano-lightning-talk']

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Forward ssh agent.
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Copy ssh local files to the guest.
  if File.exists?(File.join(Dir.home, ".ssh/id_rsa"))
    config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  end

  if File.exists?(File.join(Dir.home, ".ssh/id_rsa.pub"))
    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    config.vm.provision "shell" do |s|
      id_rsa_pub = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
      s.inline = <<-SHELL
        echo #{id_rsa_pub} >> /home/vagrant/.ssh/authorized_keys
      SHELL
    end
  end

  if File.exists?(File.join(Dir.home, ".ssh/config"))
    config.vm.provision "file", source: "~/.ssh/config", destination: "/home/vagrant/.ssh/config"
  end

  if File.exists?(File.join(Dir.home, ".ssh/known_hosts"))
    config.vm.provision "file", source: "~/.ssh/known_hosts", destination: "/home/vagrant/.ssh/known_hosts"
  end

  config.vm.provision "file", source: "provisioning/etc/apache2/sites-available/dev.capistrano-lightning-talk.conf", destination: "/tmp/provisioning/etc/apache2/sites-available/dev.capistrano-lightning-talk.conf"
  config.vm.provision "file", source: "provisioning/etc/apache2/sites-available/capistrano-lightning-talk.conf", destination: "/tmp/provisioning/etc/apache2/sites-available/capistrano-lightning-talk.conf"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.name = "capistrano-lightning-talk"

    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update -y
    # Problem with grub-pc with apt-get upgrade -y : @see https://github.com/chef/bento/issues/661#issuecomment-248136601
    DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

    # Install apache2.
    apt-get install -y apache2

    # Change owner as vagrant instead www-data for demo.
    chown -R vagrant:vagrant /var/www

    # Copy vhosts.
    cp /tmp/provisioning/etc/apache2/sites-available/* /etc/apache2/sites-available/
    rm -rf /tmp/provisioning

    # Enable vhosts.
    a2ensite dev.capistrano-lightning-talk capistrano-lightning-talk
    service apache2 restart
  SHELL
end
