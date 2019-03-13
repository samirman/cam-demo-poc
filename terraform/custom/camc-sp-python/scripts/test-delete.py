#####################################################################
##
##      Created 3/13/19 by ucdpadmin. For Cloud cmh-aws
##
#####################################################################
import json
import requests
import sys
from requests.auth import HTTPBasicAuth

#URL = 'http://icdemo3.cloudy-demos.com:9080'
#resource_id = '16978790-0030-2267-4468-f74f1befb474'
#user = 'admin'
#password = 'ec11ipse'

URL = sys.argv[1]
resource_id = sys.argv[2]
user = sys.argv[3]
password = sys.argv[4]

path = URL + '/cli/resource/deleteResource'
fullpath = path + "?resource=" + resource_id

# disable warning
requests.packages.urllib3.disable_warnings()
http_basic = HTTPBasicAuth(user, password)
r = requests.delete(url=fullpath, verify=False, auth=http_basic)
