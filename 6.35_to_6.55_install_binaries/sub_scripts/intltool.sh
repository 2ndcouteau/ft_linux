Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/intltool-*/

time {
	echo -e ${red}"Fix advertissement because perl <= 5.22"${Rcol}
	sed -i 's:\\\${:\\\$\\{:' intltool-update.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install
	install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO

	echo -e ${blu}'time install intltool.sh'${Rcol}
}
