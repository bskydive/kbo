# GIT

## документация

 * [GIT CHANGELOG](https://github.com/git/git/tree/master/Documentation/RelNotes)
 * https://marklodato.github.io/visual-git-guide/index-en.html
 * https://github.com/k88hudson/git-flight-rules
 * https://services.github.com/on-demand/downloads/github-git-cheat-sheet/
 * https://medium.com/@ABatickaya/%D1%88%D0%BF%D0%B0%D1%80%D0%B3%D0%B0%D0%BB%D0%BA%D0%B0-%D0%BF%D0%BE-git-55eeea487676#.38x1yx7en
 * http://www.alexkras.com/19-git-tips-for-everyday-use/
 * [~/.gitconfig](http://cheat.errtheblog.com/s/git)
 * [Как начать работать с GitHub: быстрый старт - 2011](http://habrahabr.ru/post/125799/)
 * x https://sites.google.com/site/alextestprojects/obzor-instrumentov/git/primer-modeli-vetvlenia-git
 * [Ежедневная работа с Git - 2013](http://habrahabr.ru/post/174467/#typicalscenario)
 * [a Perforce based code review tool](https://www.gerritcodereview.com/)
 * [fuzzy search history](https://github.com/junegunn/fzf-bin/releases)
 * [git mindmap cheatsheet](https://alexkras.com/git/git.png)
 * https://developer.atlassian.com/blog/2015/12/tips-tools-to-solve-git-conflicts/
 * http://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/
 * https://ericdouglas.github.io/2016/04/01/Git-Useful-Tips/


### тренажёры

 * http://pcottle.github.io/learnGitBranching/
 * http://www-cs-students.stanford.edu/~blynn/gitmagic/intl/ru/index.html

## инструменты

 * https://github.com/Everduin94/better-commits
	* `npm install -g better-commits`
 * https://github.com/github/git-sizer/#getting-started
 * [javascript git](https://github.com/isomorphic-git/isomorphic-git)
 * [docker+clojure анализ git, первая версия codeScene](https://github.com/adamtornhill/code-maat)
 * https://github.com/jwiegley/git-scripts
 * [скрипты tools utils git-extras](https://github.com/tj/git-extras)
 * [оценка производительности разработчика gitlean](https://www.youtube.com/watch?v=-yDLzoX4re4)
	* https://github.com/garybernhardt/dotfiles/blob/main/bin/git-churn
	* https://github.com/flacle/truegitcodechurn

	```bash
		set -e
		git log --all -M -C --name-only --format='format:' --since='1 month ago' someDir1 someDir2 | sort | grep -v '^$' | uniq -c | sort -n
	```
 * [git commit calendar](https://github.com/IonicaBizau/git-stats/blob/master/bin/git-stats)

	```bash
		# Local git statistics including GitHub-like contributions calendars.
		# Options:
		# -r, --raw              Outputs a dump of the raw JSON data.
		# -g, --global-activity  Shows global activity calendar in the current
		# 						repository.
		# -d, --data <path>      Sets a custom data store file.
		# -l, --light            Enables the light theme.
		# -n, --disable-ansi     Forces the tool not to use ANSI styles.
		# -A, --author           Filter author related contributions in the current
		# 						repository.
		# -a, --authors          Shows a pie chart with the author related
		# 						contributions in the current repository.
		# -u, --until <date>     Optional end date.
		# -s, --since <date>     Optional start date.
		# --record <data>        Records a new commit. Don't use this unless you are
		# 						a mad scientist. If you are a developer just use
		# 						this option as part of the module.
		# -h, --help             Displays this help.
		# -v, --version          Displays version information.

		# Examples:
		git-stats # Default behavior (stats in the last year)
		git-stats -l # Light mode
		git-stats -s '1 January 2012' # All the commits from 1 January 2012 to now
		git-stats -s '1 January 2012' -u '31 December 2012' # All the commits from 2012
	```

 * [Gitk is a graphical repository browser/client](https://www.atlassian.com/git/tutorials/gitk)
 * строк кода на дату
 * [bash скрипты с консольной графикой](https://github.com/arzzen/git-quick-stats)
 * [генерация(очень медленно) json файла и веб-визуализатор коммитов gitstat](https://github.com/nielskrijger/gitstat)
 * https://codescene.com/
 * https://codeclimate.com/velocity
 * https://waydev.co/
 * https://www.pluralsight.com/product/flow
 * https://linearb.io/
 * [Next-level software developer metrics](https://www.gitclear.com/)

## монорепы

### mercurial

* [Почему Facebook* не использует Git](https://habr.com/ru/articles/798881/)
* mercurial быстрее для миллионов строк, потому что сразу высчитывает diff
* концепция stacked diff вместо простого копирования файлов и вычисления [git-stat](https://pubs.opengroup.org/onlinepubs/009696799/functions/stat.html)
* mercurial написан на python, а git на bash+C

### для git

 * [Внешние зависимости в гите: submodule или subtree? - 2009](https://habr.com/ru/articles/75964/)
 * submodules
	* Каждый человек, работающий с основным репозиторием должен иметь доступ к репозиторию, из которого взят подмодуль.
	* В общем случае невозможно получить целостную рабочую копию одной командой. Теперь после git checkout нужно делать git submodule update --init.
	* git archive игнорирует подмодули — больше нельзя одной командой запаковать весь проект в архив.
	* Из проекта верхнего уровня не видно изменений внутри подмодулей и наоборот. Чтобы узнать полного состояние рабочей копии проекта, необходимо запрашивать его для каждого подмодуля и для родительского проекта по отдельности. Без подмодулей достаточно сказать git status в любом месте внутри рабочей копии.
	* После замены корневой директории подмодуля на что-нибудь другое (например другой подмодуль), нужно вручную удалять старую версию во всех рабочих копиях.
	* Команда git submodule не понимает стандартных опций --git-dir и --work-tree. Её можно запускать только из корня рабочей копии. Это затрудняет автоматизацию.
 * subtree
	* git-subtree - Merge subtrees together and split repository into subtrees
	* Unlike submodules, subtrees do not need any special constructions (like .gitmodule files or gitlinks), and do not force to do anything special or to understand how subtrees work. A subtree is just a subdirectory that can be committed to, branched, and merged along with your project in
	* Unlike the subtree merge strategy you can also extract the entire history of a subdirectory from your project and make it into a standalone project. If the standalone library gets updated, you can automatically merge the changes into your project; if you update the library inside your project, you can "split" the changes back out again and merge them back into the library project.
	* https://github.com/apenwarr/git-subtree/blob/master/git-subtree.txt
	* [Git subtree в деталях - 2018](https://habr.com/ru/articles/429014/)

## аналитика git

 * [Покажи мне свой Git, и я скажу, кто ты](https://habr.com/ru/company/oleg-bunin/blog/691468/)
    * размер и частоту коммитов;
    * даты и количество комментариев при Code Review;
    * частоту пулл-реквестов и процесс релиза.
    * даты создания/закрытия задачи;
    * привязки к веткам/коммитам из SCM.
* [5 метрик продуктивности команды разработки](https://www.pluralsight.com/blog/teams/5-developer-metrics-every-software-manager-should-care-about)
	1. Lead/deliver Time - оборачиваемость
		* время от начала проекта до поставки ценности заказчику
	2. [Code Churn - переписывание](https://www.pluralsight.com/blog/tutorials/code-churn)
		* lines of code (LOC) that were modified, added and deleted over a short period of time such as a few weeks.
		* По данным Pluralsight пределы churn: 10%-отлично, 28-хорошо, больше - плохо
		* прототипирование
			* освободите разработчика от совещаний
			* возможно задача слишком сложна или недостаточно описана
		* перфекционизм разработчика
			* переписывание рабочего кода без добавления функционала и исправления ошибок
			* внедрите соглашения по качеству кода
		* сложности с реализацией
			* внедрение правил разбиения задачи по сложности и времени, предельные вехи
			* внедрение регулярной взаимопомощи
			* убедитесь, что у разработчика достаточно ресурсов, и ему не нужна помощь
		* проблемы с заказчиком, постановкой задач
			* обсудите с заказчиком примеры ущерба от изменения требований
			* следите за изменениями требований в JIRA
		* нечёткое задание
			* внедрите соглашения по качеству и объёму ТЗ на задачи
		* проблемы коммуникаций внутри команды;
			* настройте соглашения по процессу проверки кода
			* соглашения по передаче знаний
		* выгорание
			* смените тип или сложность задач
			* поменяйте проект
			* назначьте отпуск
			* отправьте в командировку или на конференцию
	3. Impact - охват
		* связность кода, отношение объёма функционала к объёму изменённого кода
		* охват областей знаний/доменов разработчиками, командой
	4. Active Days - инженерные задачи
		* написание кода(git)
		* проверка кода(комментарии gitlab/JIRA)
		* контроль баланса с не-инженерными задачами: планирование, совещания
		* ущерб от не-инженерных задач, прерываний на совещания - общая скорость команды, выгорание
	5. Efficiency -
		* долговечность, антипод переписывания
		* на этапе проверки гипотез эффективность низкая, переписываемость высокая
		* эффективность позволяет понять стиль программирования

## аналоги github/gitlab

 * https://trends.rbc.ru/trends/industry/622b8b4f9a7947053add4807
	* русская https://gitflic.ru/
	* китайская https://gitee.com/
	* https://gogs.io/
	* немецкая https://rhodecode.com/
	* canonical https://launchpad.net/
 * gitea

## github

 * [github](../admin/github.md)

## gitlab

 * [gitlab](../admin/gitlab.md)

## gitignore

 * [A collection of .gitignore templates](https://github.com/github/gitignore)
 * https://www.toptal.com/developers/gitignore

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

## справочник команд

 * [giteveryday - A useful minimum set of commands for Everyday Git](https://github.com/git/git/blob/master/Documentation/giteveryday.txt)
 * [малоизвестные команды](https://habr.com/ru/company/mailru/blog/318508/)
 * http://mindspill.net/computing/linux-notes/git-notes/
 * git reset
 	* https://git-scm.com/book/ru/v2/Инструменты-Git-Раскрытие-тайн-reset

	```
		Обратите внимание, изменяется не сам HEAD (что происходит при выполнении команды checkout); reset перемещает ветку, на которую указывает HEAD. Таким образом, если HEAD указывает на ветку master (то есть вы сейчас работаете с веткой master), выполнение команды git reset 9e5e6a4 сделает так, что master будет указывать на 9e5e6a4.
	```

### вывод для скриптов

 * https://stackoverflow.com/questions/48341920/git-branch-command-behaves-like-less
 * https://stackoverflow.com/questions/2183900/how-do-i-prevent-git-diff-from-using-a-pager

```bash
git --no-pager branch -r -l 'origin/*release*'
  origin/release-v1.4.0

git config --global core.pager '/usr/bin/less -R -F -X'
git config --global core.pager ''
```

### clone Клонирование ветки без истории

```bash
# !!! git clone --recurse-submodules

mkdir git-sandbox && cd git-sandbox
git clone https://gitlab.com/stepanovv/webpack-dep-graph.git
# Клонирование в «webpack-dep-graph»…
# remote: Enumerating objects: 1444, done.
# remote: Counting objects: 100% (93/93), done.
# remote: Compressing objects: 100% (50/50), done.
# remote: Total 1444 (delta 54), reused 67 (delta 43), pack-reused 1351 (from 1)
# Получение объектов: 100% (1444/1444), 79.84 МиБ | 11.37 МиБ/с, готово.
# Определение изменений: 100% (735/735), готово.
ll webpack-dep-graph/push.sh
# ls: невозможно получить доступ к 'webpack-dep-graph/push.sh': Нет такого файла или каталога
du -sm webpack-dep-graph/
# 94      webpack-dep-graph/
rm -rf webpack-dep-graph/
g clone --depth 1 --single-branch --branch release-v1.4.0 https://gitlab.com/stepanovv/webpack-dep-graph.git
# Клонирование в «webpack-dep-graph»…
# remote: Enumerating objects: 138, done.
# remote: Counting objects: 100% (138/138), done.
# remote: Compressing objects: 100% (125/125), done.
# remote: Total 138 (delta 11), reused 115 (delta 4), pack-reused 0 (from 0)
# Получение объектов: 100% (138/138), 11.23 МиБ | 8.79 МиБ/с, готово.
# Определение изменений: 100% (11/11), готово.
du -sm webpack-dep-graph/
25      webpack-dep-graph/
ll webpack-dep-graph/push.sh
# -rwxr-xr-x 1 bsk users 242 июл  9 12:17 webpack-dep-graph/push.sh
git status
# На ветке release-v1.4.0
# Ваша ветка обновлена в соответствии с «origin/release-v1.4.0».
#
# нечего коммитить, нет изменений в рабочем каталоге

```

### Получение информации из удалённого репозитория

 * https://stackoverflow.com/questions/1178389/browse-and-display-files-in-a-git-repo-without-cloning

```bash
# если есть локальный клон
git --no-pager branch -r -l 'origin/*release*'
#  origin/release-v1.4.0

# если его нет, можно склонировать минимальный
git clone --no-checkout --depth 1 URL

# у CI/CD есть cli и seb api

wget -qO- https://api.github.com/repos/bskydive/webpack-dep-graph/branches | grep -i release | awk -F: '{print $2}' | awk -F\" '{print $2}'
# release-v1.4.0

# https://docs.gitlab.com/ee/api/branches.html
curl --header "PRIVATE-TOKEN: <your_access_token>" --url "https://gitlab.example.com/api/v4/projects/5/repository/branches/main"

```

### git credential

 * win https://stackoverflow.com/questions/15381198/remove-credentials-from-git
 * https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage
 * https://stackoverflow.com/questions/44246876/how-to-remove-cached-credentials-from-git

 ```bash
 	git config --global -l
	git config --local  -l
	git config --system -l
	git config --global --unset credential.helper
	git config --local --unset credential.helper
	git config --system --unset credential.helper

	mcedit ./.git/config
	#origin
	#https://**username**@gitlab.com/user/projectgit

 ```

### модифицированные файлы

```bash
git status -uno --porcelain
# added not shown
git diff --name-only --diff-filter=ATCMR
git ls-files -m

# untracked files
git ls-files -o --exclude-standard
```

### log

```bash
git log --pretty=oneline --format='DEV: %an %cd #%h %s' --date=format:'%c'
```

 * коммиты и Комментарии на дату сатитистика

	```bash
		g log  --pretty=format:%s --after="2018-07-27"
		g log  --pretty=format:%s --after="2018-08-17 8:00" --before="2018-08-18 8:00"
		# стендап
		g shortlog --author="Valeriy Stepanov" --after="2019-12-09 8:00" --before="2019-12-16 8:00"

		g shortlog -sn --after="2019-01-01 8:00" --before="2019-04-01 8:00"

		# список участников
		git log --pretty="%an %ae%n%cn %ce" | sort | uniq
		# [список разработчиков и их коммитов](https://stackoverflow.com/questions/9597410/list-all-developers-on-a-project-in-git)
		git shortlog --summary --numbered --email
		git shortlog -scn \-- src/

		#
		mcedit .mailmap

		#[список строк автора](https://stackoverflow.com/questions/1265040/how-to-count-total-lines-changed-by-a-specific-author-in-a-git-repository)
		git log --author="Valeriy Stepanov" --oneline --shortstat
		git log --author="Valeriy Stepanov" --oneline --numstat
		git log --author="Valeriy Stepanov" --oneline --stat

		git diff --stat feature-000 develop
	```

 * крайний коммит
	```bash
		git log -1 --format='DEV: %cd #%h' --date=format:'%c' > version.txt

		# первые коммиты в истории
		git log --reverse --pretty=oneline --format='DEV: %an %cd #%h %s' --date=format:'%c' | head -10
	```
### git diff patch

```bash

g format-patch -1 94cb8415ef1834000f0f4da95232a2ac7cb0e8a4
git apply patch

```

### git push

```bash
	#!/bin/bash

	current_branch=`git rev-parse --abbrev-ref HEAD`
	[[ $current_branch == 'develop' ]] && echo -e "\n\n!!!необходимо перейти ИЗ develop!!!\n\n"
	[[ $current_branch == 'develop' ]] && exit

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
 * Compared to --bare, --mirror not only maps local branches of the source to local branches of the target, it maps all refs (including remote branches, notes etc.) and sets up a refspec configuration such that all these refs are overwritten by a git remote update in the target repository.
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
	cat gitlab_import.cron
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
 * кириллица без конвертации
	```bash
		git config core.quotepath off
	```

### edit commit message

```bash
	git log --oneline |less
	git cat-file -p b54648f
	git commit --amend -p b54648f
	git log --oneline |less
```

### разрешение конфиликтов

 * утилита gitrerere
 * перезаписать длинный файл, отличия в котором не видны в git
	```bash
		git checkout develop
		rm -rf dist/*
		git checkout 000-feature-x dist/
	```
 * спрятать изменения
	```bash
		git stash
		git stash list --date=local
		git stash apply stash@{0}
		git stash apply 0
		git stash drop 0
		git stash list
	```

### git squash rebase

 * https://htmlacademy.ru/blog/boost/tools/how-to-squash-commits-and-why-it-is-needed

 ```bash
	git rebase -i HEAD~5
	git rebase -i 123456 # коммит после крайнего
	# pick aabbc4 comment
	# squash aabbc3 comment
	# squash aabbc2 comment
	# squash aabbc1 comment

	# git add
 	git rebase --continue
 ```

## workflow

 * [SDCast #18: в гостях Михаил Лопаткин ](https://sdcast.ksdaemon.ru/2015/02/sdcast-18/)
	* Мы подсмотрели у гугла. У хромиума по всем исходникам разложены файлы owners, в них записаны кто из разработчиков отвечает за конкретную папку или подсистему. Тот кто знает как эта часть работает. Т.е. во-первых знаем кого звать на ревью кода, а во вторых на кого повесить операцию разруливания конфликтов, если такое случилось при мерже. т.е. owner кусочка кода разрешает конфликты при мерже.
 * [merging-vs-rebasing](https://www.atlassian.com/git/tutorials/merging-vs-rebasing)
 * [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/)
 * http://nvie.com/posts/a-successful-git-branching-model/
 * http://endoflineblog.com/gitflow-considered-harmful
 * http://endoflineblog.com/follow-up-to-gitflow-considered-harmful
 * https://habrahabr.ru/post/106912/ - это модель для гиков или документации, или огромной ко, или для предметной области, где от выпускаемого ПО зависит жизнь человека, или высоконагруженный проект

### git hooks

 * [husky](https://typicode.github.io/husky/)

```bash
git commit -am "msg" --no-verify
```

### GitLab Flow

 * [Introduction to GitLab Flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)

### Git flow

 * [git flow](http://danielkummer.github.io/git-flow-cheatsheet/index.ru_RU.html)
 * [git flow ](http://internetdevels.ru/blog/git-flow-model)
 * подразумевает что на каждом спринте вы создаете (обновляете текущую) ветку developer из которой потом каждый программер выделяет ветку feature и в ней решает конкретный issue, после того как он все сделал он (можно через pull request) слвиает feature в develop, после определенного момента (по срокам) разработка фич останавливаеться из ветки develop создается ветка release которая тестируется. Далее все сливается в maste и так покругу.
 * удобнее когда есть четкая дата релиза + фаза стабилизации. Наличие тестов желательно но не обязательно т.к. есть тестирование перед деплоем и время закрыть все косяки руками.

```bash
#git-flow
comment="${1}"
dev="develop"
origin="origin"

feature=`git branch | grep '*' | awk -F'* ' '{print $2}'`

git add -A ./public/* ./src/*
git commit -am "${feature}: ${comment}"

git checkout "${dev}"
git merge --no-ff -m "${feature}: merge ${feature} to ${dev}" ${feature}

git checkout "master"
git merge --no-ff -m "${feature}: merge ${dev} to master" ${dev}

git checkout "${feature}"
git push ${origin} --all
```

### GitHub flow

 * [GitHub flow](https://guides.github.com/introduction/flow/)
 * [Github-flow - немного сложнее, чем на бумаге. 2gis](https://www.youtube.com/watch?v=EwdXZXfQdQY)
 * ставит своей целью короткий релизный цикл (время от производства feature до deploy на продакшен может быть очень коротким), так сказать что бы пользователь как можно раньше получил свои новые фичи. Здесь очень важно наличие хороших тестов + CI. ну и высокая ответственность программиста.
 * Обычно из master выделяется ветка feature по конкретном issue прогер берет делает ее, далее делает pull request на добавление feature в master, она прохоидт автотесты + делается код ревью, заливаеться в master и автоматически деплоится на прод.

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


## git remote

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

### add remote

```bash

Git global setup

git config --global user.name "Валерий"
git config --global user.email "stepanovv.ru@yandex.ru"

Create a new repository

git clone git@gitlab.com:stepanovv/code_quality_js.git
cd code_quality_js
git switch -c main
touch README.md
git add README.md
git commit -m "add README"
git push -u origin main

Push an existing folder

cd existing_folder
git init --initial-branch=main
git remote add origin git@gitlab.com:stepanovv/code_quality_js.git
git add .
git commit -m "Initial commit"
git push -u origin main

Push an existing Git repository

cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.com:stepanovv/code_quality_js.git
git push -u origin --all
git push -u origin --tags


```

## merge tool

 * https://youtu.be/_9bxJs6-5hs?t=858
 * kdiff3
 * meld
 * diffuse
 * https://www.kernel.org/pub/software/scm/git/docs/howto/revert-a-faulty-merge.txt



## github

 * [github CLI](https://hub.github.com/)
 * [15 советов по работе с Github](https://habr.com/ru/company/mailru/blog/359246/)
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

