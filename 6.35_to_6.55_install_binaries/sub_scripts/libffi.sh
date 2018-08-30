Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/libffi-*/

time {
	echo -e ${red}"Install headers in the standard folder"${Rcol}
	sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
		-i include/Makefile.in
	sed -e '/^includedir/ s/=.*$/=@includedir@/' \
		-e 's/^Cflags: -I${includedir}/Cflags:/' \
		-i libffi.pc.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --disable-static

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${blu}'time install libffi.sh'${Rcol}
}
