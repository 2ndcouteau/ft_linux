Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


time {
	echo -e ${red}"#################################################"
	echo -e "# Start Install all packages${BRed} 6.21 to 6.34${red} #"
	echo -e "#################################################"${Rcol}


	echo -e ${blu}"Set${yel} SOURCES=/sources"${Rcol}
	SOURCES=/sources
	echo -e ${blu}"Set${yel} ROOT_PWD=$(pwd)"${Rcol}
	ROOT_PWD=$(pwd)/

	echo -e ${blu}"Set${yel} SUB=./sub_scripts"${Rcol}
	SUB=./sub_scripts

	echo -e ${yel}"Installation START"$Rcol
	for prog_name in 	bzip2.sh\
						pkg-config.sh\
						ncurses.sh\
						attr.sh\
						acl.sh\
						libcap.sh\
						sed.sh\
						shadow.sh\
						psmisc.sh\
						iana-etc.sh\
						bison.sh\
						flex.sh\
						grep.sh\
						bash.sh\

	do
		echo -e ${red}"## Call install${BRed} $prog_name ${red} ##"${Rcol}
		cd $ROOT_PWD
		. $SUB/$prog_name
		if [[ $? != 0 ]]; then exit $?; fi
	done

	echo -e ${blu}"All install DONE"${Rcol}
} # End General time()
