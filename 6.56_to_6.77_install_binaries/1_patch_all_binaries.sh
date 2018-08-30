Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

nb_error=0

echo -e $red"Patch Coreutils"$Rcol
cd /sources/coreutils-*/
patch -Np1 -i ../coreutils-8.29-i18n-1.patch
if [[ $? != 0 ]]; then
	echo -e ${red}"Patch coreutils failed"${Rcol}
	nb_error=$((nb_error+1));
fi

echo -e $red"Patch Kbd"$Rcol
cd /sources/kbd-*/
patch -Np1 -i ../kbd-2.0.4-backspace-1.patch
if [[ $? != 0 ]]; then
	echo -e ${red}"Patch kbd failed"${Rcol}
	nb_error=$((nb_error+1));
fi

echo -e $red"Patch sysvinit"$Rcol
cd /sources/sysvinit-*/
patch -Np1 -i ../sysvinit-2.88dsf-consolidated-1.patch
if [[ $? != 0 ]]; then
	echo -e ${red}"Patch sysvinit failed"${Rcol}
	nb_error=$((nb_error+1));
fi

exit $nb_error ;
