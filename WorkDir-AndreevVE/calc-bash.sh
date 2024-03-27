#!/bin/bash
read -p " " ARG1
read -p " " ARG2
read -p " " ARG3
if [ $ARG2 = "+" ]
    then 
      result=$(($ARG1 + $ARG3))
    elif [ $ARG2 = "-" ] 
         then 
           result=$(($ARG1 - $ARG3)) 
         elif [ $ARG2 = "/" ] 
              then 
                result=$(($ARG1 / $ARG3))
              else
                result=$(($ARG1 * $ARG3)) 
fi


echo "sdfsd" $result
      