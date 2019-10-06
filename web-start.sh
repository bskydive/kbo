#!/bin/bash
#bash web-start.sh ./public/portfolio

pm2 start http-server -- -c-1 -a localhost -p 8080 ${1} && echo -e '\n====================================\nhttp://localhost:8080/portfolio/portfolio.html\n====================================\n'
