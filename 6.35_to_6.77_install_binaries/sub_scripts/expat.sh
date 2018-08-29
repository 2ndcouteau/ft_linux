Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/expat-*/

time {
	echo -e ${red}"Fix issues with regression tests"${Rcol}
	sed -i 's|usr/bin/env |bin/|' run.sh.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --disable-static

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"install documentation"${Rcol}
	install -v -dm755 /usr/share/doc/expat-2.2.5
	install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.5

	echo -e ${blu}'time install expat.sh'${Rcol}
}
