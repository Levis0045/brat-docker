import json
import re

with open('/var/www/brat/config.py', 'r') as fh:
	config = fh.read()

usr_json = json.load(open('/var/www/brat/cfg/bratcfg/users.json', 'r'))

usr_str = '%s,' % ',\n'.join(["'{}': '{}'".format(u, p) for u, p in usr_json.items()])

new_config = re.sub('USER_PASSWORD = \{([^}]+)\}', 'USER_PASSWORD = {\g<1>%s\n}' % usr_str, config)

with open ('/var/www/brat/config.py', 'w') as fh:
	fh.write(new_config)
