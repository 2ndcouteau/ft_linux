# Roadmap.mp ft_linux Project

## Errors:

### In Progress:

* Run 6.* installation
	* 6.7 to 6.9 DONE
	* 6.10 Tools chain adjustment Done
	* 6.11 to 6.19 install all binaries DONE
	* 6.20 --> actually in progress
	* write 6.21 to 6.77 extract, patch and install script
		--> maybe in two parts

* Write remove/clean script for 6.7 to 6.20 source extracted folders

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
