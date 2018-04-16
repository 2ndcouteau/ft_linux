#!/bin/bash

cd $SOURCES

echo -e $blu"Extract gcc"$Rcol
tar -xvf gcc*.tar.xz
cd gcc*/

echo -e $blu"Make Clean"$Rcol
make clean

sleep 5

echo -e $blu"Extract dependancies in the$red GCC$blu folder"$Rcol
tar -xf ../mpfr-4.0.1.tar.xz
mv -v mpfr-4.0.1 mpfr

tar -xf ../gmp-6.1.2.tar.xz
mv -v gmp-6.1.2 gmp

tar -xf ../mpc-1.1.0.tar.gz
mv -v mpc-1.1.0 mpc


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

case $(uname -m) in
    x86_64)
	sed -e '/m64=/s/lib64/lib/' \
	    -i.orig gcc/config/i386/t-linux64
	;;
esac

echo -e $blu"Create$yel build$blu folder"$Rcol
mkdir -v build
cd build


#echo -e $blu"Set$yel LFS_TGT=$(../config.guess)"$Rcol
#LFS_TGT=$(../.config.guess)

time {
    echo -e $blu"Run$red configuration"$Rcol
    ../configure                                       \
	--target=$LFS_TGT                              \
	--prefix=/tools                                \
	--with-glibc-version=2.11                      \
	--with-sysroot=$LFS                            \
	--with-newlib                                  \
	--without-headers                              \
	--with-local-prefix=/tools                     \
	--with-native-system-header-dir=/tools/include \
	--disable-nls                                  \
	--disable-shared                               \
	--disable-multilib                             \
	--disable-decimal-float                        \
	--disable-threads                              \
	--disable-libatomic                            \
	--disable-libgomp                              \
	--disable-libmpx                               \
	--disable-libquadmath                          \
	--disable-libssp                               \
	--disable-libvtv                               \
	--disable-libstdcxx                            \
        --enable-languages=c,c++

    echo -e $red"make clean"$Rcol
    make clean

    
    echo -e $red"make"$Rcol
    make

    echo -e $red"make install"$Rcol
    make install
}
