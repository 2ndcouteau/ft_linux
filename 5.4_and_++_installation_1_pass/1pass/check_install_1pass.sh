#!/bin/bash

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'

echo "[Requesting program interpreter: /tools/lib64/ld-linux-x86-64.so.2]"
echo ":Result expected. "

rm -v dummy.c a.out

echo "If everything is good until here, you can follow.
If there is a problem in two steps, that mean Binutils, GCC or Glibc had problems"
