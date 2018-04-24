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

	echo -e $yel"Extraction START"$Rcol
	./0_uncompress_all.sh
	echo -e $blux"Extraction DONE"$Rcol
	read -p "Press any key to continue... " -n1 -s

	echo -e $yel"Patch START"$Rcol
	./1_patch_sources.sh
	echo -e $blu"Patches DONE"$Rcol
	read -p "Press any key to continue... " -n1 -s

	{
		echo -e $yel"Installation START"$Rcol
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


		######
		echo -e $red"## Call install$BRed Bison ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_bison.sh


		echo -e $red"## Call install$BRed Bzip2 ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_bzip2.sh


		echo -e $red"## Call install$BRed Coreutils ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_coreutils.sh

		######
		echo -e $red"## Call install$BRed Diffutils ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_diffutils.sh


		echo -e $red"## Call install$BRed File ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_file.sh


		echo -e $red"## Call install$BRed Findutils ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_findutils.sh


		echo -e $red"## Call install$BRed Gawk ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_gawk.sh


		echo -e $red"## Call install$BRed Gettext ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_gettext.sh


		echo -e $red"## Call install$BRed Grep ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_grep.sh


		echo -e $red"## Call install$BRed Gzip ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_gzip.sh


		echo -e $red"## Call install$BRed Make ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_make.sh


		echo -e $red"## Call install$BRed Patch ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_patch.sh


		echo -e $red"## Call install$BRed Perl ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_perl.sh


		echo -e $red"## Call install$BRed Sed ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_sed.sh


		echo -e $red"## Call install$BRed Tar ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_tar.sh


		echo -e $red"## Call install$BRed Texinfo ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_texinfo.sh


		echo -e $red"## Call install$BRed Util-linux ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_util-linux.sh


		echo -e $red"## Call install$BRed XZ ##"$Rcol
		cd $ROOT_PWD
		. $SUB/install_xz.sh

	## Eventually, here, you can create a script to clean symbol of object files

		echo -e $red"## Change Owner of $Bred/tools/ ##"$Rcol
		cd $ROOT_PWD
		. $SUB/change_owner_tools.sh
	} > $SOURCES/.installations.log
} # End time
