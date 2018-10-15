#!/usr/bin/env bash
HOMEDIR=$HOME/netup
cd $HOME
echo "Cloning from GitHub..";
git clone https://github.com/private-locker/Net-UP.git netup
cd $HOMEDIR
chmod +x $HOMEDIR/netup
source $HOMEDIR/netup


