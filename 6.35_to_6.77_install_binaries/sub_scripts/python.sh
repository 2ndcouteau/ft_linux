Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/Python-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr       \
				--enable-shared     \
				--with-system-expat \
				--with-system-ffi   \
				--with-ensurepip=yes

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make install
	chmod -v 755 /usr/lib/libpython3.6m.so
	chmod -v 755 /usr/lib/libpython3.so

	echo -e ${red}"install documentation"${Rcol}
	install -v -dm755 /usr/share/doc/python-3.6.4/html
	tar --strip-components=1  \
		--no-same-owner       \
		--no-same-permissions \
		-C /usr/share/doc/python-3.6.4/html \
		-xvf ../python-3.6.4-docs-html.tar.bz2

	echo -e ${blu}'time install python.sh'${Rcol}
}
