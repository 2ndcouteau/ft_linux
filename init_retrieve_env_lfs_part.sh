#!/bin/bash




## Step 4.4
# Set lfs user environement
cat > ~/.bash_profile <<EOF
 EOF                                                       
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << EOF
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/tools/bin:/bin:/usr/bin
export LFS LC_ALL LFS_TGT PATH
EOF

# Update lfs user environement
source ~/.bash_profile

## Step 5.3
sudo ln -fs /bin/bash /bin/sh
sudo ln -fs /usr/bin/gawk /usr/bin/awk
sudo ln -fs /usr/bin/bison /usr/bin/yacc
