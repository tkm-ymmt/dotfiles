import shutil, sys, os, re


files = os.listdir(sys.argv[1])

dirs = [
    'bakery',
    'coverlet-dryer',
    'electronic-kettle',
    'electronic-pot',
    'grill-pan',
    'humidifier',
    'juicer',
    'oven-toaster',
    'stainless-pot',
    'tableware-dryer',
]

filename = 'title_hotplate.png'

for dir in dirs:
    cpd = re.sub(r'_.*\.', '_{}.'.format(dir), filename)
    #print(cpd)
    shutil.copy(filename, './'+cpd)
#    for f in files:
#        if f == '.DS_Store':
#            continue
#        n = str(i)
#        cpd = re.sub(r'\d+', n, f)
#        shutil.copy(f, './' + cpd)
