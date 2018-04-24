#!/bin/bash
NAME_P="make"
cd $SOURCES
cd $NAME_P*/

time {
	echo -e $red"Avoid error from glibc(2.27)"$Rcol
	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools --without-guile

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
#	echo -e $red"make check"$Rcol
#	make check

	echo -e $red"make install"$Rcol
	make install
}
