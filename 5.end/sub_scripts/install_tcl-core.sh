#!/bin/bash

cd $SOURCES
cd tcl*/

time {
	echo -e $blu"Go to unix/ and configure"$Rcol
	cd unix
	./configure --prefix=/tools

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...Tcl-core"$Rcol
	#echo -e $red"make test"$Rcol
	#TZ=UTC make test

	echo -e $red"make install"$Rcol
	make install

	## Config final
	echo -e $blu"Set write rights to remove debogage sybole be remove later"$Rcol
	chmod -v u+w /tools/lib/libtcl8.6.so

	echo -e $blu"Install header for the next package: Expect"$Rcol
	make install-private-headers

	echo -e $blu"Set link"$Rcol
	ln -sv tclsh8.6 /tools/bin/tclsh

}
