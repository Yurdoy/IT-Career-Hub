#!/bin/bash

cd /opt/151223-wde/Yuriy/Dir1

for ((i=1; i<=100; i++));
	do
		filename=$RANDOM
		touch "${i}.txt"
	done

current_dir="/opt/151223-wde/Yuriy/Dir1"
even_dir="/opt/151223-wde/Yuriy/Dir2"
odd_dir="/opt/151223-wde/Yuriy/Dir1"

for file in "$current_dir"/*;
	do
   		 filename=$(basename "$file")
    	if [[ $filename =~ [0-9]+ && $(( ${filename//[!0-9]/} % 2 )) -eq 0 ]];
	then
        	mv "$file" "$even_dir"
	else
        	echo "$file оставлен в текущей директории."
    	fi
done
