#!/bin/bash

echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'

echo "    [Requesting program interpreter: /tools/lib64/ld-linux-x86-64.so.2]"
echo ":Result expected. "

rm -v dummy.c a.out

echo "If everything is good until here, you can follow.
If there is a problem in two steps, that mean Binutils, GCC or Glibc had problems"

echo "Else, retry with gcc instead of cc. If it's work, you need to create the link for cc --> gcc
Else, test \$PATH=$PATH, '/tools/bin' should be on the start of the list.
If it's bad, maybe you are not 'lfs' user or you had problem in the 4.4 section"
