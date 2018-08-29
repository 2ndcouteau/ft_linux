Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/flex-*/

time {
	echo -e ${red}"Fix issue with glibc-2.26"${Rcol}
	sed -i "/math.h/a #include <malloc.h>" src/flexdef.h

	echo -e ${red}"Configure binary"${Rcol}
	HELP2MAN=/tools/bin/true \
	./configure --prefix=/usr --docdir=/usr/share/doc/flex-2.6.4

	echo -e ${red}"make"${Rcol}
	make

	# echo -e ${red}"By-pass test...or NO tests"${Rcol}
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Create link to retrocompliance with lex"${Rcol}
	ln -s flex /usr/bin/lex

	echo -e ${blu}'time install flex.sh'${Rcol}
}
