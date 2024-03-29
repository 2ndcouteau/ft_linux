Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/inetutils-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr        \
				--localstatedir=/var \
				--disable-logger     \
				--disable-whois      \
				--disable-rcp        \
				--disable-rexec      \
				--disable-rlogin     \
				--disable-rsh        \
				--disable-servers

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Move some binaries if /usr/ is not available"${Rcol}
	mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
	mv -v /usr/bin/ifconfig /sbin

	echo -e ${blu}'time install inetutils.sh'${Rcol}
}
