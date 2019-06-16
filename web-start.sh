#!/bin/env bash
#bash web-start.sh ./dist

pm2 start http-server -- -c-1 -a localhost -p 8080 ${1}