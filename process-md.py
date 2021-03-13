import re
import sys

with open(sys.argv[1], 'r') as file:
    f = file.read()

f = re.sub('---', '', f)
f = re.sub('title: "([A-Za-z ]+)"', '# \g<1>', f)
f = re.sub('author: ["A-Za-z ]+', '', f)
f = re.sub('categories: [\[\]"A-Za-z ]+', '', f)
f = re.sub('tags: [\[\]"a-zA-Z ,]+', '', f)
f = re.sub('<!--more-->', '', f)

with open(sys.argv[1], 'w') as file:
    file.write(f)
