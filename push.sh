#!/bin/bash
git add -A ./
git commit -am 'content'
#сначала в облако, на сервере потом будем из него качать по хуку
git push --prune origin master
#теперь запускаем хук
#git push --prune svv master
git status

