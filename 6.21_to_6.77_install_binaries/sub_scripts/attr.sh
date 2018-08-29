Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/attr-*/

time {

	echo -e ${red}"Install documentation in versionned folder"${Rcol}
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in

	echo -e ${red}"Avoid to install ever installed man pages"${Rcol}
	sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile

	echo -e ${red}"Correct test because version of Perl"${Rcol}
	sed -i 's:{(:\\{(:' test/run

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr \
				--bindir=/bin \
				--disable-static

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make -j1 tests root-tests

	echo -e ${red}"make install"${Rcol}
	make install install-dev install-lib
	chmod -v 755 /usr/lib/libattr.so

	echo -e ${red}"Delete share library and recreate lib"${Rcol}
	mv -v /usr/lib/libattr.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so

	echo -e ${blu}'time install attr.sh'${Rcol}
}
