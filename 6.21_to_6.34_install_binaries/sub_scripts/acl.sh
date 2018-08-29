Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/acl-*/

time {

	echo -e ${red}"Install documentation in versionned folder"${Rcol}
	sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in

	echo -e ${red}"Correct broken tests"${Rcol}
	sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test

	echo -e ${red}"Correct test because version of Perl"${Rcol}
	sed -i 's/{(/\\{(/' test/run

	echo -e ${red}"Correct bug for getfacl segfault"${Rcol}
	sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
	libacl/__acl_to_any_text.c

	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr    \
				--bindir=/bin    \
				--disable-static \
				--libexecdir=/usr/lib

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test...$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make install install-dev install-lib
	chmod -v 755 /usr/lib/libacl.so

	echo -e ${red}"Delete share library and recreate lib"${Rcol}
	mv -v /usr/lib/libacl.so.* /lib
	ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so

	echo -e ${blu}'time install acl.sh'${Rcol}
}
