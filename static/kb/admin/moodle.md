# Moodle

## настройка

 * безопастность-уведомления-уведомлять о неудачных попытках входа-админ
 * логин на главной

```
Site Admin > Security > Site Policies > Force users to login
```

 * Заблокировать изменение имени/фамилии
 * http://portal.dulubs.ru/admin/auth_config.php?auth=manual
 * В начало  Администрирование Плагины  Аутентификация  Ручная регистрация
 * оценки за тест по всем ученикам --> вкладка отчёт на тесте
 * добавить группу --> курс - manage - +user - добавить глобальную группу(перед этим переключить её контекст)

```
    Home /    Site administration /    Plugins /    Activity modules /    Manage activities
```
 * отключить изображения пользователей

```
 В начало / ► Администрирование / ► Безопасность / ► Политика безопасности сайта
```

## upgrade

 * http://docs.moodle.org/27/en/Upgrading_to_Moodle_2.7
 * копировать БД и каталог данных
 * выставить права
 * при миграции поменять cfg-wwwrooot в config.php

```bash
su - mo_user -c "cd /home/mo_user/moodle/admin/cli/;php5 maintenance.php --enable"
   $ git pull
su - mo_user -c "cd /home/mo_user/moodle/admin/cli/;php5 upgrade.php"
su - mo_user -c "cd /home/mo_user/moodle/admin/cli/;php5 maintenance.php --disable"
```

## links

 * http://docs.moodle.org/25/en/Installing_Moodle
 * http://blog.jimvdesign.com/2012/03/https-only-moodle-with-nginx.html
 * http://wiki.rsu.edu.ru/wiki/%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0_%D0%B8_%D0%BD%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0_%D1%81%D1%80%D0%B5%D0%B4%D1%8B_%D0%B4%D0%B8%D1%81%D1%82%D0%B0%D0%BD%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE_%D0%BE%D0%B1%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D1%8F
 * https://library.linode.com/lemp-guides/centos-6
 * http://rudw0lf.ru/nginx-2/nastrojka-keshirovaniya-staticheskogo-kontenta-v-moodle/
 * https://github.com/arthurfurlan/nginx-config-templates/blob/master/moodle.conf
 * https://moodle.org/mod/forum/discuss.php?d=188653&parent=938804
 * http://docs.moodle.org/24/en/Performance_recommendations

## safe install web

 * disable 80 port
 * set URI/domain to local IP in hosts
 * enable 80 port
 * migrate URI/domain

## moodle setup

 * Check Memory Limit:  40M.
 * Increase MaxClients Memory Limit
 * MaxClients = Total available memory * 80% / Max memory usage of apache process
 * Note: don’t be tempted to increase the MaxClients value above 256 or your available RAM, this would allow your server to consume more memory and swap to disk.


## ----

```bash
aptitude install php5-common php5-cli php5-gd nginx php5-curl php5-xmlrpc php5-fpm php5-xcache php5-pgsql php5-intl
usermod -s /sbin/nologin www-data
useradd -s /sbin/nologin -m mo_user

wget https://download.moodle.org/stable27/moodle-latest-27.tgz.md5
md5sum -c moodle-latest-27.tgz.md5
tar -xf moodle-latest-27.tgz
mv moodle /home/mo_user/
rm /home/mo_user/moodle/*.txt

mkdir /home/mo_user/mo_data
chown -R mo_user:www-data /home/mo_user/
chmod -R u=rwX,g=rwX,o=rX /home/mo_user/mo_data
chmod -R u=rwX,g=rX,o=rX /home/mo_user/moodle

##!!!на время установки - дл ясоздания файла config.php
chmod -R u=rwX,g=rwX,o=rX /home/mo_user/moodle

```

 * (files are owned by the administrator/superuser and are only writeable by them - readable by everyone else)
 * If you want to use the built-in plugin installer you need to make the directory writable by web server user.
 * It is strongly recommended to use ACL when your server supports it, for example if your Apache 
 * server uses account www-data:

```bash
chmod -R +a "www-data allow read,delete,write,append,file_inherit,directory_inherit" /home/mo_user/moodle
```


If you are planning to execute PHP scripts from the command line you should set the same permissions 
for the current user:

```bash
sudo chmod -R +a "mo_user allow read,delete,write,append,file_inherit,directory_inherit" /home/mo_user/mo_data

su - postgres -c "createuser --pwprompt --encrypted --no-adduser --no-createdb --no-createrole --no-inherit mo_user"
su - postgres -c "createdb --encoding=UNICODE --owner=mo_user mo_db"
su - postgres -c "psql -U mo_user mo_db"

echo -E "#!/bin/bash\n/usr/bin/php /home/mo_user/moodle/admin/cli/cron.php" >> /distr/conf/moodle_cron.sh
chmod 0755 /distr/conf/moodle_cron.sh

###вариант из командной строки, н олучше закрыть 80 порт и вытащить его туннелем!!!
usermod -s /bin/bash www-data
su - mo_user -c "cd /path/to/moodle/admin/cli; /usr/bin/php install.php"
usermod -s /sbin/nologin www-data
```

## OpenMeetings Plugin

 * mkdir /usr/local/src/moodle/plugins/om/
 * cd /usr/local/src/moodle/plugins/om/
 * wget http://mirror.quintex.com/apache/incubator/openmeetings/moodle-plugin-1.4-incubating/apache-openmeetings-moodle-plugin-incubating-1.4.tar.gz
 * После этого нужно указать учетные данные администратора OpenMeetings в интерфейсе настроек планига в Moodle 
