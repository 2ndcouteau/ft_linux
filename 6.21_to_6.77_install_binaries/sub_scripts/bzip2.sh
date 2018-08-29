Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/bzip2-*/

time {

	echo -e ${red}"Correction for relatif symbolic links"${Rcol}
	sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile

	echo -e ${red}"Install manuals in the good place"${Rcol}
	sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile

	echo -e ${red}"Prepare the makefile"${Rcol}
	make -f Makefile-libbz2_so
	make clean

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# echo "quit" | ./bc/bc -l Test/checklib.b

	echo -e ${red}"make install"${Rcol}
	make PREFIX=/usr install

	echo -e ${red}"Install bzip2 in the good place"${Rcol}
	cp -v bzip2-shared /bin/bzip2
	cp -av libbz2.so* /lib
	ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
	rm -v /usr/bin/{bunzip2,bzcat,bzip2}
	ln -sv bzip2 /bin/bunzip2
	ln -sv bzip2 /bin/bzcat

	echo -e ${blu}'time install bc.sh'${Rcol}
}
