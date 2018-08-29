Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/grep-*/

time {

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --bindir=/bin

	echo -e ${red}"make"${Rcol}
	make

	# echo -e ${red}"By-pass test...or NO tests"${Rcol}
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install grep.sh'${Rcol}
}
