Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

cd /sources/texinfo-*/

time {
	echo -e ${red}"Configure binary"${Rcol}
	./configure --prefix=/usr --disable-static

	echo -e ${red}"make"${Rcol}
	make

	# echo -e $red"By-pass test... or No test$NAME_P"$Rcol
	echo -e ${red}"make check"${Rcol}
	make check

	echo -e ${red}"make install"${Rcol}
	make install

	echo -e ${red}"install Tex composant"${Rcol}
	make TEXMF=/usr/share/texmf install-tex

	echo -e ${red}"Create folder to avoid issue with some makefile"${Rcol}
	pushd /usr/share/info
	rm -v dir
	for f in *
	  do install-info $f dir 2>/dev/null
	done
	popd

	echo -e ${blu}'time install texinfo.sh'${Rcol}
}
