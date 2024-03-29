#!/bin/bash
# Script-Wide Variables/Functions
R='\033[0;31m';G='\033[0;32m';B='\033[0;34m';Y='\033[0;33m';P='\033[0;35m';C='\033[0;36m';W='\033[0;37m';BR='\033[1;31m';BG='\033[1;32m';BB='\033[1;34m';BY='\033[1;33m';BP='\033[1;35m';BC='\033[1;36m';BW='\033[1;37m';RST='\033[0m'
do_sleep(){
	WAITTIME=NULL
	if [[ $1 != "" ]]; then
		WAITTIME=$1
		sleep $WAITTIME
	else
		WAITTIME=2
		sleep $WAITTIME
	fi
}
do_wtimer_danceman(){
	WAITMESSAGE="$1"
	WAITTIME="$2"
	SECONDS=0
	i=$SECONDS
	echo -e "$WAITMESSAGE"
	wtimer_dancemanbuff;
	while [ $i -le $WAITTIME ]; do
		wtimer_danceman;
		i=$SECONDS
	done
	wtimer_rplbuff;
}
do_wtimer_periods(){
	WAITMESSAGE="$1"
	WAITTIME="$2"
	SECONDS=0
	i=$SECONDS
	while [ $i -le $WAITTIME ]; do
		wtimer_periods "$WAITMESSAGE"
		i=$SECONDS
	done
	echo -e "";
}
subsystem(){
        VAR="Windows Subsystem"
        SUBCHECK=$(lscpu | grep 'Hypervisor vendor:' | head -1 | awk '{print $3,$4}')
        if [[ "$SUBCHECK" == "$VAR" ]]; then
                print_error "WARNING: SOME FUNCTIONS WILL NOT WORK CORRECTLY ON WINDOWS SUBSYSTEM!";
        fi
}
runproject(){
	if [ -f $1 ]; then
		source $1
	else
		print_error "No Module located.";
	fi
}
check_good(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
    else
        echo -e "\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
arrow_status(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;34m[\x3E]\x1B[0m $1"
    else
        echo -e "\x1B[01;34m[\x3E]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
print_status(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;34m[-]\x1B[0m $1"
    else
        echo -e "\x1B[01;34m[-]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
print_good(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;32m[*]\x1B[0m $1"
    else
        echo -e "\x1B[01;32m[*]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
print_error(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;31m[!]\x1B[0m $1"
    else
        echo -e "\x1B[01;31m[!]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
print_notification(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x1B[01;33m[!]\x1B[0m $1"
    else
        echo -e "\x1B[01;33m[!]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$NETUPLOGFILE"
    fi
}
mod_checkg(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;32m[\xE2\x9C\x94]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
mod_arrowstat(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;34m[\x3E]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;34m[\x3E]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
mod_status(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;34m[-]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;34m[-]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
mod_good(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;32m[*]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;32m[*]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
mod_error(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;31m[!]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;31m[!]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
mod_noti(){
    if [[ $LOGVERBOSE == NULL ]]; then
        echo -e "\x20\x20\x20\x20\x1B[01;33m[!]\x1B[0m $1"
    else
        echo -e "\x20\x20\x20\x20\x1B[01;33m[!]\x1B[0m $1"
        echo -e "[$LOGDATE] $1" >> "$MODULELOGFILE"
    fi
}
do_break(){
        echo -e "";
}

modcreds(){
    do_break;
    mod_noti "   Module Information:";
    mod_status "--------------------------";
        if [ -z "$MODULENAME" ]; then
                mod_status "- Module Name   : Module Not Named";
        else
                mod_status "- Module Name   : $MODULENAME";
        fi
        if [ -z "$MODULEVERS" ]; then
                mod_status "- Module Version: Not Specified";
        else
                mod_status "- Module Version: $MODULEVERS";
        fi
        if [ -z "$MODULECRED" ]; then
                mod_status "- Module Credits: Not Specified";
        else
                mod_status "- Module Credits: $MODULECRED";
        fi
    mod_status "--------------------------";
    do_break;
}

runmodcommand(){
        print_status "Starting Module Loader..";
        mod_noti "Module Directory: $MODULE";
        do_break;
        mod_status "Executing module: $FILE";
        mod_status "-------------------------- ";
        if [ -f $MODULE/$FILE.* ]; then
                source $MODULE/$FILE.*
                mod_checkg "Module $FILE completed.";
                do_break;
                check_good "Module Loader has finished..";
        else
                mod_error "Module Error: There is no Module with that name."
                do_break;
                exitnetup;
        fi
}

start_modules(){
        modcount=0
        print_status "Starting Module Loader..";
        mod_noti "Module Directory: $MODULE";
        for FILE in $(ls $MODULE);do
                if [ "${FILE##*.}" = "mdu" ]; then
                        do_break;
                        modcount=1
                        mod_status "Executing module: $FILE";
                        mod_status "-------------------------- ";
                        source $MODULE/$FILE
                        mod_checkg "Module $FILE completed.";
                fi
        done
        do_break;
        [ -n "$(find . -maxdepth 1 -name '*.mdu' -type f -print -quit)" ] || if [ "$modcount" -eq "0" ];then
            mod_error 'No Module Scripts were found!' && do_break;
            fi
        check_good "Module Loader has finished..";
        exitnetup;
}

list_modules(){
    mod_noti "Listing ALL Modules:";
    mod_noti "---------------------- ";
    
    # Check if $MODULE directory exists
    if [ -d "$MODULE" ]; then
        for FILE2 in $(ls $MODULE); do
            if [ "${FILE2##*.}" = "mdu" ]; then
                mod_checkg "${FILE2%%.*} \x1B[01;32m(Enabled)\x1B[0m";
            fi
            if [ "${FILE2##*.}" = "tmp" ]; then
                mod_error "${FILE2%%.*} \x1B[01;31m(Disabled)\x1B[0m";
            fi
        done
    else
        mod_error "$MODULE directory does not exist";
    fi

    # Check if $DEVMODULE directory exists
    if [ -d "$DEVMODULE" ]; then
        mod_noti "Listing ALL DevModules:";
        mod_noti "-------------------------- ";
        for FILE2 in $(ls $DEVMODULE); do
            if [ "${FILE2##*.}" = "mdu" ]; then
                mod_checkg "${FILE2%%.*} \x1B[01;32m(Enabled)\x1B[0m";
            fi
            if [ "${FILE2##*.}" = "tmp" ]; then
                mod_error "${FILE2%%.*} \x1B[01;31m(Disabled)\x1B[0m";
            fi
        done
    fi
}

autoexitcheck(){
        CONFIGFILE="$DIR/.conf"
        if [ ! -f "$CONFIGFILE" ]; then
                echo -e "";
                print_error "Auto-Exit is ON. (by Default)";
                echo -e "";
                print_status "Please check the source of netup File and change";
                print_status "AUTOEXIT to NO to continue with NET-UP Framework.";
                echo -e "";
                touch $CONFIGFILE
                exitnetup;
        else
                if [ "$AUTOEXIT" = "NO" ]; then
                        print_good "Auto-Exit is OFF.";
                        echo -e "";
                        print_good "Continuing with NET-UP Framework..";
                fi
                if [ "$AUTOEXIT" = "YES" ]; then
                        print_error "Auto-Exit is ON.";
                        echo -e "";
                        print_good "NET-UP Complete. Exiting.."
                        exitnetup;
                fi
        fi
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
