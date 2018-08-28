#!/bin/bash
Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/zlib-*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/usr

	echo -e $red"make"$Rcol
	make

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e $red"make check"$Rcol
	make check

	echo -e $red"make install"$Rcol
	make install

	echo -e $yel"Move and create new link for libz.so"$Rcol
	mv -v /usr/lib/libz.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so

	echo -e ${blu}'time\(\) install zlib.sh'${Rcol}
}
