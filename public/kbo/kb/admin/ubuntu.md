# Ubuntu

 * [centos](./centos.md)
 * [debian](./debian.md)
 * [ubuntu](./ubuntu.md)
 * [opensuse](./opensuse.md)
 * [Русификация Ubuntu](http://help.ubuntu.ru/wiki/%D1%80%D1%83%D1%81%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F_ubuntu)
 * [ssh-welcome](./ssh.md#ssh-welcome)

## grub

 * default startup menu timeout

```bash
mcedit /etc/default/grub
#GRUB_TIMEOUT_STYLE=menu
#GRUB_TIMEOUT=5
update-grub
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