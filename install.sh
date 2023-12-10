P#!/bin/bash
getdir(){
	SOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  		DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
		SOURCE="$(readlink "$SOURCE")"
		[[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
	done
	DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
}
getdir;
HOMEDIR=/usr/local/bin/netup
DELFILE="$DIR/$0"
root_check_init(){
    echo "Checking for Root.."
    if [[ $EUID -ne 0 ]]; then
        echo -e "This script must be ran with sudo or root privileges, or this isn't going to work."
            exit 1
    else
        echo -e "Root Access Granted!"
    fi
}
clonemain(){
        echo -e "Cloning from GitHub..";
        git clone https://github.com/InfoSecREDD/NET-UP.git $HOMEDIR
}
clonemods(){
        echo -e "Cloning Modules from Repo.";
        git clone https://github.com/InfoSecREDD/NET-UP-modules.git $HOMEDIR/modules
}
changeperm(){
        echo -e "Changing Permissions of Files..";
        chmod +x $HOMEDIR/netup
        chmod +x $HOMEDIR/modules/enablemod
        chmod +x $HOMEDIR/modules/disablemod
}
cleanup(){
	echo -e "Cleaning up Install Script File.."
	if [ -f "$HOMEDIR/install.sh" ]; then
		rm -rf "$HOMEDIR/install.sh";
	fi
	if [ -f "$0" ]; then
		rm -rf "$0";
	fi
}
run(){
	echo -e "Running Net-UP..";
	bash $HOMEDIR/netup
}
root_check_init;
if [[ -d "$HOMEDIR" ]] ; then
    echo -e "Directory already exists..";
    echo -e "Removing old copy..";
    rm -rf $HOMEDIR
else
    echo "$HOMEDIR does not exists.."
fi
if [ "$DIR" != "$HOMEDIR" ]; then
        if [ -f "$DIR/netup" ]; then
		cd "$HOME"
		mkdir "$HOMEDIR"
                cp -rf $DIR/* "$HOMEDIR/"
		rm -rf "$DIR"
		clonemods;
	else
		cd "$HOME"
		clonemain;
		clonemods;
		cd "$HOMEDIR"
	fi
else
	cd "$HOME"
	clonemain;
	clonemods;
fi
changeperm;
cleanup;
run;
HOMEPATH="$HOME/netup"
HOMEDIR="/usr/local/bin/netup"

if [ -L "$HOMEPATH" ]; then
    rm "$HOMEPATH"
    if [ $? -eq 0 ]; then
        echo -e "Existing symlink deleted successfully."
    else
        echo -e "Error deleting existing symlink."
        exit 1
    fi
fi

ln -s "$HOMEDIR" "$HOMEPATH"

if [ $? -eq 0 ]; then
    echo -e "New symlink created successfully."
else
    echo -e "Error creating symlink."
fi

echo -e "Exiting.. You can now use netup anywhere in the system."
# Double checking if file exists, if so delete. Precautionary measure.
if [ -f "$DELFILE" ]; then
	rm -rf "$DELFILE";
fi
exit 0;
