Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


time {
	echo -e $red"#################################################"
	echo -e "# Start Install all packages$BRed 6.11 to 6.19$red #"
	echo -e "#################################################"$Rcol


	echo -e $blu"Set$yel SOURCES=/sources"$Rcol
	SOURCES=/sources
	echo -e $blu"Set$yel ROOT_PWD=$(pwd)"$Rcol
	ROOT_PWD=$(pwd)/

	echo -e $blu"Set$yel SUB=./sub_scripts"$Rcol
	SUB=./sub_scripts

	echo -e $yel"Installation START"$Rcol
	for prog_name in 	zlib.sh\
						file.sh\
						readline.sh\
						m4.sh\
						bc.sh\
						binutils.sh\
						gmp.sh\
						mpfr.sh\
						mpc.sh
	do
		echo -e $red"## Call install$BRed $prog_name ##"$Rcol
		cd $ROOT_PWD
		. $SUB/$prog_name
		if [[ $? != 0 ]]; then exit $?; fi
	done

	echo -e ${blu}"All install DONE"${Rcol}
} # End General time()
