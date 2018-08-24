Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

## Functions declarations:
function uncompress()
{
	echo -e $blu"Extract $1"$Rcol
	tar $OPT $1*$COMPRESSIONS_EXTENSION
	if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
}

function continue_or_exit()
{
	read -rsn1 -p"Press Q to exit or Enter to continue : " input
	if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
		echo "Exit."
		exit 0
	fi
	echo
}

function show_date()
{
	date=$( date )
	echo "$blu\Current date:$red $date$Rcol"
}

time {
	echo -e $red"#########################################"
	echo -e "# Start Install all packages$BRed 6.7 to 6.9$red #"
	echo -e "#########################################"$Rcol

	show_date;
	## Parameters declarations:
	SOURCES="/sources/"
	cd $SOURCES
	errors_counter=0

	OPT="-xvf"
	COMPRESSIONS_EXTENSION=".tar.xz"

	############################################################################
	#						SOURCES EXTRACTION								   #
	############################################################################
	echo -e $yel"Extraction START"$Rcol
	## uncompress calls
	uncompress "linux-"
	uncompress "man-pages-"
	uncompress "glibc-"

	echo -e $blux"Extraction DONE"$Rcol
	continue_or_exit # Function script


	## Check Error Exraction
	if [[ ($errors_counter == 0) ]]; then
			echo -e $blu"[*] Done."$Rcol
		else
			echo -e $red"[!] Error: There was an error in Extraction."$Rcol
			exit $errors_counter
	fi

	## open bracket to redirect installations outputs
	{
		############################################################################
		#						BINARIES INSTALLATIONS							   #
		############################################################################
		##########################
		## Install linux-header ##
		##########################
		echo -e $red"## Call install$BRed linux-header$red ##"$Rcol
		time {
			show_date;
			cd $SOURCES/linux-*

			## Clean the folder from a potential previus installation
			echo -e $red"make mrproper"$Rcol
			make mrproper

			## Clean and copie the header in the system folder
			echo -e $red"make install"$Rcol
			make INSTALL_HDR_PATH=dest headers_install
			find dest/include \( -name .install -o -name ..install.cmd \) -delete
			cp -rv dest/include/* /usr/include
		} # End time() linux-header
		#######################
		## Install man-pages ##
		#######################
		echo -e $red"## Call install$BRed man-pages$red ##"$Rcol
		time {
			show_date;
			cd $SOURCES/man-pages*

			echo -e $red"make install"$Rcol
			make install
		} # End time() man-pages
		#################
		## Install glibc ##
		#################
		echo -e $red"## Call install$BRed glibc$red ##"$Rcol
		time{
			show_date;
			cd $SOURCES/glibc*

			## PATCH GLIBC
			echo -e $red"Patch glibc"$Rcol
			patch -Np1 -i ../glibc-2.27-fhs-1.patch
			if [[ $? != 0 ]]; then
					echo -e $red"Patch Failed"$Rcol ;
					exit 1
				else
					echo -e $gre"Patch Done"$Rcol ;
			fi

			echo -e $red"Prepare the installation"$Rcol
			show_date;
			# Create link to avoid to ref /tools to the final glibc
			ln -sfv /tools/lib/gcc /usr/lib

			# Create GCC header and create link for the LSB conformity
			# Then create a link to x86_64 compliance
			case $(uname -m) in
				i?86)    GCC_INCDIR=/usr/lib/gcc/$(uname -m)-pc-linux-gnu/7.3.0/include
						ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3
				;;
				x86_64) GCC_INCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/7.3.0/include
						ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64
						ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3
				;;
			esac

			# Delete old file from potential previous installation
			rm -f /usr/include/limits.h

			# Create installation folder
			mkdir -v build
			cd build

			show_date;
			echo -e $red"Run ./configure"$Rcol
			CC="gcc -isystem $GCC_INCDIR -isystem /usr/include" \
			../configure --prefix=/usr                          \
						 --disable-werror                       \
						 --enable-kernel=3.2                    \
						 --enable-stack-protector=strong        \
						 libc_cv_slibdir=/lib
			unset GCC_INCDIR

			echo -e $red"make"$Rcol
			show_date;
			make

			echo -e $red"Run Tests"$Rcol
			show_date;
			make check
			echo -e $red"Tests done"$Rcol

			# Create file to compliant with the previous test reclamation
			touch /etc/ld.so.conf

			# Correct the make file to remove useless test in LFS env
			sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile

			echo -e $red"make install"$Rcol
			show_date;
			make install
			echo -e $blu"make install done"$Rcol
			show_date;

			# Create and install the conf file of nscd
			cp -v ../nscd/nscd.conf /etc/nscd.conf
			mkdir -pv /var/cache/nscd

			# Define locales
			mkdir -pv /usr/lib/locale
			localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
			localedef -i de_DE -f ISO-8859-1 de_DE
			localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
			localedef -i de_DE -f UTF-8 de_DE.UTF-8
			localedef -i en_GB -f UTF-8 en_GB.UTF-8
			localedef -i en_HK -f ISO-8859-1 en_HK
			localedef -i en_PH -f ISO-8859-1 en_PH
			localedef -i en_US -f ISO-8859-1 en_US
			localedef -i en_US -f UTF-8 en_US.UTF-8
			localedef -i es_MX -f ISO-8859-1 es_MX
			localedef -i fa_IR -f UTF-8 fa_IR
			localedef -i fr_FR -f ISO-8859-1 fr_FR
			localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
			localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
			localedef -i it_IT -f ISO-8859-1 it_IT
			localedef -i it_IT -f UTF-8 it_IT.UTF-8
			localedef -i ja_JP -f EUC-JP ja_JP
			localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
			localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
			localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
			localedef -i zh_CN -f GB18030 zh_CN.GB18030

			# Create file.conf for network compliance
			cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf
passwd: files
group: files
shadow: files
hosts: files dns
networks: files
protocols: files
services: files
ethers: files
rpc: files
# End /etc/nsswitch.conf
EOF

			# Add folders to the dynamic lib file configuration
			## Note -- this step is normaly after the time zone configuration
			## But had be moved because of script compliance
			cat > /etc/ld.so.conf << "EOF"
# Début de /etc/ld.so.conf
/usr/local/lib
/opt/lib
EOF

			## Timezone configuration
			tar -xf ../../tzdata2018c.tar.gz
			ZONEINFO=/usr/share/zoneinfo
			mkdir -pv $ZONEINFO/{posix,right}
			for tz in etcetera southamerica northamerica europe africa antarctica  \
					  asia australasia backward pacificnew systemv; do
				zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
				zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
				zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
			done
			cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
			zic -d $ZONEINFO -p America/New_York
			unset ZONEINFO

			echo $blu"Please finish the time zone configuration manualy"
			echo "cf: 6.9.2.2 LFS-8.2 p.96"$Rcol

		} # End time() glibc
	} &> $SOURCES/.install_6-7_to_6-9.log
} # End time()
