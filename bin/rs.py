#!/usr/bin/env python
#encode='UTF-8'

import sys, random

a = [chr(i) for i in range(ord('A'), ord('Z')+1)]
b = [chr(i) for i in range(ord('a'), ord('z')+1)]
c = list(str(random.random())[2:])

a = a + b + c
random.shuffle(a)
st = ''
l = int(sys.argv[1])

for i in range(l):
    st += a[i]

print(st)


