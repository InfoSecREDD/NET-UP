#!/bin/bash
# REDD's ifup connection script to determine if a single interface is online.
#


function ifup {
    if [[ ! -d /sys/class/net/${1} ]]; then
        printf 'No such interface: %s\n' "$1" >&2
        return 1
    else
        [[ $(</sys/class/net/${1}/operstate) == up ]]
    fi
}
