#!/bin/bash

cd $SOURCES

echo -e $blu"Extract M4"$Rcol
tar -xvf m4*.tar.xz
cd m4*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...M4"$Rcol
#	echo -e $red"make check"$Rcol
#	make check

	echo -e $red"make install"$Rcol
	make install

}
