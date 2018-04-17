#!/bin/bash

cd $SOURCES

echo -e $blu"Delete old gcc folder"$Rcol
rm -rf gcc*/
echo -e $blu"Extract gcc"$Rcol
tar -xvf gcc*.tar.xz
cd gcc*/

echo -e $blu"Make Clean"$Rcol
make clean

echo -e $blu"Create full header for limits.h"$Rcol
cat gcc/limitx.h gcc/glimits.h gcc/limity.h >  `dirname \
  $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h


echo -e $blu"Change the path for use GCC in /tools/"$Rcol
for file in gcc/config/{linux,i386/linux{,64}}.h
do
    cp -uv $file{,.orig}
    sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
	-e 's@/usr@/tools@g' $file.orig > $file
      echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
      #define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
      touch $file.orig
done


echo -e $blu"Change the name by default for 64's lib"$Rcol
case $(uname -m) in
    x86_64)
	sed -e '/m64=/s/lib64/lib/' \
	    -i.orig gcc/config/i386/t-linux64
	;;
esac


echo -e $blu"Extract dependancies in the$red GCC$blu folder"$Rcol
tar -xf ../mpfr-4.0.1.tar.xz
mv -v mpfr-4.0.1 mpfr

tar -xf ../gmp-6.1.2.tar.xz
mv -v gmp-6.1.2 gmp

tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc


echo -e $blu"Create$yel build$blu folder"$Rcol
mkdir -v build
cd build

time {
    echo -e $blu"Run$red configuration"$Rcol
    CC=$LFS_TGT-gcc                                    \
    CXX=$LFS_TGT-g++                                   \
    AR=$LFS_TGT-ar                                     \
    RANLIB=$LFS_TGT-ranlib                             \
    ../configure                                       \
        --prefix=/tools                                \
	--with-local-prefix=/tools                     \
	--with-native-system-header-dir=/tools/include \
	--enable-languages=c,c++                       \
	--disable-libstdcxx-pch                        \
	--disable-multilib                             \
	--disable-bootstrap                            \
	--disable-libgomp
    
    echo -e $red"make clean"$Rcol
    make clean

    echo -e $red"make"$Rcol
    make

    echo -e $red"make install"$Rcol
    make install

    echo -e $red"Link cc to gcc : cc --> gcc"$Rcol
    ln -sv gcc /tools/bin/cc
}
