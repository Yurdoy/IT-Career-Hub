#!/bin/bash
set -e
  mkdir -p /home/MyDir
        for run in {1..10}
          do
            date '+%T' > /home/MyDir/$i.txt
            sleep 0.5
          done
 
 tar -cvzf /tmp/mydir.tar.gz /home/MyDir/*
 sleep 5
 tar -tf /tmp/mydir.tar.gz > /root/mydir-tar.txt
 
