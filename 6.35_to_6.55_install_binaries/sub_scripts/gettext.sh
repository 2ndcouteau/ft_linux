Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/gettext-*/

time {
	echo -e ${red}"Delete two tests"${Rcol}
	sed -i '/^TESTS =/d' gettext-runtime/tests/Makefile.in &&
	sed -i 's/test-lock..EXEEXT.//' gettext-tools/gnulib-tests/Makefile.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr    \
				--disable-static \
				--docdir=/usr/share/doc/gettext-0.19.8.1

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install
	chmod -v 0755 /usr/lib/preloadable_libintl.so

	echo -e ${blu}'time install gettext.sh'${Rcol}
}
