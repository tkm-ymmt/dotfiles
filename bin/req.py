#!/usr/bin/env python
#encode='UTF-8'
# this needs requests
# https://github.com/kennethreitz/requests
# python version 3.4.3
 
 
import requests, sys
 
r = requests.get(sys.argv[1])
 
print(r)
