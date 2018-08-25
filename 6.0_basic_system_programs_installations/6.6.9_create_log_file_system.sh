## This script should be run indepenandly from the 6.6 script because of the connection to a new shell

echo -e "#$red Create log files$Rcol #"
## Creation log file installation
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp
