
## mutt

http://xgu.ru/wiki/%D0%9E%D1%82%D0%BF%D1%80%D0%B0%D0%B2%D0%BA%D0%B0_e-mail_%D0%B8%D0%B7_%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B2

 * после установки необходимо запустить mutt, чтобы он создал ~/Mail 
 * при запуске указывать su -

```bash
~> cat /etc/rc.local
#!/bin/sh -e
su - root -c "/bin/bash /path/boot_mail.sh"

# cat /distr/scripts/boot_mail.sh
#!/bin/bash
msg="server `hostname` boot `date`"
echo $msg | /usr/bin/tee -a /root/mutt_boot.log
echo $msg | /usr/bin/mutt -e 'set from="`hostname` <donotreply@mailserver.ru>"' -e 'set envelope_from=yes' -s "$msg" mailuser@mailserver.ru | /usr/bin/tee -a /root/mutt_boot.log


#Переменные для автозагрузки(оказались не нужны):
set HOME="/root"
set mbox_type=maildir
set folder="$HOME/Maildir/"
set spoolfile="$HOME/Maildir/"
set record="+sent/"
set postponed="+drafts/"
```

```bash
%$ cat message.txt | mutt -e 'set from="Name From <from@email.ru>"' -e 'set envelope_from=yes' -a file.1 -a file.2 -s 'Subject' to@email.ru

где: -a  -- вкладываемые файлы (может быть несколько)
     -e  -- параметры в командной строке, используемые в muttrc (может быть несколько)
        from  -- обратный адрес в письме (по умолчанию текущий_пользователь@имя_системы)
        envelope_from  -- если "yes", в параметры обратного адреса для SMTP передаётся обратный адрес из "from",
                           (не работает со старыми версиями sendmail)


Реальный пример, debian 6 -- отправить текст из файла body.txt и вложением все файлы-письма по маске *.eml:

$/usr/bin/mutt -x -e 'set from=from@email.ru' -s 'Subject email' to@email.ru -a *.eml < body.txt

```

## mailx

```bash
These are some of the mail command:

deleting mail in Unix

type mail

d * will remove all mail

d 1 3 deletes the 1st and 3rd messages
d 1-3 deletes messages 1 through 3
d * deletes all your messages
d deletes the current message

Usage:
? print this help message
# display message number #
- print previous
+ next (no delete)
! cmd execute cmd
<CR> next (no delete)
a position at and read newly arrived mail
d [#] delete message # (default current message)
dp delete current message and print the next
dq delete current message and exit
h a display all headers
h d display headers of letters scheduled for deletion
h [#] display headers around # (default current message)
m user mail (and delete) current message to user
n next (no delete)
p print (override any warnings of binary content)
P override default 'brief' mode and display ALL header lines
q, ^D quit
r [args] reply to (and delete) current letter via mail [args]
s [files] save (and delete) current message (default mbox)
u [#] undelete message # (default current message)
w [files] save (and delete) current message without header
x exit without changing mail
y [files] save (and delete) current message (default mbox)
```

## exim

### exim_on_centos

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
route_list = “* mail1.example.com:mail2.example.com;”

Перезапуск exim:

service exim restart

Тестирование работы почты:

echo “test” |mail -s “$HOSTNAME” user@example.com

Для сброса очереди Exim и просмотра лог-файла:

exim -qff ; tail -f /var/log/exim/main.log
```

### exim on debian


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