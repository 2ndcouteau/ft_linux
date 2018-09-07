# Roadmap.mp ft_linux Project

## Errors:

### In Progress:

* Write scripts to check if all binaries have been installed correctly
* Continue 7 and more parts


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

* !!!! Write remove/clean script for 6.7 to 6.20 source extracted folders
	--> Lot of memory to save

	* Run 6.* installation
	* 6.07 to 6.09 DONE
	* 6.10 Tools chain adjustment Done
	* 6.11 to 6.19 install all binaries DONE
	* 6.20 DONE
	* 6.21 to 6.34 extract, patch and install script DONE
	* 6.35 to 6.55 extract, patch and install script DONE
	* write 6.36 to 6.77 extract, patch and install script DONE

	--> Perl, automake, autoconf, e2fsprogs (>4SBU) can be long
