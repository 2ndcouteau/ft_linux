#!/bin/bash

cd $SOURCES

echo -e $blu"Extract DejaGNU"$Rcol
tar -xzvf dejagnu*.tar.gz
cd dejagnu*/

time {
	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools

	echo -e $red"make install"$Rcol
	make install

	echo -e $red"By-pass test...DejaGNU"$Rcol
#	echo -e $red"make check"$Rcol
#	make check

}
