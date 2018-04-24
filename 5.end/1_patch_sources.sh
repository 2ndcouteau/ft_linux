#!/bin/bash

SOURCES="/mnt/lfs/sources/"

cd $SOURCES

## PATCH BZIP2
echo -e $red"Copy Patch bzip2"$Rcol
cp bzip*.patch bzip*/
cd bzip*/

echo -e $red"Patch bzip2"$Rcol
echo -e $red"Follow the instructions !"$Rcol
patch < bzip*.patch


## PATCH COREUTILS
cd $SOURCES
cp coreutil*.patch coreutil*/
cd bzip*/

echo -e $red"Patch Coreutils"$Rcol
echo -e $red"Follow the instructions !"$Rcol
patch < coreutil*.patch
