#!/bin/bash

check_ping() {
    address=$1
    timeout=3
    count=0

    while true;
    do
        response=$(ping -c 1 -W 1 "$address" | grep "time=" | cut -d '=' -f 4 | cut -d ' ' -f 1)

        if [ $count -eq $timeout ]; then
            echo "Unable to ping $timeout times"
            break
        elif (( $(echo "$response > 100 % 2") )); then
            echo "Ping time more than 100 ms: $response ms."
        fi

        count=$((count + 1))
        sleep 1
    done
}

read -p "Enter ping address: " address

check_ping "$address"


