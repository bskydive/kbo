# Debian



## detect virtualization type openVZ

 * https://serverfault.com/questions/595471/how-to-find-out-the-virtualization-type-of-an-linux-vps
 * пустой /boot/grub
 * hostnamectl status
 * virt-what

## debian rc.local автозагрузка

сделать скрипт и разместить ссылки ln -s
/etc/rc2.d/S20rc.local -> ../init.d/rc.local -> /etc/rc.local
(runlevel 2!)

## debian cron

добавляет управление заданиями через папки /etc/cron.*

```bash
aptitude install anacron
cat /etc/anacrontab
```



## debian bashrc

/etc/bash.bashrc

## apt aptitude dpkg

 * [](./ubuntu.md#package-manager)


## iptabes save

 * [](./network.md#iptables)

## timezone

dpkg-reconfigure tzdata


## default editor

mcedit
update-alternatives --config editor

## locale

sudo apt-get install language-pack-ru && sudo locale-gen ru_RU.UTF-8 && echo okok



## apt rpm commands

http://how-to.linuxcareer.com/comparison-of-major-linux-package-management-systems

apt-cache search

## vmware tools

https://communities.vmware.com/people/Deshifrator/blog/2011/04/24/install-vmware-tools-on-debian-squeeze

aptitude install gcc make linux-headers-$(uname -r)

## DEB 7

apt-get install aptitude mc


http://fileit.in/p/152

sudo dpkg-reconfigure locales

iptables порты для aptitude надо открыть 20,21,443,80 на выход

## DEBIAN 6

iptables:
FATAL: Could not load /lib/modules/2.6.32-042stab076.7/modules.dep: No such file or directory

mkdir -p /lib/modules/$(uname -r);depmod -a
https://wiki.colobridge.net/faq/особенности_использования_iptables_в_контейнере_openvz/

