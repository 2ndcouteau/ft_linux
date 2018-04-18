#!/bin/bash

## TMP -- Put this in the master call script

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


# !!!!!
# The USER lfs should be in a sudoers
# !!!!!

time {
	echo -e $red"################################################"
	echo -e "# Start Install all packages$BRed 5.11 to end$red #"
	echo -e "################################################"$Rcol

	echo -e $blu"Export$yel \$LFS=/mnt/lfs"
	export LFS=/mnt/lfs

	echo -e $blu"Set$yel SOURCES=/mnt/lfs/sources"
	SOURCES=$LFS/sources
	echo -e $blu"Set$yel TOOLS=/mnt/lfs/tools"
	TOOLS=$LFS/tools
	echo -e $blu"Set$yel PWD=$(pwd)"

	ROOT_PWD=$(pwd)/

	echo -e $blu"Set$yel SUB=./1pass"
	SUB=./sub_scripts

	echo -e $blu"Create $yel$LFS/tools$blu and change owner of $yel$SOURCES$blu and $yel$TOOLS"$Rcol
	mkdir -vp $LFS/tools
	echo -e $red"chown lfs:lfs $SOURCES"$Rcol
	sudo chown -R lfs:lfs $SOURCES
	echo -e $red"chown lfs:lfs $TOOLS"$Rcol
	sudo chown -R lfs:lfs $TOOLS

	echo -e $red"## Call install$BRed Tcl-core ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_tcl-core.sh


	echo -e $red"## Call install$BRed Expect ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_expect.sh


	echo -e $red"## Call install$BRed DejaGNU ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_dejaGNU.sh


	echo -e $red"## Call install$BRed M4 ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_m4.sh


	echo -e $red"## Call install$BRed Ncurses ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_ncurses.sh


	echo -e $red"## Call install$BRed Bash ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_bash.sh


	echo -e $red"## Call install$BRed Bison ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_bison.sh


	echo -e $red"## Call install$BRed Bzip2 ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_bzip2.sh


	echo -e $red"## Call install$BRed Coreutils ##"$Rcol
	cd $ROOT_PWD
	. $SUB/install_coreutils.sh

} # End time
