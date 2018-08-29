Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/libcap-*/

time {

	echo -e ${red}"Avoid installation static lib"${Rcol}
	sed -i '/install.*STALIBNAME/d' libcap/Makefile

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make RAISE_SETFCAP=no lib=lib prefix=/usr install
	chmod -v 755 /usr/lib/libcap.so


	echo -e ${red}"Delete share library and recreate lib"${Rcol}
	mv -v /usr/lib/libcap.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so

	echo -e ${blu}'time install libcap.sh'${Rcol}
}
