#!/bin/bash

cd /code/dpla/ingestion

if [ ! -f /code/dpla/ingestion/akara.conf ]; then
    # setup akara conf
    function subst() { eval echo -E "$2"; }
    mapfile -c 1 -C subst < akara.ini.tmpl > akara.ini
    python setup.py install
    akara -f akara.conf setup
fi

#start -f for ignoring pid, -X for debug output, useful from docker logs
akara -f akara.conf start -X -f
