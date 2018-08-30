Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/e2fsprogs-*/

time {
	echo -e ${red}"Create install subfolder"${Rcol}
	mkdir -v build
	cd build

	echo -e ${red}"Configure binary"${Rcol}
	LIBS=-L/tools/lib                    \
	CFLAGS=-I/tools/include              \
	PKG_CONFIG_PATH=/tools/lib/pkgconfig \
	../configure --prefix=/usr           \
				 --bindir=/bin           \
				 --with-root-prefix=""   \
				 --enable-elf-shlibs     \
				 --disable-libblkid      \
				 --disable-libuuid       \
				 --disable-uuidd         \
				 --disable-fsck

	echo -e ${red}"make"${Rcol}
	make


	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	ln -sfv /tools/lib/lib{blk,uu}id.so.1 lib
	make LD_LIBRARY_PATH=/tools/lib check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Install static lib"${Rcol}
	make install-libs

	echo -e ${red}"Change right for some libs"${Rcol}
	chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a

	echo -e ${red}"Update .info system file"${Rcol}
	gunzip -v /usr/share/info/libext2fs.info.gz
	install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info

	echo -e ${red}"Install documentation"${Rcol}
	makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
	install -v -m644 doc/com_err.info /usr/share/info
	install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info

	echo -e ${blu}'time install procps.sh'${Rcol}
}
