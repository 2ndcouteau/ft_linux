Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/coreutils-*/

time {
	echo -e ${red}"Fix issues with an endless test"${Rcol}
	sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk

	echo -e ${red}"Configure binary"${Rcol}
	FORCE_UNSAFE_CONFIGURE=1 ./configure \
				--prefix=/usr            \
				--enable-no-install-program=kill,uptime

	echo -e ${red}"make"${Rcol}
	FORCE_UNSAFE_CONFIGURE=1 make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check and params for non-root test"${Rcol}
	make NON_ROOT_USERNAME=nobody check-root
		echo "dummy:x:1000:nobody" >> /etc/group
	chown -Rv nobody .
	su nobody	-s /bin/bash \
				-c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"

	echo -e ${red}"Delete temp group"${Rcol}
	sed -i '/dummy/d' /etc/group

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Move bin in FHS specification places"${Rcol}
	mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
	mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
	mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
	mv -v /usr/bin/chroot /usr/sbin
	mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
	sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8

	echo -e ${red}"move some binaries"${Rcol}
	mv -v /usr/bin/{head,sleep,nice} /bin

	echo -e ${blu}'time install coreutils.sh'${Rcol}
}
