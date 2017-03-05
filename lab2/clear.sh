#!/bin/bash
# check if sudo
if [[ "$(whoami)" != "root" ]]; then
	echo "ERROR: No permissions" >&2;
	exit 1
fi

# definitions
disk=/dev/sdb
disk1="$disk"1
log=log.txt
newdisk=/mnt/newdisk

# delete partition
echo -e "d\n\nw" | fdisk $disk > $log
echo Removed first partition from $disk

# unmount
umount $newdisk
rm /root/newdisk
rm -r $newdisk