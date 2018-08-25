Rcol='\e[0m',    # Text Reset
red='\e[0;31m';
BRed='\e[1;31m';
gre='\e[0;32m';
yel='\e[0;33m';
blu='\e[0;34m';

# function ezlife()
# {
# 	echo -e $blu"EZLIFE, i am $NAME"$Rcol
# 	echo -e $blu"People also call me $1"$Rcol
#
# 	if [[ $? != 1 ]]; then counter=$((counter+1)); fi
# }
#
# counter=0
# NAME="Hiro"
#
# ezlife "$NAME"
# echo "Counter == $counter"
#
# echo
# ezlife "Takashi"
# echo "Counter == $counter"


## Step 1) Function declaration:
function remove_sources {
	echo -e $blu"Remove $1"$Rcol
	sudo rm -rf $SOURCES/$1*
}
# --> Just be sure $1 is incremented correctly


# Step 2) Call function:
remove_sources {
"name1",
"name2",
"name3"
}
