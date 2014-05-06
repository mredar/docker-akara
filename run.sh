#!/bin/bash

if [ ! -f /code/dpla/ingestion/akara.conf ]; then
    # setup akara conf
    cd /code/dpla/ingestion
    function subst() { eval echo -E "$2"; }
    mapfile -c 1 -C subst < akara.ini.tmpl > akara.ini
    python setup.py install
    akara -f akara.conf setup
fi

akara -f akara.conf start -X