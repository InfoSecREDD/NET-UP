#!/bin/bash
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

modcreds(){
    mod_status "-----------------------------";
    do_break;
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
    mod_status "-----------------------------";
    do_break;
}

runmodcommand(){
        print_status "Starting Module Loader..";
        mod_noti "Module Directory: $MODULE";
        do_break;
        mod_status "Executing module: $FILE";
        mod_status "-------------------------- ";
        source $MODULE/$FILE.*
        mod_checkg "Module $FILE completed.";
        do_break;
        check_good "Module Loader has finished..";
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
        for FILE2 in $(ls $MODULE);do
                if [ "${FILE2##*.}" = "mdu" ]; then
                        mod_checkg "${FILE2%%.*} \x1B[01;32m(Enabled)\x1B[0m";
                fi
                if [ "${FILE2##*.}" = "tmp" ]; then
                        mod_error "${FILE2%%.*} \x1B[01;31m(Disabled)\x1B[0m";
                fi
        done
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
