#!/usr/bin/env bash

# скрипт проверяет доступность по списку репозиториев, добавляет все новые файлы и отправляет изменения в master из текущей ветки

# usage:
# ./remote_git_init.sh # once
# ./push.sh message

result=""
errcode=0
message='content'
[[ -z $1 ]] || message=$1


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


git add -A ./
git commit -am ${message}

push gl develop || exit ${errcode}
push gh develop

#сначала в облако, на сервере потом будем из него качать по хуку
#git push pc-1 master
##теперь запускаем хук
##git push --prune svv master
#git status

echo -e "++++++++++++++++++++++++++++++++++++++++"
echo -e "\n\n${result}\n\n"
echo -e "++++++++++++++++++++++++++++++++++++++++"

echo "проверить на одинаковость два index.html и два 404.html для gh+gl"
echo "npm run prod"
echo "сделать ПР https://gitlab.com/stepanovv/kbo/merge_requests и проверить сборку https://gitlab.com/stepanovv/kbo/pipelines"

