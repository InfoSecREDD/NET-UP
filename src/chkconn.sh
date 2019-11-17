#!/bin/bash
# REDD's ifup connection script to determine if a single interface is online.
#


function ifup {
    if [[ ! -d /sys/class/net/${1} ]]; then
        echo -e "Please check interface $1.";
        return 1
    else
        [[ $(</sys/class/net/${1}/operstate) == up ]]
    fi
}
