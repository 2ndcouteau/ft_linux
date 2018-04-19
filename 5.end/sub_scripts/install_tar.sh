#!/bin/bash
NAME_P="tar"

## XZ config
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

## GZ config
# OPT="-xzvf"
# COMPRESSIONS_EXTENSION=".tar.gz"

cd $SOURCES

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION
cd $NAME_P*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools

	echo -e $red"make"$Rcol
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
#	echo -e $red"make check"$Rcol
#	make check

	echo -e $red"make install"$Rcol
	make install
}
