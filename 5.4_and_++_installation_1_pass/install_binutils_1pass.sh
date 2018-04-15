

#!/bin/bash

cd $SOURCES

tar -xvf binutils*.tar.xz
cd binutils*/

mkdir -v build
cd build

LFS_TGT=$(../.config/guess)

time {
    ../configure --prefix=/tools            \
		 --with-sysroot=$LFS        \
		 --with-lib-path=/tools/lib \
		 --target=$LFS_TGT          \
		 --disable-nls              \
		 --disable-werror

    make

    case $(uname -m) in
	x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
    esac

    make install
}
