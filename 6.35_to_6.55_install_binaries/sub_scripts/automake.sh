Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/automake-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.15.1

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"Skip some test then make check"${Rcol}
	sed -i "s:./configure:LEXLIB=/usr/lib/libfl.a &:" t/lex-{clean,depend}-cxx.sh
	make -j4 check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install automake.sh'${Rcol}
}
