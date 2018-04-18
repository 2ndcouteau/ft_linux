#!/bin/bash

cd $SOURCES

echo -e $blu"Extract Ncurses"$Rcol
tar -xzvf ncurse*.tar.gz
cd ncurse*/

time {
	echo -e $blu"Check gawk is find for the compilation"$Rcol
	sed -i s/mawk// configure

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/tools \
				--with-shared   \
				--without-debug \
				--without-ada   \
				--enable-widec  \
				--enable-overwrite

	echo -e $red"make"$Rcol
	make

	echo -e $red"make install"$Rcol
	make install

}
