#!/bin/bash
NAME_P="diffutils"


SOURCES="/mnt/lfs/sources/"
cd $SOURCES

echo $SOURCES
echo -e $blu"Extract $NAME_P"$Rcol
tar -xvf $NAME_P*.tar.xz
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
