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
rain=//rain/tmp
share=/mnt/share

# prevent repeating 
fdisk -l $disk | grep Linux > /dev/null && (echo "ERROR: Repeating" >&2; exit 1)

# task 1
echo -e "n\np\n\n\n+500M\nw" | fdisk $disk > $log
echo Created a 500M partition on $disk

# task 2
mkfs.ext3 -Fb 1024 $disk1

# task 3
dumpe2fs -h $disk1 > superblock.txt

# task 5
mkdir $newdisk
mount $disk1 $newdisk

# task 6
ln -s $newdisk /root/

# task 7
mkdir "$newdisk"/any

# task 8
uuid=$(blkid $disk1 | awk '{print $2}')
echo $uuid $newdisk ext3 noexec,noatime 0 0 >> /etc/fstab
reboot

# task 9
umount $disk1
echo -e "d\nn\np\n\n\n+1G\nw" | fdisk $disk > $log
resize2fs $disk1 1G
mount $disk1 $newdisk
df -h | grep $disk1

# task 10
sudo e2fsck -n /dev/sdb1

# task 11
mkdir /mnt/share
# I DON'T KNOW IF IT WORKS
mount.cifs $rain $share

# task 13
# I DON'T KNOW IF IT WORKS
echo $rain $share cifs guest,iocharset=utf8 0 0 >> /etc/fstab