#!/bin/bash

echo "BRAT_USERNAME: $BRAT_USERNAME"
echo "BRAT_PASSWORD: $BRAT_PASSWORD"
echo "BRAT_EMAIL: $BRAT_EMAIL"

cd /var/www/brat && /var/www/brat/install.sh <<EOD 
$BRAT_USERNAME 
$BRAT_PASSWORD 
$BRAT_EMAIL
EOD

echo "patch the user config with more users"

chown -R www-data:www-data /bratdata

# patch the user config with more users
python2 /var/www/brat/user_patch.py

echo "Install complete. You can log in as: $BRAT_USERNAME"

exit 0
