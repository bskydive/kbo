#!/usr/bin/env bash

git add -A ./*
git commit -am "${1} add files"
git push gl develop
git push gh develop
git push bb develop
echo "проверить на одинаковость два index.html для bb+gl"
echo "сделать ПР https://gitlab.com/stepanovv/kbo/merge_requests и проверить сборку https://gitlab.com/stepanovv/kbo/pipelines"
#сначала в облако, на сервере потом будем из него качать по хуку
#git push --prune origin develop
#теперь запускаем хук
#git push --prune svv develop
git status


#============================== EXIT
exit
#git-flow
comment="${1}"
dev="develop"
origin="origin-bb"

feature=`git branch | grep '*' | awk -F'* ' '{print $2}'`

git add -A ./public/* ./src/*
git commit -am "${feature}: ${comment}"

git checkout "${dev}"
git merge --no-ff -m "${feature}: merge ${feature} to ${dev}" ${feature}

git checkout "master"
git merge --no-ff -m "${feature}: merge ${dev} to master" ${dev}

git checkout "${feature}"
git push ${origin} --all