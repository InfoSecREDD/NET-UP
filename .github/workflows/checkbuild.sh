#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root."
  exit 0;
else
  source ../../netup
fi
exit 0
