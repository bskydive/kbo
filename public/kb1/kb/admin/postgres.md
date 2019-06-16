# Postgres

## links

 * [типы данных](http://www.postgresql.org/docs/9.5/static/datatype-numeric.html#DATATYPE-SERIAL)
 * [хитрости из продакшена](http://habrahabr.ru/post/263541/)
 * http://www.postgresql.org/about/news/1432/
 * http://wiki.debian.org/PostgreSql
 * http://www.depesz.com/
 * http://habrahabr.ru/post/177957/
 * https://habrahabr.ru/post/314048/
 * [курсы](https://www.youtube.com/playlist?list=PLaFqU3KCWw6KzGwUubZm-9-vKsi6vh5qC)
 * [Олимпиада SQL: разбор задачи про календарь](https://habr.com/post/359064/)
 * [Задачи и решения для бойца PostgreSQL](https://habr.com/post/423097/) 
 * [SQL индексы ликбез](https://habr.com/company/oleg-bunin/blog/348172/)
 
## Оптимизации

 * [Три аспекта оптимизации (БД и ПО)](https://habr.com/post/349910/)
 * [Пользовательские агрегатные и оконные функции в PostgreSQL и Oracle](https://habr.com/company/postgrespro/blog/351008/)
 * [BLOOM индекс фасеты](https://habr.com/company/postgrespro/blog/349224/)
 * [RUM индекс полнотекстовый поиск](https://habr.com/company/postgrespro/blog/343488/)
 * [GIN индекс указатель терминов](https://habr.com/company/postgrespro/blog/340978/)
 * [BRIN индекс секционирование](https://habr.com/company/postgrespro/blog/346460/)
 * [GIST индекс деревья](https://habr.com/company/postgrespro/blog/333878/)
 * [SP-GiST индекс деревья с секционированием](https://habr.com/company/postgrespro/blog/337502/) 
 * [Декларативное партиционирование](https://habr.com/post/422753/)

## Древовидные структуры

 * http://www.ibase.ru/treedb/
 * http://www.codenet.ru/db/other/trees/
 * https://stackoverrun.com/ru/q/64838
 * [Идеальный каталог](https://habr.com/post/322930/) 
 

## утилиты

 * https://github.com/NikolayS/postgres_dba
 
## postgres remote access 

```bash


mcedit /var/lib/pgsql/10/data/pg_hba.conf 
host    all             all             127.0.0.1/32            trust
host    all             all             192.168.0.0/24            trust

mcedit /var/lib/pgsql/9.1/data/postgresql.conf 
bytea_output = 'escape'
listen_addresses = '*'

systemctl restart postgresql-10
su - postgres -c "psql -U userlist_user -d userlist_db --password"

```


### ssl

http://www.thislinux.org/2014/03/secure-postgresql-over-ssl.html


```bash
# cat /var/lib/9.3/data/pg_hba.conf
hostssl    [database]  [user]    [source-ip]/32            trust

# cat /var/lib/9.3/data/postgresql.conf
ssl = on

psql -h 192.168.1.5 -U vivek -d sales

su - postgres -c "psql -U userlist_user -d userlist_db --password"

```

## postgres on debian

```bash
#wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
#wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

#cat >> /etc/apt/sources.list.d/pgdg.list
#apt-get install sudo aptitude pgdg-keyring libssl libssl1.0.0 libssl1.0.0-dbg libpq5 postgresql-9.1

dpkg-reconfigure locales

aptitude install postgresql
The following NEW packages will be installed:
  libpq5{a} postgresql postgresql-9.1{a} postgresql-client-9.1{a} postgresql-client-common{a} postgresql-common{a} ssl-cert{a}

echo $LANG

su - postgres
psql
show lc_collate;


#pg_dropcluster --stop 9.1 main
#pg_createcluster --locale en_US.UTF-8 --start 9.1 main

mcedit /etc/postgresql/9.1/main/pg_hba.conf

local   all             postgres                                peer
# TYPE  DATABASE        USER            ADDRESS                 METHOD
# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust


```

## Backup

http://habrahabr.ru/post/222311/

```bash
/etc/init.d/nginx-passenger stop
pgrep -fl nginx
sudo -U postgres -c "pg_dump $DBNAME | qzip > /distr/backup/$DBNAME_dump_`date`.gz"
echo $?
/etc/init.d/nginx-passenger start
echo $?
```

## Restore

```bash
/etc/init.d/nginx-passenger stop
pgrep -fl nginx

su - postgres
postgres=# drop database "DBNAME";
DROP DATABASE
postgres=# commit


sudo - postgres -c "cat /distr/backup/$DUMPNAME | gunzip | psql $DBNAME"
echo $?
/etc/init.d/nginx-passenger start
echo $?
```

## postgres install on centos

```bash

#wget http://yum.postgresql.org/9.1/redhat/rhel-6-x86_64/pgdg-centos91-9.1-4.noarch.rpm
#rpm -ivh pgdg-centos91-9.1-4.noarch.rpm 
mcedit /etc/yum.repos.d/CentOS-Base.repo 
exclude=postgres*

yum install postgresql91-server postgresql91-libs pgstat2 pg_top91 barman --disablerepo=epel
 postgresql91-server                    x86_64                    9.1.10-1PGDG.rhel6                      pgdg91                    3.6 M
Installing:
 postgresql91                          x86_64                     9.1.10-1PGDG.rhel6                     pgdg91                     984 k
Installing for dependencies:
 postgresql91-libs                     x86_64                     9.1.10-1PGDG.rhel6                     pgdg91                     190 k


cat >> /distr/postgres_profile.sh
#!/bin/bash
export PATH=/usr/pgsql-9.1/bin:$PATH:$HOME/bin

chmod a+x /distr/postgres_profile.sh
ln -s /distr/postgres_profile.sh /etc/profile.d/postgres_profile.sh

bash

su - postgres -c "initdb --locale=ru_RU.utf8"
##service postgresql-9.1 initdb
service postgresql-9.1 start

mcedit /var/lib/pgsql/9.1/data/pg_hba.conf 
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             192.168.1.0/24            trust
host    all             all             ::1/128                 trust

echo "bytea_output = 'escape'" >> /var/lib/pgsql/9.1/data/postgresql.conf 

listen_addresses = '*'

/etc/init.d/postgresql-9.1 restart



```

## psql help

```bash

General
  \copyright             show PostgreSQL usage and distribution terms
  \g [FILE] or ;         execute query (and send results to file or |pipe)
  \h [NAME]              help on syntax of SQL commands, * for all commands
  \q                     quit psql

Query Buffer
  \e [FILE] [LINE]       edit the query buffer (or file) with external editor
  \ef [FUNCNAME [LINE]]  edit function definition with external editor
  \p                     show the contents of the query buffer
  \r                     reset (clear) the query buffer
  \s [FILE]              display history or save it to file
  \w FILE                write query buffer to file

Input/Output
  \copy ...              perform SQL COPY with data stream to the client host
  \echo [STRING]         write string to standard output
  \i FILE                execute commands from file
  \o [FILE]              send all query results to file or |pipe
  \qecho [STRING]        write string to query output stream (see \o)

Informational
  (options: S = show system objects, + = additional detail)
  \d[S+]                 list tables, views, and sequences
  \d[S+]  NAME           describe table, view, sequence, or index
  \da[S]  [PATTERN]      list aggregates
  \db[+]  [PATTERN]      list tablespaces
  \dc[S]  [PATTERN]      list conversions
  \dC     [PATTERN]      list casts
  \dd[S]  [PATTERN]      show comments on objects
  \ddp    [PATTERN]      list default privileges
  \dD[S]  [PATTERN]      list domains
  \det[+] [PATTERN]      list foreign tables
  \des[+] [PATTERN]      list foreign servers
  \deu[+] [PATTERN]      list user mappings
  \dew[+] [PATTERN]      list foreign-data wrappers
  \df[antw][S+] [PATRN]  list [only agg/normal/trigger/window] functions
  \dF[+]  [PATTERN]      list text search configurations
  \dFd[+] [PATTERN]      list text search dictionaries
  \dFp[+] [PATTERN]      list text search parsers
  \dFt[+] [PATTERN]      list text search templates
  \dg[+]  [PATTERN]      list roles
  \di[S+] [PATTERN]      list indexes
  \dl                    list large objects, same as \lo_list
  \dL[S+] [PATTERN]      list procedural languages
  \dn[S+] [PATTERN]      list schemas
  \do[S]  [PATTERN]      list operators
  \dO[S+] [PATTERN]      list collations
  \dp     [PATTERN]      list table, view, and sequence access privileges
  \drds [PATRN1 [PATRN2]] list per-database role settings
  \ds[S+] [PATTERN]      list sequences
  \dt[S+] [PATTERN]      list tables
  \dT[S+] [PATTERN]      list data types
  \du[+]  [PATTERN]      list roles
  \dv[S+] [PATTERN]      list views
  \dE[S+] [PATTERN]      list foreign tables
  \dx[+]  [PATTERN]      list extensions
  \l[+]                  list all databases
  \sf[+] FUNCNAME        show a function's definition
  \z      [PATTERN]      same as \dp

Formatting
  \a                     toggle between unaligned and aligned output mode
  \C [STRING]            set table title, or unset if none
  \f [STRING]            show or set field separator for unaligned query output
  \H                     toggle HTML output mode (currently off)
  \pset NAME [VALUE]     set table output option
                         (NAME := {format|border|expanded|fieldsep|footer|null|
                         numericlocale|recordsep|tuples_only|title|tableattr|pager})
  \t [on|off]            show only rows (currently off)
  \T [STRING]            set HTML <table> tag attributes, or unset if none
  \x [on|off]            toggle expanded output (currently off)

Connection
  \c[onnect] [DBNAME|- USER|- HOST|- PORT|-]
                         connect to new database (currently "postgres")
  \encoding [ENCODING]   show or set client encoding
  \password [USERNAME]   securely change the password for a user
  \conninfo              display information about current connection

Operating System
  \cd [DIR]              change the current working directory
  \timing [on|off]       toggle timing of commands (currently off)
  \! [COMMAND]           execute command in shell or start interactive shell

Variables
  \prompt [TEXT] NAME    prompt user to set internal variable
  \set [NAME [VALUE]]    set internal variable, or list all if no parameters
  \unset NAME            unset (delete) internal variable

Large Objects
  \lo_export LOBOID FILE
  \lo_import FILE [COMMENT]
  \lo_list
  \lo_unlink LOBOID      large object operations

``` 
