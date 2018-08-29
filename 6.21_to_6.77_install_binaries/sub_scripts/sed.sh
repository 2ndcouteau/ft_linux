Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/sed-*/

time {

	echo -e ${red}"Fix env issue and remove a test"${Rcol}
	sed -i 's/usr/tools/'                 build-aux/help2man
	sed -i 's/testsuite.panic-tests.sh//' Makefile.in


	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --bindir=/bin

	echo -e ${red}"make"${Rcol}
	make
	make html

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install and install documentation"${Rcol}
	make install
	install -d -m755           /usr/share/doc/sed-4.4
	install -m644 doc/sed.html /usr/share/doc/sed-4.4

	echo -e ${blu}'time install sed.sh'${Rcol}
}
