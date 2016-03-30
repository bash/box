# bash/box

[![built-with-make](https://img.shields.io/badge/build%20system-make-brightgreen.svg)](Makefile)
[![vagrant box](https://img.shields.io/badge/vagrant%20box-0.0.1-brightgreen.svg)](https://atlas.hashicorp.com/bash/boxes/box)

A vagrant base image with nginx, mongodb, php7 and redis.

## Usage
```bash
vagrant init bash/box
vagrant up --provider virtualbox
```

## Building
```bash
make package
```