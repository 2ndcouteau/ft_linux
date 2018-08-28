Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/bc-*/

time {

	# Use of sed instead of ed
	cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
	-e     's/$/",/' \
	-e '2,$ s/^/"/'  \
	-e   '$ d'       \
	-i libmath.h
sed -e '$ s/$/0}/' \
	-i libmath.h
EOF

	# Create temporary symbolic link for this installation
	ln -sv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6
	ln -sfv libncurses.so.6 /usr/lib/libncurses.so

	# Fix error in configure
	sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure

	echo -e $red"Run ./configure"$Rcol
	./configure --prefix=/usr           \
				--with-readline         \
				--mandir=/usr/share/man \
				--infodir=/usr/share/info

	echo -e $red"make"$Rcol
	make

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e $red"make check"$Rcol
	echo "quit" | ./bc/bc -l Test/checklib.b

	echo -e $red"make install"$Rcol
	make install

	echo -e ${blu}'time\(\) install bc.sh'${Rcol}
}
