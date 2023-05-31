
# bash

 * https://github.com/bskydive/ssh-agentless-monitoring/blob/master/monitoring.sh

## unlimited bash history


```bash

	##for debian&opensuse
	cat >> /etc/bash.bashrc
	##for centos
	cat >> /etc/bashrc

	##bsk
	alias ll="ls -la --color=auto"
	# Append history list instead of override
	shopt -s histappend
	# All commands of root will have a time stamp
	if test "$UID" -eq 0  ; then
		HISTTIMEFORMAT=${HISTTIMEFORMAT:-"%F %H:%M:%S "}
	fi
	# Do not save dupes and lines starting by space in the bash history file
	#HISTCONTROL=ignoreboth
	# don't put duplicate lines in the history. See bash(1) for more options
	export HISTCONTROL=erasedups
	# ... and keep multi line commands together
	shopt -s cmdhist

	# Undocumented feature which sets the size to "unlimited".
	# http://stackoverflow.com/questions/9457233/unlimited-bash-history
	export HISTFILESIZE=
	export HISTSIZE=
	#export HISTTIMEFORMAT="[%F %T] "
	# Change the file location because certain bash sessions truncate .bash_history file upon close.
	# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
	export HISTFILE=~/.bash_eternal_history

```

## bash scripts

 * [backup](./backup.md)
 * [monitoring](./monitoring.md)

```bash
	date +%H.%M.%S_%d.%m.%Y
```

## xargs

 * https://www.commandlinefu.com/commands/browse
 * [Xargs: многообразие вариантов использования](http://habrahabr.ru/company/selectel/blog/248207/)
 *
 ```bash
	find . -name "*.sh" -print0 | xargs -0 rm -rf

	# скачать все графические файлы в 10 потоков
	wget -nv <ссылка> | egrep -o "http://[^[:space:]]*.jpg" | xargs -P 10 -n 1 wget -nv

	# сжать в 3 потока
	echo dir1 dir2 dir3 | xargs -P 3 -I NAME tar czf NAME.tar.gz NAME
 ```
 *
	```bash
		#Если иметь

		"\C-n": history-search-forward
		"\C-p": history-search-backward

		#в .inputrc то по <C-n>/<C-p>
	```

## tips

 * http://mywiki.wooledge.org/BashFAQ
 * http://mywiki.wooledge.org/BashGuide/TestsAndConditionals
 * http://wiki.bash-hackers.org/syntax/ccmd/if_clause
 * [подводные камни bash](https://habr.com/ru/company/mailru/blog/311762)

	```bash
		for i in *.mp3; do
			[ -e "$i" ] || continue
			cp "./$i" /target
		done

		cp -- "$file" "$target"
		# -- - сигнал прекращения поиска опций

		#posix
		[ "$foo" = bar ]
		[ bar = "$foo" ] && [ foo = "$bar" ]
		[ "$foo" -gt 7 ]

		case $foo in
			*[![:digit:]]*)
				printf '$foo expanded to a non-digit: %s\n' "$foo" >&2
				exit 1
				;;
			*)
				[ $foo -gt 7 ]
		esac

		if [ false ]; then echo "HELP"; fi
		if test false; then echo "HELP"; fi
		if [ a = b ] && [ c = d ]; then
		if test a = b && test c = d; then
		if [[ a = b && c = d ]]; then

		#bash/ksh
		[[ $foo == bar ]]
		[[ $foo == "$match" ]]
		[[ $foo = bar && $bar = foo ]]
		((foo > 7))

		#TODO спарсить после 11 пункта
	```

 * https://github.com/you-dont-need/You-Dont-Need-GUI#find-a-stale-file
 * [Bash-скрипты, часть 2: циклы](https://habrahabr.ru/company/ruvds/blog/325928/)
 * https://opensource.com/article/18/5/gnu-parallel
	```bash
		find . -name "*jpeg" | parallel -I% --max-args 1 convert % %.png
		# -I - подстановочный символ для input
		# max-args - по сколько обрабатывать входных результатов, у нас он один - имя файла
		# % % - разрешение подстановочного символа в двух местах
	```
 * [10 (or so) bash Tricks I can't live without](http://axixmiqui.wordpress.com/bash-tricks/)
 *
	```bash

		#Correct small typing mistakes of cd
				shopt -s cdspell
		#Setup history searches
		bind '&quot;\e[A&quot;:history-search-backward'
		bind '&quot;\e[B&quot;:history-search-forward'

		#see: http://aplawrence.com/Linux/bash_history.html
		# don't put duplicate lines in the history. See bash(1) for more options
		export HISTCONTROL=erasedups
		# ... and don't clobber the history when closing multiple shells
		shopt -s histappend
		# ... and keep multi line commands together
		shopt -s cmdhist


		Bash programmable completion gives you a way to tab-complete the argument to commands. Completion for many common commands can be installed from:

		http://www.caliban.org/bash/index.shtml#completion

		Just put the file on your machine and source it. Or use install it from you tool of choice mac: fink, debian: apt, redhat: rpm, etc…

		###############################################################################
		#Use bash-Completion
		if [ -f /sw/etc/bash_completion ]; then
				. /sw/etc/bash_completion
		fi
	```

 *

	```bash
		#set prompt
		#Error flag thanks to http://dotfiles.org/~steve/.bashrc
		sh_light_red=&quot;\[33[1;31m\]&quot;
		sh_norm=&quot;\[33[0m\]&quot;
		sh_blue=&quot;\[33[34m\]&quot;
		sh_inverse=&quot;\[33[40m\]\[33[1;37m\]&quot;
		sh_inverse_red=&quot;\[33[41m\]\[33[1;37m\]&quot;
		sh_ssh=&quot;\[33[32m\]&quot;

		if [ &quot;$SSH_CONNECTION&quot; ] ; then
		SSH_FLAG=1
		#TODO get hostname from $SSH_CONNECTION
		ssh_prompt=${sh_ssh}ssh${sh_norm}
		else
		SSH_FLAG=
		fi

		PS1='${debian_chroot:+($debian_chroot)}''${SSH_FLAG:+('${ssh_prompt}')}'${sh_inverse}'${ERROR_FLAG:+'${sh_inverse_red}'}\u'${sh_norm}':${SSH_FLAG:+'${sh_ssh}'}\h${SSH_FLAG:+'${sh_norm}'}['${sh_blue}'\w'${sh_norm}']${ERROR_FLAG:+'${sh_light_red}'}\$${ERROR_FLAG:+'${sh_norm}'} '

		PROMPT_COMMAND='if [ $? -ne 0 ]; then ERROR_FLAG=1; else ERROR_FLAG=; fi; '

	```
* stderr `cmd | tee -a file.log 2>&1`
