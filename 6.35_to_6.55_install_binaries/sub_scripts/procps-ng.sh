Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/procps-ng-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr                            \
				--exec-prefix=                           \
				--libdir=/usr/lib                        \
				--docdir=/usr/share/doc/procps-ng-3.3.12 \
				--disable-static                         \
				--disable-kill

	echo -e ${red}"make"${Rcol}
	make

	echo -e ${red}"Remove some tests"${Rcol}
	sed -i -r 's|(pmap_initname)\\\$|\1|' testsuite/pmap.test/pmap.exp
	sed -i '/set tty/d' testsuite/pkill.test/pkill.exp
	rm testsuite/pgrep.test/pgrep.exp

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Move lib in propice place"${Rcol}
	mv -v /usr/lib/libprocps.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so

	echo -e ${blu}'time install procps.sh'${Rcol}
}
