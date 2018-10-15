#!/usr/bin/env bash
get_dir () {
     SOURCE="${BASH_SOURCE[0]}"
     while [ -h "$SOURCE" ]; do
          DIRECTORY="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          [[ $SOURCE != /* ]] && SOURCE="$DIRECTORY/$SOURCE"
     done
     DIRECTORY="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
     echo "$DIRECTORY"
}
DIR=$(get_dir)
HOMEDIR=$DIR/netup
git clone 

source $DIR/src/initialize

