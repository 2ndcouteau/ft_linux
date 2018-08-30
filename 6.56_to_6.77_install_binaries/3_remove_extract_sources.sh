Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

echo -e ${blu}"Remove uncompress sources"${Rcol}
rm -rf /sources/*/
echo -e ${red}"DONE"${Rcol}
