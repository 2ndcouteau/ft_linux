Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/iproute2-*/

time {
	echo -e ${red}"Remove install part"${Rcol}
	sed -i /ARPD/d Makefile
	rm -fv man/man8/arpd.8

	echo -e ${red}"Remove module"${Rcol}
	sed -i 's/m_ipt.o//' tc/Makefile

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make DOCDIR=/usr/share/doc/iproute2-4.15.0 install

	echo -e ${blu}'time install iproute2.sh'${Rcol}
}
