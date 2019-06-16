#!/bin/env bash
#bash web-staop.sh

pm2 stop http-server
pm2 delete http-server
