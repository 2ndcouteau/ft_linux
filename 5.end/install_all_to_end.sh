#!/bin/bash

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

# !!!!!
# The USER lfs should be in a sudoers
# !!!!!

## Function declarations
function continue_or_exit()
{
	read -rsn1 -p"Press Q to exit or Enter to continue : " input
	if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
		echo "Exit."
		exit 0
	fi
	echo
}
##



time {
	echo -e $red"################################################"
	echo -e "# Start Install all packages$BRed 5.11 to end$red #"
	echo -e "################################################"$Rcol



	# Set General Variables
	echo -e $blu"Export$yel \$LFS=/mnt/lfs"
	export LFS=/mnt/lfs

	echo -e $blu"Set$yel SOURCES=/mnt/lfs/sources"
	SOURCES=$LFS/sources
	echo -e $blu"Set$yel TOOLS=/mnt/lfs/tools"
	TOOLS=$LFS/tools
	echo -e $blu"Set$yel ROOT_PWD=$(pwd)"

	ROOT_PWD=$(pwd)/

	echo -e $blu"Set$yel SUB=./sub_scripts"
	SUB=./sub_scripts


	# Create log file of the installations
	touch $SOURCES/.install.log



	# Prepare folders and Set owner of working directories
	echo -e $blu"Create $yel$LFS/tools$blu and change owner of $yel$SOURCES$blu and $yel$TOOLS"$Rcol
	mkdir -vp $LFS/tools
	echo -e $red"chown lfs:lfs $SOURCES"$Rcol
	sudo chown -R lfs:lfs $SOURCES
	echo -e $red"chown lfs:lfs $TOOLS"$Rcol
	sudo chown -R lfs:lfs $TOOLS




	# UNCOMPRESS ALL PACKAGES
	echo -e $yel"Extraction START"$Rcol
	./0_uncompress_all.sh
	echo -e $blux"Extraction DONE"$Rcol
	continue_or_exit # Function script



	# PATCH ALL SOURCES
	echo -e $yel\n"Patch START"$Rcol
	./1_patch_sources.sh
	echo -e $blu"Patches DONE"$Rcol
	continue_or_exit # Function script

	{
		echo -e $yel"Installation START"$Rcol
		for prog_name in 	tcl-core.sh\
							expect.sh\
							dejaGNU.sh\
							m4.sh\
							ncurses.sh\
							bash.sh\
							bison.sh\
							bzip2.sh\
							coreutils.sh\
							diffutils.sh\
							file.sh\
							findutils.sh\
							gawk.sh\
							gettext.sh\
							grep.sh\
							gzip.sh\
							make.sh\
							patch.sh\
							perl.sh\
							sed.sh\
							tar.sh\
							texinfo.sh\
							util_linux.sh\
							xz.sh
		do
			echo -e $red"## Call install$BRed $prog_name ##"$Rcol
			cd $ROOT_PWD
			. $SUB/install_$prog_name
			if [[ $? != 0 ]]; then exit $?; fi
		done

	## Eventually, here, you can create a script to clean symbol of object files

		echo -e $red"## Change Owner of $Bred/tools/ ##"$Rcol
		cd $ROOT_PWD
		. $SUB/change_owner_tools.sh
		if [[ $? != 0 ]]; then echo -e $red"Error : chown failed"$Rcol; fi

	} &> $SOURCES/.install.log
} # End time

###########################
#### OLD INSTALL SCRIPT ###
###########################
#
# echo -e $red"## Call install$BRed $prog_name ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_tcl-core.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
#
# echo -e $red"## Call install$BRed Expect ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_expect.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed DejaGNU ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_dejaGNU.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed M4 ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_m4.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Ncurses ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_ncurses.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Bash ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_bash.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# ######
# echo -e $red"## Call install$BRed Bison ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_bison.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Bzip2 ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_bzip2.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Coreutils ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_coreutils.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# ######
# echo -e $red"## Call install$BRed Diffutils ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_diffutils.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed File ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_file.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Findutils ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_findutils.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Gawk ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_gawk.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Gettext ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_gettext.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Grep ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_grep.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Gzip ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_gzip.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Make ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_make.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Patch ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_patch.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Perl ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_perl.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Sed ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_sed.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Tar ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_tar.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Texinfo ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_texinfo.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed Util-linux ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_util_linux.sh
# if [[ $? != 0 ]]; then exit $?; fi
#
# echo -e $red"## Call install$BRed XZ ##"$Rcol
# cd $ROOT_PWD
# . $SUB/install_xz.sh
# if [[ $? != 0 ]]; then exit $?; fi
