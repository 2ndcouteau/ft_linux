#!/bin/bash
SOURCES="/mnt/lfs/sources/"

cd $SOURCES

# Start Simple Extraction
echo -e $blu"Extract Bash"$Rcol
tar -xzvf bash*.tar.gz
#
echo -e $blu"Extract Bison"$Rcol
tar -xvf bison*.tar.xz
#
echo -e $blu"Extract Bzip2"$Rcol
tar -xzvf bzip*.tar.gz
#
echo -e $blu"Extract Coreutils"$Rcol
tar -xvf coreutil*.tar.xz
#
echo -e $blu"Extract DejaGNU"$Rcol
tar -xzvf dejagnu*.tar.gz
#
echo -e $blu"Extract Expect"$Rcol
tar -xzvf expect*.tar.gz
#
echo -e $blu"Extract M4"$Rcol
tar -xvf m4*.tar.xz
#
NAME_P="diffutils"
echo -e $blu"Extract $NAME_P"$Rcol
tar -xvf $NAME_P*.tar.xz
#
echo -e $blu"Extract Ncurses"$Rcol
tar -xzvf ncurse*.tar.gz
#
echo -e $blu"Extract tcl-core"$Rcol
tar -xzvf tcl*.tar.gz
#

## Start Composition Extract
NAME_P="file"
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="findutils"
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="gawk"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="gettext"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="grep"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="gzip"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="make"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.bz2"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="patch"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="perl"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="sed"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="tar"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="texinfo"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="util-linux"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

NAME_P="xz"
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"
echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION
