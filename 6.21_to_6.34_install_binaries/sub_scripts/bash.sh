Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/bash-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr                       \
				--docdir=/usr/share/doc/bash-4.4.18 \
				--without-bash-malloc               \
				--with-installed-readline

	echo -e ${red}"make"${Rcol}
	make

	echo -e ${red}"Give right to nobody in the current folder"${Rcol}
	chown -Rv nobody .
	# echo -e ${red}"By-pass test...or NO tests"${Rcol}
	echo -e ${red}"make check"${Rcol}
	su nobody -s /bin/bash -c "PATH=$PATH make tests"

	echo -e ${red}"make install and move the exec_bin"${Rcol}
	make install
	mv -vf /usr/bin/bash /bin

	echo -e ${red}"Restart bash with our new bash"${Rcol}
	exec /bin/bash --login +h

	echo -e ${blu}'time install bash.sh'${Rcol}
}
