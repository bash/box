SHELL := /bin/sh

.PHONY: package

package:
	vagrant destroy -f
	vagrant up
	vagrant package
