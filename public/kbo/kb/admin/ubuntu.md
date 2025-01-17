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

## grub

 * default startup menu timeout

```bash
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

## widgets

```
aptitude install extension-manager
# dash-to-panel
# dash-to-dock
# just perfection
# resource monitor
# vitals
# removable drive menu
```

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