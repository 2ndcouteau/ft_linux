#!/bin/bash
NAME_P="util-linux"

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
	./configure --prefix=/tools                \
				--without-python               \
				--disable-makeinstall-chown    \
				--without-systemdsystemunitdir \
				--without-ncurses              \
				PKG_CONFIG=""

	echo -e $red"make"$Rcol
	make

	echo -e $red"make install"$Rcol
	make install
}
