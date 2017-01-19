# Capistrano - Lightning Talk

## Install virtual machine

* Virtualbox : https://www.virtualbox.org/
* Vagrant : https://www.vagrantup.com/
* Vagrant host updater plugin : https://github.com/cogitatio/vagrant-hostsupdater

```
# Install and start virtual machine (see Vagrantfile, id_rsa key will be copied into VM, and password will be asked for /etc/hosts update)
$ vagrant up
```

## Capistrano deployment

```
# Bundler install http://bundler.io/
$ gem install bundler

# Install capistrano (see Gemfile and Gemfile.lock)
$ bundle install

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

## Usage

* Dev environment :
  * Url : <http://dev.capistrano-lightning-talk/>
  * Default branch : develop
  * Document root : /var/www/dev.capistrano-lightning-talk/current/src/web
  * Deploy command : $ bundle exec cap dev deploy

* Prod environment :
  * Url : <http://capistrano-lightning-talk/>
  * Default branch : master
  * Document root : /var/www/capistrano-lightning-talk/current/src/web
  * Deploy command : $ bundle exec cap prod deploy