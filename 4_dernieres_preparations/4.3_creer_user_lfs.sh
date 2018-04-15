!#/bin/bash

## NOTE
# You have to be root !


## Create the group lfs and the user lfs
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

## Explanation ##
# -s /bin/bash
#Ceci fait de bash le shell par défaut de l'utilisateur lfs.
# -g lfs
#Cette option ajoute l'utilisateur lfs au groupe lfs.
# -m
#Ceci crée un répertoire personnel pour l'utilisateur lfs . 
# -k /dev/null
#Ce paramètre empêche toute copie possible de fichiers provenant du répertoire squelette (par défaut, /etc/skel) en modifiant son emplacement par le périphérique spécial null.
# lfs
#Ceci est le nom réel pour le groupe et l'utilisateur créé
## ##




# Create password for lfs user and
# Change the propriotary of the repository
# Connection as lfs user
passwd lfs
chown -v lfs $LFS/tools
chown -v lfs $LFS/sources
su - lfs
