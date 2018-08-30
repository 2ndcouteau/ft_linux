Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/gawk-*/

time {
	echo -e ${red}"Avoid useless files"${Rcol}
	sed -i 's/extras//' Makefile.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Install Documentation"${Rcol}
	mkdir -v /usr/share/doc/gawk-4.2.0
	cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-4.2.0

	echo -e ${blu}'time install gawk.sh'${Rcol}
}
