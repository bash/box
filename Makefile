SHELL := /bin/sh

.PHONY: all clean

all: package.box

clean:
	vagrant destroy -f
	rm package.box

package.box:
	vagrant up
	vagrant package
