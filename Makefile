SHELL := /bin/bash

.NOTPARALLEL:
all: asp pkgbuild config checksums instructions

asp:
	asp export core/linux

pkgbuild:
	sed -i s'/pkgbase=linux/pkgbase=linux-pagarme/g'  linux/PKGBUILD

config:
	cp config_pagarme linux/config.x86_64

checksums:
	cd linux; updpkgsums

instructions:
	# Can't run makepkg inside a Makefile since it fails with sed errors after kernel is built
	echo "All finished, now cd into linux and run makepkg -s"

clean:
	rm -rf linux
