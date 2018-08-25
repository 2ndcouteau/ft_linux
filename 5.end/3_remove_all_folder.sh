#!/bin/bash
SOURCES="/mnt/lfs/sources/"

function delete_sources()
{
	echo -e $blu"Remove $1"$Rcol
	sudo rm -rf $SOURCES/$1*/
}

for folder in	bash\
				bison\
				bzip\
				coreutil\
				dejagnu\
				expect\
				m4\
				ncurse\
				tcl\
				diffutils\
				file\
				findutils\
				gawk\
				gettext\
				grep\
				gzip\
				make\
				patch\
				perl\
				sed\
				tar\
				texinfo\
				util-linux\
				xz
do
	echo -e $blu"Remove $folder"$Rcol
	sudo rm -rf $SOURCES/$folder*/
done
#
