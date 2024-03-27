#!/bin/bash
# Script to demonstrate how the "tail" command works
for ((i = 0; i<=10; i++))
# Цикл от 1 до 10
do
date >> File.txt
echo >> File.txt
# Записали в фай дату
sleep 2
# Подождали 
done

