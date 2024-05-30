
## centos7

## [bash](./bash.md)

### urandom

 * [мифы о dev/urandom](https://habr.com/ru/company/mailru/blog/273147)

### iptables

```bash
	systemctl disable firewalld
	yum install iptables-services vnstat dstat nmap mc iotop iftop

	vim /etc/sysconfig/iptables-config
	IPTABLES_SAVE_ON_STOP="yes"   //from no to yes
	IPTABLES_SAVE_ON_RESTART="yes"  //from no to yes
	mv /etc/sysconfig/iptables /etc/sysconfig/iptables.orig
	bash /distr/scripts/iptables.centos7-web-fv.sh
	iptables-save >> /etc/sysconfig/iptables
	yum install iptables-utils iptables-services
	systemctl enable iptables
	systemctl restart iptables

	systemctl enable rc-local.service
	chmod a+x /etc/rc.d/rc.local

	yum install policycoreutils-python
	semanage port -a -t http_port_t  -p tcp 31000
	semanage port -l | grep http_port_t
	semanage port -l | grep ssh_port_t


	mcedit /etc/selinux/config
	##disable
	reboot
```
## php

### php cache

 * [opcache](https://habr.com/ru/company/mailru/blog/310054/#habracut)

### php-fpm переменные окружения

http://habrahabr.ru/post/270359/

```bash
1. Открыть /etc/php.ini
- Заменить
variables_order = "GPCS"
на
variables_order = "EGPCS"
# После этого PHP добавит в глобальное пространство переменные окружения
# http://php.net/manual/ru/ini.core.php#ini.variables-order
2. Открыть /etc/php-fpm.d/www.conf, не путать с /etc/php-fpm.conf (в разных системах может быть в разном месте, это конфиг www-пула процессов для php-fpm.
- Добавить (или заменить, если вдруг есть):
clear_env = no # выключить очистку глобальных переменных для запускаемых воркеров
3. Установить необходимые переменные окружения в /etc/environment (стандартный синтаксис A=B)
4. ln -fs /etc/environment /etc/sysconfig/php-fpm # теперь конфиг переменных окружения сервиса php-fpm будет просто ссылкой на глобальный конфиг
5. systemctl daemon-reload && service php-fpm restart

```





## datetime

 * [datetime](./zabbix#datetime)

## selinux

 * [](./devops.md#security)

## yum rpm

```
yum history list
yum history info 25
yum history undo 25

#weak channel
/etc/yum.conf
timeout=300 # default is 30
minrate=100 # default is 1000

yum --showduplicates list elasticsearch | expand
yum install elasticsearch-5.0.2-1
```

## SSH

 * [https://habr.com/ru/company/vdsina/blog/472746/](Терминальный сервер для админа; Ни единого SSH-разрыва)
 * [Магия SSH](https://habr.com/post/331348/)

```bash
ssh-keygen -b 2048 -t rsa -f /distr/mykey.priv
засылай в редмайн /distr/mykey.priv.pub
заходи от ПОЛЬЗОВАТЕЛЯ:
ssh -p0000 user@11.12.11.12 -i /distr/mykey.priv

```
 * проброс портов
 	* from local to remote `ssh -L LOCAL_PORT:localhost:REMOTE_PORT REMOTE_USER@REMOTE_HOST`
	* from remote to local `ssh -R REMOTE_PORT:localhost:LOCAL_PORT REMOTE_USER@REMOTE_HOST`
	* `ssh -fNL`

## SSHD

```bash
useradd -m user-ssh
passwd user-ssh
passwd
vi /etc/ssh/sshd_config

Ports 0000
AllowUsers user-ssh
PermitRootLogin no
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys

service ssh reload
service ssh restart

mkdir /home/user-ssh/.ssh
cat >> /home/user-ssh/.ssh/authorized_keys
chown -R user-ssh:user-ssh /home/user-ssh
chmod 700 /home/user-ssh/.ssh

```

## LocalTime

```bash
cp /etc/localtime /etc/localtime.oldd
ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime
ll /etc/localtime
#lrwxrwxrwx 1 root root 33 May 13 11:02 /etc/localtime -> /usr/share/zoneinfo/Europe/Moscow
date
#Mon May 13 11:02:16 MSK 2013
cat /etc/adjtime
#0.0 0 0.0
#0
#UTC

```

## iptables

```bash
iptables -L
cat >> iptables.rackspace.sh
#ssh_port=0000

at -f /distr/test.iptables.sh now + 1 min
atq
mcedit iptables.rackspace.sh

```

```bash
# Log dropped outbound packets
iptables -N LOGGING
iptables -A OUTPUT -j LOGGING
iptables -A INPUT -j LOGGING
iptables -A FORWARD -j LOGGING
iptables -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables-Dropped: " --log-level 4
iptables -A LOGGING -j DROP
```

## Repo

IUS depends from EPEL !

```bash

yum install yum-utils


http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/x86_64/epel-release-6-5.noarch.rpm
http://mirror.logol.ru/epel/6/x86_64/epel-release-6-8.noarch.rpm

cd /distr/

wget http://fedora-mirror01.rbc.ru/pub/epel/6/i386/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
cat /etc/yum.repos.d/epel.repo

wget http://dl.iuscommunity.org/pub/ius/stable/CentOS/6/i386/ius-release-1.0-11.ius.centos6.noarch.rpm
rpm -ivh ius-release-1.0-11.ius.centos6.noarch.rpm

wget http://yum.postgresql.org/9.1/redhat/rhel-6-i386/pgdg-centos91-9.1-4.noarch.rpm
rpm -ivh pgdg-centos91-9.1-4.noarch.rpm
mcedit /etc/yum.repos.d/CentOS-Base.repo
exclude=postgres*


#rpm -ivh springdale-core-6-2.sdl6.10.noarch.rpm
#wget http://puias.princeton.edu/data/puias/6/i386/os/RPM-GPG-KEY-puias
#rpm --import RPM-GPG-KEY-puias
#gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-puias
#rpm -ivh springdale-core-6-2.sdl6.10.noarch.rpm
#cat >> /etc/yum.repos.d/puias.repo

#wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
#rpm -ivh rpmforge-release-0.5.3-1.el6.rf.i686.rpm
#mcedit /etc/yum.repos.d/rpmforge.repo

```
