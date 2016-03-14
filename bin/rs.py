#!/usr/bin/env python
#encode='UTF-8'

import sys, random

def make_id():
    a = [chr(i) for i in range(ord('A'), ord('Z')+1)]
    b = [chr(i) for i in range(ord('a'), ord('z')+1)]
    c = list(str(random.random())[2:])

    a = a + b + c
    random.shuffle(a)
    st = ''
    l = int(sys.argv[1])

    for i in range(l):
        st += a[i]

    return st


if __name__ == __main__():
    print(make_id())

