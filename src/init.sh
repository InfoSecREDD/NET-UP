#!/usr/bin/env bash
# Script-Wide Variables/Functions

SLEEP=$(sleep 5)

check_good(){
    echo -e "\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
}

arrow_status(){
    echo -e "\x1B[01;34m[\x3E]\x1B[0m $1"
}

print_status(){
    echo -e "\x1B[01;34m[-]\x1B[0m $1"
}

print_good(){
    echo -e "\x1B[01;32m[*]\x1B[0m $1"
}

print_error(){
    echo -e "\x1B[01;31m[!]\x1B[0m $1"
}

print_notification(){
    echo -e "\x1B[01;33m[!]\x1B[0m $1"
}

mod_checkg(){
    echo -e "\x20\x20\x20\x20\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
}

mod_arrowstat(){
    echo -e "\x20\x20\x20\x20\x1B[01;34m[\x3E]\x1B[0m $1"
}

mod_status(){
    echo -e "\x20\x20\x20\x20\x1B[01;34m[-]\x1B[0m $1"
}

mod_good(){
    echo -e "\x20\x20\x20\x20\x1B[01;32m[*]\x1B[0m $1"
}

mod_error(){
    echo -e "\x20\x20\x20\x20\x1B[01;31m[!]\x1B[0m $1"
}

mod_noti(){
    echo -e "\x20\x20\x20\x20\x1B[01;33m[!]\x1B[0m $1"
}

do_break(){
	echo -e "";
}

start_modules(){
	print_status "Starting Module Loader..";
	mod_noti "Module Directory: $MODULE";
	for FILE in $(ls $MODULE);do 
		if [ "${FILE##*.}" = "mdu" ]; then
			do_break;
			mod_status "Executing module: $FILE";
			mod_status "-------------------------- ";
			source $MODULE/$FILE
			mod_checkg "Module $FILE completed.";
		fi
	done
	do_break;
	[ -n "$(find . -maxdepth 1 -name '*.mdu' -type f -print -quit)" ] || mod_error 'No Module Scripts were found!' && do_break;
	check_good "Module Loader has finished..";
}

list_modules(){
	mod_noti "Listing ALL Modules:";
	mod_noti "---------------------- ";
        for FILE2 in $(ls $MODULE);do
                if [ "${FILE2##*.}" = "mdu" ]; then
                        mod_checkg "$FILE2 \x1B[01;32m(Enabled)\x1B[0m";
		fi
		if [ "${FILE2##*.}" = "tmp" ]; then
                        mod_error "$FILE2 \x1B[01;31m(Disabled)\x1B[0m";
                fi
        done
}

update(){
    apt-get update -y
}

upgrade(){
    apt-get update && apt-get upgrade -y
}

super_upgrade(){
    apt-get update && apt-get upgrade -y && apt-get dist-upgrade -y
}

cleanup(){
    apt-get -y autoremove && apt-get -y clean
}

check_root(){
    print_status "Checking for Root.."
    if [[ $EUID -ne 0 ]]; then
        print_error "This script must be ran with sudo or root privileges, or this isn't going to work."
	    exit 1
    else
        check_good "Root Access Granted!"
    fi
}

command_exists() {
    type "$1" &> /dev/null ;
}

check_success(){
    if [ $? -eq 0 ]; then
        check_good "Procedure successful."
    else
        print_error "Procedure unsucessful! Exiting..."
        exit 1
    fi
}

pause(){
   read -sn 1 -p "Press any key to continue..."
   echo ""
}

read_default(){
    return read -e -p "$1" -i "$2"
}

exist_backup(){
    if [ -f $2 ]; then
        print_notification "$2 found, backuping to $2.bak"
        cp "$2" "$2.bak"
    fi
    cp -f "$1" "$2"

}

show_help(){
    echo "Usage: netup [-h]"
    echo "-h - help message"
}

