#!/bin/bash

cd $SOURCES
cd bzip*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools --enable-install-program=hostname

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...Coreutils"$Rcol
#	echo -e $red"make check"$Rcol
#	make RUN_EXPENSIVE_TESTS=yes check
	##Test expensive but without issues on LINUX

	echo -e $red"make install"$Rcol
	make install
}
