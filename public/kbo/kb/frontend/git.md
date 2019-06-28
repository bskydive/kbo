# GIT

## документация

 * https://github.com/k88hudson/git-flight-rules
 * https://services.github.com/on-demand/downloads/github-git-cheat-sheet/
 * https://medium.com/@ABatickaya/%D1%88%D0%BF%D0%B0%D1%80%D0%B3%D0%B0%D0%BB%D0%BA%D0%B0-%D0%BF%D0%BE-git-55eeea487676#.38x1yx7en
 * http://www.alexkras.com/19-git-tips-for-everyday-use/
 * [~/.gitconfig](http://cheat.errtheblog.com/s/git)
 * http://habrahabr.ru/post/125799/
 * https://sites.google.com/site/alextestprojects/obzor-instrumentov/git/primer-modeli-vetvlenia-git
 * http://habrahabr.ru/post/174467/#typicalscenario
 * https://www.gerritcodereview.com/
 * http://endoflineblog.com/gitflow-considered-harmful
 * http://endoflineblog.com/follow-up-to-gitflow-considered-harmful
 * [fuzzy search history](https://github.com/junegunn/fzf-bin/releases)
 * [mindmap](https://alexkras.com/git/git.png)
 * https://developer.atlassian.com/blog/2015/12/tips-tools-to-solve-git-conflicts/
 * http://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/
 * https://ericdouglas.github.io/2016/04/01/Git-Useful-Tips/

### тренажёры

 * http://pcottle.github.io/learnGitBranching/
 * http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/ru/index.html
 
## инструменты

 * https://github.com/github/git-sizer/#getting-started
 * [javascript git](https://github.com/isomorphic-git/isomorphic-git)
 * [оценка производительности разработчика gitlean](https://www.youtube.com/watch?v=-yDLzoX4re4)
 * [скрипты git-extras](https://github.com/tj/git-extras)
 
## сеть

 * [git-retry](https://stackoverflow.com/questions/35014012/git-retry-if-http-request-failed)
	
```bash
	#https://github.com/jamiesnape/git-retry
	'-v', '--verbose', default=0,
	#Increase verbosity; can be specified multiple times

	'-c', '--retry-count', default=GitRetry.DEFAULT_RETRY_COUNT (5),
	#Number of times to retry (default=5)

	'-d', '--delay', default=GitRetry.DEFAULT_DELAY_SECS (3.0)
	#Specifies the amount of time (in seconds) to wait between successive retries (default=3 sec.). This can be zero.

	'-D', '--delay-factor', default=2
	#The exponential factor to apply to delays in between successive failures (default=%default). If this is zero, delays will increase linearly. Set this to one to have a constant (non-increasing) delay.
```

## gitlab

 * http://doc.gitlab.com/ce/

### backup

 * http://doc.gitlab.com/ce/raketasks/README.html

    ```bash
    gitlab-rake gitlab:backup:create
    ```
### restore

 * http://doc.gitlab.com/ce/raketasks/backup_restore.html#for-omnibus-installations

```bash
	# Stop processes that are connected to the database
	sudo gitlab-ctl stop unicorn
	sudo gitlab-ctl stop sidekiq

	# This command will overwrite the contents of your GitLab database!
	sudo gitlab-rake gitlab:backup:restore BACKUP=1393513186

	# Start GitLab
	sudo gitlab-ctl start

	# Check GitLab
	sudo gitlab-rake gitlab:check SANITIZE=true
```

 * http://doc.gitlab.com/ce/logs/logs.html

```bash
	# Tail all logs; press Ctrl-C to exit
	sudo gitlab-ctl tail

	# Drill down to a sub-directory of /var/log/gitlab
	sudo gitlab-ctl tail gitlab-rails

	# Drill down to an individual file
	sudo gitlab-ctl tail nginx/gitlab_error.log
```

## справочник команд

### log

 * Комментарии на дату

```bash
	g log  --pretty=format:%s --after="2018-07-27"
	g log  --pretty=format:%s --after="2018-08-17 8:00" --before="2018-08-18 8:00"
	g shortlog -sn --after="2019-01-01 8:00" --before="2019-04-01 8:00"
	git shortlog -scn \-- src/
	# список участников
	git log --pretty="%an %ae%n%cn %ce" | sort | uniq
	mcedit .mailmap
```

 * крайний коммит
	```bash
		git log -1 --format='DEV: %cd #%h' --date=format:'%c' > version.txt
	```
### git push

```bash
	#!/bin/bash

	current_branch=`git rev-parse --abbrev-ref HEAD`
	[[ $result == 'develop' ]] && echo -e "\n\n!!!необходимо перейти ИЗ develop!!!\n\n"
	[[ $result == 'develop' ]] && exit 

	git add src/*
	#npm run build
	git add dist/*
	git cm ${current_branch}-git-add
	hash=`git log -1 --format='%cd #%h' --date=format:'%c'`
	sed "s/titleName/титлеНаме: ${hash}/" ./dist/index.html > ./dist/index.html.sed; mv ./dist/index.html.sed ./dist/index.html
	grep -iE "<title>" ./dist/index.html
	#exit
	git cm git-version

	git push origin ${current_branch}

	git checkout develop && echo "=======================checkout develop"
	git merge --no-ff -m "auto merge ${current_branch} to develop" ${current_branch}
	echo "=======================git merge --no-ff -m \"auto merge from ${current_branch} to develop\" ${current_branch}"
	git push origin develop && echo "=======================push origin develop"
	#git checkout ${current_branch} && echo checkout ${current_branch}

	echo "npm run web"
	echo "make pull request"
	#git co master
	#git me origin develop
	#git push origin master
	#git co develop


```

### автоматический git pull

 * предусмотреть, что любой из удалённых репозиториев может не работать
 * [http post](https://gitlab.com/martinpham/GitLab-sync)
 * http://doc.gitlab.com/ce/raketasks/import.html
 * http://stackoverflow.com/questions/3382679/git-how-do-i-update-my-bare-repo#3382703

Once:

```bash
	git clone --mirror ssh://git@source.address:2000/repo
	git remote add remote_site ssh://git@remote_site.address/repo
	git config remote.origin.fetch 'refs/heads/*:refs/heads/*'
```

Everytime i want to sync
```bash
	cd /home/myhome/repo.git
	git --bare fetch ssh://git@source.address:2000/repo
	git  fetch ssh://git@source.address:2000/repo
	git push --mirror remote_site
	cd /var/opt/gitlab/git-data/repositories/stepanovv/portfolioJS.git
```

```bash
	cat >> config
	[remote "bb"]
			url = https://bitbucket.org/bskydive/portfoliojs.git
			fetch = +refs/heads/*:refs/heads/*
			mirror = true
```

загрузить с удалением веток
```bash
	git fetch bb  --prune
```

```bash
	[root@localhost scripts]# cat gitlab_import.cron
	#!/bin/bash
	logfile="/distr/scripts/gitlab_import.cron.log"
	gitlab_path="/var/opt/gitlab/"

	echo -e "\n\n============================IMPORT START==========================================" | tee -a ${logfile}
	date  | tee -a ${logfile}
	df -h | tee -a ${logfile}
	du -s ${gitlab_path}/* | tee -a ${logfile}
	cd ${gitlab_path} | tee -a ${logfile}
	gitlab-rake gitlab:import:repos | tee -a ${logfile}
	du -s ${gitlab_path}/* | tee -a ${logfile}
	date  | tee -a ${logfile}
	echo -e "============================IMPORT END==========================================\n\n" | tee -a ${logfile}

```

### merge upstream

```bash
1. Настроить исходный удаленный репозиторий
https://help.github.com/articles/configuring-a-remote..

Т.е. добавить как upstream
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY..
 
2. Далее нужно слить изменения с удаленного репозитория, перейти в свою ветку мастер и слить изменения в эту ветку
https://help.github.com/articles/syncing-a-fork/

a. слить изменения с удаленного репозитория
git fetch upstream

b. перейти в локальную ветку master
git checkout master

c. сделать объединение
git merge upstream/master
```

### git config

 * подмодули
	```bash
		git config -l
		git remote show origin
		git pull --recurse-submodules
		git submodule status --recursive
	```
 * самоподписанный сертификат, три способа обхода
	```bash
		git config http.sslVerify false
		git config --global http.sslVerify false
		git -c http.sslVerify=false remote show origin

	```
* запрет удалений
	```bash
		git config --system receive.denyNonFastforwards true
		git config --system receive.denyDeletes true
	```

### edit commit message

```bash
	git log --oneline |less
	git cat-file -p b54648f
	git commit --amend -p b54648f
	git log --oneline |less
```

### разрешение конфиликтов

 * перезаписать длинный файл, отличия в котором не видны в git
	```bash
		git checkout develop
		rm -rf dist/*
		git checkout 000-feature-x dist/
	```
 * спрятать изменения
	```bash
		git stash 
		git stash list
		git stash apply stash@{0}
		git stash drop stash@{0}
		git stash list
	```


## workflow

 * http://nvie.com/posts/a-successful-git-branching-model/
 * http://endoflineblog.com/gitflow-considered-harmful
 * http://endoflineblog.com/follow-up-to-gitflow-considered-harmful
 * https://habrahabr.ru/post/106912/ - это модель для гиков или документации, или огромной ко, или для предметной области, где от выпускаемого ПО зависит жизнь человека, или высоконагруженный проект
 * [GitHub flow](https://guides.github.com/introduction/flow/)
 * [у 2gis есть видео о внедрении ](https://www.youtube.com/watch?v=EwdXZXfQdQY)
 * [git flow](http://danielkummer.github.io/git-flow-cheatsheet/index.ru_RU.html)
 * [git flow ](http://internetdevels.ru/blog/git-flow-model)

все зависит от того как вы выкатываете релизы, есть ли тесты (CI/CD), что за методолгию юзаете
Git flow подразумевает что на каждом спринте вы создаете (обновляете текущую) ветку developer из которой потом каждый программер выделяет ветку feature и в ней решает конкретный issue, после того как он все сделал он (можно через pull request) слвиает feature в develop, после определенного момента (по срокам) разработка фич останавливаеться из ветки develop создается ветка release которая тестируется. Далее все сливается в maste и так покругу.

удобнее когда есть четкая дата релиза + фаза стабилизации. Наличие тестов желательно но не обязательно т.к. есть тестирование перед деплоем и время закрыть все косяки руками.

GitHub flow ставит своей целью короткий релизный цикл (время от производства feature до deploy на продакшен может быть очень коротким), так сказать что бы пользователь как можно раньше получил свои новые фичи. Здесь очень важно наличие хороших тестов + CI. ну и высокая ответственность программиста.

Обычно из master выделяется ветка feature по конкретном issue прогер берет делает ее, далее делает pull request на добавление feature в master, она прохоидт автотесты + делается код ревью, заливаеться в master и автоматически деплоится на прод.

Еще важно то как разбиваются задачи.


 * [SDCast #18: в гостях Михаил Лопаткин ](https://sdcast.ksdaemon.ru/2015/02/sdcast-18/)

Кто отвечает за сливание upstream'а сhromium'a? Как организован сам процесс?
Мы подсмотрели у гугла. У хромиума по всем исходникам разложены файлы owners, в них записаны кто из разработчиков отвечает за конкретную папку или подсистему. Тот кто знает как эта часть работает. Т.е. во-первых знаем кого звать на ревью кода, а во вторых на кого повесить операцию разруливания конфликтов, если такое случилось при мерже. т.е. owner кусочка кода разрешает конфликты при мерже.



## git server

### ssh bash

 * https://help.github.com/articles/duplicating-a-repository/
 * http://blog.plataformatec.com.br/2013/05/how-to-properly-mirror-a-git-repository/
 * http://web.archive.org/web/20130326122719/http://jefferai.org/2013/03/24/screw-the-mirrors/
 * https://geekforum.wordpress.com/2015/02/25/move-git-repository-to-new-server/
 * https://stackoverflow.com/questions/5769568/how-to-set-up-a-git-hook-so-that-after-pushing-to-ssh-peterfoo-com-bar-com#5769715
 * настройка репы
 
```
	ssh://USER_NAME@IP_ADDR:PORT_NUM/path_to_repo/repo_name.git
```

 * post-update-script

```bash
	#!/bin/sh
	
	#Обновляет копию в облаке, на сервере разработки и на развёрнутом проекте в одну команду на машине разработчика
	#
	#							/-->репозиторий в облаке
	#машина разработчика-->резервное зеркало на сервере разработки
	#							\-->развёрнутый проект на сервере разработки
	#
	#Настройка:
	#
	#Сделать зеркало на сервере разработки
	# cd /path/repo/;git clone --mirror cloudurl/name.git
	#Добавить ссылку на зеркало в развёрнутый проект 
	# cd /path/site/name/;git remote add devsrv /path/repo/name.git
	#Добавить вызов скрипта в хук
	# cat > /path/repo/name.git/hook/post-hook
	#	#!/bin/sh
	#	sh post-update-script devsrv /path/site/name/ master
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

		run_cmd "git push --mirror ${remoteRemote}" || exit

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

```

 * http://stackoverflow.com/questions/7861184/what-is-the-difference-between-git-init-and-git-init-bare

```bash
	git clone --bare ./proj ./proj.git
	scp -r ./ptoj.git user@srv:/opt/git/
	cd ./proj
	git push scp://user@srv:port:/opt/git/proj.git
```

### git daemon


https://gist.github.com/esoupy/3823712

```bash
	yum install git-daemon
	chkconfig xinetd off
	cat >> git-daemon.sh
	chmod a+x git-daemon.sh
	ln -s /distr/scripts/git-daemon.sh /etc/init.d/
	groupadd git
	useradd -s /sbin/nologin -g git

	git init --bare /distr/scripts/repo
	cd repo
	touch ./.git/git-daemon-export-ok
	git config daemon.receivepack true
	git config --global user.name "stepanovv"
	git config --global user.email stepanovv.ru@yandex.ru

	cat >> file
	git add file
	git commit -m initial

	#check:
	cd /opt
	git clone git://127.0.0.1/repo
	tail /var/log/messages

	#git-daemon port 9418
```


## bitbucket

### переезд на битбакет

```bash
	git remote add origin-bb https://bskydive@bitbucket.org/bskydive/portfoliojs.git
	git remote add origin-gh https://https://github.com/bskydive/portfolioJS
	git remote
	git remote rm origin

	git remote show origin-bb
	git remote show origin-gh

	git push -u origin-bb --all
	git push -u origin-bb --tags
```


## merge tool

 * https://youtu.be/_9bxJs6-5hs?t=858
 * kdiff3
 * meld
 * diffuse
 * https://www.kernel.org/pub/software/scm/git/docs/howto/revert-a-faulty-merge.txt



## github

 * https://help.github.com/articles/duplicating-a-repository/
 * .git директория над проектом!

```bash
	create project on git
	git clone xo https://bskydive@github.com/bskydive/xo_project.git
	cd xo_project
	git config core.autocrlf false
	git config core.autocrlf 
	git config user.name "bskydive"
	git config user.email "stepanovv.ru@yandex.ru"
	git add -A xo_project/
	git remote add xo https://bskydive@github.com/bskydive/xo_project.git
	git commit -m first
	git push xo master
	git status

	git config core.askPass ""


	# git init idea
	Initialized empty Git repository in .../idea/.git/
	# cd idea
	# git config core.autocrlf false
	# git config core.autocrlf 
	false
	# git add -A xo_project/
	# git status
	# git commit -m intial
	# git remote add xo https://bskydive@github.com/bskydive/xo_project.git
	# git pull xo master # взять тексты из гитхаба #!!! осторожно!!!
	# git push xo master

```

