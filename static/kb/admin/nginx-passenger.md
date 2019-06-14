# Nginx-passenger


 * https://www.phusionpassenger.com/library/install/nginx/install/oss/el6/
 * https://www.phusionpassenger.com/documentation/Users%20guide%20Nginx.html#installation
 * http://www.modrails.com/documentation/Users guide Nginx.html
 * http://wiki.nginx.org/RedHatNginxInitScript



## Настройка репозиториев

```
ping 199.4.150.158
ping passenger.stealthymonkeys.com

cat >> /etc/hosts
199.4.150.158   passenger.stealthymonkeys.com


wget http://passenger.stealthymonkeys.com/rhel/6/passenger-release.noarch.rpm
wget http://passenger.stealthymonkeys.com/RPM-GPG-KEY-stealthymonkeys.asc
rpm --import RPM-GPG-KEY-stealthymonkeys.asc 
yum install passenger-release.noarch.rpm
```

## Установка passenger

 * https://www.phusionpassenger.com/library/install/nginx/install/oss/el7/


УСТАРЕЛО

```bash

yum remove nginx

passenger-config --root
#покажет где он

cd /opt/ruby-enterprise
./bin/passenger-install-nginx-module 

#проверка
./bin/passenger-memory-stats 
```

## Настройка прав доступа

```bash

usermod -aG redmine nginx
id nginx

# пока непонятно - пришлось сделать chown -R nginx:nginx /opt/redmine-2.3.1, потом обратно redmine:redmine
chmod g+rw /opt/redmine/log/main.log

chmod g+w /opt/redmine/config
chown -R redmine:redmine /opt/redmine/

mkdir /var/log/nginx
chown nginx:nginx /var/log/nginx/

```

## Настройка скрипта демонизации

```bash
cat >> /distr/nginx-passenger.sh
...
nginx="/opt/nginx/sbin/nginx"
user=nginx
NGINX_CONF_FILE="/opt/nginx/conf/nginx.conf"
...
make_dirs() {
   # make required directories
#   user=`$nginx -V 2>&1 | grep "configure arguments:" | sed 's/[^*]*--user=\([^ ]*\).*/\1/g' -`
...

chmod a+x /distr/nginx-passenger.sh 
./nginx-passenger.sh status
./nginx-passenger.sh start
ln -s /distr/nginx-passenger.sh /etc/init.d/nginx-passenger
```

```bash
#!/bin/sh
#
# nginx - this script starts and stops the nginx daemon
#
# chkconfig:   - 85 15 
# description:  Nginx is an HTTP(S) server, HTTP(S) reverse \
#               proxy and IMAP/POP3 proxy server
# processname: nginx
# config:      /etc/nginx/nginx.conf
# config:      /etc/sysconfig/nginx
# pidfile:     /var/run/nginx.pid
 
# Source function library.
. /etc/rc.d/init.d/functions
 
# Source networking configuration.
. /etc/sysconfig/network
 
# Check that networking is up.
[ "$NETWORKING" = "no" ] && exit 0
 
nginx="/opt/nginx/sbin/nginx"
prog=$(basename $nginx)
user=nginx
 
NGINX_CONF_FILE="/opt/nginx/conf/nginx.conf"
 
[ -f /etc/sysconfig/nginx ] && . /etc/sysconfig/nginx
 
lockfile=/var/lock/subsys/nginx
 
make_dirs() {
   # make required directories
#   user=`$nginx -V 2>&1 | grep "configure arguments:" | sed 's/[^*]*--user=\([^ ]*\).*/\1/g' -`
#    user=`grep '^user=' $NGINX_CONF_FILE`
   if [ -z "`grep $user /etc/passwd`" ]; then
       useradd -M -s /bin/nologin $user
   fi
   options=`$nginx -V 2>&1 | grep 'configure arguments:'`
   for opt in $options; do
       if [ `echo $opt | grep '.*-temp-path'` ]; then
           value=`echo $opt | cut -d "=" -f 2`
           if [ ! -d "$value" ]; then
               # echo "creating" $value
               mkdir -p $value && chown -R $user $value
           fi
       fi
   done
}
 
start() {
    [ -x $nginx ] || exit 5
    [ -f $NGINX_CONF_FILE ] || exit 6
    make_dirs
    echo -n $"Starting $prog: "
    daemon $nginx -c $NGINX_CONF_FILE
    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}
 
stop() {
    echo -n $"Stopping $prog: "
    killproc $prog -QUIT
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}
 
restart() {
    configtest || return $?
    stop
    sleep 1
    start
}
 
reload() {
    configtest || return $?
    echo -n $"Reloading $prog: "
    killproc $nginx -HUP
    RETVAL=$?
    echo
}
 
force_reload() {
    restart
}
 
configtest() {
  $nginx -t -c $NGINX_CONF_FILE
}
 
rh_status() {
    status $prog
}
 
rh_status_q() {
    rh_status >/dev/null 2>&1
}
 
case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart|configtest)
        $1
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
            ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}"
        exit 2
esac

```

## Настройка ротации логов

```bash
[root@centos logrotate.d]# cat /etc/logrotate.d/nginx
/var/log/nginx/*.log {
        daily
        missingok
        rotate 52
        compress
        delaycompress
        notifempty
        create 640 nginx adm
        sharedscripts
        postrotate
                [ -f /var/run/nginx.pid ] && kill -USR1 `cat /var/run/nginx.pid`
        endscript
}
```

## Настройка приложения


```bash

#проверить путь
passenger-config --root

cp /opt/nginx/conf/nginx.conf /opt/nginx/conf.nginx.conf.old

cat > /opt/nginx/conf/nginx.conf
##
user  nginx;
worker_processes  1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  1024;
}
##
```

заменить:

server_name
passenger_root
#passenger-config --root

```bash

http {
    passenger_root /opt/ruby-enterprise/lib/ruby/gems/1.8/gems/passenger-4.0.29;
    passenger_ruby /opt/ruby-enterprise/bin/ruby;

    include       mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    keepalive_timeout  65;
    #gzip  on;

    server {
        listen 3000;
        server_name 198.61.225.104 redmine;
        root /opt/redmine/public;
        passenger_enabled on;
        allow all;
        passenger_min_instances 1;

        # rails_env development;
        client_max_body_size      15m; # Макстимальный размер аттача
            }
}


```


## Запуск и проверка

```bash


/etc/init.d/nginx-passenger restart

passenger-memory-stats 

------------- Apache processes -------------
*** WARNING: The Apache executable cannot be found.
Please set the APXS2 environment variable to your 'apxs2' executable's filename, or set the HTTPD environment variable to your 'httpd' or 'apache2' executable's filename.


---------- Nginx processes ----------
PID    PPID   VMSize   Private  Name
-------------------------------------
17797  1      49.5 MB  0.0 MB   nginx: master process /opt/nginx/sbin/nginx -c /opt/nginx/conf/nginx.conf
17799  17797  49.9 MB  0.2 MB   nginx: worker process
### Processes: 2
### Total private dirty RSS: 0.21 MB


----- Passenger processes ------
PID    VMSize    Private   Name
--------------------------------
347    411.9 MB  143.3 MB  Rack: /opt/redmine-2.3.1
17758  208.9 MB  0.1 MB    PassengerWatchdog
17761  544.4 MB  1.3 MB    PassengerHelperAgent
17763  60.5 MB   6.0 MB    Passenger spawn server
17766  144.7 MB  0.0 MB    PassengerLoggingAgent
### Processes: 5
### Total private dirty RSS: 150.74 MB


```
