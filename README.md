docker-akara
============

A Dockerfile for building an Akara server for the DPLA ingestion process

Change akara.ini to match your environment.

With the couchdb set 127.0.0.1:5984 you can link the tutum/couchdb (or mredar/tutum-docker-couchdb) containers from this one and access the couch.

To set your environment on the first run, cp env.list.tmpl to env.list and fill in the appropriate values. Then run:

docker run -d -p 8889:8889 --env-file env.list docker-akara
