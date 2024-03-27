#!/bin/python3
from random import randint

N = 20000
#fh = open('./test_file.txt', 'w', encoding='utf-8')
fh = open('./test_file.txt', 'w')
arrya = []
for i in range(N):
    arrya.append(randint(0, 1000))
    fh.write(str(arrya[i]))
    fh.write(" ")

#fh.write(str(arrya))
fh.close()
