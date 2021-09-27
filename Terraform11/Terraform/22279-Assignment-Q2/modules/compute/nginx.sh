#! /bin/bash

apt-get install nginx -y
service nginx start
service nginx status
curl http://127.0.0.1/