#!/bin/bash
# Install the critical development tools

sudo apt-get install -y\
	automake\
	bash\
	binutils\
	bison\
	bzip2\
	coreutils\
	diffutils\
	findutils\
	gawk\
	gcc\
	g++\
	libc6\
	libc6-dev\
	grep\
	gzip\
	m4\
	make\
	patch\
	perl\
	sed\
	tar\
	texinfo\
	xz-utils;

echo
echo "create link /bin/sh -> /bin/bash"
sudo ln -fs /bin/bash /bin/sh
ls -lh /bin/sh
