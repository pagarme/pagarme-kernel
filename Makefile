SHELL := /bin/bash

.NOTPARALLEL:
all: abs pkgbuild config checksums instructions

abs:
	ABSROOT=. abs core/linux

pkgbuild:
	sed -i s'/pkgbase=linux/pkgbase=linux-pagarme/g'  core/linux/PKGBUILD

config:
	cp config_pagarme core/linux/config.x86_64

checksums:
	cd core/linux; updpkgsums

instructions:
	# Can't run makepkg inside a Makefile since it fails with sed errors after kernel is built
	echo "All finished, now cd into core/linux and run makepkg -s"

clean:
	rm -rf core
