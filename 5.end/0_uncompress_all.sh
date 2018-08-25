#!/bin/bash
SOURCES="/mnt/lfs/sources/"

cd $SOURCES
errors_counter=0

function uncompress()
{
	echo -e $blu"Extract $NAME_P"$Rcol
	tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION
	if [[ $? != 0 ]]; then
		errors_counter=$((errors_counter+1));
	fi
}
#############################
#############################
# Start Composition Extract #
#############################
#############################
## Extract tar.gz archives ##
#############################
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"

for archive in	"bash"
				"bzip"
				"dejagnu"
				"expect"
				"ncurse"
				"tcl"
				"file"
				"findutils"
do
	uncompress $archive
done

#############################
## Extract tar.bz2 archive ##
#############################
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.bz2"

uncompress "make"

#############################
## Extract tar.xz archives ##
#############################
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

for archive in	"gawk"
				"gettext"
				"grep"
				"gzip"
				"patch"
				"perl"
				"sed"
				"tar"
				"texinfo"
				"util-linux"
				"xz"
				"bison"
				"coreutil"
				"m4"
				"diffutils"
do
	uncompress $archive
done

###########################
## Check Error Exraction ##
###########################
if [[ ($errors_counter == 0) ]]; then
		echo -e $blu"[*] Done."$Rcol
	else
		echo -e $red"[!] Error: There was an error in Extraction."$Rcol
		exit $errors_counter
fi
