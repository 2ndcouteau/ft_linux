#!/bin/bash

## TMP -- Put this in the master call script

Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';


time {
    echo -e $red"##########################"
    echo -e "# Start Install libstd++ #"
    echo -e "##########################"$Rcol

    echo -e $blu"Export$yel \$LFS=/mnt/lfs"
    export LFS=/mnt/lfs

    echo -e $blu"Set$yel SOURCES=/mnt/lfs/sources"
    SOURCES=$LFS/sources
    echo -e $blu"Set$yel TOOLS=/mnt/lfs/tools"
    TOOLS=$LFS/tools
    echo -e $blu"Set$yel PWD=$(pwd)"

    ROOT_PWD=$(pwd)/

    cd $SOURCES

    echo -e $blu"Delete old gcc folder"$Rcol
    rm -rf gcc*/
    echo -e $blu"Extract gcc because libstd++ is in gcc sources"$Rcol
    tar -xvf gcc*.tar.xz
    cd gcc*/

    mkdir -v build
    cd build

    echo -e $blu"Run$red configuration"$Rcol
    ../libstdc++-v3/configure           \
	--host=$LFS_TGT                 \
	--prefix=/tools                 \
	--disable-multilib              \
	--disable-nls                   \
	--disable-libstdcxx-threads     \
	--disable-libstdcxx-pch         \
	--with-gxx-include-dir=/tools/$LFS_TGT/include/c++/7.3.0

    echo -e $red"make"$Rcol
    make

    echo -e $red"make install"$Rcol
    make install
    
} # End time
