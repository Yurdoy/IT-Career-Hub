#!/bin/bash
for filename in *$1*      # Проход по списку файлов в текущем каталоге.
do
   if [ -f "$filename" ]
   then
     fname=`basename $filename`            # Удалить путь к файлу из имени.
     dname=`dirname $filename`	
     n=`echo $fname | sed -e "s/$1/$2/"`   # Поменять старое имя на новое.
#     mv $fname $n                          # Переименовать.
     echo $dname "File "$fname "----" $n	
     let "number += 1"
   fi
done
