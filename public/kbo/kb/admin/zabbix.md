# Zabbix

 * https://github.com/zabbix/zabbix-docker/issues

## zabbix vs prometheus

 * https://github.com/zabbix/zabbix-docker/wiki/Docker-101---Before-starting-with-containerized-Zabbix
 * They simply aren't supposed to be docker-compose up -d -f docker-compose_v3_ubuntu_pgsql_latest.yaml. You should instead copy the one you like and then tailor it to your needs. So for example if you choose Postgres as your DB copy the pgsql_latest to docker-compose.yml and just keep the services you need.
 * if you're new to Zabbix AND Containers you might have a hard time and completely ruin your experience maybe even dropping Zabbix because you just can't get it up and running.
 * So if you're new to containers as a whole start with a good Docker/Container tutorial first. It's not hard at all. It might set you back 1-2 hours but those will pay off easily not just for Zabbix but also for the rest of your containerized journey
 * zabbix
	* C backend, and a PHP front end.
	* https://blog.zabbix.com/zabbix-network-discovery-for-dynamic-deployments/10175/
	* discovery protocols and ports: FTP, HTTP, HTTPS, ICMP ping, SNMP
 * Prometheus
 	* can provide a dimensional data model where metrics are identified by a metric name and tags with built-in storage, graphing, and alerting.
	* time-series database monitoring solution
	* To manage alerts with Prometheus you need to install Alertmanager.
	* discovery via

## install

### docker

1. Create network dedicated for Zabbix component containers:

```bash

docker network create --subnet 172.20.0.0/16 --ip-range 172.20.240.0/20 zabbix-net

# 2. Start empty PostgreSQL server instance

docker run --name postgres-server -t \
       -e POSTGRES_USER="zabbix" \
       -e POSTGRES_PASSWORD="zabbix_pwd" \
       -e POSTGRES_DB="zabbix" \
       --network=zabbix-net \
       --restart unless-stopped \
       -d postgres:latest

# 3. Start Zabbix snmptraps instance

docker run --name zabbix-snmptraps -t \
       -v /zbx_instance/snmptraps:/var/lib/zabbix/snmptraps:rw \
       -v /var/lib/zabbix/mibs:/usr/share/snmp/mibs:ro \
       --network=zabbix-net \
       -p 162:1162/udp \
       --restart unless-stopped \
       -d zabbix/zabbix-snmptraps:alpine-7.0-latest

# 4. Start Zabbix server instance and link the instance with created PostgreSQL server instance

docker run --name zabbix-server-pgsql -t \
       -e DB_SERVER_HOST="postgres-server" \
       -e POSTGRES_USER="zabbix" \
       -e POSTGRES_PASSWORD="zabbix_pwd" \
       -e POSTGRES_DB="zabbix" \
       -e ZBX_ENABLE_SNMP_TRAPS="true" \
       --network=zabbix-net \
       -p 10051:10051 \
       --volumes-from zabbix-snmptraps \
       --restart unless-stopped \
       -d zabbix/zabbix-server-pgsql:alpine-7.0-latest

# 5. Start Zabbix web interface and link the instance with created PostgreSQL server and Zabbix server instances

docker run --name zabbix-web-nginx-pgsql -t \
       -e ZBX_SERVER_HOST="zabbix-server-pgsql" \
       -e DB_SERVER_HOST="postgres-server" \
       -e POSTGRES_USER="zabbix" \
       -e POSTGRES_PASSWORD="zabbix_pwd" \
       -e POSTGRES_DB="zabbix" \
       --network=zabbix-net \
       -p 443:8443 \
       -p 80:8080 \
       -v /etc/ssl/nginx:/etc/ssl/nginx:ro \
       --restart unless-stopped \
       -d zabbix/zabbix-web-nginx-pgsql:alpine-7.0-latest
```

### docker compose

* see devops-infra/docker/zabbix/


## nginx for zabbix

 * [Zabbix 2.2 верхом на nginx + php-fpm и mariadb - 2013](http://habrahabr.ru/company/acronis/blog/198354/)

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

