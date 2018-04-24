SOURCES="/mnt/lfs/sources/"

cd $SOURCES

echo -e $blu"Extract Bash"$Rcol
tar -xzvf bash*.tar.gz

echo -e $blu"Extract Bison"$Rcol
tar -xvf bison*.tar.xz

echo -e $blu"Extract Bzip2"$Rcol
tar -xzvf bzip*.tar.gz

echo -e $blu"Extract Coreutils"$Rcol
tar -xvf coreutil*.tar.xz

echo -e $blu"Extract DejaGNU"$Rcol
tar -xzvf dejagnu*.tar.gz

echo -e $blu"Extract $NAME_P"$Rcol
tar -xvf $NAME_P*.tar.xz

echo -e $blu"Extract Expect"$Rcol
tar -xzvf expect*.tar.gz

echo -e $blu"Extract M4"$Rcol
tar -xvf m4*.tar.xz

echo -e $blu"Extract Ncurses"$Rcol
tar -xzvf ncurse*.tar.gz

echo -e $blu"Extract tcl-core"$Rcol
tar -xzvf tcl*.tar.gz

### End Simple extract

### Start Option extract

OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"


echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.bz2"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION

#

OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

echo -e $blu"Extract $NAME_P"$Rcol
tar $OPT $NAME_P*$COMPRESSIONS_EXTENSION
