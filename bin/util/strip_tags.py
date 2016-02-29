from bs4 import BeautifulSoup
import sys, re
 
def stripAllTags( html ):
        if html is None:
                return None
        return ''.join( BeautifulSoup( html ).findAll( text = True ) ) 

striped = []
shaped = []
with open(sys.argv[1]) as f:
    for line in f:
        if re.search(r'\n', line):
            line = re.sub(r'\n', '', line)
            striped.append(stripAllTags(line))

for st in striped:
    if st.startswith('Q'):
        shaped.append('<p class="modSmallHeadline">{}</p>'.format(st))
    elif st.startswith('A'):
        shaped.append('<p>{}</p>'.format(st))
    else:
        shaped.append('<li>{}</li>'.format(st))


for s in shaped:
    print(s)
