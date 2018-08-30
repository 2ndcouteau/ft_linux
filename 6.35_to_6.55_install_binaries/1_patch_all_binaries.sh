Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

nb_error=0

echo -e $red"Patch ninja"$Rcol
cd /sources/ninja-*/
export NINJAJOBS=4
patch -Np1 -i ../ninja-1.8.2-add_NINJAJOBS_var-1.patch
if [[ $? != 0 ]]; then
	echo -e ${red}"Patch ninja failed"${Rcol}
	nb_error=$((nb_error+1));
fi

if [[ $nb_error != 0 ]]; then echo -e ${yel}"PATCH FAILDED !!"${Rcol} ; fi

return $nb_error
