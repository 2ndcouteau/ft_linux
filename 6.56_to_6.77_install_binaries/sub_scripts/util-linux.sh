Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/util-linux-*/

time {
	echo -e ${red}"Create folder for hwclock"${Rcol}
	mkdir -pv /var/lib/hwclock

	echo -e ${red}"Configure binary"${Rcol}
	./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
				--docdir=/usr/share/doc/util-linux-2.31.1 \
				--disable-chfn-chsh  \
				--disable-login      \
				--disable-nologin    \
				--disable-su         \
				--disable-setpriv    \
				--disable-runuser    \
				--disable-pylibmount \
				--disable-static     \
				--without-python     \
				--without-systemd    \
				--without-systemdsystemunitdir

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	chown -Rv nobody .
	su nobody -s /bin/bash -c "PATH=$PATH make -k check"

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install util-linux.sh'${Rcol}
}
