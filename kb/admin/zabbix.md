
## nginx for zabbix

http://habrahabr.ru/company/acronis/blog/198354/

## httpd for zabbix

```bash
ServerTokens OS
ServerRoot "/etc/httpd"
PidFile run/httpd.pid
Timeout 300
KeepAlive Off
MaxKeepAliveRequests 100
KeepAliveTimeout 300

<IfModule prefork.c>
StartServers       2
MinSpareServers    2
MaxSpareServers   20
ServerLimit      256
MaxClients       256
MaxRequestsPerChild  4000
</IfModule>

<IfModule worker.c>
StartServers         2
MaxClients         300
MinSpareThreads     2
MaxSpareThreads     75 
ThreadsPerChild     5
MaxRequestsPerChild  0
</IfModule>

```

## datetime 

### ntpd

```bash
# ntpdate -d ru.pool.ntp.org
# ntpdate ntp1.stratum1.ru
# mcedit /etc/ntp.conf
logfile /var/log/ntp.log
server ntp1.stratum1.ru iburst burst prefer
server ntp1.stratum2.ru iburst burst 
server ntp2.stratum2.ru iburst burst
server ntp4.stratum2.ru iburst burst
server ntp1.vniiftri.ru iburst burst
server ntp2.vniiftri.ru iburst burst
server ntp3.vniiftri.ru iburst burst
server ntp4.vniiftri.ru iburst burst


Создаем симлинк для нужного часового пояса в /etc/localtime:

# cp -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

Теперь время синхронизирует корректно.
Далее выставляем время в BIOS равное времени в UTC (время по Гринвичу):

# hwclock --systohc --utc

Для того, чтобы время системы не устанавливалось равным времени в BIOS, а правильно показывало в соответствии с часовым поясом редактируем файл /etc/sysconfig/clock как показано ниже:

ZONE="Europe/Moscow"
UTC=true
ARC=false

# chkconfig --level 2345 ntpd on

проверка демона:
# ntpq -p
     remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
 ns.davydkovo.ne 89.109.251.21    2 u    1   64    1    3.784  -65.046   0.000


```

### tzdata

перевод часов

```bash
 zdump -v Europe/Moscow |grep 2014
Europe/Moscow  Sat Oct 25 21:59:59 2014 UT = Sun Oct 26 01:59:59 2014 MSK isdst=0 gmtoff=14400
Europe/Moscow  Sat Oct 25 22:00:00 2014 UT = Sun Oct 26 01:00:00 2014 MSK isdst=0 gmtoff=10800
# strings /etc/localtime | grep MSK
MSK-3

```



## vnstat

```bash
yum install epel-release
yum install vnstat

vnstat --oneline
1;eth0;08/30/14;38 KiB;41 KiB;79 KiB;0.08 kbit/s;Aug '14;38 KiB;41 KiB;79 KiB;0.00 kbit/s;38 KiB;41 KiB;79 KiB

Show traffic summary for selected interface using one line with a parseable format. 
The output contains 15 fields with ; used as field delimeter. The 1st field contains
the version information of the output that will be changed in future versions of 
vnStat if the field structure changes. 
The following fields in order 
2) interface name,
3) timestamp  for  today,  
4) rx  for today, 
5) tx for today, 
6) total for today, 
7) average traffic rate for today, 
8) timestamp for current month, 
9) rx for current month, 
10) tx for current month, 
11) total for current month, 
12) average traffic rate for today, 
13) all time total rx, 
14) all time total tx, 
15) all time total traf-fic.

```

### HZ to sec convert

```bash
awk 'NR==1{sec_idle=$2};NR==2{hz_idle=$5; print hz_idle/sec_idle }' /proc/uptime /proc/stat
```

http://man7.org/linux/man-pages/man5/proc.5.html

```bash
/proc/stat
             cpu  3357 0 4313 1362393
                     The amount of time, measured in units of USER_HZ
                     (1/100ths of a second on most architectures, use
                     sysconf(_SC_CLK_TCK) to obtain the right value), that
                     the system spent in various states:
                     user   (1) Time spent in user mode.
                     nice   (2) Time spent in user mode with low priority
                            (nice).
                     system (3) Time spent in system mode.
                     idle   (4) Time spent in the idle task.  This value
                            should be USER_HZ times the second entry in the
                            /proc/uptime pseudo-file.
                     iowait (since Linux 2.5.41)
                            (5) Time waiting for I/O to complete.
                     steal (since Linux 2.6.11)
                            (8) Stolen time, which is the time spent in
                            other operating systems when running in a
                            virtualized environment
              swap 1 0
                     The number of swap pages that have been brought in and
                     out.
              procs_running 6
                     Number of processes in runnable state.  (Linux 2.5.45
                     onward.)
              procs_blocked 2
                     Number of processes blocked waiting for I/O to
                     complete.  (Linux 2.5.45 onward.)
```

http://www.mjmwired.net/kernel/Documentation/iostats.txt

```bash
Field  1 -- # of reads completed
    This is the total number of reads completed successfully.
Field  2 -- # of reads merged, field 6 -- # of writes merged
    Reads and writes which are adjacent to each other may be merged for
    efficiency.  Thus two 4K reads may become one 8K read before it is
    ultimately handed to the disk, and so it will be counted (and queued)
    as only one I/O.  This field lets you know how often this was done.
Field  3 -- # of sectors read
    This is the total number of sectors read successfully.
Field  4 -- # of milliseconds spent reading
    This is the total number of milliseconds spent by all reads (as
    measured from __make_request() to end_that_request_last()).
Field  5 -- # of writes completed
    This is the total number of writes completed successfully.
Field  6 -- # of writes merged
    See the description of field 2.
Field  7 -- # of sectors written
    This is the total number of sectors written successfully.
Field  8 -- # of milliseconds spent writing
    This is the total number of milliseconds spent by all writes (as
    measured from __make_request() to end_that_request_last()).
Field  9 -- # of I/Os currently in progress
    The only field that should go to zero. Incremented as requests are
    given to appropriate struct request_queue and decremented as they finish.
Field 10 -- # of milliseconds spent doing I/Os
    This field increases so long as field 9 is nonzero.
Field 11 -- weighted # of milliseconds spent doing I/Os
    This field is incremented at each I/O start, I/O completion, I/O
    merge, or read of these stats by the number of I/Os in progress
    (field 9) times the number of milliseconds spent doing I/O since the
    last update of this field.  This can provide an easy measure of both
    I/O completion time and the backlog that may be accumulating.
```

## awk

http://www.catonmat.net/blog/ten-awk-tips-tricks-and-pitfalls/

## zabbix

Ограничения использования макросов:
 * https://www.zabbix.com/documentation/2.2/manual/appendix/macros/supported_by_location
 * https://www.zabbix.com/documentation/ru/2.0/manual/config/items/itemtypes/ssh_checks

`ssh.run[<уникальное короткое описание>,<ip>,<порт>,<кодировка>]`

```bash

# mcedit /etc/selinux/config 
disabled
# setenforce 0

# rpm -ivh http://repo.zabbix.com/zabbix/2.2/rhel/6/x86_64/zabbix-release-2.2-1.el6.noarch.rpm
# yum install zabbix-server-pgsql zabbix-web-pgsql --disablerepo=ius ##php54 conflicts php53

Installed:
  zabbix-agent.x86_64 0:2.2.6-1.el6                              zabbix-server-pgsql.x86_64 0:2.2.6-1.el6                              zabbix-web-pgsql.noarch 0:2.2.6-1.el6                             
Dependency Installed:
  OpenIPMI-libs.x86_64 0:2.0.16-14.el6                  apr-util-ldap.x86_64 0:1.3.9-3.el6_0.1         dejavu-fonts-common.noarch 0:2.30-2.el6         dejavu-sans-fonts.noarch 0:2.30-2.el6            
  fontpackages-filesystem.noarch 0:1.41-1.1.el6         fping.x86_64 0:3.10-1.el6.rf                   httpd.x86_64 0:2.2.15-31.el6.centos             httpd-tools.x86_64 0:2.2.15-31.el6.centos        
  iksemel.x86_64 0:1.4-2.el6                            libXpm.x86_64 0:3.5.10-2.el6                   libxslt.x86_64 0:1.1.26-2.el6_3.1               lm_sensors-libs.x86_64 0:3.1.1-17.el6            
  net-snmp.x86_64 1:5.5-49.el6_5.2                      net-snmp-libs.x86_64 1:5.5-49.el6_5.2          php.x86_64 0:5.3.3-27.el6_5.1                   php-bcmath.x86_64 0:5.3.3-27.el6_5.1             
  php-cli.x86_64 0:5.3.3-27.el6_5.1                     php-common.x86_64 0:5.3.3-27.el6_5.1           php-gd.x86_64 0:5.3.3-27.el6_5.1                php-mbstring.x86_64 0:5.3.3-27.el6_5.1           
  php-pdo.x86_64 0:5.3.3-27.el6_5.1                     php-pgsql.x86_64 0:5.3.3-27.el6_5.1            php-xml.x86_64 0:5.3.3-27.el6_5.1               unixODBC.x86_64 0:2.2.14-12.el6_3                
  zabbix.x86_64 0:2.2.6-1.el6                           zabbix-server.x86_64 0:2.2.6-1.el6             zabbix-web.noarch 0:2.2.6-1.el6                

mkdir /home/zabbix
chown zabbix:zabbix /home/zabbix
usermod -d /home/zabbix/ zabbix
sudo -u zabbix ssh-keygen -b 4096 -t rsa
##сама спросит куда сохранять
echo "SSHKeyLocation=/home/zabbix/.ssh" >> /etc/zabbix/zabbix_server.conf


# mcedit /var/lib/pgsql/data/pg_hba.conf
    local   zabbix      zabbix                            md5

#   su - postgres -c "createuser --pwprompt --encrypted --no-adduser --no-createdb --no-createrole --no-inherit zabbix" 
#   su - postgres -c "createdb --encoding=UNICODE --owner=zabbix zabbix" 

#  cd /usr/share/doc/zabbix-server-pgsql-2.2.6/create/
#  cat schema.sql|  su - postgres -c "psql -U zabbix zabbix"
#  cat images.sql|  su - postgres -c "psql -U zabbix zabbix"
#  cat data.sql|  su - postgres -c "psql -U zabbix zabbix"

# echo "date.timezone = Europe/Moscow" >> /etc/php.ini
# /etc/init.d/zabbix-server start

# mcedit /etc/httpd/conf/httpd.conf
listen 8080

# /etc/init.d/httpd start

loaclhost:8080/zabbix

Admin/zabbix

```

