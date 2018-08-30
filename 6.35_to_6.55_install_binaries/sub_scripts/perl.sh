Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/perl-*/

time {
	echo -e ${red}"Create host file for test"${Rcol}
	echo "127.0.0.1 localhost $(hostname)" > /etc/hosts

	echo -e ${red}"Use Zlib"${Rcol}
	export BUILD_ZLIB=False
	export BUILD_BZIP2=0

	echo -e ${red}"Configure binary"${Rcol}
	sh Configure -des -Dprefix=/usr                 \
					  -Dvendorprefix=/usr           \
					  -Dman1dir=/usr/share/man/man1 \
					  -Dman3dir=/usr/share/man/man3 \
					  -Dpager="/usr/bin/less -isR"  \
					  -Duseshrplib                  \
					  -Dusethreads

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make -k check

	echo -e ${red}"make install"${Rcol}
	make install
	unset BUILD_ZLIB BUILD_BZIP2

	echo -e ${blu}'time install perl.sh'${Rcol}
}
