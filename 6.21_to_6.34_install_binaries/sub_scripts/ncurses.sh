Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/ncurses-*/

time {
	echo -e ${red}"Avoid to install static library not compliant with configure"${Rcol}
	sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr           \
				--mandir=/usr/share/man \
				--with-shared           \
				--without-debug         \
				--without-normal        \
				--enable-pc-files       \
				--enable-widec

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Move library in the good place"${Rcol}
	mv -v /usr/lib/libncursesw.so.6* /lib

	echo -e ${red}"Correct the link to the library"${Rcol}
	ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so

	echo -e ${red}"Create fake link to use non_wide character"${Rcol}
	for lib in ncurses form panel menu ; do
		rm -vf                    /usr/lib/lib${lib}.so
		echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
		ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
	done

	echo -e ${red}"Check usage of the lib"${Rcol}
	rm -vf                     /usr/lib/libcursesw.so
	echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
	ln -sfv libncurses.so      /usr/lib/libcurses.so

	echo -e ${red}"Install documentation"${Rcol}
	mkdir -v       /usr/share/doc/ncurses-6.1
	cp -v -R doc/* /usr/share/doc/ncurses-6.1

	echo -e ${blu}'time install ncurses.sh'${Rcol}
}
