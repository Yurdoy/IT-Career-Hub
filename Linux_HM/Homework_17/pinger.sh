#!/bin/bash

address=google.com
count=0

while :
do
    if ping -c 1 $address;
	then
        count=0
        time=$(ping -c 1 $address)
        
        if (( $(echo $time > 100 | bc -l) ));
	then
            echo "Ping time to $address is over 100ms: $time ms"
        fi
    else
        ((count++))
        if [ $count -eq 3 ];
	then
            echo "Failed to ping $address for 3 attempts."
            exit 1
        fi
    fi

    sleep 1
done
