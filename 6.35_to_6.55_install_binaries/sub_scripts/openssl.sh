Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/openssl-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./config --prefix=/usr         \
			 --openssldir=/etc/ssl \
			 --libdir=lib          \
			 shared                \
			 zlib-dynamic

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
	make MANSUFFIX=ssl install

	echo -e ${red}"install documentation"${Rcol}
	mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.0g
	cp -vfr doc/* /usr/share/doc/openssl-1.1.0g

	echo -e ${blu}'time install openssl.sh'${Rcol}
}
