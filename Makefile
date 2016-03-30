SHELL := /bin/sh

package:
	vagrant destroy -f
	vagrant up
	vagrant package
