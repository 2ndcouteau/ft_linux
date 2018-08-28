Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

function continue_or_exit()
{
	read -rsn1 -p"Press Q to exit or Enter to continue : " input
	if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
		echo "Exit."
		exit 0
	fi
	echo
}

cd /sources/binutils-*/

time {
	echo -e ${blu}'Expected output:\
spawn ls\
if you read somethink like:\
The system has no more ptys.\
Ask your system administrator to create more.\
You should quit !'${Rcol}
	expect -c "spawn ls"
	continue_or_exit;

	echo -e ${red}"Create install sub_folder"${Rcol}
	mkdir -v build
	cd       build

	echo -e $red"Run ./configure"$Rcol
	../configure --prefix=/usr       \
				 --enable-gold       \
				 --enable-ld=default \
				 --enable-plugins    \
				 --enable-shared     \
				 --disable-werror    \
				 --enable-64-bit-bfd \
				 --with-system-zlib

	echo -e $red"make"$Rcol
	make tooldir=/usr

	# echo -e $red"By-pass test...$NAME_P"$Rcol
	echo -e $red"make check"$Rcol
	make -k check

	echo -e $red"make install"$Rcol
	make tooldir=/usr install

	echo -e ${blu}'time\(\) install binutils.sh'${Rcol}
}
