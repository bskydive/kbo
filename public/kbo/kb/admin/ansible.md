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
* IaaS(vps)/SaaS(managed) - google, M$, AWS, Y, M, $ber, MT$
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
* node - подчинённый узел

### основной конфиг

 * https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html

```bash
ansible-config -h
#  -t {all,base,become,cache,callback,cliconf,connection,httpapi,inventory,lookup,netconf,shell,vars}, --type {all,base,become,cache,callback,cliconf,connection,httpapi,inventory,lookup,netconf,shell,vars}
#                        Filter down to a specific plugin type.
#  -f {ini,env,vars} Output format for init
#  --disabled Prefixes all entries with a comment character to disable them

ansible-config init --disabled -t all > .ansible.cfg

#[defaults]
#nocows=1
#deprecation_warnings=false

```
 * configuration file will be searched in the following order:
	* `ANSIBLE_CONFIG` (environment variable if set)
	* `ansible.cfg` (in the current directory)
	* `~/.ansible.cfg` (in the home directory)
	* `/etc/ansible/ansible.cfg`
 * Ansible will not automatically load a config file from the current working directory if the directory is world-writable
 * https://stackoverflow.com/questions/35969668/ansible-path-to-ansible-cfg
```bash
ansible --version
#ansible [core 2.17.1]
#  config file = /home/ansible/.ansible.cfg
#  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
#  ansible python module location = /home/ansible/venv3-ansible/lib/python3.12/site-packages/ansible
#  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
#  executable location = /home/ansible/venv3-ansible/bin/ansible
#  python version = 3.12.3 (main, Apr 10 2024, 05:33:47) [GCC 13.2.0] (/home/ansible/venv3-ansible/bin/python3)
#  jinja version = 3.1.4
#  libyaml = True
```

### дерево конфигов

 * https://dev.to/admantium/ansible-idempotent-playbooks-4e67

```
├── ansible.cfg
├── host_vars
│   ├── raspi-3-1.yml
│   ├── ...
├── group_vars
├── roles
│   ├── consul
│   ├── docker-arch
│   ├── docker-arm
│   ├── nfs-client
│   ├── nfs-server
│   └── nomad
├── scripts
│   ├── consul
│   ├── nomad
│       ├── configs
│       ├── jobs
│   ├── system
│       ├── update_packages.yaml
│   ├── tutorial
│   └── uninstall
├── hosts
└── site.yml

```

### facts

 * параметры системы
 * собираются автоматически перед запуском playbook

```bash

ansible -m setup # посмотреть какие факты собираются
ansible -m ansible.builtin.setup


```

### Inventory

 * https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups

```yaml
# описание nodes
# /etc/ansible/hosts
# ENV
atlanta:
  hosts:
    host1:
      http_port: 80
      maxRequestsPerChild: 808
    host2:
      http_port: 303			# alias
      maxRequestsPerChild: 909	# alias
	  ansible_port: 5555		# alias
      ansible_host: 192.0.2.50	# alias
ungrouped:
  hosts:
    mail.example.com:
webservers:
  hosts:
    foo.example.com:
    bar.example.com:
dbservers:
  hosts:
    one.example.com:
    two.example.com:
    three.example.com:
east:
  hosts:
    foo.example.com:
    one.example.com:
    two.example.com:
west:
  hosts:
    bar.example.com:
    three.example.com:
prod:
  children:
    east:
test:
  children:
    west:
usa:
  children:
    southeast:
      children:
        atlanta:
          hosts:
            host1:
            host2:
        raleigh:
          hosts:
            host2:
            host3:
      vars:
        some_server: foo.southeast.example.com
        halon_system_timeout: 30
        self_destruct_countdown: 60
        escape_pods: 2
    northeast:
    northwest:
    southwest:
```
 * https://docs.ansible.com/ansible/latest/inventory_guide/intro_inventory.html#how-variables-are-merged
    * all group (because it is the 'parent' of all other groups)
    * parent group
    * child group
    * host

 *
```bash
ll myinventory/
  01-openstack.yml          # configure inventory plugin to get hosts from OpenStack cloud
  02-dynamic-inventory.py   # add additional hosts with dynamic inventory script
  03-on-prem                # add static hosts and groups
  04-groups-of-groups       # add parent groups

ansible -i myinventory

```

### модули

 * скрипты, команды cli

### плагины

 * шаблоны настроек для модулей

### Плейбуки

 * связывают inventory, role, collection

### Роли

 * набор для конкретного действия

```bash

cat requirements.yml
  roles:
    # Install a role from Ansible Galaxy.
    - name: geerlingguy.java
      version: "1.9.6" # note that ranges are not supported for roles
ansible-galaxy install -r requirements.yml
ansible-galaxy role install -r
```

### Коллекции

 * набор ролей, модулей, плагинов
 * пространство имён
 * https://docs.ansible.com/ansible/latest/collections_guide/collections_installing.html

```bash

ansible-galaxy collection install <namespace.collection>
ansible-galaxy collection install my_namespace.my_collection --upgrade
ansible-galaxy collection install my_namespace-my_collection-1.0.0.tar.gz -p ./collections
ansible-galaxy collection install my_namespace.my_collection:==1.0.0-beta.1
ansible-galaxy collection install 'my_namespace.my_collection:>=1.0.0,<2.0.0'

cat requirements.yml

  collections:
  # With just the collection name
  - my_namespace.my_collection
  # With the collection name, version, and source options
  - name: my_namespace.my_other_collection
    version: ">=1.2.0" # Version range identifiers (default: ``*``)
    source: ... # The Galaxy URL to pull the collection from (default: ``--api-server`` from cmdline)
    type: galaxy
    signatures:
      - https://examplehost.com/detached_signature.asc
      - file:///path/to/local/detached_signature.asc
  - name: https://github.com/organization/repo_name.git
    type: git
    version: devel

ansible-galaxy install -r requirements.yml
ansible-galaxy collection install -r

ansible-galaxy collection install /path/to/ns -p ./collections
# ns/
# ├── collection1/
# │   ├── MANIFEST.json
# │   └── plugins/
# └── collection2/
#     ├── galaxy.yml
#     └── plugins/
```

### примеры cli

 * жёлтый - цвет тревоги, зелёный - без изменений

```bash
# -a - argument
# module ping
ansible all -m ping --private-key=~/.ssh/custom_id -u user
# exec
ansible all -a "uname -a"
ansible all -m shell -a "uname -a"
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

 * `protocol error: file name does not match request` - remote file name requires quotes to escape spaces or non-ascii characters
	* If you must use SCP, set the -T arg to tell the SCP client to ignore path validation. You can do this in one of three ways:
	* Set a host variable or group variable: ansible_scp_extra_args=-T,
	* Export or pass an environment variable: ANSIBLE_SCP_EXTRA_ARGS=-T
	* Modify your ansible.cfg file: add scp_extra_args=-T to the \[ssh_connection\] section

### примеры логики

```handlebars
{{ hostvars[inventory_hostname]['somevar_' ~ other_var] }}
{{ lookup('vars', 'somevar_' ~ other_var) }}
original_host: "{{ hostvars[inventory_hostname]['ansible_host']['ansible_port']['ansible_user'] }}"

```

## best practices

 * [ansible playbook best practices](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html#best-practices)
 * стремимся к идемпотентости, повторяемости
	* используем общепринятые модули - проверить, что они идемпотентны, покрыты тестами
	* накатываем на чистое состояние
	* пишем тесты
	* проверяем/очищаем состояние перед действием
	* логируем действия, конфиги, окружение, состояния, версии
 * ansible ограничивает кол-во worker(EE - execution envinronment)
	* --forks

## борьба со сложностью

 * [ошибки новичков или где сложность](https://habr.com/ru/companies/slurm/articles/657727/)
	* вложенные playbook
	* долгие последовательные playbook без тестов
	* плохое документирование
	*
 * что можно переиспользовать в больших командах - [В далекой-далекой Galaxy: как организовать общее пространство для Ansible-контента - 2024](https://habr.com/ru/companies/yadro/articles/817639/)
	* что нельзя переиспользовать
		* Inventory
			* их может быть много — окружения у всех свои
		* Плейбуки
			* описывают целевые системы и их целевое состояние
			* связан с inventory
	* что можно переиспользовать
		* Роли
			* роль должна не зависеть от состояния хостов, inventory и окружения, её можно использовать в любом playbook
			* её можно легко преобразовать в плейбук и отправить коллегам.
		* Коллекции
			* В них могут быть тысячи файлов, а нужен какой-то определенный модуль или роль. Нельзя загружать их все
		* модули
			* их пишут для конкретной роли. Модули хранятся вместе с ней и там же используются.
			* Их можно вынести в отдельную коллекцию, но коллекция ради одного модуля не имеет смысла.
	* как переиспользовать
		* Когда роли хранятся отдельно от плейбуков, то изменения в плейбуках и ролях могут делать разные люди. Возрастает риск нарваться на мажорные изменения, которые поломают автоматизацию.
		* роли лучше хранить/разрабатывать в git репе, и скачивать через galaxy
		* https://github.com/cookiecutter/cookiecutter
		* [Пишем свой драйвер Molecule без костылей и боли - 2023](https://habr.com/ru/companies/yadro/articles/764906/)
		* при коммите в репозиторий с ролью читаем из meta.yml наборы вида «дистрибутив-версия», где мы должны протестировать роль
		* Molecule — очень прожорливый инструмент, можно использовать Jenkins, но лучше настроить ограничения количества одновременно поднятых виртуалок(worker pool) в Molecule. Так проще искать ошибку в логах.
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
 * тестирование конфигов https://ansible.readthedocs.io/projects/molecule/


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
python3 -m pip install --user ansible
# error: externally-managed-environment
#
# × This environment is externally managed
# ╰─> To install Python packages system-wide, try apt install
#     python3-xyz, where xyz is the package you are trying to
#     install.
#
#     If you wish to install a non-Debian-packaged Python package,
#     create a virtual environment using python3 -m venv path/to/venv.
#     Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
#     sure you have python3-full installed.
#
#     If you wish to install a non-Debian packaged Python application,
#     it may be easiest to use pipx install xyz, which will manage a
#     virtual environment for you. Make sure you have pipx installed.
#
#     See /usr/share/doc/python3.12/README.venv for more information.
#
# note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
# hint: See PEP 668 for the detailed specification.

aptitude install python3-venv python3-pip
useradd -m -s /bin/bash ansible
su - ansible
ssh-keygen -t rsa -b 4096
cat >> ~/.profile
#source ${HOME}/venv3-ansible/bin/activate
bash
python3 -m pip install ansible
python3 -m pip install argcomplete
ansible-config init --disabled -t all > .ansible.cfg
mcedit .ansible.cfg
#[defaults]
#nocows=1
#deprecation_warnings=false

```
 * https://kislyuk.github.io/argcomplete/
 * [Ansible для начинающих - 2023](https://habr.com/ru/companies/slurm/articles/714000/)
 * https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#control-node-requirements
 * https://4sysops.com/archives/how-to-deploy-ansible-inside-a-docker-container/
```yaml
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y gcc python-dev libkrb5-dev && \
  apt-get install python3-pip -y && \
  pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install pywinrm[kerberos] && \
  apt install krb5-user -y && \
  pip3 install pywinrm && \
  pip3 install ansible
```

 * [runner in docker](https://ansible.readthedocs.io/en/latest/getting_started_ee/)

```bash

#https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/#create-and-use-virtual-environments

docker pull alpinelinux/ansible

```

## security

 * https://docs.ansible.com/ansible/latest/vault_guide/index.html

```bash
ansible --user root --become --become-user user --become-method su --ask-become-pass

```
## facts

 * специальные переменные
 * могут храниться в конфигах и внешних redis/json
 * могут кэшироваться

## plugins

https://docs.ansible.com/ansible/latest/collections/all_plugins.html


## ansible aws

 * https://docs.ansible.com/ansible/latest/collections/amazon/aws/index.html#description
 * https://docs.ansible.com/ansible/latest/collections/amazon/aws/docsite/aws_ec2_guide.html#minimal-example

```yaml
# Простейший пример подготовки инфраструктуры
- amazon.aws.ec2:
    key_name: mykey
    instance_type: t2.micro
    image: ami-123456
    wait: yes
    group: webserver
    count: 3
    vpc_subnet_id: subnet-29e63245
    assign_public_ip: yes
```

