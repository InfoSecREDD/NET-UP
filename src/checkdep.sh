#!/usr/bin/env bash
## Checking Device for Commands needed.

check_dep() {
	declare -a deps=('curl' 'ethtool' 'ipcalc')

	for j in ${deps[@]}
	do
		if ! command_exists $j ; then
			print_notification "Attempting to install $j..."
			sudo -k apt-get install -y $j &>/dev/null
			check_success
		fi
	done
}
