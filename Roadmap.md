# Roadmap.mp ft_linux Project

## Errors:

### In Progress:

* Run 6.* installation
	--> see 6.7 test.sh

### Done:
* Error with the pass
	* check the .install.log file
	--> Be carreful where you make the path declaration

* 6.2 script have not been run correctly
	- Some folder have not been created
	- $LFS have not been declarated correctly
	--> Correct by add "LFS=/mnt/lfs/" in hard in the script.
	--> Then correct the connection process to avoid to cut the script by a connection.

* Factorisation script 5.end
	* 5.end/0_...sh
	* 5.end/3_...sh
	* install_all_to_end.sh
