#!/bin/python3

import time

def shake(args):
    start = time.time()
    result = args[:]
    for i in range((len(result))-1):
        for j in range((len(result))-i-1,):
            if result[j] > result[j+1]:
                result[j], result[j+1] = result[j+1], result[j]
        for k in range((len(result))-i-1,0,-1):
            if result[k] < result[k-1]:
                result[k], result[k-1] = result[k-1], result[k]
    end = time.time() - start
    print("time shake = ",end)
    return result

def bubble(args):
    start = time.time()
    for i in range((len(args))-1):
        for j in range((len(args))-i-1):
            if args[j] > args[j+1]:
                args[j], args[j+1] = args[j+1], args[j]
    end = time.time() - start
    print("time buble = ",end)
    return args









