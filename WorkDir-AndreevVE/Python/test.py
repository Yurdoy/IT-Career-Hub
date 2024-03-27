#!/bin/python3
import sort

array = []
fh = open('test_file.txt', 'r+', encoding='utf-8')
array = fh.read()
arg = [int(x) for x in array.split()]

print("Resul sort shake ", sort.shake(arg))
print("Resul sort buble ", sort.bubble(arg))