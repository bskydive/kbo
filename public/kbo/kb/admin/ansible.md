# ansible


 * configuration management
	* packer+pxe
	* argoCD
 * https://galaxy.ansible.com/ui/search/?keywords=nginx
 * https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_intro.html#playbook-syntax
 * [Андрей Девяткин — Почему я советую людям не учить Ansible - 2021](https://youtu.be/vTLHuyYAswo?t=738)

 * основная проблема - ползучие недокументированные изменения
 * выход - переложить изменения в скрипты и регулярно проверять накатываемость конфигурации с нуля
 * инструмент расследования - filesystem snapshot diff, версионируемые ФС
 * https://12factor.net/ru/
	* Одна кодовая база, отслеживаемая в системе контроля версий, - множество развёртываний
	* Явно объявляйте и изолируйте зависимости
	* Сохраняйте конфигурацию в ENV переменных
	* Сделайте сторонние службы подключаемыми ресурсами
	* Строго разделяйте стадии build release deploy
	* СДелайте stateless приложение
	* Экспортируйте сервисы через привязку портов
	* Масштабируйте приложение с помощью изолируемых процессов, а не потоков
	* Максимизируйте надёжность с помощью быстрого запуска и корректного завершения работы
	* Держите окружения dev/staging/production максимально похожими
	* Рассматривайте журнал как поток событий
	* Выполняйте задачи администрирования/управления с помощью разовых процессов
 * [Ansible - путь сильных духом: Kubernetes/Helm/ArgoCD/Jenkins](https://habr.com/ru/companies/slurm/articles/810933/)
 * [44 совета по Ansible: рекомендации и Best Practices - 2023](https://habr.com/ru/companies/slurm/articles/725788/)
* нет агентов
	* меньше векторов атаки
	* лёгкое внедрение в организации, без изменений в инфраструктуре
	* https://galaxy.ansible.com
	* playbook
	* module
	* role
	* group
* on-permise self-hosted
* vSphere
* https://ansible.readthedocs.io/projects/awx/en/latest/
 * аналоги - chef/puppet, у них агенты
 * [Основы Ansible 2.9 для сетевых инженеров](https://ansible-for-network-engineers.readthedocs.io/ru/latest/)
 * [Ansible. Часть 1. Основы](https://www.youtube.com/watch?v=n27bpkAtyf4&ab_channel=Unixway)
 * [Ansible. Часть 2. Playbook](https://www.youtube.com/watch?v=5JcL3c6rPE8&ab_channel=Unixway)

```bash
ANSIBLE_LOAD_CALLBACK_PLUGINS=true ANSIBLE_STDOUT_CALLBACK=json ansible ... | jq

```

## ЧАВО

 * https://docs.ansible.com/ansible/latest/command_guide/cheatsheet.html
 * https://www.digitalocean.com/community/cheatsheets/how-to-use-ansible-cheat-sheet-guide
    * Control Machine: a system where Ansible is installed
    * Playbook: series of tasks to be executed on a remote server.
    * Role: a collection of playbooks and other files that are relevant to a goal such as installing a web server.
    * Play: a full Ansible run. A play can have several playbooks and roles, included from a single playbook that acts as entry point.
	* иерархия конфигов
		* node - подчинённый узел
		* Inventory - описание nodes /etc/ansible/hosts
		* модули - скрипты
		* плагины - 
		* Плейбуки - связывают inventory, role, collection
		* Роли - набор для конкретного действия
		* Коллекции - набор ролей, модулей, плагинов
```bash
# module ping
ansible all -m ping --private-key=~/.ssh/custom_id -u user
# exec
ansible all -a "uname -a"
# module apt
ansible server1 -m apt -a "name=vim"
# playbook
ansible-playbook -l server1 myplaybook.yml
ansible-playbook myplaybook.yml --list-tasks
 --list-hosts
 --list-tags
# run
ansible-playbook myplaybook.yml --start-at-task="Set Up Nginx"
 --tags=mysql,nginx
 --skip-tags=mysql

#vault
ansible-vault create credentials.yml
 encrypt
 view
 edit
 decrypt

ansible-vault create --vault-id dev@prompt credentials_dev.yml
ansible-vault create --vault-id dev@path/to/passfile credentials_dev.yml
ansible-vault edit credentials_dev.yml --vault-id dev@prompt
ansible-playbook myplaybook.yml -vvvv


```

## best practices

 * [ansible playbook best practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#best-practices)

## борьба со сложностью

 * [ошибки новичков или где сложность](https://habr.com/ru/companies/slurm/articles/657727/)
	* вложенные playbook
	* долгие последовательные playbook без тестов
	* плохое документирование
	*
 * что можно переиспользовать в больших командах - [В далекой-далекой Galaxy: как организовать общее пространство для Ansible-контента - 2024](https://habr.com/ru/companies/yadro/articles/817639/)
	* что переиспользовать
		* Inventory нельзя
			* их может быть много — окружения у всех свои
		* Плейбуки нельзя
			* описывают целевые системы и их целевое состояние
		* Роли можно
			* роль должна не зависеть от состояния хостов, inventory и окружения, её можно использовать в любом playbook
			* её можно легко преобразовать в плейбук и отправить коллегам.
		* Коллекции можно
			* В них могут быть тысячи файлов, а нужен какой-то определенный модуль или роль. Нельзя загружать их все
		* модули можно
			* их пишут для конкретной роли. Модули хранятся вместе с ней и там же используются.
			* Их можно вынести в отдельную коллекцию, но коллекция ради одного модуля не имеет смысла.
	* как переиспользовать
		* Когда роли хранятся отдельно от плейбуков, то изменения в плейбуках и ролях могут делать разные люди. Возрастает риск нарваться на мажорные изменения, которые поломают автоматизацию.
		* роли лучше хранить/разрабатывать в git репе, и скачивать через galaxy
		* https://github.com/cookiecutter/cookiecutter
		* [Пишем свой драйвер Molecule без костылей и боли - 2023](https://habr.com/ru/companies/yadro/articles/764906/)
		* при коммите в репозиторий с ролью читаем из meta.yml наборы вида «дистрибутив-версия», где мы должны протестировать роль
		* Molecule — очень прожорливый инструмент, можно исопльзовать Jenkins, но лучше настроить ограничения количества одновременно поднятых виртуалок(worker pool) в Molecule. Так проще искать ошибку в логах.
	* как документировать и каталогизировать
		* https://ansible.readthedocs.io/projects/galaxy-ng/
			* есть UI
			* использует Pulp
			* урезанное проксирование
			* мало документации
			* нельзя работать с ролями, только коллекции
		* https://github.com/briantist/galactory
			* нет UI
			* использует Artifactory
			* удобное проксирование
			* много документации
			* нельзя работать с ролями, только коллекции
		* автогенерация на портале https://github.com/ansible-community/antsibull-docs
			* Sphinx для поиска
			* Jenkins на каждый PR делает из ролей коллекцию, собирает из commit messages CHANGELOG, выгружает в artifactory через galactory

## линтеры

 * YAMLLint
 * ansible-lint
 * ansible-later

## performance

 * gather_facts: no
https://www.redhat.com/sysadmin/faster-ansible-modules
1. Use multiple tasks in a single module and avoid module loops
2. Avoid copy loops and use the synchronize module
3. Use the latest version of Ansible and its modules
4. Make configuration templates
5. Use appropriate modules and avoid using shell or command modules

https://www.redhat.com/sysadmin/faster-ansible-playbook-execution
1. Identify slow tasks with callback plugins
2. Disable fact gathering
3. Configure parallelism
4. Configure SSH optimization
5. Disable host key checking in a dynamic environment
6. Use pipelining
7. Use execution strategies
8. Use async tasks

## install


```bash

#https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments


```

## sec

 * https://docs.ansible.com/ansible/latest/vault_guide/index.html

## facts

 * специальные переменные
 * могут храниться в конфигах и внешних redis/json
 * могут кэшироваться

## plugins

https://docs.ansible.com/ansible/latest/collections/all_plugins.html
