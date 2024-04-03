#!/bin/bash
ping -c1 8.8.8.8 > /dev/null
if [ $? -eq 0 ]
  then 
    echo ok 
    exit 0
  else
    echo “fail”
fi
