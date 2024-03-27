#!/bin/bash
#
ARHPATH=/tmp
EXTPATH=/tmp/1111
DATE=`date '+%d-%m-%y'`
echo $DATE
for i in {1..5}
do
mkdir -p Dir$i
for j in {1..5}
do 
date +'%H-%M-%S' > Dir$i/File-$j.txt
sleep 1
cat Dir$i/File-$j.txt
done
ls Dir$i
done
tar -czvf $ARHPATH/Arh-$DATE.tar.gz Dir* >> ArhList.txt
sleep 5
mkdir -p $EXTPATH
tar -xzf $ARHPATH/Arh-$DATE.tar.gz -C $EXTPATH

