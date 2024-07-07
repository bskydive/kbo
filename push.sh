#!/usr/bin/env bash

git add -A ./*
git commit -am "${1} add files"

git push gl develop || exit $?
git push gh develop

#git push bb develop
echo "проверить на одинаковость два index.html и два 404.html для gh+gl"
echo "npm run prod"
echo "сделать ПР https://gitlab.com/stepanovv/kbo/merge_requests и проверить сборку https://gitlab.com/stepanovv/kbo/pipelines"
#сначала в облако, на сервере потом будем из него качать по хуку
#git push --prune origin develop
#теперь запускаем хук
#git push --prune svv develop
git status

#!/bin/bash

# скрипт проверяет доступность по списку репозиториев, добавляет все новые файлы и отправляет изменения в master из текущей ветки

# usage:
# ./remote_git_init.sh # once
# ./push.sh message

result=""
errcode=0

git add -A ./
git commit -am 'content'

push() {

	remote=${1}
	echo "++++++++++PUSH:${remote}:test"

	git remote show ${remote} && {

		echo "++++++++++PUSH:${remote}:start"
		git push ${remote} master

		errcode=$?
		[[ ${errcode} -ne 0 ]] && result="${result}\n ++++++++++PUSH:${remote}:ERROR:${errcode}"
		[[ ${errcode} -eq 0 ]] && result="${result}\n ++++++++++PUSH:${remote}:OK"

		echo "++++++++++PUSH:${remote}:end"
		return ${errcode}
	} || result="${result}\n ++++++++++PUSH:${remote}:FAILED REMOTE TEST:$?"
}

push "gl" || exit ${errcode}
push "gh"
#push "local"
#push "usb"

#сначала в облако, на сервере потом будем из него качать по хуку
#git push pc-1 master
##теперь запускаем хук
##git push --prune svv master
#git status

echo -e "++++++++++++++++++++++++++++++++++++++++"
echo -e "\n\n${result}\n\n"
echo -e "++++++++++++++++++++++++++++++++++++++++"

#============================== EXIT
exit
#git-flow
comment="${1}"
dev="develop"
origin="gl"

feature=`git branch | grep '*' | awk -F'* ' '{print $2}'`

git add -A ./public/* ./src/*
git commit -am "${feature}: ${comment}"

git checkout "${dev}"
git merge --no-ff -m "${feature}: merge ${feature} to ${dev}" ${feature}

git checkout "master"
git merge --no-ff -m "${feature}: merge ${dev} to master" ${dev}

git checkout "${feature}"
git push ${origin} --all
