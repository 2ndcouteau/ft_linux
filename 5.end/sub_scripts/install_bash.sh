#!/bin/bash

cd $SOURCES
cd bash*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools --without-bash-malloc

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...Bash"$Rcol
#	echo -e $red"make check"$Rcol
#	make tests

	echo -e $red"make install"$Rcol
	make install

	echo -e $blu"Set link for sh-->bash"$Rcol
	ln -sv bash /tools/bin/sh
}
