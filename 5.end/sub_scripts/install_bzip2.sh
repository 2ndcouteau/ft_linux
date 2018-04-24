#!/bin/bash

cd $SOURCES
cd bzip*/

time {
	echo -e $red"make"$Rcol
	make

	echo -e $red"make install"$Rcol
	make PREFIX=/tools install
}
