#!/bin/bash

cd $SOURCES

echo -e $blu"Extract linux API headers"$Rcol
tar -xvf linux*.tar.xz
cd linux*/

echo -e $blu"Clean potentialy old files"$Rcol
make mrproper

time {
    
    echo -e $red"make$blu with option"$Rcol
    make INSTALL_HDR_PATH=dest headers_install

    echo -e $blu"Copy$yel dest/include/* to /tools/include"$Rcol
    cp -rv dest/include/* /tools/include

}
