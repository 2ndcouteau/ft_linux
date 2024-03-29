Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

echo -e ${blu}"Set${yel} ROOT_PWD=$(pwd)"${Rcol}
ROOT_PWD=$(pwd)/

time {
	{
		echo -e ${red}"#########################################################"
		echo -e "# Start Extract and Install all packages${BRed} 6.35 to 6.55${red} #"
		echo -e "#########################################################"${Rcol}

		echo -e $yel"Extract and install START"$Rcol
		echo -e $red"## Call install${BRed} Extract ${red}##"${Rcol}
		cd $ROOT_PWD
		. ./0_extract_all_binaries.sh
		if [[ $? != 0 ]]; then exit $?; fi

		echo -e $red"## Patch all binaries ##"${Rcol}
		cd $ROOT_PWD
		. ./1_patch_all_binaries.sh
		if [[ $? != 0 ]]; then
			echo -e ${yel}"PATCH FAILDED !!"${Rcol} ;
			exit $?;
		fi

		echo -e $red"## Call install${BRed} Install ${red}##"${Rcol}
		cd $ROOT_PWD
		. ./2_install_all_binaries.sh

		echo -e $red"## Clean all sources ##"${Rcol}
		cd $ROOT_PWD
		. ./3_remove_extract_sources.sh

		if [[ $? != 0 ]]; then exit $?; fi
	}  &> /sources/.656_to_677.log
	echo -e ${blu}"All extract and install DONE"${Rcol}
}
