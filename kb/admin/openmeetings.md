# OpenMeetings


## links

https://cwiki.apache.org/confluence/download/attachments/27838216/Installing+OM2.1.1+on+Debian64+Wheezy.pdf?version=1&modificationDate=1380291632000

https://cwiki.apache.org/confluence/display/OPENMEETINGS/Tutorials+for+installing+OpenMeetings+and+Tools
http://dimonyga.ru/ystanovka-red-5-na-centos/
http://habrahabr.ru/post/166671/
http://openmeetings.apache.org/installation.html
http://www.ghostscript.com/download/gsdnld.html

http://www.notesteacher.ru/index.php/stati/24-distant/82-ustanovka-servera-videokonferentsij-openmeetings-3-0-2-v-debian-7-5

## jnlp

https://www.java.com/ru/download/help/jcp_security.xml

```bash
update-alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1
update-alternatives --config java

##update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.7.0_67/bin/javac 1
##update-alternatives --install /usr/bin/javaws javaws /usr/java/jdk1.7.0_67/bin/javaws 1

##update-alternatives --config javac
##update-alternatives --config javaws

/usr/java/latest/bin/ControlPanel
```
to run jnlp go Security tab and add domain

## upgrade 

Что бы уменьшить время и интернет траффик вы можете воспользоватся командной строкой admin для копирования/восстановления/обновления:
войдите в установочную папку OM (например /opt/red5)
остановите OM (./red5-shutdown.sh)
выполняем ./admin.sh -b -file ~/today_om_backup.zip (создает резервную копию OM)
загрузите новый дистрибутив OM
mv /opt/red5 /opt.red5.bak (перемещаем рабочую версию OM :))
распаковываем дистрибутив OM в папку /opt/red5
запускаем ./admin.sh -i -file ~/today_om_backup.zip (или './admin.sh -i -file ~/today_om_backup.zip --db-type mysql --db-user om_user --db-pass om_user_pass' в случае когда база данных отличается от базы по умолчанию )
запускаем OM



## SSL

http://openmeetings.apache.org/RTMPSAndHTTPS.html

## iptables

    Port 5080: HTTP (For example for file upload and download)
    Port 1935: RTMP (Flash Stream and Remoting/RPC)
    Port 8088: RTMP over HTTP-Tunneling (rtmpT)

It means after hitting enter on a line with information, then hit enter or Ctrl-D (EOF) on the blank line.

### JDK 6

Oracle JDK 1.6.24+ for red5
https://code.google.com/p/red5/wiki/RPM_HowTo
JDBC 4

### Oracle JDK 7

JDBC 41

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/webupd8team-java.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" >> /etc/apt/sources.list.d/webupd8team-java.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
apt-get update
apt-get install oracle-java7-installer


### repos

```bash
mcedit /etc/apt/sources.list
deb http://security.debian.org/ wheezy/updates main contrib non-free
deb-src http://security.debian.org/ wheezy/updates main contrib non-free
deb http://ftp.debian.org/debian/ wheezy main contrib non-free
deb-src http://ftp.debian.org/debian/ wheezy main contrib non-free
deb http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb-src http://ftp.debian.org/debian/ wheezy-updates main contrib non-free
deb http://ftp2.de.debian.org/debian wheezy main non-free


deb http://www.deb-multimedia.org wheezy main non-free 

apt-get update
gpg --keyserver pgpkeys.mit.edu --recv-key  07DC563D1F41B907
gpg -a --export 07DC563D1F41B907 | sudo apt-key add -
apt-get install deb-multimedia-keyring 
apt-get update
```

### install postgres 9.3

http://www.postgresql.org/download/linux/debian/

```bash
Create the file 
cat >> /distr/config/pgdg.list
deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main

ln -s /distr/config/pgdg.list /etc/apt/sources.list.d/
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
aptitude update && aptitude install postgresql-9.3

```

pg_dropcluster --stop 9.3 main
pg_createcluster --locale en_US.UTF8 --start 9.3 main


http://openmeetings.apache.org/PostgresConfig.html

```bash
su - postgres -c "createuser --pwprompt --encrypted --no-adduser --no-createdb --no-createrole --no-inherit om_user"
su - postgres -c "createdb --encoding=UNICODE --owner=om_user om_db"
```
echo $LANG
es_US.UTF-8

mcedit /var/lib/postgresql/9.1/main/postmaster.opts

mcedit /etc/postgresql/9.1/main/postgresql.conf
```bash
standard_conforming_strings = on 
escape_string_warning = off
```

mcedit /etc/postgresql/9.1/main/pg_hba.conf
```bash
# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
```


make sure PostgreSQL is listening on TCP/IP connections!
netstat -tuna 

#драйвер
http://jdbc.postgresql.org/download.html

cd /opt/red5/webapps/openmeetings/WEB-INF/lib
wget http://jdbc.postgresql.org/download/postgresql-9.1-903.jdbc4.jar

### как стереть настройки и запустить установку заново

If you encounter issues, you can drop the db again and delete the file $red5/webapps/openmeetings/conf/install.xml and then run the web based installer again


### libs

```bash
aptitude install libreoffice 

#wget --no-check-certificate --no-cookies --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F" http://download.oracle.com/otn-pub/java/jdk/6u32-b05/jdk-6u32-linux-i586.bin

##red5 requires java 1.6

bash jdk-6u45-linux-x64.bin && mkdir -p /usr/lib/jvm && mv jdk1.6.0_45/ /usr/lib/jvm/
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.6.0_45/bin/javac 1
update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.6.0_45/bin/java 1
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.6.0_45/bin/javaws 1
update-alternatives --config javac
update-alternatives --config java
update-alternatives --config javaws

aptitude install libgif-dev xpdf unzip libfreetype6 libfreetype6-dev libjpeg8 libjpeg62 libjpeg8-dev g++ libjpeg-dev libdirectfb-dev libart-2.0-2 libt1-5 zip unzip bzip2 imagemagick subversion git-core checkinstall yasm texi2html libfaac-dev libfaad-dev libxvidcore-dev libmp3lame-dev libsdl1.2-dev libx11-dev libxfixes-dev zlib1g-dev libogg-dev sox libvorbis0a libvorbis-dev libgsm1 libgsm1-dev libfaad2 flvtool2 lame make

aptitude install libpostgresql-jdbc-java libspring-jdbc-java
aptitude install libxmlrpc3-server-java libxmlrpc3-common-java libxmlrpc3-client-java xmlrpc-api-utils


```

### tools

```bash

#####собрать руками#####
cd /distr/
wget http://www.swftools.org/swftools-2013-04-09-1007.tar.gz
tar -zxvf swftools-2013-04-09-1007.tar.gz && cd swftools-2012-10-15-1307 && ./configure && make && checkinstall && echo okok
pdf2swf --version

cd /distr/
git clone --depth 1 git://git.videolan.org/x264.git
cd x264 && ./configure --enable-shared && make && checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes --fstrans=no --default && echo okok

## get latest !!! https://www.ffmpeg.org/download.html
cd /distr
wget https://www.ffmpeg.org/releases/ffmpeg-2.2.4.tar.gz && && ./configure --enable-libmp3lame --enable-libxvid --enable-libvorbis --enable-libgsm --enable-libfaac --enable-gpl --enable-nonfree --enable-libx264 && make && mkdir -p /usr/local/share/ffmpeg && checkinstall && ldconfig && ffmpeg -version 

##sox уже из debiam multimedia. ffmpeg там тоже есть

#####поставить собранный пакет для debian 7.5 x64#####
swftools-2013-04-09_1007-1_amd64.deb
x264_0.142.2+gita5831aa-1_amd64.deb
ffmpeg_2.2.4-1_amd64.deb

```

### ant

```bash

cd /distr
wget http://apache-mirror.rbc.ru/pub/apache/openmeetings/3.0.2/bin/apache-openmeetings-3.0.2.tar.gz && tar -xf apache-openmeetings-3.0.2.tar.gz 
mv /distr/apache-openmeetings-3.0.2 /opt/
ln -s /opt/apache-openmeetings-3.0.2 /opt/red5

# если будудт ошибки openJPA JDBC - надо пересобрать руками
#возможно дело в том, что собрано под ubuntu LTS

#wget http://apache-mirror.rbc.ru/pub/apache/openmeetings/2.1.1/src/apache-openmeetings-2.1.1-src.tar.gz
#tar -zxvf apache-openmeetings-2.1.1-src.tar.gz 
#cd apache-ant-1.8.4/bin/
#./ant clean.all && ./ant -Ddb=postgres && ./ant -version
##~25 minutes !!!


cat >> /etc/hosts
140.211.11.74    repository.apache.org

cd /distr
wget http://apache-mirror.rbc.ru/pub/apache//ant/binaries/apache-ant-1.9.4-bin.tar.gz
tar -xf apache-ant-1.9.4-bin.tar.gz
mv /distr/apache-ant-1.9.4 /opt/
ln -s /opt/apache-ant-1.9.4/ /opt/ant
export PATH=${PATH}:/opt/ant:/opt/ant/bin
echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/ant:/opt/ant/bin
ant -version

wget http://apache-mirror.rbc.ru/pub/apache/openmeetings/3.0.2/src/apache-openmeetings-3.0.2-src.zip
tar -xf apache-openmeetings-3.0.2-src.zip 
cd apache-openmeetings-3.0.2

ant clean.all
ant -Ddb=postgresql 

#перемещаем собранный OM
mv dist/red5/ /opt/

[ivy:resolve] :::: ERRORS
[ivy:resolve]   SERVER ERROR: Service Temporarily Unavailable url=https://repository.apache.org/content/repositories/releases/commons-beanutils/commons-beanutils/1.8.3/commons-beanutils-1.8.3.jar.sha1
[ivy:resolve]   SERVER ERROR: Service Temporarily Unavailable url=https://repository.apache.org/content/repositories/releases/commons-beanutils/commons-beanutils/1.8.3/commons-beanutils-1.8.3.jar.md5
[ivy:resolve]   SERVER ERROR: Service Temporarily Unavailable url=https://repository.apache.org/content/repositories/releases/commons-codec/commons-codec/1.6/commons-codec-1.6.jar
[ivy:resolve]   SERVER ERROR: Service Temporarily Unavailable url=https://repository.apache.org/content/repositories/releases/commons-collections/commons-collections/3.2.1/commons-collections-3.2.1.jar
[ivy:resolve]   SERVER ERROR: Service Temporarily Unavailable url=https://repository.apache.org/content/repositories/releases/commons-pool/commons-pool/1.5.6/commons-pool-1.5.6.jar

ivysettings.xml:
replace the
<artifact pattern="http://repo1.maven.org/maven2/[organisation]/[artifact]-[revision].[ext]"/>
with
<artifact pattern="http://repo1.maven.org/maven2/[artifact]/[artifact]/[revision]/[artifact]-[revision].[ext]"/>

```

### JOD

```bash
cd /distr
wget http://jodconverter.googlecode.com/files/jodconverter-core-3.0-beta-4-dist.zip && unzip jodconverter-core-3.0-beta-4-dist.zip
mv /distr/jodconverter-core-3.0-beta-4 /opt/
ln -s /opt/jodconverter-core-3.0-beta-4 /opt/jod

```

### security

```bash

useradd om_user
usermod -s /sbin/nologin om_user
chown -R om_user:om_user /opt/red5

```

### config 

```bash

cd /usr/lib/red5/webapps/openmeetings/WEB-INF/classes/META-INF/
mkdir /distr/config
cp persistence.xml persistence.xml.origi
cp postgresql_persistence.xml /distr/config/persistence.xml
mcedit /distr/config/persistence.xml

<property name="openjpa.ConnectionProperties"
    value="DriverClassName=org.postgresql.Driver
      , Url=jdbc:postgresql://localhost:5432/om_db
      ...
      , Username=om_user
      , Password=********" />

ln -s /distr/config/persistence.xml /usr/lib/red5/webapps/openmeetings/WEB-INF/classes/META-INF/persistence.xml


```

### INIT script

```bash

cat >> red5-om.sh

ln -s /distr/red5-om.sh /etc/init.d/red5-om.sh
update-rc.d red5-om.sh defaults
cd /usr/lib/red5/

./red5.sh

tail -f log/openmeetings.log

mcedit /etc/init.d/red5-om.sh

/etc/init.d/red5-om.sh stop
```

###  Cоздаем скрипты запуска red5

http://your_ip:5080/openmeetings/install

## OM 2 Backup

```bash
./admin.sh -b -v --db-name om-db --db-user om-user --password om-passwd -file /distr/om-backup.zip
```

### mysql

apt-get install texi2html unzip imagemagick ghostscript ttf-mscorefonts-installer pstoedit libpaper-utils ttf-dejavu sox ffmpeg lame libart-2.0-2

wget http://www.swftools.org/swftools-0.9.2.tar.gz
apt-get install g++ libfreetype6 libfreetype6-dev libjpeg62 libjpeg62-dev libt1-dev libungif4-dev libavifile-0.7-dev libavifile-0.7c2

cd /opt/red5/webapps/openmeetings/WEB-INF/classes/META-INF/
cp -f mysql_persistence.xml persistence.xml

правим
  , Username=root
  , Password=my_password"/>
(заменить существующий  persistence.xml)

MySQL jConnector JDBC

wget http://www.mysql.com/downloads/connector/j/mysql-connector-java-5.1.30.tar.gz 
tar -xf mysql-connector-java-5.1.30.tar.gz 
cp mysql-connector-java-5.1.22-bin.jar /opt/red5/webapps/openmeetings/WEB-INF/lib 
