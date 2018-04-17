#!/bin/bash

cd $SOURCES

echo -e $blu"Delete old binutils folder"$Rcol
rm -rf binutils*/
echo -e $blu"Extract binutils"$Rcol
tar -xvf binutils*.tar.xz
cd binutils*/

echo -e $blu"Create$yel build$blu folder"$Rcol
mkdir -v build
cd build

time {
    echo -e $blu"Run$red configuration"$Rcol
    CC=$LFS_TGT-gcc                \
    AR=$LFS_TGT-ar                 \
    RANLIB=$LFS_TGT-ranlib         \
    ../configure                   \
        --prefix=/tools            \
	--disable-nls              \
	--disable-werror           \
	--with-lib-path=/tools/lib \
	--with-sysroot

    echo -e $red"make"$Rcol
    make

    echo -e $red"make install"$Rcol
    make install

    make -C ld clean
    make -C ld LIB_PATH=/usr/lib:/lib
    cp -v ld/ld-new /tools/bin
}
