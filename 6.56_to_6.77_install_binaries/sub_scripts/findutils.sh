Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/findutils-*/

time {
	echo -e ${red}"Remove endless test"${Rcol}
	sed -i 's/test-lock..EXEEXT.//' tests/Makefile.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --localstatedir=/var/lib/locate

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"MANUAL CHECK"${Rcol}
	ls -lah /usr/bin/find /bin

	echo -e ${red}"Move binaries to be compliant with FHS"${Rcol}
	mv -v /usr/bin/find /bin
	sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb

	echo -e ${blu}'time install findutils.sh'${Rcol}
}
