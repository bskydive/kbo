# AIX

## 1. Введение

### 1.1. Описание

### 1.2. Реквизиты

## 3. Администрирование

### 3.1. Установка


список ПО Linux для AIX
```
bash
bash-doc
gzip
bzip2
coreutils
bc
cpio
hexedit
lynx
depdump
unzip
vim-common
vim-minimal
vim-enhanced
wget
which
zip
zlib
zsh
```

### 3.2. Настройка

```bash
загрузка системных служб (которыми управляешь через stopsrc/startsrc) 
разрешается/запрещается командой

chrctcp

отрубить автозапуск нужно тремя командами :
stopsrc -s NAME
chrctcp -d NAME
rmitab NAME
```

### 3.3. Управление

```bash
Перезапуск сети

-bash-3.00# refresh -s inetd
0513-095 The request for subsystem refresh was completed successfully.

Перезапуск ssh

-bash-3.00# ps -Af | grep ssh
    root 192648 135660   0 17:52:32      -  0:00 sshd: root@notty
    root 258164 151880   0 18:13:07  pts/0  0:00 grep ssh
    root 135660  86438   0 14:33:20      -  0:01 /usr/sbin/sshd
    root 196952 135660   0 14:46:37      -  0:00 sshd: root@pts/0
    root 205214 135660   0 15:27:09      -  0:00 sshd: root@pts/2
    root 209392 135660   0 15:14:42      -  0:00 sshd: root@pts/1
    root 213284 135660   0 15:15:25      -  0:00 sshd: root@notty
-bash-3.00# kill -HUP 135660

```
 
### 3.4. Резервное копирование

### 3.5. Мониторинг

```bash

для определения сколько памяти занимает процесс:

[root@fcodaix root]# svmon -P | grep java


-------------------------------------------------------------------------------
     Pid Command          Inuse      Pin     Pgsp  Virtual 64-bit Mthrd 
16MB
  450726 java            *359271*     7721    28455   383034      Y    
Y     N


Заголовок он не выводит, поэтому просто смотри третье поле. Умножай на 4
и получишь в килобайтах.

свободная память смотрится так:

[root@fcodaix root]# svmon
               size      inuse       free        pin    virtual
memory       524288     522876       *1412*     116815     722872
pg space    3211264     236493


опять же умножай на 4 и будут килобайты


svmon показывает только страницы по 4Кб
в новых версиях svmon можно делать так
svmon -PO unit=MB -O summary=basic -t 3

будут три самых прожорливых процесса

```

```bash

Готовые команды

svmon | awk ' /memory/ {printf("MB free: %d\nMB all: %d\n",($4*4)/1024,($2*4)/1024)}'
MB free: 6
MB all: 2048

svmon -P | awk ' /java/ {printf("Pid: %d\nCommand: %s\nInuse: %d MB\nPgsp: %d MB\nVirtual: %d\n",$1, $2, ($3*4)/1024 ,($5*4)/1024, ($6*4)/1024)}'

Pid: 585850
Command: java
Inuse: 1360 MB
Pgsp: 279 MB
Virtual: 1654

svmon -P | awk ' /java/ {printf("Pid: %d\nCommand: %s\nInuse: %d MB\n",$1, $2, ($3*4)/1024)}'
Pid: 585850
Command: java
Inuse: 1360 MB


```

## 4. Использование

```bash
 lslpp -w /usr/sbin/cron
  File                                        Fileset               Type
  ----------------------------------------------------------------------------
  /usr/sbin/cron                              bos.rte.cron          File

```

## 5. Документы

## 6. Ссылки

 * http://www.unix.com/aix/26488-ssh-aix.html
 * http://aix4admins.blogspot.ru/2011/06/commands-oslevel-shows-actual-bos-level.html


## 8. Контакты специалистов 
