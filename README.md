# Capistrano - Lightning Talk

This repository provides Capistrano lightning talk presentation : <https://jeanfei.github.io/capistrano-lightning-talk>
It also provides a Vagrant configuration file to setup a virtual machine with apache2, and 2 virtual hosts to test Capistrano tasks.

## Getting Started

### Prerequisites

* Virtualbox : https://www.virtualbox.org/
* Vagrant : https://www.vagrantup.com/
* Vagrant host updater plugin : https://github.com/cogitatio/vagrant-hostsupdater
* Ruby : https://www.ruby-lang.org/

*The project was originally built with : Virtualbox 5.1.12, Vagrant 1.9.1, vagrant-hostsupdater 1.0.2, ruby 2.4.0, osx 10.12.2* 

### Installing

```
# Install and start virtual machine (see Vagrantfile, id_rsa key will be copied into VM, and password will be asked for /etc/hosts update)
$ vagrant up

# Bundler install http://bundler.io/
$ gem install bundler

# Install capistrano (see Gemfile and Gemfile.lock)
$ bundle install
```

## Usage

Fork this repository. Commit, push modification into src/web directory, and execute Capistrano tasks.

* Dev environment :
  * Url : <http://dev.capistrano-lightning-talk/>
  * Default branch : develop
  * Document root : /var/www/dev.capistrano-lightning-talk/current/src/web

* Prod environment :
  * Url : <http://capistrano-lightning-talk/>
  * Default branch : master
  * Document root : /var/www/capistrano-lightning-talk/current/src/web

Deploy changed with Capistrano tasks :

```
# Deployment directory
$ cd capistrano

# List all available tasks
$ bundle exec cap -T

# Simulate deploy dev
$ bundle exec cap dev deploy --dry-run

# Deploy dev : http://dev.capistrano-lightning-talk/
$ bundle exec cap dev deploy

# Deploy prod : http://capistrano-lightning-talk/
$ bundle exec cap prod deploy

# Rollback prod : http://capistrano-lightning-talk/
$ bundle exec cap prod deploy:rollback

# Deploy specific branch
$ bundle exec cap dev deploy BRANCH=my-feature-branch
```