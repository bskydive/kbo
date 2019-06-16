#!/bin/sh
#
#Обновляет копию в облаке, на сервере разработки и на развёрнутом проекте в одну команду на машине разработчика
#
#               /-->репозиторий в облаке
#машина разработчика-->резервное зеркало на сервере разработки
#                                                       \-->развёрнутый проект на сервере разработки
#
#Настройка:
#
#Сделать зеркало на сервере разработки
# cd /path/repo/;git clone --mirror cloudurl/name.git
#Добавить ссылку на зеркало в развёрнутый проект 
# cd /path/site/name/;git remote add devsrv /path/repo/name.git
#Добавить вызов скрипта в хук
# cat > /path/repo/name.git/hook/post-hook
#       #!/bin/sh
#       sh post-update-script devsrv /path/site/name/ master
# chmod a+x /path/repo/name.git/hook/post-hook
#
#на машине разработчика: 
# git remote add devsrv ssh://user@srv:port/path/repo/name.git
# git push devsrv
#
logfile="/opt/repo/gitrepo.log"
localRemote=${1}
localDir=${2}
localBranch=${3}
remoteRemote="origin"

run_cmd () {
        #decorator function for awesome logging
        command_text=${1}
        echo "----COMMAND:${command_text}"
        eval ${command_text}
        errcode=$?
        [ $errcode -ne 0 ] && echo "++++++++++++++++++++++++++++++++++++++ERROR_CODE: ${errcode} "
        [ $errcode -eq 0 ] && echo -e "----OK"
        return ${errcode}
}

run () {
        echo -e "============================================update_hook_start========================================"
        curdate=`date +%c`
        newhash=`git log --pretty=format:"%H" | head -n1`
        remoteRemotedesc=`git remote show ${remoteRemote}`

        echo -e "curdate\nrefname=${1}\nnewhash=$newhash"
        echo -e "============================================pushing to remote"
        echo -e "remoteRemote=${remoteRemote}"
        echo -e "remoteRemotedesc=${remoteRemotedesc}"
        echo -e "localDir=`pwd`"

        #run_cmd "git push --mirror ${remoteRemote}" || exit
        run_cmd "git fetch ${remoteRemote}" || exit

        echo -e "============================================pull from local"

        run_cmd "unset $(git rev-parse --local-env-vars)" || exit
        run_cmd "cd ${localDir}" || exit

        localRemotedesc=`git remote show ${localRemote}`

        echo -e "localRemote=${localRemote}"
        echo -e "localRemotedesc=${localRemotedesc}"
        echo -e "localDir=`pwd`"
        echo -e "localBranch=${localBranch}"

        run_cmd "git pull --prune ${localRemote} ${localBranch}" || exit

        echo -e "============================================update_hook_END========================================"
}

run | tee -a $logfile
