#!/bin/bash
date
echo «Hello $USER !»
current_directory=$(pwd)
echo "Скрипт работает в директории: $current_directory"
process_count=$(ps -ef | wc -l)
process_count=$((process_count - 1))
echo "Количество процессов: $process_count"
ls -l /etc/passwd | awk '{print $1}'

