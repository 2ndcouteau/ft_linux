Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/man-db-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr                        \
				--docdir=/usr/share/doc/man-db-2.8.1 \
				--sysconfdir=/etc                    \
				--disable-setuid                     \
				--enable-cache-owner=bin             \
				--with-browser=/usr/bin/lynx         \
				--with-vgrind=/usr/bin/vgrind        \
				--with-grap=/usr/bin/grap            \
				--with-systemdtmpfilesdir=

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install man-db.sh'${Rcol}
}
