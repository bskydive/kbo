
# Bbb


http://how-it.ru/public/root/431-ustanovka_bigbluebutton_na_debian_squeeze.html


```bash
apt-get update
mkdir /distr

wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 451AE93C
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5
##cat >> /etc/apt/sources.list.d/bigbluebutton.list
##deb http://ubuntu.bigbluebutton.org/lucid_dev_08/ bigbluebutton-lucid main

cat >> /etc/apt/sources.list
#

# deb cdrom:[Debian GNU/Linux 6.0.7 _Squeeze_ - Official i386 xfce+lxde-CD Binary-1 20130223-13:15]/ squeeze main

#Deb cdrom:[Debian GNU/Linux 6.0.7 _Squeeze_ - Official i386 xfce+lxde-CD Binary-1 20130223-13:15]/ squeeze main

deb http://ftp.ru.debian.org/debian squeeze main contrib non-free
deb-src http://ftp.ru.debian.org/debian squeeze main contrib non-free

deb http://ftp.ru.debian.org/debian squeeze-updates main contrib non-free
deb-src http://ftp.ru.debian.org/debian squeeze-updates main contrib non-free

deb http://security.debian.org/ squeeze/updates main contrib non-free
deb-src http://security.debian.org/ squeeze/updates main contrib non-free

deb http://us.archive.ubuntu.com/ubuntu/ lucid multiverse
deb http://ubuntu.bigbluebutton.org/lucid_dev_08/ bigbluebutton-lucid main


export LANG=en_US.UTF-8
#иначе будет ошибка при установке bbb-record-core

aptitude install libgmp3c2

wget http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/m/mpfr/libmpfr1ldbl_2.4.2-3ubuntu1_i386.deb
dpkg -i libmpfr1ldbl_2.4.2-3ubuntu1_i386.deb
mkdir -p /var/www/nginx-default
touch /var/www/nginx-default/50x.html


apt-get install sudo mc less openssl zlib1g-dev libssl-dev libreadline5-dev libyaml-dev build-essential bison checkinstall libffi5 gcc libreadline5 libyaml-0-2
cd /distr/
cat >> ruby_install.sh
#!/bin/bash
cd /tmp
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
tar xvzf ruby-1.9.2-p290.tar.gz
cd ruby-1.9.2-p290
./configure --prefix=/usr\
            --program-suffix=1.9.2\
            --with-ruby-version=1.9.2\
            --disable-install-doc
make
sudo checkinstall -D -y\
                  --fstrans=no\
                  --nodoc\
                  --pkgname='ruby1.9.2'\
                  --pkgversion='1.9.2-p290'\
                  --provides='ruby'\
                  --requires='libc6,libffi5,libgdbm3,libncurses5,libreadline5,openssl,libyaml-0-2,zlib1g'\
                  --maintainer=brendan.ribera@gmail.com
sudo update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.2 500 \
                         --slave /usr/bin/ri ri /usr/bin/ri1.9.2 \
                         --slave /usr/bin/irb irb /usr/bin/irb1.9.2 \
                         --slave /usr/bin/erb erb /usr/bin/erb1.9.2 \
                         --slave /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.2
sudo update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.9.2 500

bash ruby_install.sh
ruby -v
gem -v
gem list
gem install hello

apt-get install bigbluebutton

The following extra packages will be installed:
  authbind bbb-apps bbb-apps-deskshare bbb-apps-sip bbb-apps-video bbb-client bbb-common bbb-config bbb-freeswitch bbb-freeswitch-config
  bbb-openoffice-headless bbb-playback-slides bbb-record-core bbb-web ca-certificates-java cabextract comerr-dev default-jre default-jre-headless
  esound-common exiv2 gcj-4.4-base gcj-4.4-jre-lib ghostscript gsfonts imagemagick java-common jsvc krb5-multidev libaa1 libaccess-bridge-java
  libaccess-bridge-java-jni libao-common libao4 libasyncns0 libaudio2 libaudiofile0 libcaca0 libcdparanoia0 libcdt4 libcolamd2.7.1
  libcommons-beanutils-java libcommons-collections3-java libcommons-compress-java libcommons-daemon-java libcommons-dbcp-java
  libcommons-digester-java libcommons-logging-java libcommons-pool-java libcurl3 libcurl4-openssl-dev libdb-je-java libdb4.7-java
  libdb4.7-java-gcj libdjvulibre-text libdjvulibre21 libdvdnav4 libdvdread4 libecj-java libenca0 libesd0 libexiv2-9 libexpat1-dev libflac8
  libfontconfig1-dev libfreetype6-dev libfribidi0 libgcj-bc libgcj-common libgcj10 libgd2-noxpm libgraph4 libgs8 libgvc5 libhsqldb-java
  libicu4j-java libidn11-dev libilmbase6 libjack-jackd2-0 libjaxp1.3-java libjbig2dec0 libjline-java libjpeg62-dev libjtidy-java libkrb5-dev
  libldap2-dev liblircclient0 liblqr-1-0 liblucene2-java liblzo2-2 libmagickcore3 libmagickcore3-extra libmagickwand3 libnetpbm10 libopenal1
  libopencore-amrnb0 libopencore-amrwb0 libopenexr6 libpaper-utils libpaper1 libpathplan4 libpostproc51 libpulse0 libpython2.6 libregexp-java
  libservlet2.5-java libsmbclient libsndfile1 libsox-fmt-alsa libsox-fmt-base libsox1b libssh2-1 libssh2-1-dev libtalloc2 libtomcat6-java
  libvorbisfile3 libwavpack1 libwbclient0 libwmf0.2-7 libwpd8c2a libwpg-0.1-1 libwps-0.1-1 libxdot4 libxml2-dev libxslt1-dev lp-solve lsb-release
  mencoder mplayer netcat-openbsd netpbm nginx odbcinst odbcinst1debian2 openjdk-6-jre openjdk-6-jre-headless openjdk-6-jre-lib openoffice.org
  openoffice.org-base openoffice.org-base-core openoffice.org-calc openoffice.org-draw openoffice.org-emailmerge openoffice.org-filter-binfilter
  openoffice.org-filter-mobiledev openoffice.org-impress openoffice.org-java-common openoffice.org-math openoffice.org-officebean
  openoffice.org-report-builder-bin openoffice.org-writer pkg-config python-gnupginterface python-software-properties python-uno red5
  redis-server-2.2.4 sox swftools-0.9.1 tomcat6 tomcat6-common ttf-dejavu ttf-dejavu-extra ttf-liberation ttf-mscorefonts-installer
  ttf-sil-gentium ttf-sil-gentium-basic tzdata-java ufraw-batch unattended-upgrades unixodbc unzip vorbis-tools x-ttcidfont-conf zip
Suggested packages:
  doc-base esound-clients imagemagick-doc autotrace cups-bsd lpr lprng curl enscript ffmpeg gimp gnuplot grads hp2xx html2ps libwmf-bin povray
  radiance sane-utils texlive-base-bin transfig xdg-utils equivs krb5-doc nas libcommons-beanutils-java-doc libcommons-collections3-java-doc
  java-virtual-machine glassfish-javaee libcommons-digester-java-doc liblog4j1.2-java libexcalibur-logkit-java libavalon-framework-java
  libcommons-logging-java-doc libcurl3-dbg libdvdcss2 ecj ant libecj-java-gcj esound libgcj10-dbg libgcj10-awt libgd-tools libhsqldb-java-doc
  libhsqldb-java-gcj jackd2 libjaxp1.3-java-gcj libjline-java-doc libjtidy-java-doc lirc libportaudio2 pulseaudio libsox-fmt-all lsb mplayer-doc
  ttf-freefont netselect fping icedtea6-plugin libnss-mdns sun-java6-fonts ttf-baekmuk ttf-unfonts ttf-unfonts-core ttf-sazanami-gothic
  ttf-kochi-gothic ttf-sazanami-mincho ttf-kochi-mincho ttf-wqy-microhei ttf-wqy-zenhei ttf-indic-fonts hunspell-dictionary myspell-dictionary
  openoffice.org-help-3.2 openoffice.org-l10n-3.2 openoffice.org-hyphenation openoffice.org2-thesaurus openoffice.org-gnome openoffice.org-kde
  openclipart-openoffice.org pstoedit gstreamer0.10-plugins-base gstreamer0.10-plugins-good gstreamer0.10-plugins-ugly gstreamer0.10-plugins-bad
  gstreamer0.10-ffmpeg libmyodbc odbc-postgresql libsqliteodbc tdsodbc mdbtools libmysql-java libpg-java libjtds-java openoffice.org-gcj
  openoffice.org-report-builder bsh tomcat6-docs tomcat6-admin tomcat6-examples tomcat6-user libtcnative-1 ufraw unixodbc-bin
The following NEW packages will be installed:
  authbind bbb-apps bbb-apps-deskshare bbb-apps-sip bbb-apps-video bbb-client bbb-common bbb-config bbb-freeswitch bbb-freeswitch-config
  bbb-openoffice-headless bbb-playback-slides bbb-record-core bbb-web bigbluebutton ca-certificates-java cabextract comerr-dev default-jre
  default-jre-headless esound-common exiv2 gcj-4.4-base gcj-4.4-jre-lib ghostscript gsfonts imagemagick java-common jsvc krb5-multidev libaa1
  libaccess-bridge-java libaccess-bridge-java-jni libao-common libao4 libasyncns0 libaudio2 libaudiofile0 libcaca0 libcdparanoia0 libcdt4
  libcolamd2.7.1 libcommons-beanutils-java libcommons-collections3-java libcommons-compress-java libcommons-daemon-java libcommons-dbcp-java
  libcommons-digester-java libcommons-logging-java libcommons-pool-java libcurl3 libcurl4-openssl-dev libdb-je-java libdb4.7-java
  libdb4.7-java-gcj libdjvulibre-text libdjvulibre21 libdvdnav4 libdvdread4 libecj-java libenca0 libesd0 libexiv2-9 libexpat1-dev libflac8
  libfontconfig1-dev libfreetype6-dev libfribidi0 libgcj-bc libgcj-common libgcj10 libgd2-noxpm libgraph4 libgs8 libgvc5 libhsqldb-java
  libicu4j-java libidn11-dev libilmbase6 libjack-jackd2-0 libjaxp1.3-java libjbig2dec0 libjline-java libjpeg62-dev libjtidy-java libkrb5-dev
  libldap2-dev liblircclient0 liblqr-1-0 liblucene2-java liblzo2-2 libmagickcore3 libmagickcore3-extra libmagickwand3 libnetpbm10 libopenal1
  libopencore-amrnb0 libopencore-amrwb0 libopenexr6 libpaper-utils libpaper1 libpathplan4 libpostproc51 libpulse0 libpython2.6 libregexp-java
  libservlet2.5-java libsmbclient libsndfile1 libsox-fmt-alsa libsox-fmt-base libsox1b libssh2-1 libssh2-1-dev libtalloc2 libtomcat6-java
  libvorbisfile3 libwavpack1 libwbclient0 libwmf0.2-7 libwpd8c2a libwpg-0.1-1 libwps-0.1-1 libxdot4 libxml2-dev libxslt1-dev lp-solve lsb-release
  mencoder mplayer netcat-openbsd netpbm nginx odbcinst odbcinst1debian2 openjdk-6-jre openjdk-6-jre-headless openjdk-6-jre-lib openoffice.org
  openoffice.org-base openoffice.org-base-core openoffice.org-calc openoffice.org-draw openoffice.org-emailmerge openoffice.org-filter-binfilter
  openoffice.org-filter-mobiledev openoffice.org-impress openoffice.org-java-common openoffice.org-math openoffice.org-officebean
  openoffice.org-report-builder-bin openoffice.org-writer pkg-config python-gnupginterface python-software-properties python-uno red5
  redis-server-2.2.4 sox swftools-0.9.1 tomcat6 tomcat6-common ttf-dejavu ttf-dejavu-extra ttf-liberation ttf-mscorefonts-installer
  ttf-sil-gentium ttf-sil-gentium-basic tzdata-java ufraw-batch unattended-upgrades unixodbc unzip vorbis-tools x-ttcidfont-conf zip



!!!red5 hangs-up

reboot

dpkg --configure -a
apt-get install bbb-demo




bbb-conf --clean
bbb-conf --check
bbb-conf --setip 94.250.248.67
bbb-conf --stop
/etc/init.d/redis-server-2.2.4 stop

```




We recommend installing BigBlueButton on a dedicated (non-virtual) server for optimal performance. To install BigBlueButton, you'll need root access to a Ubuntu 10.04 server with

4 GB (or more of memory)
quad-core 2.6 GHZ CPU (or faster)
Ports 80, 1935, 9123 accessible
Port 80 is not used by another application
500G of free disk space (or more) for recordings
Minimum of 100 MBits/sec bandwidth 


* проверить скорость соединения
* выключить торренты и проверить QoS провайдера
* выключить тяжелые приложения(антивирус, индексатор, торрент, сетевые папки, терминалы)
* изоляция от посторонних шумов, открытый микрофон(гарнитура)

http://code.google.com/p/bigbluebutton/wiki/FAQ#What_are_the_minimum_hardware_requirements_for_the_BigBlueButton

For viewers (students): (at least) 0.5 Mbits/sec -- which is 500 Kbits/sec -- upstream bandwidth, and (at least) 1 Mbits/sec download bandwidth.

andwidth requirements for server

IOPS?

320x240 or 640x480. 
roughly 30-50 kbytes/second per stream.
Viewers can only share a 320x240 webcam.


    Y = 30-50 Kbytes/sec; let's assume 40 Kbytes/sec on average
    W = amount of webcams that are streaming
    U = amount of users that are watching 

For calculations:

    server incoming bandwidth: W*Y
    server outgoing bandwidth: W*(U-1)*Y (minus one since a broadcaster does not have to subscribe to his own stream) 

For example, with 5 users in a room with 5 webcams streaming, the bandwidth calculation is as follows:

    in: 5*40 = 200 Kbytes/sec incoming bandwidth needed to the server (e.g. 1.6 Mbit)
    out: 5*(5-1)*40 = 800 Kbytes/sec incoming bandwidth needed from the server (e.g. 6.4 Mbit)
    Total traffic used after one our: 60 mins*60 secs*(200 + 800) = 3.6 Gbyte traffic per hour 

If you'd have a typical classroom situation with the presenter broadcasting their webcam to 30 remote students, the calculation is as follows:

    in: 1*40 = 40 Kbytes/sec incoming (e.g. 0.32 Mbit/sec)
    out: 1*(30-1)*40 = 1160 Kbytes/sec outgoing (e.g. 9.3 Mbit/sec)
    Total traffic used after one hour: 60 mins*60 secs*( 40 + 1160) = 4.3 

Gbyte traffic per hour

10 of those classes. server need to be able to output 93 Mbit/sec.

Sharing slides take almost no bandwidth beyond the initial uploading/downloading of slides. 
Chat also almost no bandwidth as well.
Desktop sharing takes the most bandwidth, and it's dependent on area chosen by the presenter (full screen and region) and how often their screen updates.

A VoIP connection to the BigBlueButton takes roughly 20 kB/sec per user. 
if there are 20 students , then the bandwidth is 20 * 20 KBytes/sec = 400 kBytes/sec.

If the presenter has only 100 KByte/second upstream, then performing VoIP, video, and desktop sharing will not fit within that upstream constraint. In reality, red5/Flash does a good job of using limited bandwidth and it actually works quite well. In the case of desktop sharing, the remote desktops will still receive updates, but the refresh will be much slower than if the presenter was on a LAN (such as within the university or college network).
What are the minimum bandwidth requirements for a user?












```bash
http://code.google.com/p/bigbluebutton/wiki/InstallationUbuntu#Install_Video



apt-get install zlib1g-dev libssl-dev libreadline5-dev libyaml-dev build-essential bison checkinstall libffi5 gcc checkinstall libreadline5 libyaml-0-2


   17  wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | sudo apt-key add -
   21  wget http://ubuntu.bigbluebutton.org/bigbluebutton.asc -O- | sudo apt-key add -
   60  wget http://us.archive.ubuntu.com/ubuntu/pool/main/m/mpfr/libmpfr-dev_2.4.2-3ubuntu1_i386.deb
   61  wget http://us.archive.ubuntu.com/ubuntu/pool/main/z/zlib/zlib1g-dev_1.2.3.4.dfsg-3ubuntu3_i386.deb
   80  wget http://us.archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi5_3.0.9-1_i386.deb
   90  wget http://us.archive.ubuntu.com/ubuntu/pool/main/libf/libffi/libffi5_3.0.9-1_i386.deb


root@ubuntu:/distr# apt-get install libgmp3-dev
Reading package lists... Done
Building dependency tree
Reading state information... Done
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
 libgmp3-dev : Depends: libgmp-dev (= 2:5.0.2+dfsg-2ubuntu1) but it is not going to be installed
 libmpfr-dev : Depends: libmpfr1ldbl (= 2.4.2-3ubuntu1) but it is not installable
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).
root@ubuntu:/distr# apt-get install libgmp-dev
Reading package lists... Done
Building dependency tree
Reading state information... Done
You might want to run 'apt-get -f install' to correct these:
The following packages have unmet dependencies:
 libgmp-dev : Depends: libgmpxx4ldbl (= 2:5.0.2+dfsg-2ubuntu1) but it is not going to be installed
              Breaks: libmpfr-dev (< 3.0.1-5) but 2.4.2-3ubuntu1 is to be installed
 libmpfr-dev : Depends: libgmp3-dev (>= 4.2.dfsg-1) but it is not going to be installed
               Depends: libmpfr1ldbl (= 2.4.2-3ubuntu1) but it is not installable
E: Unmet dependencies. Try 'apt-get -f install' with no packages (or specify a solution).
root@ubuntu:/distr#

The following extra packages will be installed:
  binutils cpp cpp-4.6 gcc gcc-4.6 libc-dev-bin libc6-dev libgomp1 libmpc2 libquadmath0 libssl-doc linux-libc-dev manpages-dev
  zlib1g-dev
Suggested packages:
  binutils-doc cpp-doc gcc-4.6-locales gcc-multilib make autoconf automake1.9 libtool flex bison gdb gcc-doc gcc-4.6-multilib
  libmudflap0-4.6-dev gcc-4.6-doc libgcc1-dbg libgomp1-dbg libquadmath0-dbg libmudflap0-dbg binutils-gold glibc-doc


libyaml-0-2 libyaml-dev

The following extra packages will be installed:
  dpkg-dev fakeroot g++ g++-4.6 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libdpkg-perl
  libstdc++6-4.6-dev make patch
Suggested packages:
  debian-keyring g++-multilib g++-4.6-multilib gcc-4.6-doc libstdc++6-4.6-dbg libstdc++6-4.6-doc make-doc diffutils-doc


The following extra packages will be installed:
  libbison-dev m4
Suggested packages:
  bison-doc

The following extra packages will be installed:
  libtinfo-dev
The following NEW packages will be installed:
  libreadline-gplv2-dev libtinfo-dev

  apt-get install libssl-dev
   63  apt-get install libyaml-dev
   64  apt-get install build-essential
   65  apt-get install bison
   66  apt-get install checkinstall
   67  apt-get install libreadline5
   68  apt-get install libreadline5-dev
   69  apt-get install libreadline-gplv2-dev

```
 
