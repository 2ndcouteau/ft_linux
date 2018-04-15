#!/bin/bash

## Put this repository in the /mnt/lfs/sources and run this script

SOURCES=/mnt/lfs/sources

cd $SOURCES
install_binutils_1pass.sh

cd $SOURCES
install_gcc_1pass.sh
