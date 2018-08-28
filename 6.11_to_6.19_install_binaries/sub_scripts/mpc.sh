Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/mpc-*/

time {

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/usr    \
				--disable-static \
				--docdir=/usr/share/doc/mpc-1.1.0

	echo -e $red"make"$Rcol
	make
	make html

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e $red"make check"$Rcol
	make check

	echo -e $red"make install"$Rcol
	make install
	make install-html

	echo -e ${blu}'time\(\) install mpc.sh'${Rcol}
}
