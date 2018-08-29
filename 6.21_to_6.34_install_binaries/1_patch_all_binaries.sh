Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

nb_error=0

echo -e $red"Patch Bzip2"$Rcol
cd /sources/bzip2-*/
patch -Np1 -i ../bzip2-1.0.6-install_docs-1.patch
if [[ $? != 0 ]]; then
	echo -e ${red}"Patch Bzip2 failed"${Rcol}
	nb_error=$((nb_error+1));
fi
