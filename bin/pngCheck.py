#!/usr/bin/env python

import sys, subprocess, re

cmd = "identify -verbose %s" % sys.argv[1]
proc = subprocess.Popen(cmd.strip().split(' '), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
try:
    outs = proc.stdout.read()
    errs = proc.stdout.read()
except TimeoutExpired:
    proc.kill()
    outs, errs = proc.communicate()

lines = outs.decode().split('\n')

distincter = []
outs = ''
name = ''
for l in lines:
    if 'Image: ' in l:
        name = l.split(': ')[1]
    if 'alpha' in l:
        distincter.append( re.match(r"\d+", l.split(': ')[1]).group() )
    if 'png:IHDR.color_type' in l:
        distincter.append( re.match(r"\d+", l.split(': ')[1]).group() )

if distincter == ['8', '3']:
    outs = '%s: PNG8, alphaChannel' % name
elif distincter == ['1', '3']:
    outs = '%s: PNG8, index' % name
elif distincter == ['3']:
    outs = '%s: PNG8, NoAlpha' % name
elif distincter == ['2']:
    outs = '%s: PNG24, TrueColor' % name
elif distincter == ['1', '6']:
    outs = '%s: PNG32, NoAlpha' % name
elif distincter == ['8', '6']:
    outs = '%s: PNG32, Alpha' % name

print(outs)

#def distinct (list) ->
#    output = ''
#    if len(list) < 2:
#        if re.match(/3/, len[0]):
#            output = 'png8, no-interrace'
#        else:
#            output = 'png8, interrace'
#    else:
#        if re.match(/1/, len[0]):
#            if re.match(/3/, )
#            output = 'png8, interrace'
#        else:
#            output = ''

# ToDo: 標準出力をdictに変換する
# outs = [[l.strip(), len(l) - len(l.strip()), i, 'p' if l[-1:] == ':' else ''] for i, l in enumerate(lines)]
# 
# info = {}
# 
# 
# for o in outs:
#     spliter = ': ' if o[-1:] == '' else ':'
#     s = o[0].split(spliter)
#     k = s[0]
#     v = s[1].strip() if len(s) > 1 else ''
#     info[k] = v
# 
# print(info['Image'])


