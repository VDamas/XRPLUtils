import sys
import json

from tabulate import tabulate
from operator import itemgetter

jsondata=sys.argv[1]
data=json.loads(jsondata)

amendments = []
for channel in data.values():
    #print channel   # prints the entire channel
    #print channel['features'].keys()
    for key in channel['features'].keys():
         hash = key
         name = channel['features'][key]['name']
         enabled = channel['features'][key]['enabled']
         supported = channel['features'][key]['supported']
         vetoed = channel['features'][key].get('vetoed','')
         count = channel['features'][key].get('count','')
         threshold = channel['features'][key].get('threshold','')
         validations = channel['features'][key].get('validations','')
         vote = channel['features'][key].get('vote','')

         amendments.append([hash,name,enabled,supported,vetoed,count,threshold,validations,vote])

print(tabulate(sorted(amendments, key=itemgetter(5)), headers=['hash', 'name', 'enabled', 'supported', 'vetoed', 'count', 'threshold', 'validations', 'vote']))






