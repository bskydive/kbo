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
 * [Docker Tutorial for Beginners FULL COURSE in 3 Hours by TechWorld with Nana](https://youtu.be/3c-iBn73dDE)
 * O'Reilly Online Learning - https://learning.oreilly.com/search/?query=docker
 * Docker Curriculum - https://docker-curriculum.com
 * Docker's own 101 - https://www.docker.com/101-tutorial
 * Tutorialspoint - https://www.tutorialspoint.com/docker/index.htm

## платные сервисы

 * https://www.docker.com/pricing/
 * https://www.docker.com/products/docker-scout/#scout_pricing
 * https://www.docker.com/products/build-cloud/#pricing
 * https://docs.docker.com/subscription/core-subscription/details/
 * https://docs.docker.com/subscription/scout-details/
 * https://docs.docker.com/subscription/build-cloud/build-details/

## теория

 * основой контейнеризации являются Linux namespace
 * https://www.kernel.org/doc/html/latest/admin-guide/cgroup-v1/cgroups.html
	```bash
		#1) mount -t tmpfs cgroup_root /sys/fs/cgroup
		#2) mkdir /sys/fs/cgroup/cpuset
		#3) mount -t cgroup -ocpuset cpuset /sys/fs/cgroup/cpuset
		#4) Create the new cgroup by doing mkdir's and write's (or echo's) in the /sys/fs/cgroup/cpuset virtual file system.
		#5) Start a task that will be the "founding father" of the new job.
		#6) Attach that task to the new cgroup by writing its PID to the /sys/fs/cgroup/cpuset tasks file for that cgroup.
		#7) fork, exec or clone the job tasks from this founding father task.

		mount -t tmpfs cgroup_root /sys/fs/cgroup
		mkdir /sys/fs/cgroup/cpuset
		mount -t cgroup cpuset -ocpuset /sys/fs/cgroup/cpuset
		cd /sys/fs/cgroup/cpuset
		mkdir Charlie
		cd Charlie
		/bin/echo 2-3 > cpuset.cpus
		/bin/echo 1 > cpuset.mems
		/bin/echo $$ > tasks
		sh
		# The subshell 'sh' is now running in cgroup Charlie
		# The next line should display '/Charlie'
		cat /proc/self/cgroup
	```
 * https://www.redhat.com/sysadmin/cgroups-part-one
 * https://docs.docker.com/get-started/overview/#docker-architecture
 * [Механизмы контейнеризации: cgroups](https://habr.com/ru/companies/selectel/articles/303190/)
 * cgroups v2
	* blkio — устанавливает лимиты на чтение и запись с блочных устройств;
	* cpuacct — генерирует отчёты об использовании ресурсов процессора;
	* cpu — обеспечивает доступ процессов в рамках контрольной группы к CPU;
	* cpuset — распределяет задачи в рамках контрольной группы между процессорными ядрами;
	* devices — разрешает или блокирует доступ к устройствам;
	* freezer — приостанавливает и возобновляет выполнение задач в рамках контрольной группы
	* hugetlb — активирует поддержку больших страниц памяти для контрольных групп;
	* memory — управляет выделением памяти для групп процессов;
	* net_cls — помечает сетевые пакеты специальным тэгом, что позволяет идентифицировать пакеты, порождаемые определённой задачей в рамках контрольной группы;
	* netprio — используется для динамической установки приоритетов по трафику;
	* pids — используется для ограничения количества процессов в рамках контрольной группы.
 * спецификации
	* CRI - container runtime interface - образ
	* OCI - open container initiative - API
 * движки
	* https://docs.docker.com/engine/alternative-runtimes/
	* CRI-O - k8s
	* containerd
	* runc(фундамент)

## выбор образа ОС

 * Alpine
	* наименьший размер, однако там [musl libc](http://www.musl.libc.org) вместо стандартной [glibc](http://www.etalabs.net/compare_libcs.html). Поэтому некоторое старое ПО может глючить из-за недостаточных libc зависимостей.
	* See [this Hacker News comment thread](https://news.ycombinator.com/item?id=10782897) for more discussion of the issues that might arise and some pro/con comparisons of using Alpine-based images.
	* [`alpine` image description](https://hub.docker.com/_/alpine/)
	* https://wiki.alpinelinux.org/wiki/Running_glibc_programs
	* https://stackoverflow.com/questions/70243938/use-shared-library-that-uses-glibc-on-alpinelinux
	* MUSL is lighter and doesn't drag a legacy with it. This is a problem when applications depend on the legacy, like when they want to use pthread.
	* [Comparison of C/POSIX standard library implementations for Linux](https://www.etalabs.net/compare_libcs.html)
 * oracle linux
	* Ksplice for zero-downtime kernel patching, DTrace for real-time diagnostics, Btrfs file system
 * ubuntu
	* This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.
 * thin os для контейнерных окружений
	* https://fedoraproject.org/coreos/
	* RancherOS
	* Photon OS от VMware
 *
 *

## оптимизация

 * положить временные файлы в память - https://docs.docker.com/storage/tmpfs/

## лучшие практики для dockerfile

 * [Best practices for Dockerfile instructions](https://docs.docker.com/develop/develop-images/instructions/)
 * [General best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/guidelines/)
 * [Image-building best practices](https://docs.docker.com/guides/workshop/09_image_best/)
 * [https://kazarin.online/index.php/2021/03/17/docker-antipatterns/](10 Антипаттернов использования Docker)
 * [](./devops.md#buildcompile)
 * низкая связность
	* вызов скриптов только из текущего репозитория
	* вызов внешних сервисов и логика только на уровне оркестратора/CICD систем
 * идемпотентность
	* работа с git или другими внешними сервисами только на чтение
	* слой БД загружается только как готовый образ, без модификации скриптами SQL
	* учитываем кэширование слоёв файловой системы, разделяем скрипты по шагам(multistage), очищаем кэши
	* https://docs.docker.com/guides/docker-concepts/building-images/multi-stage-builds/
	* https://docs.docker.com/build/building/multi-stage/

```dockerfile
# Stage 1: Build Environment
FROM builder-image AS build-stage
# Install build tools (e.g., Maven, Gradle)
# Copy source code
# Build commands (e.g., compile, package)

# Stage 2: Runtime environment
FROM runtime-image AS final-stage
#  Copy application artifacts from the build stage (e.g., JAR file)
COPY --from=build-stage /path/in/build/stage /path/to/place/in/final/stage
# Define runtime configuration (e.g., CMD, ENTRYPOINT)
```

```dockerfile
# stage 1, более толстое окружение для сборки
FROM eclipse-temurin:21.0.2_13-jdk-jammy AS builder
WORKDIR /opt/app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
COPY ./src ./src
RUN ./mvnw clean install

# stage 2, маленькое окружение для запуска
FROM eclipse-temurin:21.0.2_13-jre-jammy AS final
WORKDIR /opt/app
EXPOSE 8080
# -----------v 	`AS builder-------------------^`
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar"]
#  stage (final) is the default target for building
# You could use docker build -t spring-helloworld-builder --target builder . to build only the builder stage with the JDK environment
```

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
 * Объединяйте команды в цепочки. Некоторые команды, как RUN, COPY или FROM, порождают новый слой, который занимает место на локальном диске.

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

 * Используйте инструкцию COPY вместо ADD, т.к. add может выполнять команды распаковки

## image development

 * dockerfile - /var/lib/docker/image/overlay2/imagedb/content/sha256/*

## install

 * https://docs.docker.com/engine/install/ubuntu/

```bash
	# Add Docker's official GPG key:
	apt-get update
	apt-get install ca-certificates curl
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	cat >> /etc/apt/sources.list.d/docker.list

	#deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu noble stable


	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

	cat >> /etc/docker/daemon.json

	docker run hello-world
```
 * https://docs.docker.com/engine/install/linux-postinstall/

```bash
	usermod -aG docker $USER
	mkdir ~/.docker
	#chown "$USER":"$USER" /home/"$USER"/.docker -R
	#chmod g+rwx ~/.docker -R
	systemctl enable docker.service
	systemctl enable containerd.service
```
 * https://docs.docker.com/config/containers/logging/json-file/
 * https://docs.docker.com/reference/cli/dockerd/#daemon-configuration-file

```bash
	dockerd --validate --config-file=/etc/docker/daemon.json
	configuration OK
	ll /var/snap/docker/current/config/daemon.json
	ll /etc/docker/daemon.json
```

 * alias

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
 * https://docs.docker.com/engine/security/rootless/

### registry

 * --disable-content-trust
 * https://docs.docker.com/reference/cli/dockerd/#insecure-registries
 * cloud docker registry
 	* AWS ECR/ECS
	* azure
	* redhat quey
	* Harbor
 * [зеркала](https://docs.docker.com/docker-hub/mirror/?highlight=mirror#configure-the-docker-daemon)
 * [Блокировка Docker Hub для России. Без паники разбираемся как работать дальше](https://habr.com/ru/articles/818565/)
 * https://tproger.ru/articles/docker-hub-v-rossii---vse--gajd--kak-obojti-blokirovku

```bash
	cat >> /etc/docker/daemon.json
{
	"registry-mirrors": [
		"https://mirror.gcr.io",
		"https://registry.gitverse.ru",
		"https://dockerhub.timeweb.cloud/",
		"https://dockerhub1.beget.com"
	],
		#"https://cr.yandex.ru/mirror", #нужна учётка yandex.cloud
		#"https://daocloud.io", #slow
		#"https://c.163.com",
		#"https://registry.docker-cn.com"
	"add-registry": ["192.168.100.100:5001"],
	"block-registry": ["docker.io"],
	"insecure-registries" : [ "hostname.cloudapp.net:5000" ]
}
```
 * https://stackoverflow.com/questions/33054369/how-to-change-the-default-docker-registry-from-docker-io-to-my-private-registry
 *

```bash
	cat >> /etc/hosts
	127.0.0.1 index.docker.io auth.docker.io registry-1.docker.io production.cloudflare.docker.com
```

 * https://hub.docker.com/_/registry
 * https://www.docker.com/blog/how-to-use-your-own-registry-2/

```bash
docker pull registry
mcedit /etc/docker/daemon.json
#"insecure-registries" : [ "vm-pc3-mgmt:5000" ]
docker ps
systemctl restart docker
docker run -d -p 5000:5000 --name registry registry:latest

# load image
docker pull nginx
# tag in cache
docker tag nginx vm-pc3-mgmt:5000/nginx-local
# push from cache to registry container
docker push vm-pc3-mgmt:5000/nginx-local
# pull from local
docker pull vm-pc3-mgmt:5000/nginx-local

```

## cli

 * https://docs.docker.com/reference/cli/docker/container/run/

```bash
	curl -s --unix-socket /var/run/docker.sock http://localhost/containers/json | jq .
	curl --unix-socket /var/run/docker.sock -XPOST http://localhost/containers/bdeee2239e44b563939d7122ee3f73c0b27923de53bb212076ad62471b3b2098/stop
	docker ps
	docker run -v /:/host <образ> #смонтировать в контейнере корень хоста
	docker run -itd --name ubuntu1 ubuntu:22.04 # запуск контейнера
	docker exec -it ubuntu1 bash # запуск консоли внутри контейнера
```

 * https://docs.docker.com/reference/cli/docker/image/build/#target
 * https://docs.docker.com/reference/cli/docker/compose/#use-profiles-to-enable-optional-services

## WTF troubleshooting

 * https://stackoverflow.com/questions/49110092/failed-to-start-docker-application-container-engine

```bash
docker info
rm /var/run/docker.pid
rm /etc/docker/daemon.json
```

## docker file

 * https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
 * https://docs.docker.com/reference/dockerfile/
	* ADD - Add local or remote files and directories.
	* COPY - Copy files and directories.
	* VOLUME - Create volume mounts.
	* ARG - Use build-time variables.
	* CMD - Specify default commands.
	* ENV - Set environment variables.
	* EXPOSE - Describe which ports your application is listening on.
	* FROM - Create a new build stage from a base image.
	* HEALTHCHECK - Check a container's health on startup.
		* https://docs.docker.com/compose/compose-file/05-services/#healthcheck
	* LABEL - Add metadata to an image.
	* MAINTAINER - Specify the author of an image.
	* ONBUILD - Specify instructions for when the image is used in a build.
	* RUN
		* https://docs.docker.com/reference/dockerfile/#run
		- Execute build commands.
		* создаёт новый слой в образе
	* ENTRYPOINT - Specify default executable.
		* https://docs.docker.com/reference/dockerfile/#entrypoint
		* exec форма лучше `shell`
			* https://docs.docker.com/reference/dockerfile/#shell-and-exec-form
			* всегда запускает процесс с PID=1, это обязательный атрибут запущенного контейнера
			* exec: `ENTRYPOINT ["executable", "param1", "param2"]`
			* shell: `ENTRYPOINT command param1 param2`
			* строковая/shell форма запускает bash, и не принимает SIG* снаружи
		* `INSTRUCTION ["executable","param1","param2"] #exec form`
    	* `INSTRUCTION command param1 param2 #shell form`
	* SHELL - Set the default shell of an image.
	* STOPSIGNAL - Specify the system call signal for exiting a container.
	* USER - Set user and group ID.
	* WORKDIR - Change working directory.
 * ENTRYPOINT+CMD - для переопределения параметров runtime
 * обязательные атрибуты
	* FROM
	*

 * https://docs.docker.com/compose/startup-order/

### prod

 * https://docs.docker.com/compose/production/
 * убрать внешние точки монтирования volume, чтобы контейнер был без изменений снаружи
 * другие порты
 * другие environment variables: reducing the verbosity of logging, or to specify settings for external services such as an email server
 * другие политики downtime `restart: always`
 * убрать лишние services: log aggregator

### daemon.json

 * cli-->api-->daemond
 * daemond может общаться через fd/socket/tcp
 * https://docs.docker.com/config/daemon/troubleshoot/
 * https://docs.docker.com/engine/alternative-runtimes/

### plugins

 * https://docs.docker.com/engine/extend/
 * `docker plugin ls`

### ENV

 * [проверить ENV у процесса снаружи](https://stackoverflow.com/questions/532155/linux-where-are-environment-variables-stored)

```bash
	cat /proc/$PID/environ | tr '\0' '\n'
```

* https://docs.docker.com/compose/environment-variables/

```
services:
  api:
    image: 'node:6-alpine'
    env_file:
     - ./Docker/api/api.env
    environment:
     - NODE_ENV=production
```
 * https://docs.docker.com/engine/reference/run/#environment-variables

 ```
docker run -e "deep=purple" -e today --rm alpine env
 ```

## logging

 * https://docs.docker.com/config/containers/logging/configure/

```bash

	cat >> /etc/docker/daemon.json

		{
			"log-driver": "json-file",
			"log-opts": {
				"max-size": "10m",
				"max-file": "3",
				"labels": "production_status",
				"env": "os,customer",
				"mode": "non-blocking",
				"tag":"{{.ImageName}}/{{.Name}}/{{.ID}}"
			}
		}

	docker ps -qa | xargs docker inspect --format='{{.LogPath}}' | xargs ls -hl
	#https://stackoverflow.com/questions/33017329/where-is-a-log-file-with-logs-from-a-container
```
	* none - No logs are available for the container and docker logs does not return any output.
	* local - Logs are stored in a custom format designed for minimal overhead.
	* json - file	The logs are formatted as JSON. The default logging driver for Docker.
	* syslog - Writes logging messages to the syslog facility. The syslog daemon must be running on the host machine.
	* journald - Writes log messages to journald. The journald daemon must be running on the host machine.
	* gelf - Writes log messages to a Graylog Extended Log Format (GELF) endpoint such as Graylog or Logstash.
	* fluentd - Writes log messages to fluentd (forward input). The fluentd daemon must be running on the host machine.
	* awslogs - Writes log messages to Amazon CloudWatch Logs.
	* splunk - Writes log messages to splunk using the HTTP Event Collector.
	* etwlogs - Writes log messages as Event Tracing for Windows (ETW) events. Only available on Windows platforms.
	* gcplogs - Writes log messages to Google Cloud Platform (GCP) Logging.
 * https://docs.docker.com/reference/cli/docker/compose/logs/
 * https://docs.docker.com/compose/compose-file/05-services/#logging

## monitoring

 * https://opentelemetry.io/docs/
 * https://docs.docker.com/config/otel/
 * https://docs.docker.com/reference/cli/docker/inspect/

## compose file

 * https://docs.docker.com/compose/compose-application-model/
 * [пример python сборки](https://docs.docker.com/compose/gettingstarted/)
 * конвертер run<>compose
	* https://www.composerize.com/
	* https://github.com/composerize/composerize
	* https://github.com/composerize/decomposerize
	* https://ray.run/tools/docker-run-to-docker-compose
	* https://ray.run/tools/docker-compose-to-docker-run
 * https://docs.docker.com/compose/release-notes/
 * синтакс
	* map
	* array
	* .env
```yaml
#Map syntax:

environment:
  RACK_ENV: development
  SHOW: "true"
  USER_INPUT:

#Array syntax:

environment:
  - RACK_ENV=development
  - SHOW=true
  - USER_INPUT
```
### validate/debug

 * https://docs.docker.com/reference/cli/docker/compose/config/
 * https://docs.docker.com/reference/cli/docker/compose/#use-dry-run-mode-to-test-your-command

```bash
	docker-compose -f /path/to/the/docker-compose.yaml config --quiet && echo OKOK
	docker compose -f /path/to/the/docker-compose.yaml config -q && echo OKOK
	docker compose --dry-run up --build -d
	docker-compose -f .docker/docker-compose.yml build www-service
	docker-compose -f .docker/docker-compose.yml up www-service
```

### шаблоны конфигов

 * https://docs.docker.com/samples/
 * https://github.com/docker/awesome-compose
 * https://docs.docker.com/compose/samples-for-compose/
 * https://docs.docker.com/compose/faq/

### optimization/diagnostics/performance

 * docker network mode host отключает накладные расходы на NAT
 * https://docs.docker.com/reference/cli/docker/compose/#configuring-parallelism
 * [PID 1 init](https://docs.docker.com/compose/compose-file/05-services/#init)
 * parallelism
	* https://docs.docker.com/reference/cli/docker/compose/#configuring-parallelism
		* `docker compose --parallel 1 pull`
	* https://docs.docker.com/build/guide/multi-stage/#parallelism
	*

### service

* https://docs.docker.com/compose/compose-file/05-services/#healthcheck
	```yaml
		backend:
			image: example/backend
			healthcheck:
				test: ["CMD", "curl", "-f", "http://localhost"]
				interval: 1m30s
				timeout: 10s
				retries: 3
				start_period: 40s
				start_interval: 5s
	```
 * [два вида](https://docs.docker.com/compose/compose-file/build/#using-build-and-image)
	* [image](https://docs.docker.com/compose/compose-file/05-services/#image)
	* [build](https://docs.docker.com/compose/compose-file/build/)
 * [зависимости](https://docs.docker.com/compose/compose-file/05-services/#depends_on)

### profiles

* profile позволяет запускать из командной строки группы сервисов
* по-умолчанию стартуют сервисы без профилей
* не запускает второй уровень зависимостей, только profile-->depends_on. depends_on-->profiles не запускается, нужно перечислять все зависимости в profiles
* https://docs.docker.com/compose/profiles/
* https://docs.docker.com/reference/cli/docker/compose/#use-profiles-to-enable-optional-services
* https://docs.docker.com/compose/compose-file/05-services/#profiles
	```yaml
		services:
		frontend:
			image: frontend
			profiles: ["frontend"]

		phpmyadmin:
			image: phpmyadmin
			depends_on:
			- db
			profiles:
			- debug
	```
* https://docs.docker.com/compose/profiles/

	```bash
		#services:
		#  frontend:
		#    image: frontend
		#    profiles: [frontend]
		#
		#  phpmyadmin:
		#    image: phpmyadmin
		#    depends_on: [db]
		#    profiles: [debug]
		#
		#  backend:
		#    image: backend
		#
		#  db:
		#    image: mysql

		docker compose --profile debug up
		COMPOSE_PROFILES=debug docker compose up
		docker compose --profile frontend --profile debug up
		COMPOSE_PROFILES=frontend,debug docker compose up
		docker compose --profile "*"

		#services:
		#  backend:
		#    image: backend
		#
		#  db:
		#    image: mysql
		#
		#  db-migrations:
		#    image: backend
		#    command: myapp migrate
		#    depends_on:
		#      - db
		#    profiles:
		#      - tools

		# Only start backend and db
		docker compose up -d

		# This runs db-migrations (and,if necessary, start db)
		# by implicitly enabling the profiles `tools`
		docker compose run db-migrations
	```

### ENVironment

 * https://docs.docker.com/compose/compose-file/05-services/#environment
	```yaml
		#Map syntax:

		environment:
		RACK_ENV: development
		SHOW: "true"
		USER_INPUT:

		#Array syntax:

		environment:
		- RACK_ENV=development
		- SHOW=true
		- USER_INPUT
	```
 * https://docs.docker.com/compose/environment-variables/set-environment-variables/#compose-file

	```bash
		cat .env
		#TAG=v1.5

		cat compose.yml
		#services:
		#web:
		#	image: "webapp:${TAG}"
		docker compose config
		#services:
		#  web:
		#    image: 'webapp:v1.5'
	```

### configs

 *

### networks

* https://www.docker.com/blog/docker-networking-design-philosophy/
* https://blog.oddbit.com/post/2014-08-11-four-ways-to-connect-a-docker/
* https://docs.docker.com/compose/compose-file/05-services/#networks
	* external: true|false
	* internal: true|false
* https://docs.docker.com/network/drivers/macvlan/
* https://docs.docker.com/network/drivers/ipvlan/
* https://docs.docker.com/compose/compose-file/06-networks/#ipam
* https://training.play-with-docker.com/docker-networking-hol/
* https://stackoverflow.com/questions/51873123/docker-container-with-dhcp-assigned-address
* https://docs.docker.com/reference/cli/docker/container/run/#add-host
```yaml
	services:
	app:
		image: busybox
		command: top
		networks:
		app_net:
			link_local_ips:
			- 57.123.22.11
			- 57.123.22.13
        front_tier:
		  ipv4_address: 172.16.238.10
          ipv6_address: 2001:3984:3989::10

networks:
  front-tier:
    ipam:
      driver: default
      config:
        - subnet: "172.16.238.0/24"
        - subnet: "2001:3984:3989::/64"
  bridge-net:
    driver: bridge
    macvlan-net:
      driver: macvlan
      driver_opts:
        #parent: "eth3"
	  ipam:
	    config:
          - subnet: "192.168.0.0/24"
          - gateway: "192.168.0.252"
    ipvlan-net:
      driver: ipvlan
      driver_opts:
        #parent: "eth3"
        ipvlan_mode: l2
	  ipam:
	    config:
          - subnet: "192.168.0.0/24"
          - gateway: "192.168.0.252"

```

```bash
docker network create -d ipvlan \
    --subnet=192.168.0.0/24 \
    --gateway=192.168.0.252 \
    -o ipvlan_mode=l2 \
    -o parent=eth3 ipvlan_net
docker network create \
  --driver=bridge \
  --subnet=192.168.0./24 \
  --gateway=192.168.0.252 \
  bridge-net

docker run --add-host=my-hostname=8.8.8.8

```

### volumes

* `services-->volumes:-->- name: path`
* `volumes:-->name:-->options`
* [драйверы](https://docs.docker.com/storage/storagedriver/select-storage-driver/)
	* overlay 2
	* btrfs/zfs - снимки
	* devicemapper - потоки блоков
	* old
		* vfs
		* overlay 1
		* fuse-overlayfs
		* aufs
 * https://docs.docker.com/compose/compose-file/05-services/#advanced-example

```yaml
services:
  proxy:
    image: nginx
    volumes:
      - type: bind
        source: ./proxy/nginx.conf
        target: /etc/nginx/conf.d/default.conf
        read_only: true
```

* https://docs.docker.com/compose/compose-file/05-services/#volumes

	```yaml
		services:
			backend:
				image: example/backend
				volumes:
				- type: volume
					source: db-data
					target: /data
					volume:
					nocopy: true
					subpath: sub
				- type: bind
					source: /var/run/postgres/postgres.sock
					target: /var/run/postgres/postgres.sock
		volumes:
			db-data:
		volumes:
			example:
				driver_opts:
				type: "nfs"
				o: "addr=10.40.0.199,nolock,soft,rw"
				device: ":/docker/example"
		volumes:
			db-data:
				name: ${DATABASE_VOLUME} #DATABASE_VOLUME=my_volume_001
	```

* https://docs.docker.com/reference/cli/docker/volume/create/

	```bash
		docker volume create --driver local \
			--opt type=tmpfs \
			--opt device=tmpfs \
			--opt o=size=100m,uid=1000 \
			foo

		docker volume create --driver local \
			--opt type=btrfs \
			--opt device=/dev/sda2 \
			foo

		docker volume create --driver local \
			--opt type=nfs \
			--opt o=addr=192.168.1.1,rw \
			--opt device=:/path/to/dir \
			foo
	```
 * https://docs.docker.com/storage/bind-mounts/
 * If you use -v or --volume to bind-mount a file or directory that does not yet exist on the Docker host, -v creates the endpoint for you. It is always created as a directory.
 * If you use --mount to bind-mount a file or directory that does not yet exist on the Docker host, Docker does not automatically create it for you, but generates an error.
```bash
	docker run -d \
	-it \
	--name devtest \
	--mount type=bind,source="$(pwd)"/target,target=/app \
	nginx:latest
	docker inspect devtest
	#"Mounts": [
	#    {
	#        "Type": "bind",
	#        "Source": "/tmp/source/target",
	#        "Destination": "/app",
	#        "Mode": "",
	#        "RW": true,
	#        "Propagation": "rprivate"
	#    }
	#],
	docker run -d \
	-it \
	--name devtest \
	--mount type=bind,source="$(pwd)"/target,target=/app,readonly \
	nginx:latest

```
 * https://docs.docker.com/storage/bind-mounts/#use-a-bind-mount-with-compose

```bash
services:
  frontend:
    image: node:lts
    volumes:
      - type: bind
        source: ./static
        target: /opt/app/static
volumes:
  myapp:
```
 * https://docs.docker.com/compose/compose-file/05-services/#volumes
 * https://docs.docker.com/compose/compose-file/07-volumes/

```bash
services:
  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
volumes:
  example:
	external: true
	labels:
	  com.example.description: "Database volume"
	  com.example.department: "IT/Ops"
	  com.example.label-with-empty-value: ""
    name: ${DATABASE_VOLUME}
	driver_opts:
	  type: "nfs"
	  o: "addr=10.40.0.199,nolock,soft,rw"
	  device: ":/docker/example"
```

### swarm secrets

 * https://earthly.dev/blog/docker-secrets/

```yaml
	services:
		frontend:
			image: example/webapp
			secrets:
			- server-certificate
	secrets:
		server-certificate:
			file: ./server.cert
```
 * https://docs.docker.com/reference/cli/docker/secret/

```bash
	docker secret create`-->`/run/secrets
```
 * https://blog.gitguardian.com/how-to-handle-secrets-in-docker/
 * https://docs.docker.com/compose/compose-file/09-secrets/
 * https://docs.docker.com/compose/use-secrets/

```yaml
services:
   db:
     image: mysql:latest
     volumes:
       - db_data:/var/lib/mysql
     environment:
       MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_root_password
       - db_password

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD_FILE: /run/secrets/db_password
     secrets:
       - db_password


secrets:
   db_password:
     file: db_password.txt
   db_root_password:
     file: db_root_password.txt

volumes:
    db_data:
```

## network

 * https://docs.docker.com/compose/compose-file/05-services/#links
 * https://docs.docker.com/compose/networking/
 * https://docs.docker.com/compose/compose-file/06-networks/

```yaml
services:
  proxy:
    build: ./proxy
    networks:
      - frontend
  app:
    build: ./app
    networks:
      - frontend
      - backend
  db:
    image: postgres
    networks:
      - backend

networks:
  frontend:
    # Use a custom driver
    driver: custom-driver-1
  backend:
    # Use a custom driver which takes special options
    driver: custom-driver-2
    driver_opts:
      foo: "1"
      bar: "2"
```

 * https://docs.docker.com/reference/cli/docker/network/create/
	```bash
		docker network create \
		--driver=bridge \
		--subnet=172.28.0.0/16 \
		--ip-range=172.28.5.0/24 \
		--gateway=172.28.5.254 \
		br0

		docker network create -d overlay \
		--subnet=192.168.10.0/25 \
		--subnet=192.168.20.0/25 \
		--gateway=192.168.10.100 \
		--gateway=192.168.20.100 \
		--aux-address="my-router=192.168.10.5" --aux-address="my-switch=192.168.10.6" \
		--aux-address="my-printer=192.168.20.5" --aux-address="my-nas=192.168.20.6" \
		my-multihost-network
	```
 * https://docs.docker.com/network/drivers/
	* [bridge](https://docs.docker.com/network/drivers/bridge/): The default network driver. If you don't specify a driver, this is the type of network you are creating. Bridge networks are commonly used when your application runs in a container that needs to communicate with other containers on the same host.
	* [host](): Remove network isolation between the container and the Docker host, and use the host's networking directly.
	* [overlay](): Overlay networks connect multiple Docker daemons together and enable Swarm services and containers to communicate across nodes. This strategy removes the need to do OS-level routing. See Overlay network driver.
	* [ipvlan](): IPvlan networks give users total control over both IPv4 and IPv6 addressing. The VLAN driver builds on top of that in giving operators complete control of layer 2 VLAN tagging and even IPvlan L3 routing for users interested in underlay network integration.
	* [macvlan](): Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host's network stack.
	* [none](): Completely isolate a container from the host and other containers. none is not available for Swarm services.
	Network plugins: You can install and use third-party network plugins with Docker.
 * Be sure that your subnetworks do not overlap. If they do, the network create fails and Docker Engine returns an error
 * port mapping
	* https://docs.docker.com/compose/compose-file/05-services/#ports

```yaml
#[HOST:]CONTAINER[/PROTOCOL]
ports:
  - "3000"
  - "3000-3005"
  - "8000:8000"
  - "9090-9091:8080-8081"
  - "49100:22"
  - "8000-9000:80"
  - "127.0.0.1:8001:8001"
  - "127.0.0.1:5000-5010:5000-5010"
  - "6060:6060/udp"

ports:
  - name: web
    target: 80
    host_ip: 127.0.0.1
    published: "8080"
    protocol: tcp
    app_protocol: http
    mode: host

  - name: web-secured
    target: 443
    host_ip: 127.0.0.1
    published: "8083-9000"
    protocol: tcp
    app_protocol: https
    mode: host
```
 * type
	* host
	* bridge
	* none
 * https://docs.docker.com/reference/dockerfile/#expose - inform, but not publish
 * https://docs.docker.com/compose/compose-file/05-services/#expose

## volumes

 * bind
 * volume
 * nfs
 * mount
	* overlay
	* custom - driver
 * [подходы к созданию хранилища](https://docs.docker.com/compose/faq/#should-i-include-my-code-with-copyadd-or-a-volume)
	* COPY - копирование для изоляции
	* ADD - плюс распаковка
	* VOLUME - если необходимо отлаживать или разрабатывать, менять файлы после запуска контейнера
	* https://docs.docker.com/compose/file-watch/

```yaml
	services:
	web:
		build: . # build from ./Dockerfile
		command: npm start
		develop:
		watch:
			- action: sync
			path: ./web
			target: /src/web
			ignore:
				- node_modules/
			- action: rebuild
			path: package.json
```

 * build context
 * context
	* папка на хосте
	* https://docs.docker.com/compose/compose-file/build/#context

 * сложные иерархии монтирования
	* https://docs.docker.com/storage/bind-mounts/#configure-bind-propagation


### container

 * https://docs.docker.com/reference/cli/docker/container/commit/
 * https://docs.docker.com/reference/cli/docker/container/diff/

```bash
docker diff 1fdfd1f54c1b
# A	A file or directory was added
# D	A file or directory was deleted
# C	A file or directory was changed

```
 * https://docs.docker.com/guides/docker-concepts/building-images/understanding-image-layers/
```bash
docker image history node-base
#IMAGE          CREATED          CREATED BY                                      SIZE      COMMENT
#d5c1fca2cdc4   10 seconds ago   /bin/bash                                       126MB     Add node
#2b7cc08dcdbb   5 weeks ago      /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
#<missing>      5 weeks ago      /bin/sh -c #(nop) ADD file:07cdbabf782942af0…   69.2MB
#<missing>      5 weeks ago      /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
#<missing>      5 weeks ago      /bin/sh -c #(nop)  LABEL org.opencontainers.…   0B
#<missing>      5 weeks ago      /bin/sh -c #(nop)  ARG LAUNCHPAD_BUILD_ARCH     0B
#<missing>      5 weeks ago      /bin/sh -c #(nop)  ARG RELEASE                  0B
```

### cleanup

 * https://docs.docker.com/config/pruning/#prune-everything
 * https://docs.docker.com/config/pruning/#prune-volumes
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

## security

 * [docker scout](https://docs.docker.com/scout/quickstart/) analyzes image contents and generates a detailed report of packages and vulnerabilities that it detects
 * для платных тарифов
	* [System for Cross-domain Identity Management (SCIM) 2.0](https://docs.docker.com/security/for-admins/provisioning/scim/)
		* Creating new users
		* Push user profile updates
		* Remove users
		* Deactivate users
		* Re-activate users
		* Group mapping
	* [Escalate container privileges (--privileged)](https://docs.docker.com/reference/cli/docker/container/run/#privileged)
		* Enables all Linux kernel capabilities
		* Disables the default seccomp profile
		* Disables the default AppArmor profile
		* Disables the SELinux process label
		* Grants access to all host devices
		* Makes /sys read-write
		* Makes cgroups mounts read-write
 * [Основы безопасности в Docker-контейнерах](https://selectel.ru/blog/courses/docker-security/)
 * [Часто забываемые правила безопасности Docker: заметки энтузиаста ИБ](https://habr.com/ru/company/dataline/blog/567790/)
	* Помнить о настройке авторизации Docker TCP через сертификат SSL.
	* Во время сборки контейнера мы создаем юзера и переходим на него. https://docs.docker.com/reference/dockerfile/#user

```bash
FROM alpine
RUN groupadd -r myuser && useradd -r -g myuser
#<Здесь еще можно выполнять команды от root-пользователя, например, ставить пакеты>
USER myuser
#
```
    * Ограничить ресурсы. Так мы сократим риск несанкционированного майнинга:

```bash
-m или --memory #доступная память до OOM;
--cpus 	#сколько процессоров доступно, например 1.5;
--cpuset-cpus #какие именно процессоры доступны (ядра);
--restart=on-failure:<number_of_restarts> #убираем вариант Restart Always, чтобы контролировать количество перезапусков и вовремя обнаруживать проблемы;
--read-only #файловая система настраивается только на чтение при запуске, особенно если контейнер отдает статику.
```
    * Не отключать профили безопасности. По умолчанию Docker уже использует профили для модулей безопасности Linux. Эти  правила можно ужесточать, но не наоборот
	* seccomp — механизм ядра Linuх, позволяющий определять доступные системные вызовы. В стандартной поставке Docker блокирует около 44 вызовов из 300+
	* Кроме Seccomp можно использовать также профили AppArmor или SELinux
	* Анализировать содержимое контейнера [линтерами](#линтеры-linters)
 * https://selectel.ru/blog/docker-security-1/


### замена dockerd

 * Ограничить доступ к сокету Docker Daemon. Владельцем сокет-файла должен быть пользователь root.
 * Не прокидывать сокет в контейнер (Docker-in-Docker) `docker run -it -v /var/run/docker.sock:/var/run/docker.sock myapp` .
 	* для сборки можно использовать kaniko.
	* для подписи образов можно использовать стороннюю систему и подключить ее через API.
	* https://docs.docker.com/engine/security/userns-remap/
```bash
docker run -u 4000 alpine #Запуск контейнеров от непривилегированного пользователя
--userns-remap=default #включаем поддержку user namespace в Docker daemon
docker run
--cap-drop all --cap-add CHOWN alpine #Отключить все возможности ядра (capabilities)
--security-opt=no-new-privileges #Запретить  эскалацию привилегий (смену юзера на uid0). Используем опцию при запуске
--icc=false #Отключить межконтейнерное взаимодействие через сеть docker0
```

 * Хорошая практика в CI/CD, особенно в enterprise, — не использовать Docker daemon. Одна из важных его проблем в безопасности — это объединение в себе двух абсолютно разных функционалов: сборки образов и управления рантаймом контейнеров.
 * Чтобы разделить build и run можно использовать альтернативные утилиты для сборки образов контейнеров, не полагающихся на Docker Daemon, которые работают без использования полномочий root-пользователя. С 23.0 версии Docker BuildKit был встроен в билдер вместо устаревшего.
	* BuildKit
	* [kaniko](https://github.com/GoogleContainerTools/kaniko)
		* [Создание образов Docker, без Docker, с использованием Kaniko + Gitlab CI и AWS - 2023](https://teletype.in/@bh_cat/9GeFQhwtf06)
		* https://github.com/GoogleContainerTools/kaniko/blob/main/docs/tutorial.md
	* buildah

### subuid

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
#uid=111(dockremap) gid=119(dockremap) groups=119(dockremap)
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

docker container top ubuntu1
#UID             	PID             	PPID            	C               	STIME           	TTY             	TIME            	CMD
#165536          	389598          	389575          	0               	10:53           	pts/0           	00:00:00        	/bin/bash
```

### линтеры linters

 * https://www.cisecurity.org/benchmark/docker
 * https://github.com/docker/docker-bench-security
 * https://github.com/CISOfy/lynis
* бесплатный Clair
* условно бесплатные Snyk, anchore, Harbor
* платные JFrog XRay и Qualys
* системы асессмента ИБ в целом, например, Open Policy agent

### selinux

* https://docs.docker.com/storage/bind-mounts/#configure-the-selinux-label
* https://projectatomic.io/blog/2015/06/using-volumes-with-docker-can-cause-problems-with-selinux/
```bash
docker run -v /var/db:/var/db:z rhel7 /bin/sh

# Will automatically do the
chcon -Rt svirt_sandbox_file_t /var/db

# Even better, you can use Z.

docker run -v /var/db:/var/db:Z rhel7 /bin/sh

# This will label the content inside the container with the exact MCS label that the container will run with, basically it runs
chcon -Rt svirt_sandbox_file_t -l s0:c1,c2 /var/db
# where s0:c1,c2 differs for each container.
```

## swarm

 * https://docs.docker.com/engine/swarm/
 * для роя необходим репозиторий, мастер ноды и воркер ноды
 * для создания реплик необходимо указать их количество
 * rolling update автоматически применит изменения в образах на все реплики
 * вместо compose необходимо создать [stack.yaml](https://docs.docker.com/engine/swarm/stack-deploy/)
	* в нём можно указать один общий сервис, и разделяемые реплики
```bash
docker swarm init --advertise-addr 192.168.99.100
#Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.
#
#To add a worker to this swarm, run the following command:
#
#    docker swarm join \
#    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
#    192.168.99.100:2377
#
#To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

docker info
#Containers: 2
#Running: 0
#Paused: 0
#Stopped: 2
#  ...snip...
#Swarm: active
#  NodeID: dxn1zf6l61qsb1josjja83ngz
#  Is Manager: true
#  Managers: 1
#  Nodes: 1

docker node ls
#ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
#dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader

docker swarm join-token worker
#To add a worker to this swarm, run the following command:
#
#    docker swarm join \
#    --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
#    192.168.99.100:2377

docker swarm join \
  --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
  192.168.99.100:2377

#This node joined a swarm as a worker.
#Open a terminal and ssh into the machine where the manager node runs
docker node ls
#ID                           HOSTNAME  STATUS  AVAILABILITY  MANAGER STATUS
#03g1y59jwfg7cf99w4lt0f662    worker2   Ready   Active
#9j68exjopxe7wfl6yuxml7a7j    worker1   Ready   Active
#dxn1zf6l61qsb1josjja83ngz *  manager1  Ready   Active        Leader

docker service create --replicas 1 --name helloworld alpine ping docker.com

#9uk4639qpg7npwf3fn2aasksr

docker service scale helloworld=5

#helloworld scaled to 5

docker service ps helloworld

#NAME                                    IMAGE   NODE      DESIRED STATE  CURRENT STATE
#helloworld.1.8p1vev3fq5zm0mi8g0as41w35  alpine  worker2   Running        Running 7 minutes
#helloworld.2.c7a7tcdq5s0uk3qr88mf8xco6  alpine  worker1   Running        Running 24 seconds
#helloworld.3.6crl09vdcalvtfehfh69ogfb1  alpine  worker1   Running        Running 24 seconds
#helloworld.4.auky6trawmdlcne8ad8phb0f1  alpine  manager1  Running        Running 24 seconds
#helloworld.5.ba19kca06l18zujfwxyc5lkyn  alpine  worker2   Running        Running 24 seconds

docker service rm helloworld

#helloworld

```
