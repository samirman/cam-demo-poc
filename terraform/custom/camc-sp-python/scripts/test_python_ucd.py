import json
import requests
import sys
from requests.auth import HTTPBasicAuth

URL = sys.argv[1]
resource_name = sys.argv[2]
user = sys.argv[3]
password = sys.argv[4]

path = URL + '/cli/resource/create'

PARAMS = { 'name':resource_name, 'description':'test resource from python script', 'impersonationForce':'true', 'impersonationUser':'root' }

# disable warning
requests.packages.urllib3.disable_warnings()
http_basic = HTTPBasicAuth(user, password)
r = requests.put(url=path, data=json.dumps(PARAMS), verify=False, auth=http_basic)

data = r.json()
resource_id = data['id']

returnObj = {}
returnObj['resource_id'] = resource_id
returnObj['resource_name'] = resource_name
returnObj['all']=json.dumps(data) 

print(json.dumps(returnObj))