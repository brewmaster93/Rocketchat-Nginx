#!/bin/bash

nohup nginx -g "daemon off;" > /var/log/nginx/start.log 2>&1 &

cd Rocket.Chat/

node main.js


