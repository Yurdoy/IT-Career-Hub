#!/bin/bash
 
print_date() { date +'%H:%M:%S'
}
 
for ((i=1; i<=10; i++)); do
 
    echo "$(print_date) $(ps -ef | wc -l)"
 
    #sleep 5
done
 
cat /proc/cpuinfo > /home/hm14.txt
cat /etc/os-release | grep 'NAME="Alpine Linux"' >> /home/hm14.txt
cat /etc/os-release | grep 'NAME="Alpine Linux"' | sed s/NAME=//g >> /home/hm14.txt
 
cd /home
 
for ((i=50; i<=100; i++)); do
 
    touch "${i}.txt"
 
done