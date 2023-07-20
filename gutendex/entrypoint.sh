#!/bin/sh

echo ------------------
echo Waiting for postgresql connection...
echo ------------------
python3 /usr/src/gutendex/db_healthchecker.py

echo Starting gutendex
echo ------------------

echo migrating database
echo ------------------
python3 /usr/src/gutendex/manage.py migrate
echo ------------------
if [ -d "/usr/src/gutendex/catalog_files/tmp" ]; then
	echo "updating catalog ..."
	python3 /usr/src/gutendex/manage.py updatecatalog
else
	echo "Skipping catalog update ..."
fi

echo ------------------
echo running server
echo ------------------
python3  /usr/src/gutendex/manage.py runserver $GUTENDEX_HOSTNAME:$GUTENDEX_PORT