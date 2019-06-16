#  Security



##  общие советы

https://digitalguardian.com/blog/101-data-protection-tips-how-keep-your-passwords-financial-personal-information-safe


##  passwords


* https://habrahabr.ru/company/cloud4y/blog/347952/
* https://habrahabr.ru/company/1cloud/blog/344972/
* https://habrahabr.ru/post/325298/
* hashcat
* md5crack
* john the ripper
* https://www.passwords.ru/
* https://habrahabr.ru/company/1cloud/blog/344972/?
* https://habrahabr.ru/post/325298/



##  ssl/tls

https://cyberdeveloper.pro/?p=248
https://cyberdeveloper.pro/?p=287

## fail2ban

 * https://habr.com/post/236859/

## zip-bomb

 * [подарок из правого носка](https://habr.com/post/272261/)

```bash
dd bs=1024 count=1572864 </dev/urandom >mydummy 
echo -ne \\x50\\x4b\\x03\\x04\\x14\\x00\\x00\\x00\\x08\\x00 | dd conv=notrunc bs=1 count=10 of=mydummy

location ~* "^/(archive|auth|backup|clients|com|dat|dump|engine|files|home|html|index|master|media|my|mysql|old|site|sql|website|wordpress)\.zip$" {
	access_log /usr/local/nginx/logs/dummy.log;
	default_type application/zip;
	root /usr/local/nginx/html/dummy;
	rewrite ^(.*)$ /mydummy break;
	max_ranges 0;#запрещает «докачку»
	limit_rate 4k;# ограничивает скорость скачивания
	include param/zone1rs;#Зона, где разрешен 1 коннект на 1 ип. В разных версиях nginx свой листинг. Главное — limit_conn one 1;, где one это имя вашей зоны.
}

```

* https://habr.com/post/119676/
* https://xakep.ru/2015/09/03/png-bomb/
* http://www.unforgettable.dk/

## proxy

127.0.0.1 blackhole.beeline.ru

```php
<?php
	if ($_GET['url']!=''){
		$webProxy="http://www.webproxy.net/view?q=";
		print '<html><head><title>Ола-ла! Блокировочка)</title><meta http-equiv="content-type" content="text/html; charset=utf-8" /></head><body>';
		print 'Ола-ла! Блокировочка)<br>';
		print $_GET['url'] . '<br>';
		print '<a href="'. $webProxy . urldecode($_GET['url']) . '">открыть в web proxy</a>';
		print "</body></html>";
		exit;
	}
?>
```

## сканирование интернет

* [кто сканирует интернет](https://habr.com/post/358056/)
* shodan
* [Проверка поискового робота google](https://support.google.com/webmasters/answer/80553?hl=ru)
* https://github.com/roccomuso/is-google

##  openvpn

https://habrahabr.ru/post/324770/

```bash
#Создаем новый сертификат:
openssl x509 -in ca.crt -days 3650 -out ca-new.crt -signkey ca.key
#Получаем ответ:
##Getting Private key и новый сертификат ca-new.crt Выполним проверку сертификата клиента новым корневым сертификатом:
openssl verify -CAfile ca-new.crt client9.crt
#Все хорошо:
##client9.crt: OK
#Следующей командой можно посмотреть содержимое сертификата и убедиться что у нового и старого сертификата Modulus одинаков:
openssl x509 -noout -text -in ca-new.crt
#Все вроде бы очень хорошо, рассылаем новый сертификат, предварительно переименовав его по образу старого с инструкцией пользователю куда его подложить (перезаписываем старый).
#Перезапускаем службу на сервере и смотрим как подключатся клиенты. К сожалению не все клиенты это сделали успешно. У некоторых в логе получили:
##Tue Mar 21 15:12:18 2017 VERIFY ERROR: depth=1, error=certificate signature failure: /C=RU...
#Вот здесь пришлось потерять несколько часов, в итоге выяснилось что на клиентских компьютерах также не срабатывает проверка сертификата клиента:
openssl verify -CAfile ca-new.crt client9.crt
#Версия openssl (в составе OpenVPN ) оказалась старая и не хотела успешно проверять.
#Соответственно у проблемных клиентов пришлось обновить OpenVPN до версии 2.3.3 (такая использовалась у меня, 
#про другие ничего сказать не могу, но полагаю что более новые версии также будут вести себя положительно) и система отправлена в плавание еще на 10 лет.

```


##  Юристы

http://www.tsarev.biz/

##  восстановление после взлома

https://habrahabr.ru/post/318126

```

Возможно конечно подменить… но помимо того что уже сказали что систему надо в идеале переставить, если это не возможно то надо сделать так:
1. Загрузиться с live-cd потом выполнить
rpm --root /mnt/hacked_system_root_directory -Va

2. Если видно что файлы(binary/lib) изменены, то переустановить пакет:
rpm --root /mnt/hacked_system_root_directory -qf /пусть_до_измененного_файла_вместе_с_именем_файла
rpm --root /mnt/hacked_system_root_directory -ivh --force имя-пакета.rpm

понятное дело что пакет должен быть той же версии что и установленный ну или более свежей, тут главное чтоб зависимости не ломали ничего.

Если много что надо так менять имеет смысл использовать yumdownloader + yum --installroot=/mnt/hacked_system_root_directory localinstall package1 package2…

```

##  ФЗ152 сбор персданных

* https://habrahabr.ru/company/cloud4y/blog/352178/
* https://habrahabr.ru/company/ruvds/blog/283216/
* [мифы о 152-фз](https://habr.com/ru/company/dataline/blog/446696/)

## GDPR

 * https://vc.ru/38251-gdpr-vstupaet-v-silu-cherez-nedelyu-25-maya-chto-eto-takoe-kogo-kosnetsya-i-kak-bystro-podgotovitsya

##  selinux

```bash
getenforce
yum install policycoreutils-python
semanage
```

 * https://habrahabr.ru/post/322904/
 * https://www.digitalocean.com/community/tutorials/an-introduction-to-selinux-on-centos-7-part-2-files-and-processes
 * https://n40lab.wordpress.com/2015/04/13/centos-7-installing-nginx-phusion-passenger/
 * https://wiki.gentoo.org/wiki/SELinux/Tutorials/Where_to_find_SELinux_permission_denial_details

```bash
#логи ищутся в /var/log/avc.log или, если включен auditd, в логах auditd (/var/log/audit/audit.log)
#есть более удобные инструменты типа setroubleshootd и sealert, как с ними работать, там толком не указано, сейчас посмотрю у себя на стенде.

[] ausearch -m avc --start today
#----
#time->Sat Dec  5 03:16:48 2015
#type=PATH msg=audit(1449296208.222:52): item=2 name=(null) inode=32671 dev=fd:00 mode=0100755 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:ld_so_t:s0 nametype=NORMAL
#type=PATH msg=audit(1449296208.222:52): item=1 name=(null) inode=21659 dev=fd:00 mode=0100755 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:bin_t:s0 nametype=NORMAL
#type=PATH msg=audit(1449296208.222:52): item=0 name="/usr/sbin/setroubleshootd" inode=55079 dev=fd:00 mode=0100755 ouid=0 ogid=0 rdev=00:00 #obj=system_u:object_r:setroubleshootd_exec_t:s0 nametype=NORMAL
#type=CWD msg=audit(1449296208.222:52):  cwd="/"
#type=EXECVE msg=audit(1449296208.222:52): argc=3 a0="/usr/bin/python" a1="-Es" a2="/usr/sbin/setroubleshootd"
#type=EXECVE msg=audit(1449296208.222:52): argc=5 a0="/usr/bin/python" a1="-Es" a2="/usr/sbin/setroubleshootd" a3="-f"
#type=SYSCALL msg=audit(1449296208.222:52): arch=40000003 syscall=11 success=yes exit=0 a0=8c27bf0 a1=8c27460 a2=8c27008 a3=8c2a160 items=3 ppid=1935 pid=1936 #auid=4294967295 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=(none) ses=4294967295 comm="setroubleshootd" exe="/usr/bin/python" #subj=system_u:system_r:setroubleshootd_t:s0-s0:c0.c1023 key=(null)
#type=AVC msg=audit(1449296208.222:52): avc:  denied  { noatsecure } for  pid=1936 comm="setroubleshootd" scontext=system_u:system_r:system_dbusd_t:s0-s0:c0.c1023 #tcontext=system_u:system_r:setroubleshootd_t:s0-s0:c0.c1023 tclass=process
#type=AVC msg=audit(1449296208.222:52): avc:  denied  { siginh } for  pid=1936 comm="setroubleshootd" scontext=system_u:system_r:system_dbusd_t:s0-s0:c0.c1023 #tcontext=system_u:system_r:setroubleshootd_t:s0-s0:c0.c1023 tclass=process
#type=AVC msg=audit(1449296208.222:52): avc:  denied  { rlimitinh } for  pid=1936 comm="setroubleshootd" scontext=system_u:system_r:system_dbusd_t:s0-s0:c0.c1023 #tcontext=system_u:system_r:setroubleshootd_t:s0-s0:c0.c1023 tclass=process
#----
#.... и так далее ...
#
#Ошибки доступа в permissive mode можно видеть через ausearch - утилиту, поставляющуюся в комплекте с auditd.
#теперь смотрю, как добиться более внятных "подсказок" от sealert
#И еще, насколько я понял, то сообщения от selinux появляются в логах auditd не сразу, а с некоторой задержкой, хотя возможно я неправ и надо проверять
#Пока не могу добиться выдачи чего-то внятного от sealert
#По идее, чтобы вывести все предупреждения, нужно выполнить
[] sealert -l *

#1. Правим в конфиге апача директиву:
Listen 10000
#ожидаем, что СЕЛинукс возбудится на попытку открыть "не тот" порт "не тем" процессом
#2. запускаем апач
#3. смотрим что по логам натворилось. Сначала по логам auditd (туда оно запишется в любом случае, даже если у тебя не стоит setroubleshoot)

[] ausearch -m avc --start recent
----
time->Sat Dec  5 03:39:19 2015
type=SOCKADDR msg=audit(1449297559.868:77): saddr=0A002710000000000000000000000000000000000000000000000000
type=SOCKETCALL msg=audit(1449297559.868:77): nargs=3 a0=4 a1=9887a0 a2=1c
type=SYSCALL msg=audit(1449297559.868:77): arch=40000003 syscall=102 success=yes exit=0 a0=2 a1=bf9e5100 a2=22f3a4 a3=988778 items=0 ppid=2756 pid=2757 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts1 ses=3 comm="httpd" exe="/usr/sbin/httpd" subj=unconfined_u:system_r:httpd_t:s0 key=(null)
type=AVC msg=audit(1449297559.868:77): avc:  denied  { name_bind } for  pid=2757 comm="httpd" src=10000 scontext=unconfined_u:system_r:httpd_t:s0 tcontext=system_u:object_r:port_t:s0 tclass=tcp_socket

#Т.е. ошибка уже отражена, но крайне херово читаема, в принципе как и все, что по умолчанию пишет auditd
#4. Если в системе стоит setroubleshoot, то этот демон пишет сообщения в /var/log/messages (по умолчанию так, я не знаю на каком syslog facility/priority эти сообщения приходят - но их всегда можно завернуть в другой лог)

[] tail /var/log/messages
Dec  5 03:39:20 CentOS6 setroubleshoot: SELinux is preventing /usr/sbin/httpd from name_bind access on the tcp_socket . For complete SELinux messages. run sealert -l 94e5ed86-f6b3-44bd-bc86-1afe3d4e677f

#Дальше запускаем собственно то, что он нам советует:

[] sealert -l 94e5ed86-f6b3-44bd-bc86-1afe3d4e677f
SELinux is preventing /usr/sbin/httpd from name_bind access on the tcp_socket .

  Plugin bind_ports (92.2 confidence) suggests  ********************

If you want to allow /usr/sbin/httpd to bind to network port 10000
Then you need to modify the port type.
Do
[] semanage port -a -t PORT_TYPE -p tcp 10000
    where PORT_TYPE is one of the following: ntop_port_t, http_cache_port_t, http_port_t, puppet_port_t, jboss_messaging_port_t, jboss_management_port_t.

  Plugin catchall_boolean (7.83 confidence) suggests  **************

If you want to allow system to run with NIS
Then you must tell SELinux about this by enabling the 'allow_ypbind'boolean.
Do
setsebool -P allow_ypbind 1

  Plugin catchall (1.41 confidence) suggests  **********************

If you believe that httpd should be allowed name_bind access on the  tcp_socket by default.
Then you should report this as a bug.
You can generate a local policy module to allow this access.
Do
allow this access for now by executing:
[] grep httpd /var/log/audit/audit.log | audit2allow -M mypol
[] semodule -i mypol.pp


Additional Information:
Source Context                unconfined_u:system_r:httpd_t:s0
Target Context                system_u:object_r:port_t:s0
Target Objects                 [ tcp_socket ]
Source                        httpd
Source Path                   /usr/sbin/httpd
Port                          10000
Host                          CentOS6
Source RPM Packages           httpd-2.2.15-39.el6.centos.i686
Target RPM Packages
Policy RPM                    selinux-policy-3.7.19-260.el6_6.5.noarch
Selinux Enabled               True
Policy Type                   targeted
Enforcing Mode                Permissive
Host Name                     CentOS6
Platform                      Linux CentOS6 2.6.32-504.30.3.el6.i686 #1
                              SMP Wed Jul 15 10:55:56 UTC 2015 i686 i686
Alert Count                   1
First Seen                    Sat Dec  5 03:39:19 2015
Last Seen                     Sat Dec  5 03:39:19 2015
Local ID                      94e5ed86-f6b3-44bd-bc86-1afe3d4e677f

Raw Audit Messages
type=AVC msg=audit(1449297559.868:77): avc:  denied  { name_bind } for  pid=2757 comm="httpd" src=10000 scontext=unconfined_u:system_r:httpd_t:s0 tcontext=system_u:object_r:port_t:s0 tclass=tcp_socket


type=SYSCALL msg=audit(1449297559.868:77): arch=i386 syscall=socketcall success=yes exit=0 a0=2 a1=bf9e5100 a2=22f3a4 a3=988778 items=0 ppid=2756 pid=2757 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts1 ses=3 comm=httpd exe=/usr/sbin/httpd subj=unconfined_u:system_r:httpd_t:s0 key=(null)

Hash: httpd,httpd_t,port_t,tcp_socket,name_bind

audit2allow

#============= httpd_t ==============

#!!!! This avc can be allowed using the boolean 'allow_ypbind'
allow httpd_t port_t:tcp_socket name_bind;

audit2allow -R

#============= httpd_t ==============

#!!!! This avc can be allowed using the boolean 'allow_ypbind'
allow httpd_t port_t:tcp_socket name_bind;
```

##  BIOS

###  UEFI secure boot

http://habrahabr.ru/post/273497/
https://habrahabr.ru/post/308032/
https://habrahabr.ru/post/266935/
https://habrahabr.ru/users/coderush/
https://habrahabr.ru/company/dsec/blog/326556/

###  intel AMT device remote control

https://habrahabr.ru/post/283146/

##  Сбор данных по соц. сетям

конкурентная разведка

http://www.securitylab.ru/analytics/477229.php

##  drweb live usb

/root/.wine/drive_c/users/root/Doctor Web/cureit.log

##  secure chat

https://threema.ch/

##  отказ от апгрейда

http://geektimes.ru/post/269070/

##  сбор данных Windows

http://habrahabr.ru/post/267507/

http://www.adme.ru/zhizn-nauka/6-ssylok-chtoby-proverit-chto-znaet-o-nas-internet-857410/


http://www.computerra.ru/131424/windows-7-8-10-spy-features/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ct_news+%28Computerra%29

```

Андрей Васильков Компьютерра

Список IP-адресов, на которые выполняется фоновая отправка данных (пополняемый):
104.47.153.35
104.75.53.17
104.82.10.129
108.162.232.199
111.221.29.*
131.253.*.*
134.170.*.*
137.116.81.24
137.117.235.16
137.135.8.42
138.91.246.237
157.55.*.*
157.56.*.*
162.159.241.165
168.63.108.233
184.86.56.12
185.13.160.61
191.232.*.*
191.237.208.126
195.12.232.155
2.20.254.89
2.22.42.122
2.23.143.150
207.46.*.*
208.67.222.222
212.30.134.*
216.218.248.203
23.102.21.4
23.218.212.69
23.43.139.27
23.78.117.155
23.99.*.*
239.255.255.250
31.13.64.1
64.18.*.*
64.4.*.*
65.207.*.*
65.39.*.*
65.52.*.*
65.55.*.*
68.232.34.200
77.67.29.144
84.149.126.30
88.221.132.128
93.184.220.20

показать больше
3
•
Ответить
•
Поделиться ›

Аватар
Андрей Васильков Компьютерра • день назад

Список URL, на которые выполняется отправка данных (пополняемый):
a.ads1.msn.com
a.ads2.msn.com
a-0001.a-msedge.net
ad.doubleclick.net
adnexus.net
adnxs.com
ads.msn.com
ads1.msads.net
ads1.msn.com
az361816.vo.msecnd.net
az512334.vo.msecnd.net
ca.telemetry.microsoft.com
choice.microsoft.com
choice.microsoft.com.nsatc.net
compatexchange.cloudapp.net
corp.sts.microsoft.com
corpext.msitadfs.glbdns2.micro...
cs1.wpc.v0cdn.net
df.telemetry.microsoft.com
diagnostics.support.microsoft....
fe2.update.microsoft.com.akadn...
feedback.microsoft-hohm.com
feedback.search.microsoft.com
feedback.windows.com
i1.services.social.microsoft.c...
i1.services.social.microsoft.c...
oca.telemetry.microsoft.com
oca.telemetry.microsoft.com.ns...
pre.footprintpredict.com
preview.msn.com
redir.metaservices.microsoft.c...
reports.wes.df.telemetry.micro...
services.wes.df.telemetry.micr...
settings-sandbox.data.microsof...
* sls.update.microsoft.com.akadn... (нужен для обновлений)
spynet2.microsoft.com
spynetalt.microsoft.com
sqm.df.telemetry.microsoft.com
sqm.telemetry.microsoft.com
sqm.telemetry.microsoft.com.ns...
* ssw.live.com (сервис Microsoft Live)
statsfe1.ws.microsoft.com
statsfe2.update.microsoft.com....
statsfe2.ws.microsoft.com
survey.watson.microsoft.com
telecommand.telemetry.microsof...
telecommand.telemetry.microsof...
telemetry.appex.bing.net
telemetry.appex.bing.net
telemetry.microsoft.com
telemetry.urs.microsoft.com
vortex.data.microsoft.com
vortex-sandbox.data.microsoft....
vortex-win.data.microsoft.com
watson.live.com
watson.microsoft.com
watson.ppe.telemetry.microsoft...
watson.telemetry.microsoft.com
watson.telemetry.microsoft.com...
wes.df.telemetry.microsoft.com

```

##  security scanner

 * https://help.github.com/articles/about-security-alerts-for-vulnerable-dependencies/
 * aibolit
 * chkrootkit
 * rkhunter
 * http://habrahabr.ru/company/first/blog/242865/

##  ssh

```bash
> useradd -m user
> passwd user
> passwd

> mcedit /etc/ssh/sshd_config

AllowUsers user
Port 00001
PubkeyAuthentication yes
PermitRootLogon no
AuthorizedKeysFile      .ssh/authorized_keys
ClientAliveInterval 600  
 ClientAliveCountMax 3

> su - user
> mkdir ~/.ssh
> chmod -R go-rwx ~/.ssh
> chmod -R 700 ~/.ssh
> chown -R user:group ~/.ssh
> cat >> ~/.ssh/authorized_keys

> /etc/init.d/sshd restart

> bash iptables.xxx.xxx.sh

> ssh-keygen -R 192.168.0.203 -f /home/user/.ssh/known_hosts
```

###  ssh tunnel

[Памятка пользователям ssh](http://habrahabr.ru/post/122445/)

```bash
tar -c * | ssh user@server cd && tar -x
```

1. ControlMaster — уже упомянули пару раз в комментах.
2. Извлечение public ключа из private: ssh-keygen -y -f id_rsa > id_rsa.pub
3. pam-ssh-agent-auth тоже интересная штука, особенно в комбинации с вышеописанным authorized_keys2
4. ssh-keyscan бывает полезна, впрочем любители chef/puppet/cfengine могут собирать ключики с машин более эффективным образом.
5. В последних версиях OpenSSH начали использовать Elliptic Curve DSA 

http://www.amazon.com/SSH-Mastery-OpenSSH-PuTTY-Tunnels/dp/1470069717/

##  windows

[шифровальщики](https://habrahabr.ru/company/pc-administrator/blog/325080/)

