#!/bin/bash

cd $SOURCES

echo -e $blu"Extract binutils"$Rcol
tar -xvf binutils*.tar.xz
cd binutils*/

echo -e $blu"Create$yel build$blu folder"$Rcol
mkdir -v build
cd build

#echo -e $blu"Set$yel LFS_TGT=$(../config.guess)"$Rcol
#LFS_TGT=$(../config.guess)

time {
    echo -e $blu"Run$red configuration"$Rcol
    ../configure --prefix=/tools            \
		 --with-sysroot=$LFS        \
		 --with-lib-path=/tools/lib \
		 --target=$LFS_TGT          \
		 --disable-nls              \
		 --disable-werror
    echo -e $red"make"$Rcol
    make

    case $(uname -m) in
	x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
    esac

    echo -e $red"make install"$Rcol
    make install
}
