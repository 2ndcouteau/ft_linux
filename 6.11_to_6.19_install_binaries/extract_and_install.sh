Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

echo -e ${blu}"Set${yel} ROOT_PWD=$(pwd)${blu}"${Rcol}
ROOT_PWD=$(pwd)/

time {
	{
		echo -e ${yel}"Extract and install START"${Rcol}
		echo -e ${red}"## Call install${BRed} Extract ${red}##"${Rcol}
		cd $ROOT_PWD
		. ./0_extract_all_binaries.sh
		if [[ $? != 0 ]]; then exit $?; fi
		echo -e ${red}"## Call install${BRed} Install ${red}##"${Rcol}
		cd $ROOT_PWD
		. ./1_install_all_binaries.sh

		if [[ $? != 0 ]]; then exit $?; fi
	}  &> /sources/.611_to_619.log
	echo -e ${blu}"All extract and install DONE"${Rcol}
}
