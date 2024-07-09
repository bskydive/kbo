#!/bin/bash

# удаляем стандартный origin, чтобы использовать скрипты pull.sh+push.sh для несокльких реп

repo_name=kbo

cat .git/config | grep -i url

git remote add gl git@gitlab.com:stepanovv/${repo_name}.git && git remote remove origin
git branch --set-upstream-to=gl/master master
git branch --set-upstream-to=gl/develop develop
git remote add gh git@github.com:bskydive/${repo_name}.git

