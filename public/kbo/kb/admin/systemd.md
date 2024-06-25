# Systemd

## limits

 * Each file watch takes up 1080 bytes, so assuming that all 524,288 watches are consumed, that results in an upper bound of around 540 MiB
 * [How to set limits for services in RHEL and systemd  2023](https://access.redhat.com/solutions/1257953)
 * https://unix.stackexchange.com/questions/611887/what-ulimit-value-applies-to-a-systemd-service
 * https://unix.stackexchange.com/questions/345595/how-to-set-ulimits-on-service-with-systemd
 * The mappings of systemd limits to ulimit
	| Directive        | ulimit equivalent    | Unit |
	|-|-|-|
	| LimitCPU=        | ulimit -t            | Seconds |
	| LimitFSIZE=      | ulimit -f            | Bytes |
	| LimitDATA=       | ulimit -d            | Bytes |
	| LimitSTACK=      | ulimit -s            | Bytes |
	| LimitCORE=       | ulimit -c            | Bytes |
	| LimitRSS=        | ulimit -m            | Bytes |
	| LimitNOFILE=     | ulimit -n            | Number of File Descriptors |
	| LimitAS=         | ulimit -v            | Bytes |
	| LimitNPROC=      | ulimit -u            | Number of Processes |
	| LimitMEMLOCK=    | ulimit -l            | Bytes |
	| LimitLOCKS=      | ulimit -x            | Number of Locks |
	| LimitSIGPENDING= | ulimit -i            | Number of Queued Signals |
	| LimitMSGQUEUE=   | ulimit -q            | Bytes |
	| LimitNICE=       | ulimit -e            | Nice Level |
	| LimitRTPRIO=     | ulimit -r            | Realtime Priority |
	| LimitRTTIME=     | ulimit -R            | Microseconds |
	| | | |

 * [Linux Increase The Maximum Number Of Open Files / File Descriptors (FD) 2024](https://www.cyberciti.biz/faq/linux-increase-the-maximum-number-of-open-files/)

```bash
man bash
man sysctl
man prlimit
help ulimit
man 5 proc
man systemd.exec

/etc/systemd/system.conf
#DefaultLimitCORE=infinity:infinity
#DefaultLimitNOFILE=1024:524288


ulimit -Sn
#1024
ulimit -Hn
#524288
cat /proc/sys/fs/inotify/max_user_watches
#65536
sysctl fs.inotify.max_user_watches
#fs.inotify.max_user_watches = 65536
sysctl fs.file-max
#fs.file-max = 9223372036854775807


	cat > /etc/sysctl.d/vscode.sysctl.conf
	# fs.inotify.max_user_watches=524288
	# fs.file-max=1632119
	sysctl -p
	sysctl --system

sysctl --system
#* Applying /boot/sysctl.conf-5.14.21-150400.24.100-default ...
#kernel.hung_task_timeout_secs = 0
#kernel.msgmax = 65536
#kernel.msgmnb = 65536
#kernel.shmmax = 0xffffffffffffffff
#kernel.shmall = 0x0fffffffffffff00
#vm.dirty_ratio = 20
#* Applying /usr/lib/sysctl.d/50-default.conf ...
#net.ipv4.icmp_echo_ignore_broadcasts = 1
#net.ipv4.conf.all.rp_filter = 2
#net.ipv4.conf.default.promote_secondaries = 1
#net.ipv4.conf.all.promote_secondaries = 1
#net.ipv6.conf.default.use_tempaddr = 1
#net.ipv4.ping_group_range = 0 2147483647
#fs.inotify.max_user_watches = 65536
#kernel.sysrq = 184
#fs.protected_hardlinks = 1
#fs.protected_symlinks = 1
#kernel.kptr_restrict = 1
#* Applying /usr/lib/sysctl.d/51-network.conf ...
#net.ipv4.conf.all.accept_redirects = 0
#net.ipv4.conf.default.accept_redirects = 0
#net.ipv4.conf.all.accept_source_route = 0
#net.ipv4.conf.default.accept_source_route = 0
#net.ipv6.conf.all.accept_redirects = 0
#net.ipv6.conf.default.accept_redirects = 0
#* Applying /etc/sysctl.d/70-yast.conf ...
#net.ipv4.ip_forward = 1
#net.ipv6.conf.all.forwarding = 1
#net.ipv6.conf.all.disable_ipv6 = 0
#* Applying /usr/lib/sysctl.d/99-sysctl.conf ...
#* Applying /etc/sysctl.d/vscode.sysctl.conf ...
#fs.inotify.max_user_watches = 524288
#fs.file-max = 1632119
#* Applying /etc/sysctl.conf ...
sysctl fs.inotify.max_user_watches
#fs.inotify.max_user_watches = 524288
sysctl fs.file-max
#fs.file-max = 1632119
ulimit -Hn
#524288
ulimit -Sn
#1024
cat /proc/sys/fs/inotify/max_user_watches
#524288

cat /etc/security/limits.conf
# user hard nofile 16384
# user soft nofile 9216
ulimit -Sn
ulimit -Hn
```

## journalctl

 * [Управление логгированием в systemd 2015](http://habrahabr.ru/company/selectel/blog/264731/)

```bash
# логи, собранные с момента последней загрузки системы:
journalctl -b
journalctl -b 0
journalctl -b 9346310348bc4edea250555dc046b30c

# список предыдущих загрузок можно с помощью команды:
journalctl --list-boots

# Хранить предыдущие сессии: изменить значение параметра storage на persistent:
cat /etc/systemd/journald.conf
#[Journal]
#Storage=persistent

#по времени
journalctl --since "2015-07-20 17:15:00"
journalctl ---since yesterday
journalctl --since 09:00 --until now
journalctl --since 10:00 --until "1 hour ago"

#по сервисам
journalctl -u nginx.service
journalctl -u nginx.service --since yesterday
journalctl -u nginx.service -u php-fpm.service —since today

#С конца по строкам
journalctl -f
journalctl -n 20

#Объём логов
journalctl --disk-usage
#Journals take up 16.0M on disk

#ротация
/etc/systemd/journald.conf

#SystemMaxUse=50M
#SystemKeepFree=
#SystemMaxFileSize=10M
#RuntimeMaxUse=
#RuntimeKeepFree=
#RuntimeMaxFileSize=10M

systemctl restart systemd-journald.service
```

## cli

 * [Red Hat Enterprise Linux7System Administrator's GuideChapter 10. Managing Services with systemd](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/chap-Managing_Services_with_systemd.html)
 * [systemd для администраторов Lennart Poettering 2017](http://www2.kangran.su/~nnz/pub/s4a/s4a_latest.pdf)
 * [SysVinit to Systemd Cheatsheet/ru 2011](https://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet/ru)

	| Команда sysvinit 				| Команда systemd 							| Комментарий |
	|-|-|-|
	| service frobozz start 		| systemctl start frobozz.service 			| Используется для разового запуска службы. |
	| service frobozz stop 			| systemctl stop frobozz.service 			| Используется для разовой остановки службы. |
	| service frobozz restart 		| systemctl restart frobozz.service 		| Используется для разового перезапуска службы. |
	| service frobozz reload 		| systemctl reload frobozz.service 			| Если такая возможность поддерживается службой, перезагружает конфигурационный файл, не прерывая процесса. |
	| service frobozz condrestart 	| systemctl condrestart frobozz.service 	| Перезапускает службу, если она запущена. |
	| service frobozz status 		| systemctl status frobozz.service 			| Сообщает, запущена ли служба. |
	| ls /etc/rc.d/init.d/ 			| ls /lib/systemd/system/*.service /etc/systemd/system/*.service 	| Используется для получения списка служб, которые могут быть запущены или остановлены. |
	| chkconfig frobozz on 			| systemctl enable frobozz.service 			| Включает запуск службы после перезагрузки. |
	| chkconfig frobozz off 		| systemctl disable frobozz.service 		| Отключает запуск службы после перезагрузки. |
	| chkconfig frobozz 			| systemctl is-enabled frobozz.service 		| Используется для проверки, будет ли служба запущена после перезагрузки. |
	| chkconfig frobozz --list 		| ls /etc/systemd/system/*.wants/frobozz.service 	| Выдает список уровней загрузки(целей), при которых данная служба будет запущена автоматически. |
	| chkconfig frobozz --add 		| Не используется, нет аналога.				| |
	| | | |

 * [Шпаргалка по управлению сервисами CentOS 7 с systemd](http://habrahabr.ru/company/infobox/blog/241237/)
	* Systemd приносит концепцию юнитов systemd.
	* Юниты представлены конфигурационными файлами, размещенными в одной из директорий:
	* Юниты содержат информацию о системных сервисах, прослушиваемых сокетах, сохраненных снапшотах состояний системы и других обьектах, относящихся к системе инициализации.

```bash
/usr/lib/systemd/system/ # юниты из установленных пакетов RPM.
/run/systemd/system/ # юниты, созданные в рантайме. Этот каталог приоритетнее каталога с установленными юнитами из пакетов.
/etc/systemd/system/ # юниты, созданные и управляемые системным администратором. Этот каталог приоритетнее каталога юнитов, созданных в рантайме.
```

## Типы юнитов systemd

 * .service - системный сервис
 * .target — группа юнитов systemd
 * .automount - точка автомонтирования файловой системы
 * .device - файл устройства, распознанного ядром
 * .mount - точка монтирования файловой системы
 * .path - файл или директория в файловой системе
 * .scope - процесс, созданный извне
 * .slice - группа иерархически организованных юнитов, управляющая системными процессами
 * .snapshot - сохраненное состояние менеджера systemd
 * .socket - сокет межпроцессного взаимодействия
 * .swap - Свап-устройство или свап-файл (файл подкачки)
 * .timer - таймер systemd

## Основные функции systemd в CentOS 7

 * Активация, основанная на сокетах. Во время загрузки systemd прослушивает сокеты для всех системных сервисов, поддерживает этот тип активации и передает сокеты этим сервисам сразу после старта сервисов. Это позволяет systemd не только запускать сервисы параллельно, но также дает возможность перезапускать сервисы без потери любых отправленных им сообщений, пока сервисы были недоступны. Соответствующий сокет остается доступным и все сообщения выстраиваются в очередь.
 * Активация, основанная на D-Bus. Системные сервисы, использующие D-Bus для межпроцессного взаимодействия, могут быть запущены по требованию, когда клиентское приложение пытается связаться с ними.
 * Активация, основанная на девайсах. Системные сервисы, поддерживающие активацию, основанную на девайсах, могут быть запущены, когда определенный тип оборудования подключается или становится доступным.
 * Активация, основанная на путях. Системные сервисы могут поддерживать этот вид активации, если изменяется состояние папки или директории.
 * Снепшоты системных состояний. Система может сохранять состояние всех юнитов и восстанавливать предыдущее состояние системы.
 * Управление точками монтирования и автомонтирования. Systemd отслеживает и управляет точками монтирования и автомонтирования.
 * Агрессивная параллелизация Systemd запускает системные сервисы параллельно из-за использования активации, основанной на сокетах. В комбинации с сервисами, поддерживающими активацию по требованию, параллельная активация значительно уменьшает время загрузки системы.
 * Транзакционная логика активации юнитов. До активации и деактивации юнитов systemd вычисляет их зависимости, создает временную транзакцию и проверяет целостность этой транзакции. Если транзакция нецелостная, systemd автоматически пытается исправить ее и удалить не требующиеся задания из нее до формирования сообщения об ошибке.
 * Обратная совместимость с инициализацией SysV. SystemD полностью поддерживает скрипты инициализации SysV, как описано в спецификации Linux Standard Base (LSB), что упрощает переход на systemd.

## Управление сервисами

 * В предыдущих версиях CentOS использовалась SysV или Upstart. Скрипты инициализации располагались в директории /etc/rc.d/init.d/. Такие скрипты обычно писались на Bash и позволяли администратору управлять состоянием сервисов и демонов. В CentOS 7 скрипты инициализации были заменены сервисными юнитами.
 * По способу использования сервисные юниты .service напоминают скрипты инициализации. Для просмотра, старта, остановки, перезагрузки, включения или выключения системных сервисов используется команда systemctl. Команды service и chkconfig по-прежнему включены в систему, но только по соображениям совместимости.
 * При использовании systemctl указывать расширение файла не обязательно.

```bash
systemctl start name.service				 # запуск сервиса.
systemctl stop name.service					 # остановка сервиса
systemctl restart name.service				 # перезапуск сервиса
systemctl try-restart name.service			 # ерезапуск сервиса только, если он запущен
systemctl reload name.service				 # перезагрузка конфигурации сервиса
systemctl status name.service				 # проверка, запущен ли сервис с детальным выводом состояния сервиса
systemctl is-active name.service			 # проверка, запущен ли сервис с простым ответом: active или inactive
systemctl list-units --type service --all	 # отображение статуса всех сервисов
systemctl enable name.service				 # активирует сервис (позволяет стартовать во время запуска системы)
systemctl disable name.service				 # деактивирует сервис
systemctl reenable name.service				 # деактивирует сервис и сразу активирует его
systemctl is-enabled name.service			 # проверяет, активирован ли сервис
systemctl list-unit-files --type service	 # отображает все сервисы и проверяет, какие из них активированы
systemctl mask name.service					 # заменяет файл сервиса симлинком на /dev/null, делая юнит недоступным для systemd
systemctl unmask name.service				 # возвращает файл сервиса, делая юнит доступным для systemd

```

## targets

 * Предыдущие версии CentOS с SysV init или Upstart включали предопределенный набор уровней запуска (runlevels), которые представляли специфичные режимы для операций, пронумерованные от 0 до 6. В CentOS 7 концепция уровней запуска была заменена целями systemd.
 * Файлы целей systemd .target предназначены для группировки вместе других юнитов systemd через цепочку зависимостей. Например юнит graphical.target, использующийся для старта графической сессии, запускает системные сервисы GNOME Display Manager (gdm.service) и Accounts Service (accounts-daemon.service) и активирует multi-user.target. В свою очередь multi-user.target запускает другие системные сервисы, такие как Network Manager (NetworkManager.service) или D-Bus (dbus.service) и активирует другие целевые юниты basic.target.
 * В CentOS 7 присутствуют предопределенные цели, похожие на стандартный набор уровней запуска. По соображениям совместимости они также имеют алиасы на эти цели, которые напрямую отображаются в уровнях запуска SysV.

```bash
poweroff.target (runlevel0.target) # завершение работы и отключение системы
rescue.target (runlevel1.target) # настройка оболочки восстановления
multi-user.target (runlevel2.target, runlevel3.target, runlevel4.target) # настройка неграфической многопользовательской системы
graphical.target (runlevel5.target) # настройка графической многопользовательской системы
reboot.target (runlevel6.target) # выключение и перезагрузка системы
```
 * Команды runlevel и telinit по-прежнему доступны, но оставлены в системе по соображениям совместимости. Рекомендуется использовать systemctl для изменения или настройки системных целей

```bash
systemctl get-default					 # Для определения, какой целевой юнит используется по умолчанию
systemctl list-units --type target --all # Для просмотра всех загруженных целевых юнитов воспользуйтесь командой systemctl list-units --type target, а для просмотра вообще всех целевых юнитов командой:
systemctl set-default name.target		 # Для изменения цели по умолчанию
systemctl isolate name.target			 # Для изменения текущей цели:  Команда запустит целевой юнит и все его зависимости и немедленно остановит все остальные.
```

## Выключение и перезагрузка системы

Прежние команды сохранены для совместимости, но рекомандуется использовать systemctl:

```bash
systemctl halt # останавливает систему
systemctl poweroff # выключает систему
systemctl reboot # перезагружает систему
```

* Управление systemd на удаленной машине
	`systemctl --host user_name@host_name command`

## минимальный systemd .service

```bash
[Unit]
Description=Daemon to detect crashing apps
After=syslog.target

[Service]
ExecStart=/usr/sbin/abrtd
Type=forking

[Install]
WantedBy=multi-user.target
```

 * Unit общую информацию о сервисе. Такая секция есть не только в сервис-юнитах, но и в других юнитах (например при управлении устройствами, точками монтирования и т.д.). В нашем примере мы даем описание сервиса и указываем на то, что демон должен быть запущен после Syslog.
 * Service информация о нашем сервисе. Используемый параметр ExecStart указывает на исполняемый файл нашего сервиса. В Type мы указываем, как сервис уведомляет systemd об окончании запуска.
 * Install информацию о цели, в которой сервис должен стартовать. В данном случае мы говорим, что сервис должен быть запущен, когда будет активирована цель multi-user.target.

