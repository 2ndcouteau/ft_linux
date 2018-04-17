#!/bin/bash

cd $SOURCES

echo -e $blu"Extract Glibc"$Rcol
tar -xvf glibc*.tar.xz

echo -e $blu"Move the patch"$Rcol
cp glibc*.patch glibc*/
cd glibc*/

echo -e $blu"Apply the patch"$Rcol
echo -e $red"Please, follow the instuctions"$Rcol
patch < glibc*.patch

echo -e $blu"Create$yel build$blu folder"$Rcol
mkdir -v build
cd build


time {
    echo -e $blu"Run$red configuration"$Rcol
    ../configure                             \
	--prefix=/tools                    \
	--host=$LFS_TGT                    \
	--build=$(../scripts/config.guess) \
	--enable-kernel=3.2             \
	--with-headers=/tools/include      \
	libc_cv_forced_unwind=yes          \
	libc_cv_c_cleanup=yes

    echo -e $red"make"$Rcol
    make

    echo -e $red"make install"$Rcol
    make install
}
