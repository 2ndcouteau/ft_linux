#!/bin/bash

SOURCES="/mnt/lfs/sources/"

cd $SOURCES

## PATCH BZIP2
echo -e $red"Copy Patch bzip2"$Rcol
cp bzip*.patch bzip*/
cd bzip*/

echo -e $red"Patch bzip2"$Rcol
patch < bzip*.patch
if [[ $? != 0 ]]; then
		echo -e $red"Patch Failed"$Rcol ;
		exit 1
	else
		echo -e $gre"Patch Done"$Rcol ;
fi

echo -e \\n\\n

## PATCH COREUTILS
cd $SOURCES
cp coreutil*.patch coreutil*/
cd coreutil*/

echo -e $blu"Patch Coreutils"$Rcol
patch -p1 < coreutil*.patch
if [[ $? != 0 ]]; then
		echo -e $red"Patch Failed"$Rcol ;
		exit 1
	else
		echo -e $gre"Patch Done"$Rcol ;
fi

echo -e \\n\\n
