#!/bin/bash
SOURCES="/mnt/lfs/sources/"

cd $SOURCES
errors_counter=0

# Start Simple Extraction
echo -e $blu"Extract Bash"$Rcol
tar -xzvf bash*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract Bison"$Rcol
tar -xvf bison*.tar.xz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract Bzip2"$Rcol
tar -xzvf bzip*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract Coreutils"$Rcol
tar -xvf coreutil*.tar.xz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract DejaGNU"$Rcol
tar -xzvf dejagnu*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract Expect"$Rcol
tar -xzvf expect*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract M4"$Rcol
tar -xvf m4*.tar.xz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
NAME_P="diffutils"
echo -e $blu"Extract $NAME_P"$Rcol
tar -xvf $NAME_P*.tar.xz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract Ncurses"$Rcol
tar -xzvf ncurse*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#
echo -e $blu"Extract tcl-core"$Rcol
tar -xzvf tcl*.tar.gz
if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi


# Start Composition Extract
NAME_P="file"
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="findutils"
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="gawk"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="gettext"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="grep"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="gzip"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="make"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.bz2"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="patch"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="perl"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="sed"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="tar"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="texinfo"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="util-linux"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi
#

NAME_P="xz"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

if [[ $? != 0 ]]; then errors_counter=$((errors_counter+1)); fi

## Check Error Exraction
if [[ ($errors_counter == 0) ]]; then
		echo -e $blu"[*] Done."$Rcol
	else
		echo -e $red"[!] Error: There was an error in Extraction."$Rcol
		exit $errors_counter
fi
