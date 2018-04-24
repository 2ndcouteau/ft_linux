#!/bin/bash
NAME_P="util-linux"
cd $SOURCES
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
