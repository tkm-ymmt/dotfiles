import random, sys

def make_id():
    a = [chr(i) for i in range(ord('A'), ord('Z')+1)]
    b = [chr(i) for i in range(ord('a'), ord('z')+1)]
    c = list(str(random.random())[2:])

    a = a + b + c
    random.shuffle(a)
    st = ''
    l = int(18)

    for i in range(l):
        st += a[i]

    return st

f = open('/Users/takumi/Desktop/1000id', 'w')
for x in range(1000):
    print(make_id(), file=f)

f.close()

