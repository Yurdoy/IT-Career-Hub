#!/bin/bash
read -p "2 x 2 " FORM
echo $FORM | 
awk '  
    {
  if ($2 == "+")  result += $1 + $3;
     else
      if ($2 == "-") result += $1 - $3;
       else 
        if ($2 == "/") result += $1/$3;
         else 
           result += $1*$3;
    } 
    END { 
     print ($1, $2, $3, "=", result);
    }'

