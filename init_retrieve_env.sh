#!/bin/bash




## Step 2.7
## NOTE
### Volume for swap and boot exist yet

# Create repo for /
sudo mkdir -pv $LFS
# Mount the volume for the / of the new system
sudo mount -v -t ext4 /dev/sda3 $LFS

# Create repo for the home
sudo mkdir -v $LFS/home

# Mount the volume for the homes of the new system
sudo mount -v -t ext4 /dev/sda4 $LFS/home

## Step 4.
# Set lfs user as the owner of all work ressources
sudo chown -v -R lfs $LFS/tools
sudo chown -v -R lfs $LFS/sources
su - lfs


## Step 4.4
# Set lfs user environement
cat > ~/.bash_profile << EOF
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
