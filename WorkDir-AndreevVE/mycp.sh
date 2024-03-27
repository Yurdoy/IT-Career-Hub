#!/bin/bash
     if [[ -z "$2" ]]
     then 
     echo "Bed path"
     else
     fname=`basename $1`            
     dname=`dirname $2`	
     mkdir -p $dname 	
     echo "Path to" $dname "File name " $fname	
     cp $1 $2
     fi
