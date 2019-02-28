#####################################################################
##
##      Created 2/27/19 by ch83287.
##
#####################################################################
import json
import requests
import sys

# URL = "https://api.sit.cloud.citigroup.net/citistorage/sit/gpfsnfs/v4/datacenter"
# URL = "https://10.40.163.11:24000/citistorage/sit/gpfsnfs/v4/datacenter"
#URL = sys.argv[1]
# print (URL)
#PARAMS = { 'client_id':'a2baec70-034e-44ad-b7fd-4271cd671eac' , 'client_secret':'F5nD6yH6jB5fI4sU2sX5kM7qW5jL6vK2mY8sU7oD8bU8fR3iI7' }

# disable warning
# InsecureRequestWarning: Unverified HTTPS request is being made.
# requests.packages.urllib3.disable_warnings()

#r = requests.get(url = URL, params = PARAMS, verify = False)

#data = r.json()

# convert the string embedded json to object
#outputObj = json.loads(data['output'])

# create a list from the DCList string
#dcList = outputObj['DCList'].split(',')

# return proper json
# { "dcList": [ "foo", "bar", "baz" ] }
returnObj = { 'dcList' : 'dc1,dc2,dc3' }
print(json.dumps(returnObj))