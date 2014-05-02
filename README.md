docker-akara
============

A Dockerfile for building an Akara server for the DPLA ingestion process

Change akara.ini to match your environment.

With the couchdb set 127.0.0.1:5984 you can link the tutum/couchdb (or mredar/tutum-docker-couchdb) containers from this one and access the couch.
