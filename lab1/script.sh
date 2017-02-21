#!/bin/bash
homedir=$PWD
testdir=$homedir/test
linksdir=$testdir/links
cd $homedir

echo
echo === TASK 1 ===
mkdir $testdir
cd $testdir

echo
echo === TASK 2 ===
ls -Ap $homedir > list

echo
echo === TASK 3 ===
mkdir $linksdir

echo
echo === TASK 4 ===
ln -T list $linksdir/list_link

echo
echo === TASK 5 ===
rm list

echo
echo === TASK 6 ===
# cat $linksdir/list_link 
head -n 5 $linksdir/list_link

echo
echo === TASK 7 ===
cd $homedir
ln -T $linksdir/list_link list1

echo
echo === TASK 8 ===
ls -Ap /etc | grep .conf$ > list_conf

echo
echo === TASK 9 ===
ls -d /etc/*/ | grep .d/ > list_d

echo
echo === TASK 10 ===
cat list_conf > list_conf_d
cat list_d >> list_conf_d

echo
echo === TASK 11 ===
ln -T list_conf_d $linksdir/list_conf_d_link

echo
echo === TASK 12 ===
ln -T list1 $linksdir/links_list1

echo
echo === TASK 13 ===
less $linksdir/list_conf_d_link

echo
echo === TASK 14 ===
cd $testdir
mkdir .sub

echo
echo === TASK 15 ===
cp $homedir/list_conf_d .sub/

echo
echo === TASK 16 ===
cp -b $homedir/list_conf_d .sub/

echo
echo === TASK 17 ===
cd .sub
mv list_conf_d list_etc

echo
echo === TASK 18 ===
cd $homedir
rm list_conf_d

echo
echo === TASK 19 ===
# cat $linksdir/list_conf_d_link
head -n 5 $linksdir/list_conf_d_link

echo
echo === TASK 20 ===
cd $testdir
cal 2000 > calendar.txt

echo
echo === TASK 21 ===
cat calendar.txt | sed 9q

echo
echo === TASK 22 ===
ls -Ap1

echo
echo === TASK 23 ===
find $homedir -inum $(ls -i $linksdir/list_link | awk '{print $1}') | wc -l

echo
echo === TASK 24 ===
cd $homedir
man man > man.txt

echo
echo === TASK 25 ===
split -db 1024 man.txt