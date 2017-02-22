#!/bin/bash
#homedir=~
homedir=$PWD
testdir=$homedir/test
linksdir=$testdir/links
cd $homedir

echo === TASK 1 ===
mkdir $testdir
cd $testdir

echo === TASK 2 ===
ls -Ap $homedir > list

echo === TASK 3 ===
mkdir $linksdir

echo === TASK 4 ===
ln -T list $linksdir/list_link

echo === TASK 5 ===
rm list

echo === TASK 6 ===
cat $linksdir/list_link

echo === TASK 7 ===
cd $homedir
ln -T $linksdir/list_link list1

echo === TASK 8 ===
ls -Ap /etc | grep .conf$ > list_conf

echo === TASK 9 ===
ls -d /etc/*/ | grep .d/ > list_d

echo === TASK 10 ===
cat list_conf > list_conf_d
cat list_d >> list_conf_d

echo === TASK 11 ===
ln -T list_conf_d $linksdir/list_conf_d_link

echo === TASK 12 ===
ln -T list1 $linksdir/links_list1

echo === TASK 13 ===
less $linksdir/list_conf_d_link

echo === TASK 14 ===
cd $testdir
mkdir .sub

echo === TASK 15 ===
cp $homedir/list_conf_d .sub/

echo === TASK 16 ===
cp -b $homedir/list_conf_d .sub/

echo === TASK 17 ===
cd .sub
mv list_conf_d list_etc

echo === TASK 18 ===
cd $homedir
rm list_conf_d

echo === TASK 19 ===
cat $linksdir/list_conf_d_link

echo === TASK 20 ===
cd $testdir
cal 2000 > calendar.txt

echo === TASK 21 ===
cat calendar.txt | sed 9q

echo === TASK 22 ===
ls -Ap1

echo === TASK 23 ===
find $homedir -inum $(ls -i $linksdir/list_link | awk '{print $1}') | wc -l

echo === TASK 24 ===
cd $homedir
man --help > man.txt

echo === TASK 25 ===
split -db 1024 man.txt man-

echo === TASK 26 ===
mkdir man.dir

echo === TASK 27 ===
mv man-* man.dir/

echo === TASK 28 ===
cd man.dir/
cat man-* > man.txt

echo === TASK 29 ===
cd ..
diff man.txt man.dir/man.txt && echo OK

echo === TASK 30 ===
echo -e "String\n$(cat man.txt)" > man.txt
echo -e "\nString2" >> man.txt

echo === TASK 31 ===
diff -u man.txt man.dir/man.txt > patch.diff

echo === TASK 32 ===
mv patch.diff man.dir/

echo === TASK 33 ===
cd man.dir/
patch -t man.txt patch.diff

echo === TASK 34 ===
cd ..
diff man.txt man.dir/man.txt && echo OK

echo === TASK 35 ===
read -p "Press any key..."

echo === TASK 36 ===
rm -R test/
rm list* 
rm -R man.dir/
rm man.txt