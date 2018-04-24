#!/bin/bash

cd $SOURCES
cd expect*/

time {
	echo -e $blu"Force stty to keep clean install management"$Rcol
	cp -v configure{,.orig}
	sed 's:/usr/local/bin:/bin:' configure.orig > configure

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools       \
		--with-tcl=/tools/lib \
		--with-tclinclude=/tools/include

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...Expect"$Rcol
#	echo -e $red"make test"$Rcol
#	make test

	echo -e $red"make install"$Rcol
	make SCRIPTS="" install
}
