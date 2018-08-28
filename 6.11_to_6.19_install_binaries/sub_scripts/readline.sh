Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/readline-*/

time {
	echo -e $red"Sed to avoid mislink in ldconfig"$Rcol
	sed -i '/MV.*old/d' Makefile.in
	sed -i '/{OLDSUFF}/c:' support/shlib-install

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/usr    \
				--disable-static \
				--docdir=/usr/share/doc/readline-7.0

	# Make and force readline to link with lncursesw
	echo -e $red"make"$Rcol
	make SHLIB_LIBS="-L/tools/lib -lncursesw"

	echo -e $red"By-pass test...$NAME_P"$Rcol
	# echo -e $red"make check"$Rcol
	# make check

	echo -e $red"make install"$Rcol
	make SHLIB_LIBS="-L/tools/lib -lncurses" install

	echo -e $red"Correct some links"$Rcol
	mv -v /usr/lib/lib{readline,history}.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
	ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

	echo -e $red"Install documentation"$Rcol
	install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-7.0

	echo -e ${blu}'time\(\) install readline.sh'${Rcol}
}
