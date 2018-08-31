Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/sysvinit-*/

time {
	echo -e ${red}"make"${Rcol}
	make -C src

	echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make -C src install

	echo -e ${blu}'time install sysvinit.sh'${Rcol}
}
