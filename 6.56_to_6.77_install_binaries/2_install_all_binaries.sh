Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


time {
	echo -e ${red}"#################################################"
	echo -e "# Start Install all packages${BRed} 6.56 to 6.77${red} #"
	echo -e "#################################################"${Rcol}


	echo -e ${blu}"Set${yel} SOURCES=/sources"${Rcol}
	SOURCES=/sources
	echo -e ${blu}"Set${yel} ROOT_PWD=$(pwd)"${Rcol}
	ROOT_PWD=$(pwd)/

	echo -e ${blu}"Set${yel} SUB=./sub_scripts"${Rcol}
	SUB=./sub_scripts

	echo -e ${yel}"Installation START"$Rcol
	for prog_name in	coreutils.sh\
						check.sh\
						diffutils.sh\
						gawk.sh\
						findutils.sh\
						groff.sh\
						grub.sh\
						less.sh\
						gzip.sh\
						iproute2.sh\
						kdb.sh\
						libpipeline.sh\
						make.sh\
						patch.sh\
						sysklogd.sh\
						sysvinit.sh\
						eudev.sh\
						util-linux.sh\
						man-db.sh\
						tar.sh\
						texinfo.sh\
						vim.sh
	do
		echo -e ${red}"## Call install${BRed} $prog_name ${red} ##"${Rcol}
		cd $ROOT_PWD
		. $SUB/$prog_name
		if [[ $? != 0 ]]; then
			echo -e ${red}"ERROR Install script"${Rcol}
			exit $?;
		fi
	done

	echo -e ${blu}"All install DONE"${Rcol}
} # End General time()
