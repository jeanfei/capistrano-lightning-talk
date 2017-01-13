# Capistrano - Lightning Talk

## Install virtual machine

* Virtualbox : https://www.virtualbox.org/
* Ansible : https://www.ansible.com/
* Vagrant : https://www.vagrantup.com/
* Vagrant host updater plugin : https://github.com/cogitatio/vagrant-hostsupdater

```
# Install and start virtual machine (see Vagrantfile, id_rsa key will be copied into VM)
$ vagrant up
```

## Usage

* Dev : http://dev.capistrano-lightning-talk/
* Prod : http://capistrano-lightning-talk/

## Capistrano deployment

```
# Bundler install http://bundler.io/
$ gem install bundler

# Install capistrano (see Gemfile and Gemfile.lock)
$ bundle install

# Deployment directory
$ cd capistrano

# Deploy dev : http://dev.capistrano-lightning-talk/
$ bundle exec cap dev deploy

# Deploy prod : http://capistrano-lightning-talk/
$ bundle exec cap prod deploy

# Rollback prod : http://capistrano-lightning-talk/
$ bundle exec cap prod deploy:rollback

# Deploy specific branch
$ bundle exec cap dev deploy BRANCH=my-feature-branch
```