#####################################################################
##
##      Created 3/13/19 by ucdpadmin. For Cloud cmh-aws
##
#####################################################################
import json
import requests
import sys
from requests.auth import HTTPBasicAuth

URL = sys.argv[1]
resource_id = sys.argv[2]
user = sys.argv[3]
password = sys.argv[4]

# Test var passing
f = open('/tmp/myvars.txt', 'w')
f.write('url is ' + URL)
f.write('\nresource_id is ' + resource_id)
f.write('\nuser is ' + user)
f.write('\npassword is ' + password)
f.write('\n')

path = URL + '/cli/resource/deleteResource'
fullpath = path + "?resource=" + resource_id

f.write('\nfullpath is ' + fullpath)

# disable warning
requests.packages.urllib3.disable_warnings()
http_basic = HTTPBasicAuth(user, password)
r = requests.delete(url=fullpath, verify=False, auth=http_basic)

f.write('\nstatus_code is ' + str(r.status_code))
f.write('\n')
