#!/usr/bin/env python

import os, json, sys, subprocess

cmd = "identify -verbose %s" % sys.argv[1]
pngJson = json.dumps(subprocess.call(cmd.strip().split(" ")))

print(pngJson)
