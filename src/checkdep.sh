#!/usr/bin/env bash
## Checking Device for Commands needed.
check_dep(){
#	echo "curl ethtool ipcalc" | tr ' ' '\n' > deps
#	while read -ru 3 DEPS; do
#        if ! command_exists $DEPS ; then
#                print_notification "Attempting to install $DEPS..";
#                sudo -k apt-get install -y $DEPS &>/dev/null
#                check_success;
#        fi
#	done < "deps"
	if ! command_exists curl ; then
        	print_notification "Attempting to install curl..";
        	sudo -k apt-get install -y curl &>/dev/null
        	check_success;
	fi
	if ! command_exists ethtool ; then
        	print_notification "Attempting to install ethtool..";
        	sudo -k apt-get install -y ethtool &>/dev/null
        	check_success;
	fi
	if ! command_exists ipcalc ; then
        	print_notification "Attempting to install ipcalc..";
        	sudo -k apt-get install -y ipcalc &>/dev/null
        	check_success;
	fi
	if ! command_exists lscpu ; then
        	print_notification "Attempting to install lscpu..";
        	sudo -k apt-get install -y lscpu &>/dev/null
        	check_success;
	fi
	if ! command_exists finger ; then
        	print_notification "Attempting to install finger..";
        	sudo -k apt-get install -y finger &>/dev/null
        	check_success;
	fi
}
