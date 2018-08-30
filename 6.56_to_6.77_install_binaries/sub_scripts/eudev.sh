Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/eudev-*/

time {
	echo -e ${red}"Correct a test"${Rcol}
	sed -r -i 's|/usr(/bin/test)|\1|' test/udev-test.pl

	echo -e ${red}"Write bypass to avoid hard use of /tools"${Rcol}
	cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF


	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr           \
				--bindir=/sbin          \
				--sbindir=/sbin         \
				--libdir=/usr/lib       \
				--sysconfdir=/etc       \
				--libexecdir=/lib       \
				--with-rootprefix=      \
				--with-rootlibdir=/lib  \
				--enable-manpages       \
				--disable-static        \
				--config-cache

	echo -e ${red}"make"${Rcol}
	LIBRARY_PATH=/tools/lib make

	echo -e ${red}"Create folder for test and installation"${Rcol}
	mkdir -pv /lib/udev/rules.d
	mkdir -pv /etc/udev/rules.d

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make LD_LIBRARY_PATH=/tools/lib check

	echo -e ${red}"make install"${Rcol}
	make LD_LIBRARY_PATH=/tools/lib install

	echo -e ${red}"Add some personnal rule and support file usefull in LFS"${Rcol}
	tar -xvf ../udev-lfs-20171102.tar.bz2
	make -f udev-lfs-20171102/Makefile.lfs install

	echo -e ${red}"Eudev configuration"${Rcol}
	LD_LIBRARY_PATH=/tools/lib udevadm hwdb --update

	echo -e ${blu}'time install eudev.sh'${Rcol}
}
