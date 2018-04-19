#!/bin/bash
NAME_P="perl"

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
	echo -e $red"Configure"$Rcol
	sh Configure -des -Dprefix=/tools -Dlibs=-lm

	echo -e $red"make"$Rcol
	make

	# Install only some tools and libraries
	cp -v perl cpan/podlators/scripts/pod2man /tools/bin
	mkdir -pv /tools/lib/perl5/5.26.1
	cp -Rv lib/* /tools/lib/perl5/5.26.1
}
