#!/bin/bash


SOURCES="/mnt/lfs/sources/"
cd $SOURCES

echo -e $blu"Extract Bison"$Rcol
tar -xvf bison*.tar.xz
cd bison*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...Bison"$Rcol
#	echo -e $red"make check"$Rcol
#	make check

	echo -e $red"make install"$Rcol
	make install
}
