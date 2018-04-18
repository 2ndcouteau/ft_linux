#!/bin/bash

cd $SOURCES

echo -e $blu"Extract Bzip2"$Rcol
tar -xzvf bzip*.tar.gz
cp bzip*.patch bzip*/
cd bzip*/

echo -e $red"Patch bzip2"$Rcol
echo -e $red"Follow the instructions !"$Rcol
patch < bzip*.patch

time {
	echo -e $red"make"$Rcol
	make

	echo -e $red"make install"$Rcol
	make PREFIX=/tools install
}
