# box 📦

[![built-with-make](https://img.shields.io/badge/build%20system-make-brightgreen.svg)](Makefile)
[![vagrant box](https://img.shields.io/badge/vagrant%20box-0.0.3-brightgreen.svg)](https://atlas.hashicorp.com/bash/boxes/box)

A vagrant base image with nginx, mongodb, php7 and redis.

## Usage
```bash
vagrant init bash/box
vagrant up --provider virtualbox
```

## Building
```bash
make clean && make
```

## Example
**Vagrantfile:**
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "bash/box"

  config.vm.network :private_network, ip: '192.168.16.16'
  
  config.vm.synced_folder "./config/nginx", "/etc/nginx/conf.d", create: true
  config.vm.synced_folder ".", "/var/www", owner: 'nginx', group: 'nginx'

  config.vm.provision :shell, inline: 'service nginx reload', privileged: true, run: 'always' 
end
```
