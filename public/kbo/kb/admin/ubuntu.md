# Ubuntu

 * [centos](./centos.md)
 * [debian](./debian.md)
 * [ubuntu](./ubuntu.md)
 * [opensuse](./opensuse.md)
 * [Русификация Ubuntu](http://help.ubuntu.ru/wiki/%D1%80%D1%83%D1%81%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F_ubuntu)
 * [ssh-welcome](./ssh.md#ssh-welcome)

## remote desktop

 * https://askubuntu.com/questions/1513394/ubuntu-24-04-fresh-install-system-settings-freezes-when-going-system-remot

```bash
apt-get reinstall gnome-remote-desktop
```

 * freerdp3



## dual boot

 * [Как установить Ubuntu на отдельном диске с dual boot Windows](https://habr.com/ru/articles/760858/)
	* ПКМ -> "Manage flags"--> убрать флаги boot+esp

 * https://linuxconfig.org/how-to-install-ubuntu-alongside-windows-11-dual-boot

## kubuntu 24.04

```bash
aptitude install mcedit snap-store
snap refresh --hold # выключить автообновление snap-store
rm /etc/xdg/autostart/geoclue-demo-agent.desktop

```
### repo

```bash
grep -Rh ^deb /etc/apt/sources.list*
deb http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse

grep -Rh ^deb /etc/apt/sources.list*
deb cdrom:[Kubuntu 24.04.4 LTS _Noble Numbat_ - Release amd64 (20260210)]/ noble main multiverse restricted universe
deb https://mirror.yandex.ru/ubuntu/ noble main universe restricted multiverse

```

### очистка системы

* aptitude
```bash
# Если вы хотите повторить логику aptitude и удалить все пакеты, помеченные как u (unused)
aptitude purge ~c

# чтобы удалить автоматически установленные, но ненужные пакеты
aptitude remove '?automatic?and(?narrow(?not(?depends(.*)),?installed))'

# Эта команда без аргументов попытается привести систему к идеальному состоянию, часто предлагая удалить ненужные пакеты. Но будьте осторожны и внимательно читайте, что он предлагает.
aptitude install
```

* apt
```bash
# Удалить ненужные автоматические зависимости
apt autoremove --dry-run
sudo apt autoremove

# Удалить скачанные .deb пакеты из кеша (освободит место на диске)
sudo apt autoclean
# Или более агрессивно (удалить все кешированные пакеты)
sudo apt clean
```

## setup

```bash
add-apt-repository ppa:danielrichter2007/grub-customizer
aptitude install grub-customizer grub2-themes-ubuntu-mate grub-theme-starfield grub-splashimages grub2-themes-ubuntustudio

apt-get install aptitude

aptitude update
aptitude upgrade

aptitude install nvtop radeontop openssh-server vlc smartmontools gparted gsmartcontrol git mc mtr wget curl make iotop iftop ubuntu-restricted-extras fonts-roboto fonts-jetbrains-mono
aptitude install xubuntu-community-wallpapers xubuntu-wallpapers ubuntu-mate-wallpapers ubuntu-gnome-wallpapers

# для Gnome
aptitude install pavucontrol paprefs pulseaudio alsa-tools-gui
aptitude install gnome-tweaks gnome-shell-extension-manager
```
### repo

* ru

```bash
cat >> /etc/apt/sources.list.d/yandex.sources

deb https://mirror.yandex.ru/ubuntu/ noble main universe restricted multiverse
# deb-src https://mirror.yandex.ru/ubuntu/ noble main universe restricted multiverse

apt-cdrom add /media/user/Kubuntu\ 24.04.4\ LTS\ amd64/
add-apt-repository deb https://mirror.yandex.ru/ubuntu/ noble main universe restricted multiverse

cat >> /etc/apt/preferences.d/ya-repo-priority.pref
# Package: *
# Pin: origin "mirror.yandex.ru"
# Pin-Priority: 600

```

* en

```bash
deb http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ noble main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ noble-updates main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ noble-security main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-backports main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ noble-backports main restricted universe multiverse

deb http://archive.ubuntu.com/ubuntu/ noble-proposed main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ noble-proposed main restricted universe multiverse
```

### ubuntu fonts

```bash
mkdir -p ~/fonts && mkdir -p ~/.fonts && cd ~/fonts

wget https://github.com/adobe-fonts/source-code-pro/releases/download/2.042R-u%2F1.062R-i%2F1.026R-vf/OTF-source-code-pro-2.042R-u_1.062R-i.zip && \
unzip OTF-source-code-pro-2.042R-u_1.062R-i.zip && \
cp OTF/*.otf ~/.fonts/ && echo okok1

wget https://github.com/adobe-fonts/source-serif/releases/download/4.005R/source-serif-4.005_Desktop.zip && \
unzip source-serif-4.005_Desktop.zip && \
cp source-serif-4.005_Desktop/OTF/*.otf ~/.fonts/ && echo okok2

wget https://github.com/adobe-fonts/source-sans/releases/download/3.052R/OTF-source-sans-3.052R.zip && \
unzip OTF-source-sans-3.052R.zip && \
cp OTF/*.otf ~/.fonts/ && echo okok3

fc-cache -f -v

# rm -rf ~/fonts
```

### widgets

```
aptitude install gnome-shell-extension-manager
# dash-to-panel
# dash-to-dock
# just perfection
# resource monitor
# removable drive menu
```

## video vmware

```bash
aptitude install open-vm-tools open-vm-tools-desktop

add-apt-repository ppa:oibaf/graphics-drivers
```

## drivers bios

* https://documentation.ubuntu.com/project/SRU/reference/exception-firmware-updates/
* https://fwupd.org/

```bash

sudo fwupdmgr refresh
sudo fwupdmgr update
```

## grub

* grub-customizer
 * default startup menu timeout

```bash
ufw status
ufw status verbose
ufw enable
ufw allow 443/tcp
ufw allow 22/tcp
ufw allow 3306/tcp



mcedit /etc/default/grub
#GRUB_TIMEOUT_STYLE=menu
#GRUB_TIMEOUT=5
update-grub
```

 * [grub recover](https://askubuntu.com/questions/1404859/can-not-boot-ubuntu-22-04-dual-boot-installation-no-grub-loader)

```bash
lsblk -f
mcedit /etc/default/grub
#GRUB_DISABLE_OS_PROBER=false
update-grub

#additional
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi
```

 * https://help.ubuntu.com/community/Boot-Repair

```bash
apt-get install boot-repair
boot-repair
```

## recovery

 * https://unix.stackexchange.com/questions/42015/mount-is-busy-when-trying-to-mount-as-read-only-so-that-i-can-run-zerofree
```bash
# grub-->e-->linux ... 1-->f10
systemctl stop systemd-journald.socket
systemctl stop systemd-journald.service
mount -o remount,ro /
mount
fsck /dev/sda4
```

## at atq atd

 * https://linuxize.com/post/at-command-in-linux/

```bash
aptitude install at
atq
echo 'wall aaaaa' | at now + 1 min
at -f ./script.sh now + 10 min
atq
systemctl enable atd
systemctl start atd

```

## audio sound

 * https://itsfoss.com/sound-switcher-indicator-ubuntu/

## rdp

 * https://itsfoss.community/t/what-is-the-correct-configuration-for-remmina-to-receive-produce-audio-from-the-source/11709
	* advanced --> audio --> local|sys:alsa
 * https://askubuntu.com/questions/1515538/fixing-no-sound-dummy-output-issue-in-ubuntu-24-04

 * https://ubuntuforums.org/showthread.php?t=2398526

```bash
/etc/systemd/logind.conf
HandleLidSwitch=ignore     # Was suspend
IdleAction=ignore    # Was commented out... I know it says it's a default, but I wanted to be sure it was being set properly
IdleActionSec=30min    # Was commented out. Not sure if it's required when the above is uncommented.
```

## network

```
sudo hostnamectl set-hostname linuxconfig
```

 * https://askubuntu.com/questions/1355066/i-want-my-network-connections-immutable-instead-of-getting-system-policy-preve
 * https://www.reddit.com/r/Kubuntu/comments/1d067in/2404_system_policy_prevents_control_of_network/
 	* The /etc/polkit-1/localauthority/50-local.d directory is provided by the polkitd-pkla package

## lang switch

 * install gnome-tweaks
 * https://askubuntu.com/questions/10223/display-current-layout-language-code-country-flag-in-keyboard-indicator

## sound

```
aptitude install pavucontrol paprefs pulseaudio
aptitude install alsa-tools-gui
```

## timezone

 * [](./centos.md#localtime)
 * https://linuxize.com/post/how-to-set-or-change-timezone-on-ubuntu-20-04/

```bash
timedatectl
#                Local time: Пт 2024-06-14 13:35:24 UTC
#            Universal time: Пт 2024-06-14 13:35:24 UTC
#                  RTC time: Пт 2024-06-14 13:35:24
#                 Time zone: Etc/UTC (UTC, +0000)
# System clock synchronized: yes
#               NTP service: active
#           RTC in local TZ: no
ls -l /etc/localtime
# lrwxrwxrwx 1 root root 27 апр 23 09:40 /etc/localtime -> /usr/share/zoneinfo/Etc/UTC
timedatectl list-timezones|less
timedatectl set-timezone Europe/Moscow
ls -l /etc/localtime
# lrwxrwxrwx 1 root root 33 июн 14 16:36 /etc/localtime -> /usr/share/zoneinfo/Europe/Moscow
timedatectl
#                Local time: Пт 2024-06-14 16:36:40 MSK
#            Universal time: Пт 2024-06-14 13:36:40 UTC
#                  RTC time: Пт 2024-06-14 13:36:40
#                 Time zone: Europe/Moscow (MSK, +0300)
# System clock synchronized: yes
#               NTP service: active
#           RTC in local TZ: no

```

## ufw firewall

 * https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-20-04-ru

 ```bash
	ufw enable
	ufw status verbose
	ufw status numbered
	ufw allow https
	ufw allow 443/tcp
	ufw allow in on eth1 to any port 3306
	delete allow 80
 ```

## package manager

 * https://snapcraft.io/docs/snap-performance

	```bash
		apt-get install aptitude
		aptitude update
		aptitude upgrade
		aptitude install npm nodejs nodejs-legacy openssh-server

		aptitude install language-pack-kde-ru firefox-locale-ru libreoffice-l10n-ru libreoffice-help-ru thunderbird-locale-ru

		aptitude install snapd
		snap install snap-store
	```

 * `aptitude search`
	* first character - current state of the package
		* p - no trace of the package exists on the system, c - the package was deleted but its configuration files remain on the system
		* i - installed
		* v - virtual
	* second character - stored action to be performed
		* i - installed
		* d - deleted
		* p - the package and its configuration files will be removed.
		* A - automatically installed

 * undo update http://serverfault.com/questions/21436/transactions-and-rollback-with-debian

```bash
dpkg --get-selections "*" > my_packages-datestamp

Then later you could rollback by using that package list:

dpkg --set-selections < my_packages-datestamp
apt-get -u dselect-upgrade

##
aptitude install foo=1.2-3 # Downgrade to 1.2-3 if you run a higher version

```

## kvm libvirt

 * https://ubuntu.com/server/docs/libvirt

```bash
apt-get install aptitude
# настройка клавиатуры
aptitude install gnome-tweaks mtr
apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virtinst virt-manager
usermod -aG libvirt $USER
usermod -aG kvm $USER
kvm-ok
systemctl start libvirtd

virsh list --all
virsh start <guestname>

virsh net-list --all
virsh net-start default
virsh net-autostart default

virsh pool-define-as --name vmpool --type dir --target /var/lib/libvirt/images
virsh pool-build vmpool
virsh pool-start vmpool
virsh pool-autostart vmpool


virt-manager

virt-convert -i vmdk source_vm.vmdk -o qcow2 destination_vm.qcow2
virt-install --name imported-vm --ram 2048 --vcpus 2 --disk path=destination_vm.qcow2 --import --os-variant ubuntu20.04

```

### display

 * выбрать x вместо wayland

```bash
xrandr

gtf 2560 1440 60
# 2560x1440 @ 60.00 Hz (GTF) hsync: 89.40 kHz; pclk: 311.83 MHz
#Modeline "2560x1440_60.00"  311.83  2560 2744 3024 3488  1440 1441 1444 1490  -HSync +Vsync
cvt 2560 1440
# 2560x1440 59.96 Hz (CVT 3.69M9) hsync: 89.52 kHz; pclk: 312.25 MHz
#Modeline "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync

xrandr --newmode "2560x1440_60.00"  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync
xrandr --addmode HDMI-1 "2560x1440_60.00"
xrandr --output HDMI-1 --mode 2560x1440_60.00 --scale 1x1

```

### network

 * [bridge netplan dhcp](https://ubuntu.com/server/docs/configuring-networks#bridging-multiple-interfaces)
 * https://wiki.libvirt.org/VirtualNetworking.html#routed-mode-example
 * https://linuxconfig.org/how-to-use-bridged-networking-with-libvirt-and-kvm

```bash
virsh net-destroy default
virsh net-start default
virsh net-edit default


```