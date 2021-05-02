# Exim


## exim_on_centos

http://worm.org.ua/2011/10/exim-centos/

```bash
yum install exim
yum install system-switch-mail

Переключение МТА на Exim и автоматический запуск при старте системы:

system-switch-mail
service sendmail stop
service exim start
chkconfig exim on
chkconfig sendmail off

Добавление root alias, например, «root@example.com»:

vi /etc/aliases

Для добавление некоторых настроек в раздел роутеров, если почту необходимо отправлять через смарт-хост, необходимо сделать правки в конфигурации /etc/exim/exim.conf:

to_smart_host:
driver = manualroute
domains = ! +local_domains
transport = remote_smtp
route_list = "* mail1.example.com:mail2.example.com;"

Перезапуск exim:

service exim restart

Тестирование работы почты:

echo "test" |mail -s "$HOSTNAME" user@example.com

Для сброса очереди Exim и просмотра лог-файла:

exim -qff ; tail -f /var/log/exim/main.log
```

## exim on debian


```bash

aptitude install exim4
The following NEW packages will be installed:
exim4 exim4-base{a} exim4-config{a} exim4-daemon-light{a} heirloom-mailx{a}
0 packages upgraded, 5 newly installed, 0 to remove and 1 not upgraded.
Need to get 2,415 kB of archives. After unpacking 4,390 kB will be used.
```

```bash
В файле конфигурации php поправим sendmail_path.

В Debian: /etc/php5/apache2/php.ini или /etc/php4/apache2/php.ini

< в других дистрибутивах >

sendmail_path = /usr/sbin/exim4 -t

Теперь необходимо настроить exim:

$ dpkg-reconfigure exim4-config

В появившемся диалоговом окне вам будут задавать вопросы. На первый (Общий тип почтовой конфигурации) отвечаем:

интернет-сайт; прием и отправка почты напрямую, используя SMTP.

А далее просто жмем Enter до конца настройки. Теперь все должно работать.

Проверка

Для проверки создайте простой php скриптик:

$ cat testmail.php
<?php
   mail('komu@mail.ru', 'тема письма', 'тело письма', 'From: ot.kogo@mail.ru');
?>

и запустите его на выполнение:

$ php testmail.php

```
