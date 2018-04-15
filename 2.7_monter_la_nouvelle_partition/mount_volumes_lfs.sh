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
