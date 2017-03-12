# 1
cat /etc/passwd | awk -F: '{print "user", $1, "has id", $3}' > work3.log

# 2
sudo passwd -S root | awk '{print $3}' > work5.log

# 3
cat /etc/group | awk -F: '{printf $1", "} END {print ""}' >> work5.log

# 4
echo "Be careful!" > /etc/skel/readme.txt

# 5
useradd u1 -p $(openssl passwd -crypt 12345678)

# 6
groupadd g1

# 7
usermod -a -G g1 u1

# 8
id u1 >> work5.log

# 9
usermod -a -G g1 user

# 10
cat /etc/group | grep ^g1: | awk -F: '{print $4}' >> work5.log

# 11
sudo chsh -s /usr/bin/mc u1

# 12
useradd u2 -p $(openssl passwd -crypt 87654321)

# 13
mkdir /home/test13
cp work5.log /home/test13/work5-1.log
cp work5.log /home/test13/work5-2.log

# 14
# 0   1   2   3   4   5   6   7
# --- --x -w- -wx r-- r-x rw- rwx
groupadd test13
usermod -a -G test13 u1
usermod -a -G test13 u2
chown -R u1:test13 /home/test13
chmod -R 640 /home/test13
chmod 750 /home/test13

# 15
# 4 SUID 2 SGID 1 sticky
mkdir /home/test15
chown u1:u1 /home/test15
chmod 1777 /home/test15

# 16
cp /bin/nano /home/test15/
chown u1:u1 /home/test15/nano
chmod 4777 /home/test15/nano