# Docker

 * artifactory cli login
	`docker login https://artifactory.company.com:0000/artifactory/project-name-docker`
 * [docker AWS](https://habrahabr.ru/post/310460/)
 * [перимущества docker 2016](https://habrahabr.ru/post/277699/)
 * [разделение окружений](https://habrahabr.ru/post/327698/)
 * [docker-iptables](https://blog.andyet.com/2014/09/11/docker-host-iptables-forwarding/)
 * [install debian](https://docs.docker.com/engine/installation/linux/debian/)
 * [nginx+docker](https://gist.github.com/cboettig/8643341bd3c93b62b5c2)
 * [Самый маленький Docker-образ — меньше 1000 байт](https://habr.com/company/flant/blog/413959/)
    * https://zwischenzugs.com/2018/05/22/a-docker-image-in-less-than-1000-bytes/
 * [Контейнеры для взрослых (Часть 01): Практический гид по терминологии](https://habr.com/company/redhatrussia/blog/421663/)
 * [Контейнеры для взрослых (Часть 02): Практический гид по терминологии](https://habr.com/company/redhatrussia/blog/416827/)
 * [Контейнеры для взрослых (Часть 03): 10 вещей, которые не надо делать с контейнерами](https://habr.com/company/redhatrussia/blog/421663/)


## теория

 * основой контейнеризации являются Linux namespace
 * [Основы безопасности в Docker-контейнерах](https://selectel.ru/blog/courses/docker-security/)

## лучшие практики для dockerfile

 * [ansible playbook best practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#best-practices)
 * [Best practices for Dockerfile instructions](https://docs.docker.com/develop/develop-images/instructions/)
 * [General best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/guidelines/)
 *
 *
 * [https://kazarin.online/index.php/2021/03/17/docker-antipatterns/](10 Антипаттернов использования Docker).
 * низкая связность
	* вызов скриптов только из текущего репозитория
	* вызов внешних сервисов и логика только на уровне оркестратора/CICD систем
 * идемпотентность
	* работа с git или другими внешними сервисами только на чтение
	* слой БД загружается только как готовый образ, без модификации
	* учитываем кэширование слоёв файловой системы, разделяем скрипты по шагам, очищаем
 * разделение состава образов по средам/задачам - отдельно CI и CD
	* CD - только готовые к развёртыванию файлы и окружение: скомпилированные, очищенные
	* CI - инструменты, фреймворки, исходный код, отладочная информация, тесты
 * иммутабельность
 	* одинаковые образы в цепочке CD - QA+STAGE+PROD. Вся отладка только на предыдущем этапе CI
	* заморозка кода в цепочке CD, без сборки и git pull.
	* Контейнеры создаются и версионируются вместе с кодом. Создание и настройка контейнеров делегируется разработчикам. Опсы предоставляют реестр с шаблонами контейнеров и автоматизацией их создания.
	* переменные окружения и секреты необходимо загружать динамически во время выполнения шагов в CI/CD системе.
		* утилиты для конфигов configmaps, zookeeper, consul
		* утилиты для секретов vault, keywhiz, confidant, cerberus
 * инструкции, которые мы планируем изменять редко, лучше держать выше других, чтобы они с большей вероятностью взялись из кэша
 * Некоторые команды, как RUN, COPY или FROM, порождают новый слой, который занимает место на локальном диске. Мы можем объединить команды

	```bash
		FROM alpine:3.19
		# исключаем проблемы кэширования и уменьшаем количество слоёв
		RUN apk cache clean \
		apk update \
		apk add python3 \
		rm -rf /var/cache/apk/ 		# Чистим кэш пакетного менеджера
		# Удаляйте файлы в той же инструкции, в которой они создаются.
		# Если сделать это в следующей инструкции, он останется в предыдущем слое

	```
 * https://docs.docker.com/build/building/multi-stage/
 * Используйте инструкцию COPY вместо ADD, т.к. add может выполнять команды распаковки

## cli

```bash
curl -s --unix-socket /var/run/docker.sock http://localhost/containers/json | jq .
curl --unix-socket /var/run/docker.sock -XPOST http://localhost/containers/bdeee2239e44b563939d7122ee3f73c0b27923de53bb212076ad62471b3b2098/stop
docker ps
docker run -v /:/host <образ> #смонтировать в контейнере корень хоста
docker run -itd --name ubuntu1 ubuntu:22.04 # запуск контейнера
dockerenjoyer@ubuntu:~$ docker exec -it ubuntu1 bash # запуск консоли внутри контейнера

```

## performance

 * docker network mode host отключает накладные расходы на NAT

## security

 * [Часто забываемые правила безопасности Docker: заметки энтузиаста ИБ](https://habr.com/ru/company/dataline/blog/567790/)
 * install

	```bash
		zypper in docker python3-docker-compose
		# allow in firewall docker-swarm and docker-registry
		systemctl enable docker
		cd ./docker
		docker build -t dff docker-foo-frontend
		docker build -t dfb docker-foo-backend
		alias ffrs="docker rm dff; docker run -p 4200:4200 --name dff docker-foo-frontend; docker ps"
		alias fbrs="docker rm dfb; docker run -p 5000:5000 --name dff docker-foo-backend; docker ps"
		alias ffr="docker start dff; docker ps"
		alias fbr="docker start dfb; docker ps"
		alias ds="docker stop dff dfb; docker ps"

		alias dcr="docker-compose down && docker volume prune && docker-compose up -d"
		alias dcd="docker-compose down"
		alias dcpu="docker-compose pull"
		alias dpr="docker volume prune"
		alias dps="docker ps"
		alias dpsa="docker ps -a"
		alias di="docker images -a"
		alias dpsf="docker ps -a --format 'table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.State}}'"
	```

 * [How to cleanup unused resources](https://gist.github.com/bastman/5b57ddb3c11942094f8d0a97d461b430)

	```bash
		docker images
		docker images -a
		docker rmi 800e8b15fa9b
		# Error response from daemon: conflict: unable to delete 800e8b15fa9b (must be forced) - image is being used by stopped container d0e2e5f44b23
		docker rm d0e2e5f44b23

		ls /var/lib/docker/volumes
		docker volume prune

		docker logs $id
		docker inspect $id
	```

 * https://www.cisecurity.org/benchmark/docker
 * https://github.com/docker/docker-bench-security
 * https://github.com/CISOfy/lynis
 * https://selectel.ru/blog/docker-security-1/

 * нельзя пробрасывать сокет внутрь контейнера `docker run -it -v /var/run/docker.sock:/var/run/docker.sock myapp`
 * Хорошая практика в CI/CD, особенно в enterprise, — не использовать Docker. Одна из важных его проблем в безопасности — это объединение в себе двух абсолютно разных функционалов: сборки образов и управления рантаймом контейнеров.
 * Чтобы разделить build и run можно использовать альтернативные утилиты для сборки образов контейнеров, не полагающихся на Docker Daemon: BuildKit, kaniko, buildah, которые работают без использования полномочий root-пользователя. С 23.0 версии Docker BuildKit был встроен в билдер вместо устаревшего.
 * настроить запуск контейнера от имени непривилегированных пользователей
 * В файле /etc/docker/daemon.json (если его нет, то создайте) укажем параметр userns-remap:
	```bash
		ps -u
		#USER     	PID %CPU %MEM	VSZ   RSS TTY  	STAT START   TIME COMMAND
		#root       	1  0.0  0.1   4628  3804 pts/0	Ss+  10:36   0:00 /bin/bash
		#root      	16  0.0  0.1   4628  3840 pts/1	Ss   10:38   0:00 bash
		#root      	23  0.0  0.0   7064  1560 pts/1	R+   10:38   0:00 ps -u
		docker container top ubuntu1
		#UID             	PID             	PPID            	C               	STIME           	TTY             	TIME            	CMD
		#root            	389168          	389145          	0               	10:36           	pts/0           	00:00:00        	/bin/bash

		echo '{ "userns-remap": "default" }' > /etc/docker/daemon.json
		#Убедимся, что пользователь действительно был создан:
		id dockremap
		uid=111(dockremap) gid=119(dockremap) groups=119(dockremap)
		cat /etc/subuid
		#dockerenjoyer:100000:65536
		#dockremap:165536:65536

		docker run -itd --name ubuntu1 ubuntu:22.04
		docker exec -it ubuntu1 bash
		ps -u
		#USER     	PID %CPU %MEM	VSZ   RSS TTY  	STAT START   TIME COMMAND
		#root       	1  0.0  0.1   4628  3700 pts/0	Ss+  10:53   0:00 /bin/bash
		#root       	8  0.0  0.1   4628  3768 pts/1	Ss   10:54   0:00 bash
		#root      	16  0.0  0.0   7064  1608 pts/1	R+   10:54   0:00 ps -u
		exit
		exit
		docker container top ubuntu1
		#UID             	PID             	PPID            	C               	STIME           	TTY             	TIME            	CMD
		#165536          	389598          	389575          	0               	10:53           	pts/0           	00:00:00        	/bin/bash
	```

# kubernetes

 * [Исследование VK Cloud о том, как компании работают с Kubernetes в России](https://cloud.vk.com/promopage/state-of-kubernetes/)
 * [Весна идёт — весне дорогу! Итоги сезона Kubernetes](https://habr.com/ru/article/720322/)
 * https://habr.com/ru/hub/kubernetes/
 * [Крупномасштабный стриминг видео с использованием Kubernetes и RabbitMQ](https://habr.com/ru/companies/timeweb/articles/785050/)