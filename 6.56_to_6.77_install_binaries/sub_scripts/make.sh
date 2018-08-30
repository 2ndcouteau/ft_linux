Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/make-*/

time {
	echo -e ${red}"Bypaas an error from glibc_2.27"${Rcol}
	sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make PERL5LIB=$PWD/tests/ check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install make.sh'${Rcol}
}
