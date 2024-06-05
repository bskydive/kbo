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
