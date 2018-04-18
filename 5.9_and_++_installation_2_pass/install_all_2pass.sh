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
    echo -e $red"#####################################"
    echo -e "# Start Install all packages$BRed 2 pass$red #"
    echo -e "#####################################"$Rcol

    echo -e $blu"Export$yel \$LFS=/mnt/lfs"
    export LFS=/mnt/lfs

    echo -e $blu"Set$yel SOURCES=/mnt/lfs/sources"
    SOURCES=$LFS/sources
    echo -e $blu"Set$yel TOOLS=/mnt/lfs/tools"
    TOOLS=$LFS/tools
    echo -e $blu"Set$yel PWD=$(pwd)"

    ROOT_PWD=$(pwd)/

    echo -e $blu"Set$yel SUB=./1pass"
    SUB=./2pass

    echo -e $blu"Create $yel$LFS/tools$blu and change owner of $yel$SOURCES$blu and $yel$TOOLS"$Rcol
    mkdir -vp $LFS/tools
    echo -e $red"chown lfs:lfs $SOURCES"$Rcol
    sudo chown -R lfs:lfs $SOURCES
    echo -e $red"chown lfs:lfs $TOOLS"$Rcol
    sudo chown -R lfs:lfs $TOOLS

    echo -e $red"## Call install$BRed binutils 2pass ##"$Rcol
    cd $ROOT_PWD
    . $SUB/install_binutils_2pass.sh


    echo -e $red"## Call install$BRed gcc 2pass ##"$Rcol
    cd $ROOT_PWD
    . $SUB/install_gcc_2pass.sh


    echo -e $red"## CHECK INSTALL 2 PASS ##"$Rcol
    cd $ROOT_PWD
    . $SUB/check_install_2pass.sh

} # End time
