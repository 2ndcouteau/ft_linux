Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

SOURCES="/sources/"

cd $SOURCES
errors_counter=0

function uncompress()
{
	echo -e ${blu}"Extract $1"${Rcol}
	tar $OPT $1*$COMPRESSIONS_EXTENSION
	if [[ $? != 0 ]]; then
		echo -e ${red}"!! ERROR Extraction !!"${Rcol}
		errors_counter=$((errors_counter+1));
	fi
}
#############################
#############################
# Start Composition Extract #
#############################
#############################
## Extract tar.gz archives ##
#############################
OPT="-xzvf"
COMPRESSIONS_EXTENSION=".tar.gz"

for archive in	'check-'\
				'findutils-'\
				'groff-'\
				'less-'\
				'libpipeline-'\
				'sysklogd-'\
				'eudev-'
do
	uncompress $archive
done

#############################
## Extract tar.bz2 archive ##
#############################
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.bz2"

for archive in 	'make-'\
				'sysvinit-'\
				'vim-'
do
	uncompress $archive
done

#############################
## Extract tar.xz archives ##
#############################
OPT="-xvf"
COMPRESSIONS_EXTENSION=".tar.xz"

for archive in 	'coreutils-'\
				'diffutils-'\
				'gawk-'\
				'grub-'\
				'gzip-'\
				'iproute2-'\
				'kdb-'\
				'patch-'\
				'util-linux-'\
				'man-db-'\
				'tar-'\
				'texinfo-'
do
	uncompress $archive
done

###########################
## Check Error Exraction ##
###########################
if [[ ($errors_counter == 0) ]]; then
		echo -e ${blu}"[*] Done."${Rcol}
	else
		echo -e ${red}"[!] Error: There was an error in Extraction."${Rcol}
		exit $errors_counter
fi
