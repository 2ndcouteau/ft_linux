#!/bin/bash
NAME_P="perl"
cd $SOURCES
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
