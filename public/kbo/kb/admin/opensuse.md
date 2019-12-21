# Opensuse


## virtualbox

 * сеть-->сетевой мост-->паравиртуальная сеть(virt-io)
 * [mount share folder](https://serverfault.com/questions/674974/how-to-mount-a-virtualbox-shared-folder#674978)

```bash
	mount -t vboxsf share /home/toto
	 VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir /home/toto/
	VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir
```

## просмотр markdown файлов

[установить плагин в хром](https://chrome.google.com/webstore/detail/markdown-preview/jmchmkecamhbiokiopfpnfgbidieafmd?utm_source=chrome-app-launcher-info-dialog)

[установить pandoc и настроить kate](https://www.maketecheasier.com/convert-markdown-to-html-in-kate-text-editor/)

[смотреть плагином в idea](https://plugins.jetbrains.com/plugin/5970?pr=idea)

## screencast

 * simplescreenrecorder

## security

 * [spectre meltdown opensuse](https://www.suse.com/support/kb/doc/?id=7022512)
 * [spectre meltdown detect](https://github.com/speed47/spectre-meltdown-checker)

## audio

 * ffmpegyag

### pulse

 * [pulseaudio-equalizer](files/equalizer-preset.png)
 * в pavucontrol выбрать воспроизведение через LADSPA Plugin, чтобы эквалайзер заработал
 * удаление pulseaudio-equalizer
    ```
    
    ~/.config/pulse/default.pa
    #закомментировать module-loadspa-sink
    ### BEGIN: Equalized audio configuration
    ### Generated from: pulseaudio-equalizer
    #load-module module-ladspa-sink sink_name=ladspa_output.mbeq_1197.mbeq master=alsa_output.pci-0000_00_14.2.analog-stereo plugin=mbeq_1197 label=mbeq control=-3.4,1.7,2.0,3.0,5.0,5.6,6.5,5.2,3.2,1.5,0.0,-2.5,-4.8,-4.8,-3.2
    #set-default-sink ladspa_output.mbeq_1197.mbeq
    #set-sink-mute alsa_output.pci-0000_00_14.2.analog-stereo 0
    ### END: Equalized audio configuration
    #запуск от обычного пользователя
    pulseaudio --start
    ```
 * https://softwarerecs.stackexchange.com/questions/31490/program-measuring-sound-and-generating-an-equalizer-profile
 * https://en.opensuse.org/SDB:Audio_troubleshooting#A_possible_fix_to_choppy_.2F_skipping_sound
 * https://en.opensuse.org/SDB:Audio_troubleshooting#Intel_HDA_chipset

```bash
/etc/pulse/daemon.conf . Try changing the line default-sample-rate = 44100 in /etc/pulse/daemon.conf by default-sample-rate = 48000 and restart the PulseAudio server. 

1
PULSE_PROP="filter.want=echo-cancel" skype

2
load-module module-echo-cancel source_name=noechosource sink_name=noechosink
set-default-source noechosource
Можно добавить эти строки в /etc/pulse/default.pa куда-нибудь в конец, чтобы они выполнялись каждый раз при запуске pulseaudio.
```

 * https://bugs.freedesktop.org/show_bug.cgi?id=94167

 ```
	userB doesn't have access to /run/user/1000/pulse/native, which is why userB tries to start its own pulseaudio instance. And even if userB has access to the socket, pulseaudio will reject the connection attempt by a different user. There are a few steps to make this work:

Copy /etc/pulse/default.pa to /home/userA/.config/pulse/default.pa and change this line

    load-module module-native-protocol-unix

to

    load-module module-native-protocol-unix auth-anonymous=true

After that change anyone having access to the socket will be allowed to connect. Then give userB access to /run/user/1000/pulse/native (setfacl can probably be used to grant access to only that user, but I don't know the exact command).

It's probably also a good idea to not rely on the x11 property to point userB to userA's pulseaudio socket, so you can add "default-server = /run/user/1000/pulse/native" to /home/userB/.config/pulse/client.conf (I'm assuming that userB is only used from within userA's login sessions, so we don't need to support the case where userB logs in separately).

If you wish to have the socket somewhere else, you can pass socket=/somewhere/else to module-native-protocol-unix the same way you pass auth-anonymous=true.

 ```

### ogg to mp3

```bash
 ./ -iname "*.ogg" -exec oggdec {} \;
 ./ -iname "*.wav" -exec lame {} {}.mp3 \;
 "*.wav.mp3" "#1.mp3"
  *.ogg *.wav
```

### mp4 to audio

```bash
ffmpeg -i ./*.mp4 -vn -sn -dn -af "volume=9.9dB" -ab 95k -f mp3 audio.mp3
ffmpeg -i video.mp4 -f mp3 -ab 192000 -vn music.mp3
ffmpeg -i video.mp4 -vn -acodec copy audio.m4a
```

```bash
#!/bin/bash
for f in *.mp4
do
    name=`echo "$f" | sed -e "s/.mp4$//g"`
    ffmpeg -i "$f" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$name.mp3"
done
```

```bash
for f in *.mp4; 
do 
ffmpeg -i "$f" -vn -c:a libmp3lame -ar 44100 -ac 2 -ab 192k "${f/%mp4/mp3}"; 
done

```

https://superuser.com/questions/323119/how-can-i-normalize-audio-using-ffmpeg

```bash
ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null /dev/null

Replace /dev/null with NUL on Windows.
The -vn, -sn, and -dn arguments instruct ffmpeg to ignore non-audio streams during this analysis. This drastically speeds up the analysis.

This will output something like the following:

[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] mean_volume: -16.0 dB
[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] max_volume: -5.0 dB
[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] histogram_0db: 87861

As you can see, our maximum volume is -5.0 dB, so we can apply 5 dB gain. If you get a value of 0 dB, then you don't need to normalize the audio.



    Plain audio file: Just encode the file with whatever encoder you need:

    ffmpeg -i input.wav -af "volume=5dB" output.mp3

    Your options are very broad, of course.

    AVI format: Usually there's MP3 audio with video that comes in an AVI container:

    ffmpeg -i video.avi -af "volume=5dB" -c:v copy -c:a libmp3lame -q:a 2 output.avi

    Here we chose quality level 2. Values range from 0–9 and lower means better. Check the MP3 VBR guide for more info on setting the quality. You can also set a fixed bitrate with -b:a 192k, for example.

    MP4 format: With an MP4 container, you will typically find AAC audio. We can use ffmpeg's build-in AAC encoder.

    ffmpeg -i video.mp4 -af "volume=5dB" -c:v copy -c:a aac -b:a 192k output.mp4

    Here you can also use other AAC encoders. Some of them support VBR, too. See this answer and the AAC encoding guide for some tips.

In the above examples, the video stream will be copied over using -c:v copy. If there are subtitles in your input file, or multiple video streams, use the option -map 0 before the output filename.
```

```bash
ffmpeg -i ./*.mp4 -vn -sn -dn -af "volume=5dB" audio.m4a
```

## ibus

```
ibus ibus-branding-openSUSE-KDE ibus-gtk ibus-gtk3 ibus-lang ibus-m17n ibus-qt ibus-table ibus-table-rustrad ibus-table-translit libm17n0 libotf0 m17n-db m17n-db-lang typelib-1_0-IBus-1_0
ibus-lang

```

## X11Forwarding


```bash
linux-it9h:~ # ssh user@192.168.0.203 -X
Password:
Last login: Wed Nov  5 21:43:15 2014 from 192.168.0.207
Have a lot of fun...
ifconfig: command not found
user@linux-rbo1:~> xclock
user@linux-rbo1:~> echo $DISPLAY
linux-rbo1.site:10.0
user@linux-rbo1:~> xhost
access control enabled, only authorized clients can connect
INET:192.168.0.203
user@linux-rbo1:~>
linux-rbo1:~ # ps axjf|grep X
  931   989   989   989 tty7       989 Ss+      0   0:22  \_ /usr/bin/X -background none :0 vt07 -nolisten tcp
  931  1189  1189  1189 ?           -1 Ssl   1000   0:00  \_ /usr/bin/lxsession -s LXDE -e LXDE
    1  1379  1189  1189 ?           -1 S     1000   0:00 /usr/bin/dbus-launch --sh-syntax --exit-with-session /etc/X11/xinit/xinitrc

linux-it9h:~ # grep -i x11 /etc/ssh/sshd_config
X11Forwarding yes
#X11DisplayOffset 10
X11UseLocalhost no
#       X11Forwarding no
linux-it9h:~ # grep -i x11 /etc/ssh/ssh_config
#   ForwardX11 no
# should not forward X11 connections to your local X11-display for
# keystrokes as you type, just like any other X11 client could do.
# file if you want to have the remote X11 authentification data to
ForwardX11Trusted yes
linux-it9h:~ #

#xauth
xauth list
xauth +localhost
xauth -

```

## jpeg to pdf

    ```bash
    convert -quality 100 -density 100 -trim test*.jpeg single.pdf
    convert -geometry 1024 -quality 100 -density 100 -trim 09.STEPANOV.ACT*.jpeg 09.STEPANOV.ACT.SIGNED.pdf
    ```

## network


смотреть в /etc/NetworkManager/system-connections/

```bash
$ nmcli c modify <name> wifi-sec.key-mgmt wpa-psk wifi-sec.psk <password>
```
https://docs.ubuntu.com/core/en/stacks/network/network-manager/docs/configure-wifi-connections

Configure WiFi Connections | NetworkManager documentation

## policy-kit

org.freedesktop.login1.hibernate-multiple-sessions


## dark theme тёмная тема

### konqueror

вернуть чёрный на белом
настройка-настроить konqueror-таблицы стилей-использовать специальную таблицу стилей

### kde libreoffice

tools(сервис)-options(параметры)-accessability(спец возм)-
выключить:
 автоопределение выс контраста
автоматически подбирать цвет текста
разрешить анимацию


вид-тема

back to white
libreoffice -env:SAL_USE_VCLPLUGIN=gen

tools(сервис)-options(параметры)-персонализация
в строке поиска dark - search - ok

Install libreoffice-gtk (this will integrate your theme with you system theme (ex. font and style)

Значки:
Install libreoffice-theme-oxygen or libreoffice-theme-crystal and then follow  (Tools > Options > View).

## iowait

http://doc.opensuse.org/products/draft/SLES/SLES-tuning_sd_draft/cha.tuning.io.html

```bash
~> cat /sys/block/sda/queue/scheduler
noop [deadline] cfq
```

в настройках ядра yast

известная проблема с kworker.
 В качестве временного решения обычно рекомендуют либо 
acpi=noirq 
в параметрах ядра, либо 
echo disable > /sys/firmware/acpi/interrupts/gpeXX где XX - номер проблемного IRQ

## acpi apic

http://ubuntuforums.org/showthread.php?t=2102964

http://sourceforge.net/p/acpitool/wiki/Home/

http://software.opensuse.org/download.html?project=home%3Apbleser%3AUtilities&package=acpitool

```bash
acpitool -e

acpitool -w

acpitool  -W 17
  Changed status for wakeup device #17 (USB4)

   Device       S-state   Status   Sysfs node
  ---------------------------------------
  1. PCE2         S4    *disabled  pci:0000:00:02.0
  2. PCE3         S4    *disabled
  3. PCE4         S4    *disabled
  4. PCE5         S4    *disabled
  5. PCE6         S4    *disabled  pci:0000:00:06.0
  6. PCE7         S4    *disabled
  7. PCE9         S4    *disabled
  8. PCEA         S4    *disabled
  9. PCEB         S4    *disabled
  10. PCEC        S4    *disabled
  11. SBAZ        S4    *disabled  pci:0000:00:14.2
  12. UAR1        S4    *disabled  pnp:00:08
  13. P0PC        S4    *disabled  pci:0000:00:14.4
  14. UHC1        S4    *enabled   pci:0000:00:12.0
  15. UHC2        S4    *enabled   pci:0000:00:12.1
  16. UHC3        S4    *enabled   pci:0000:00:12.2
  17. USB4        S4    *disabled  pci:0000:00:13.0
  18. UHC5        S4    *enabled   pci:0000:00:13.1
  19. UHC6        S4    *enabled   pci:0000:00:13.2
  20. UHC7        S4    *enabled   pci:0000:00:14.5
  21. PWRB        S4    *enabled 

```


## kde


http://techbase.kde.org/Projects/Plasma/Plasmoids


## installation migration OS

 * пароли рут и пользователя
 * установка принтера
 * настройка почты
 * настройка выключения подсказок: настройки системы - поведение окон - рабочее пространство plasma - показывать всплывающие подсказки
 * рамки окна: цвета-цветовая схема-общие-цвет заголовка окна
 * толщина рамки окна: оформление приложений - оформление окон - справа-внизу границы окна-тонкие
 * установка и настройка скайп SDB:Skype — openSUSE  PulseAudio — openSUSE (pavucontrol)
 * перенос /home
 * перенос закладок в браузер
 * настройка браузера https://addons.mozilla.org/ru/firefox/addon/tree-style-tab/?src=search noscript downthemall adblock adblockhelper
 * добавить ярлыки на таскбар, индикатор ЦП, погода, сеть
 * десктоп - /usr/share/applications/
 * работа с документами - офис+экспорт в пдф
 * lame для диктофона
 * apcupsd установить, настроить
 * запомнить/перенести пароли для страниц в браузере
 * перенести ключи/скрипты удаленного доступа
 * настроить короткий формат даты для Dolphin в астройках локали DD.MM.YYYY
 * настроить полный формат даты для виджета часов на панели в настройках локали  SHORTWEEKDAY DD SHORTMONTH YYYY
 * настроить время в истории bash bash_history
 * видео кодеки wmv 
 	 * http://opensuse-guide.org/codecs.php
 	 * http://software.opensuse.org/package/opensuse-codecs-installer?search_term=opensuse-codecs-installer
 * spectacle скриншоты починить
	* Настройки - глобальные комбинации клавиш - KDE daemon - выключить prtscr
	* Настройки - глобальные комбинации клавиш - + добавить - spectacle - назначить prtscr - снимок прямоугольной области
 * zypper ar -f http://packman.inode.at/suse/openSUSE_13.1/ packman_all
	 * ближайший по пингам ftp.halifax.rwth-aachen.de/packman/suse/13.1/
 * zypper ar -f http://geeko.ioda.net/mirror/amd-fglrx/openSUSE_13.1/ radeon

http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/

* зависает при выключении
	```bash
		systemctl disable lvm2-monitor.service
		systemctl stop lvm2-monitor.service
	```
* flatpak `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo` далее `Discover`
* pavucontrol
* pulseaudio-equalizer
* digikam
* kate
* konsole
* krdc
* konqueror
* заменить ~/.kde4/share/apps/konqueror/bookmarks.xml
* pidgin
* thunderbird
* https://support.mozilla.org/en-US/kb/profiles-tb#w_backing-up-a-profile
* freemind
* yed
* printer
* scripts alias
* kalendar
* akregator
* wallet
* sqldeveloper java
* firefox+adblock+noscript whitelist
* akonadi
* torrent
* ssh_keys


## skype

 * `zypper in gnome-keyring`
 * less ~/.config/skypeforlinux/logs/skype-startup.log
 * http://arunraghavan.net/2013/08/pulseaudio-4-0-and-skype/
 * PULSE_LATENCY_MSEC=60 skype

```bash

/dumpmsnp

zypper install libpulse0-32bit alsa-plugins-pulse-32bit libphonon4-32bit pavucontrol

The following 64 NEW packages are going to be installed:
  Mesa-32bit Mesa-libEGL1-32bit Mesa-libGL1-32bit Mesa-libglapi0-32bit alsa-oss-32bit alsa-plugins-pulse-32bit fontconfig-32bit libFLAC8-32bit libICE6-32bit libLLVM-32bit 
  libSM6-32bit libX11-6-32bit libX11-xcb1-32bit libXau6-32bit libXcursor1-32bit libXdamage1-32bit libXext6-32bit libXfixes3-32bit libXi6-32bit libXinerama1-32bit libXrandr2-32bit 
  libXrender1-32bit libXxf86vm1-32bit libasound2-32bit libdrm2-32bit libdrm_intel1-32bit libdrm_nouveau2-32bit libdrm_radeon1-32bit libelf1-32bit libexpat1-32bit libffi4-32bit 
  libfreetype6-32bit libgbm1-32bit libglib-2_0-0-32bit libgobject-2_0-0-32bit libjson0-32bit liblcms1-32bit libmng1-32bit libmysqlclient18-32bit libogg0-32bit libpciaccess0-32bit 
  libphonon4-32bit libpulse-mainloop-glib0-32bit libpulse0-32bit libqt4-32bit libqt4-qt3support-32bit libqt4-sql-32bit libqt4-sql-mysql-32bit libqt4-sql-sqlite-32bit 
  libqt4-x11-32bit libsndfile1-32bit libspeex1-32bit libsqlite3-0-32bit libudev1-32bit libuuid1-32bit libvorbis0-32bit libvorbisenc2-32bit libwayland-client0-32bit 
  libwayland-server0-32bit libwrap0-32bit libxcb-dri2-0-32bit libxcb-glx0-32bit libxcb-xfixes0-32bit libxcb1-32bit 

The following recommended package was automatically selected:
  alsa-oss-32bit 


zypper in skype-4.2.0.13-suse.i586.rpm 

The following 14 NEW packages are going to be installed:
  libQtWebKit4-32bit libXss1-32bit libXv1-32bit libgmodule-2_0-0-32bit libgstapp-0_10-0-32bit libgstinterfaces-0_10-0-32bit libgstreamer-0_10-0-32bit liborc-0_4-0-32bit libpng12-0 
  libwebp4-32bit libxml2-2-32bit libxslt1-32bit skype xorg-x11-libs 

```

### VMWARE

усилить громкость на сервере и на госте
поставить пульс

```bash

zypper in libpulse0-32bit alsa-plugins-pulse-32bit 

The following 10 NEW packages are going to be installed:
  alsa-plugins-pulse-32bit libFLAC8-32bit libjson0-32bit libogg0-32bit libpulse0-32bit libsndfile1-32bit libspeex1-32bit 
  libvorbis0-32bit libvorbisenc2-32bit libwrap0-32bit 

```

## torrent


ktorrent export

```bash
#!/bin/sh
#DEST_DIR=$HOME/torrents

#if [ "$#" -ge "2" ]
#then DEST_DIR="$1"
#fi

#cd $HOME/.kde/share/apps/ktorrent/

SOURCE_DIR="$1"
DEST_DIR="$2"

cd $SOURCE_DIR

if ! [ -e "$DEST_DIR" ]
then mkdir -p "$DEST_DIR"
fi


TORRENT_LIST=
if [ -e tor0 ]
then TORRENT_LIST="$TORRENT_LIST tor?"
fi
if [ -e tor10 ]
then TORRENT_LIST="$TORRENT_LIST tor??"
fi
if [ -e tor100 ]
then TORRENT_LIST="$TORRENT_LIST tor???"
fi

for  i in $TORRENT_LIST ; do
  cp -vRTpu $i/torrent $DEST_DIR/$i.torrent
done
```

## opensuse install hangs

 "kernel-firmware" package isn't marked for installation by default

## kate

https://projects.kde.org/projects/kde/applications/kate/repository/revisions/cb94bbd610b7ed7f3421ee668fd348523b6d3229
/usr/share/kde4/apps/katepart/syntax/tcsh.xml: устаревший синтаксис. К контексту Cmd@ нельзя обращаться по символьному имени/usr/share/kde4/apps/katepart/syntax/tcsh.xml: устаревший синтаксис. К контексту CmdSet нельзя обращаться по символьному имени

https://projects.kde.org/projects/kde/applications/kate/repository/revisions/44beb7d342309f524e91ab18c9827e83225e36de
/usr/share/kde4/apps/katepart/syntax/lilypond.xml (15/56) была обнаружена ошибка The XML entity "commands-other" expands too a string that is too large to process (2594 characters > 1024).

```bash
ssh user@0.0.0.0 -X
x11forwarding yes
x11uselocalhost no
```

## firefox

* выключенные дополнения 

```
about:config
xpinstall.signatures.required - false
extensions.legacy.enabled - true
```

* [читаемые ссылки utf-8](https://addons.mozilla.org/ru/firefox/addon/pure-url/?src=search)

```
unMHT
network.standard-url.encode-utf8;false
network.standard-url.escape-utf8;false
```
настройки синхронизации

```
about:preferences#sync

```
http://www.computerra.ru/gid/rtfm/browser/37428/

http://www.guillermomolina.com.ar/index.php/en/projects/firefox-kwallet-extension/103-library-path-issues

```
Failed to open VDPAU backend libvdpau_nvidia.so: невозможно открыть разделяемый объектный файл: Нет такого файла или каталога
turning off hardware acceleration in preferences > advanced > general
```

## vpn

 * http://code.google.com/p/vpnpptp/downloads/detail?name=vpnpptp_setup-ru-Linux-x86_64-Install.tar.gz&can=2&q=
 * http://forums.opensuse.org/p-russian/dhydhdhdhdhundhdhdh/gnome/453520-networkmanager-l2tp.html
 * http://code.google.com/p/vpnpptp/downloads/detail?name=xroot-0.0.6-1.x86_64.rpm&can=2&q=


## thunderbird

 * http://kb.mozillazine.org/IMAP:_advanced_account_configuration
 * [реиндекс глобального поиска](https://support.mozilla.org/en-US/kb/rebuilding-global-database)

## repo

http://mirror.yandex.ru/opensuse/packman/12.3/repodata/

http://download.opensuse.org/repositories/home:/hillwood/openSUSE_12.3/

http://code.google.com/p/vpnpptp/downloads/list

## freemind

http://freemind.sourceforge.net/wiki/index.php/Download

http://www.liberatedcomputing.net/mm2fm/scripts/mm2fm

http://www.liberatedcomputing.net/mm2fm

## vmware

workstation 12 

install: kernel development template

```bash
cd /lib/modules/`uname -r`/build/include
ln -s   generated/uapi/linux/ .
```

http://www.redhat.com/archives/rhl-list/2007-June/msg05664.html

```bash
cat>>/etc/vmware-fuse.conf
/etc/modprobe.d/vmware-fuse.conf
options loop max_loop=64
rmmod loop && modprobe loop && echo okok
```

### loop

http://www.redhat.com/archives/rhl-list/2007-June/msg05664.html

```bash
cat>>/etc/vmware-fuse.conf
/etc/modprobe.d/vmware-fuse.conf
options loop max_loop=64
rmmod loop && modprobe loop && echo okok
```

### net

 * http://www.liberidu.com/blog/2006/09/29/solving-vmware-network-problems-on-linux-vmware-guests/

```bash
#linux network
vi /etc/sysconfig/network-scripts/ifcfg-eth0
onboot=yes
/etc/init.d/network restart
```

```bash
Remove the kernel’s networking interface rules file so that it can be regenerated

# rm -f /etc/udev/rules.d/70-persistent-net.rules
# reboot
        
UPDATE your interface configuration file

# vim /etc/sysconfig/networking/devices/ifcfg-eth0

Remove the MACADDR entry or update it to the new MACADDR for the interface (listed in this file: /etc/udev/rules.d/70-persistent-net.rules).
Remove the UUID entry
Save and exit the file
Restart the networking service

# service network restart
        
```

### archive sparce/sparse files 

tar -czSf file.tar.gz file

pigz
pbzip2

### external folder

[Mounts all shares to /home/user1/shares](https://docs.vmware.com/en/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-AB5C80FE-9B8A-4899-8186-3DB8201B1758.html)

```bash
/usr/bin/vmhgfs-fuse .host:/ /home/user1/shares -o subtype=vmhgfs-fuse,allow_other
```
по-умолчанию `mnt/hgfs`


## grub2

http://sourceforge.net/projects/kcm-grub2/

http://ksmanis.wordpress.com/projects/grub2-editor/

```bash
zypper addrepo http://download.opensuse.org/repositories/home:ksmanis/openSUSE_12.3/home:ksmanis.repo
zypper refresh
zypper install kcm-grub2
```


```bash
Figure out from the partition table what is your (main) linux partition, e.g. /dev/sda3:

fdisk -l

mount /dev/sda3 /mnt
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc # maybe superfluous
mount --bind /sys /mnt/sys # maybe superfluous

chroot /mnt
grub2-install /dev/sda
exit
reboot

If using legacy grub

Open a terminal and type (no 'sudo' is required in Rescue System mode):

 sudo /usr/sbin/grub
 grub> find /boot/grub/stage2 (will show the path of actual grub installation, you will need on the next step)
 grub> root (hdx,y)
 grub> setup (hdx)
 grub> quit

```

## x2go

2m-png-jpeg
XFCE

Проблема с цифровой клавой
http://unixforum.org/index.php?showtopic=108708&st=120&p=1263239&#entry1263239

```bash
#!/bin/bash
setxkbmap -rules xorg -model pc105 -layout "ru(winkeys),us" -option 'grp:alt_shift_toggle,grp_led:scroll'
xmodmap -e "keycode 91 = KP_Delete KP_Decimal KP_Delete KP_Decimal"
```

### Keyboard Shortcuts

```
X2Go follows the general keyboard shortcuts of the NX client. In particular:

    Ctrl + Alt + T: terminate session / disconnect
    Ctrl + Alt + F: toggle fullscreen/windowed
    Ctrl + Alt + M: minimize or maximize fullscreen window
    Ctrl + Alt + arrow keys: move viewport (when remote screen is bigger than client window)
```

http://wihttp://wiki.x2go.org/doku.php/doc:usage:x2goclientki.x2go.org/doku.php/doc:usage:x2goclient

http://wiki.x2go.org/doku.php/doc:de-compat


https://build.opensuse.org/project/repositories/X11:RemoteDesktop:x2go

```bash
zypper addrepo http://download.opensuse.org/repositories/X11:/RemoteDesktop:/x2go/openSUSE_Leap_42.1/X11:RemoteDesktop:x2go.repo
zypper addrepo http://download.opensuse.org/repositories/X11:RemoteDesktop:x2go/openSUSE_Factory/X11:RemoteDesktop:x2go.repo
zypper refresh
zypper in x2goserver
```

## vnc

https://habrahabr.ru/company/ruvds/blog/312556

```bash
disable ipv6
vncpasswd
xinetd.d/vnc
-rfbauth /home/bsk/.vnc/passwd
user = bsk
dbus-launch vncserver

/usr/bin/Xvnc :7 -depth 16 -alwaysshared -geometry 1024x768 -query localhost -once -rfbauth ~/.vnc/passwd


service vnc1
{
        socket_type     = stream
        protocol        = tcp
        wait            = no
        user            = bsk
        server          = /usr/bin/Xvnc
        server_args     = -noreset -inetd -once -query localhost -geometry 1024x768 -depth 16 -rfbauth /home/bsk/.vnc/passwd
        type            = UNLISTED
        port            = 5901
}

zypper in x11vnc
x11vnc - allow VNC connections to real X11 displays

/usr/bin/x11vnc -dontdisconnect -display :0 -notruecolor -noxfixes -shared -forever -rfbport 5900 -bg -o /var/log/x11vnc.log -rfbauth ~/.vnc/passwd -env  FD_XDM=1  -auth  guess
```

## wallpapers kde

/usr/share/wallpapers

## kopete icq

 * http://icqserver.net/forum/topic101.html
 
