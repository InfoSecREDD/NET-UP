sym_check(){
	SYMLINK1=/usr/bin/netup
	if [[ -L "$SYMLINK1" ]];then
		check_good "$SYMLINK1 points to a valid symlink file.."
	else
		print_status "Linking NET-UP into /usr/bin..";
		check_root;
		sudo -k rm -rf "$SYMLINK1"
		sudo -k ln -s $DIR/netup /usr/bin/
		check_good "NET-UP successfully linked..";
	fi
}
