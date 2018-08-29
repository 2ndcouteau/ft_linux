Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/shadow-*/

time {
	echo -e ${red}"Disable groups because Coreutils has a better solution\
avoid to install ever installed man"${Rcol}
	sed -i 's/groups$(EXEEXT) //' src/Makefile.in
	find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;

	echo -e ${red}"Change encryption method by SHA-512"${Rcol}
	sed -i	-e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
			-e 's@/var/spool/mail@/var/mail@' etc/login.defs

	echo -e ${red}"Set the first ID group to 1000"${Rcol}
	sed -i 's/1000/999/' etc/useradd

	echo -e ${red}"Configure binary"${Rcol}
	./configure --sysconfdir=/etc --with-group-name-max-length=32

	echo -e ${red}"make"${Rcol}
	make

	echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	# echo -e ${red}"make check"${Rcol}
	# make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"Move missplace folder"${Rcol}
	mv -v /usr/bin/passwd /bin

	echo -e ${red}"Enable shadow password"${Rcol}
	pwconv

	echo -e ${red}"Enable shadow password for groups"${Rcol}
	grpconv

	echo -e ${red}"Config Root password"${Rcol}
	passwd root

	echo -e ${blu}'time install shadow.sh'${Rcol}
}
