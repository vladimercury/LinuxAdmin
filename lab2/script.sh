#!/bin/bash
# check if sudo
if [[ "$(whoami)" != "root" ]]; then
	echo "ERROR: No permissions" >&2;
	exit 1
fi

# definitions
disk=/dev/sdb
log=log.txt

# prevent repeating 
fdisk -l $disk | grep Linux > /dev/null && (echo "ERROR: Repeating" >&2; exit 1)

# task 1
echo -e "n\np\n\n\n+500M\nw" | fdisk $disk > $log
echo Created a 500M partition on $disk

# task 2
mkfs.ext3 -Fb 1024 "$disk"1

# task 3
dumpe2fs -h "$disk"1 > superblock.txt