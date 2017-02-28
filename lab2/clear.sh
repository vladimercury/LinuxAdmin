#!/bin/bash
# check if sudo
if [[ "$(whoami)" != "root" ]]; then
	echo "ERROR: No permissions" >&2;
	exit 1
fi

# definitions
disk=/dev/sdb
log=log.txt

# delete partition
echo -e "d\n\nw" | fdisk $disk > $log
echo Removed first partition from $disk