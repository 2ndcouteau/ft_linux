#!/bin/bash
SOURCES="/mnt/lfs/sources/"
cd $SOURCES
# /
echo -e $blu"Remove Bash"$Rcol
sudo rm -rf bash*/
#
echo -e $blu"Remove Bison"$Rcol
sudo rm -rf bison*/
#
echo -e $blu"Remove Bzip2"$Rcol
sudo rm -rf bzip*/
#
echo -e $blu"Remove Coreutils"$Rcol
sudo rm -rf coreutil*/
#
echo -e $blu"Remove DejaGNU"$Rcol
sudo rm -rf dejagnu*/
#
echo -e $blu"Remove Expect"$Rcol
sudo rm -rf expect*/
#
echo -e $blu"Remove M4"$Rcol
sudo rm -rf m4*/
#
echo -e $blu"Remove Ncurses"$Rcol
sudo rm -rf ncurse*/
#
echo -e $blu"Remove tcl-core"$Rcol
sudo rm -rf tcl*/
#
##
NAME_P="diffutils"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="file"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="findutils"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="gawk"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="gettext"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="grep"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="gzip"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="make"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="patch"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="perl"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="sed"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P=/
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="texinfo"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="util-linux"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
#
NAME_P="xz"
echo -e $blu"Remove $NAME_P"$Rcol
sudo rm -rf $NAME_P*/
