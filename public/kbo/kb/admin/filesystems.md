# Filesystems

## тестирование производительности

 * [Как оценить производительность СХД на Linux: бенчмаркинг с помощью открытых инструментов](https://habr.com/ru/company/1cloud/blog/458204/)

## iso to usb

* http://www.osforensics.com/tools/create-disk-images.html
* http://www.wintobootic.com/
* https://www.balena.io/etcher/
* unetbootin
* https://en.opensuse.org/SDB%3ALive_USB_stick
* win
    * rufus
    * сделать fat32
    * sources/install.wim больше 4 Гб 
      * https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/install-windows-from-a-usb-flash-drive?view=windows-11#if-your-windows-image-is-larger-than-4gb
      * `Dism /Split-Image /ImageFile:"\\vmware-host\Shared Folders\wd1tbdistr\install.wim" /SWMFile:"\\vmware-host\Shared Folders\wd1tbdistr\install.swm" /FileSize:3800`
      * получатся `install.swm install2.swm`
    * сделать раздел активным
    * скопировать содержимое - вот это не работает, работает через dd
    * https://www.microsoft.com/en-us/download/windows-usb-dvd-download-tool
* 
```bash
dd if=/path/to/your/isofile of=/your/usb/disk bs=8m
dd bs=4M if=Downloads/ubuntu-19.04-desktop-amd64.iso of=/dev/sdd9 conv=fdatasync status=progress
```


## tmp clean

https://serverfault.com/questions/377348/when-does-tmp-get-cleared

```bash
cat >> /etc/sysconfig/cron

MAX_DAYS_IN_TMP = 100
MAX_DAYS_IN_LONG_TMP = 100
TMP_DIRS_TO_CLEAR = /tmp
LONG_TMP_DIRS_TO_CLEAR = /var/tmp
OWNER_TO_KEEP_IN_TMP = root
CLEAR_TMP_DIRS_AT_BOOTUP = yes
```

## linux file encoding кодировка конвертирование текста

```bash
file -bi index.js 
cat index.js | tr -d '\15\32' > index.lf.js
iconv -f cp1251 -t utf-8 ./index.lf.js > index.lf.utf8.js

convmv -f cp1252 -t utf8 -i --nosmart ./*
```

 * https://drakulavich.blogspot.ru/2012/07/unzip-i18n.html
 * https://www.artlebedev.ru/decoder/advanced/
 * http://2cyr.com/decode/?lang=ru
 * https://habr.com/post/147843/
 * http://www.opennet.ru/tips/info/2494.shtml

```bash
wine /distr/7z1801-extra/7za.exe x ./path/arch.zip
```

## NFS CIFS SMB

```bash
mount.cifs
mount.nfs
```
 * https://doc.opensuse.org/documentation/leap/reference/html/book.opensuse.reference/cha-nfs.html

```
cat /etc/exports
      #/export/data   192.168.1.2(rw,sync)
      /path/to/film  /alias      *(ro,root_squash,sync,no_subtree_check)
cat /proc/fs/nfsd/versions
      +2 +3 +4 +4.1 +4.2

systemctl restart nfsserver

mount nfs.example.com:/home /home

cat /etc/fstab
      127.0.0.1:/path/to/film /local/pathv4 nfs rw,noauto 0 0 # NFS3
      nfs.example.com:/data /local/pathv4 nfs4 rw,noauto 0 0 # NFS4

mount -t nfs4 -o minorversion=1 nfs.example.com:/data /local/pathPNFS ## PNFS

```

 * http://serverfault.com/questions/56588/unmount-a-nfs-mount-where-the-nfs-server-has-disappeared

```bash
mount.nfs 192.168.0.125:/nfs/My_Book-1 /mnt/My-Book-1/ -o nolock -o soft
```

## sshfs

```bash
$ cat /etc/fstab
USERNAME@HOSTNAME_OR_IP:/REMOTE/DIRECTORY  /LOCAL/MOUNTPOINT  fuse.sshfs  defaults,_netdev  0  0
```

## fat from ext filenames 

```bash
cat /mnt/disk/music/fatrename.sh 
#! /bin/bash
                        
SRC=$1                        
DST=$2                        
# copy music to FAT media
                        
find ${SRC} -type f | while read f ; do

    d=${DST}/$( echo $f | sed 's/[^-A-Za-z0-9А-Яа-яёЁ/._ ()]/_/g' )

    echo :$d:

    #mkdir -p "$(dirname "$d")"##создаёт рекурсивную подлянку
    cp -n "$f" "$d"
done
```

## remote install

[удалённая установка с chroot и выдёргиванием диска](https://habrahabr.ru/post/321696)

## swap

```bash
dd if=/dev/zero of=/mnt/swap.file bs=1024 count=800k
mkswap /mnt/swap.file
swapon /mnt/swap.file
```

## lsof deleted files

lsof -s | grep -iE 'deleted|command'

## fix bad filename encoding using inode

```bash
ls -i
find . -inum 17040033 -exec mv {} new-directory-name1 \;
```

## восстановление дисков

 * 

## SMART

 * https://linuxconfig.org/how-to-check-an-hard-drive-health-from-the-command-line-using-smartctl

 ```bash
	smartctl -i /dev/sdd
	smartctl -a /dev/sdd
	smartctl -t short /dev/sdd
	smartctl -a /dev/sdd

 ```

## smart hdd read-only Mode

 * включается режим только для чтения при автоматической проверке
    ```bash
    systemctl status smartd
    systemctl stop smartd
    systemctl disable smartd
    grep -ivE '#' /etc/smartd.conf
    #Run Extended Self Test every first Sunday in the month. (Start earlier, it could take tens of hours.
    #DEFAULT -d removable -s (S/../.././03|L/../(01|02|03|04|05|06|07)/7/01)
    ```

## ext 4 ordered journal включаем принудительное журналирование

```bash
cat /proc/mounts

##ищем какой диск 
> cat /etc/fstab
/dev/vda3 /                       ext4    defaults,data=journal        1 1

## ищем опцию у диска Journal_data
> tune2fs -l /dev/vda3
...
Default mount options:    journal_data user_xattr acl
...

##включаем
>  tune2fs -o journal_data /dev/vda3

#перемонтируем и ребутаем
> mount -o remount,rw /dev/vda3
> tune2fs -l /dev/vda3
```

## ext4 recover

 * https://www.kernel.org/doc/Documentation/filesystems/ext4.txt
 * https://help.ubuntu.com/community/DataRecovery
 * http://www.sleuthkit.org/autopsy/desc.php
 * https://www.cyberciti.biz/tips/surviving-a-linux-filesystem-failures.html

 ```bash
 #просмотр состояния таблицы разделов, можно через fdisk, но он устарел
 > parted -l /dev/sda
	Model: ATA SPCC Solid State (scsi)
	Disk /dev/sda: 120GB
	Sector size (logical/physical): 512B/512B
	Partition Table: gpt
	Disk Flags: pmbr_boot

	Number  Start   End     Size    File system     Name     Flags
	1      1049kB  2155MB  2154MB  linux-swap(v1)  primary
	3      2155MB  43.3GB  41.1GB  ext4            primary  legacy_boot
	4      43.3GB  118GB   75.2GB  ext4
	2      118GB   119GB   790MB                   primary  bios_grub

 #принудительная проверка с автоблокировкой плохих секторов
 > e2fsck -cCVf /dev/sda3
 #поиск резервных суперблоков
 > dumpe2fs /dev/sda3|grep -i superblock
 #бэкап
 > dd if=/dev/sda2 of=/disk2/backup-sda2.img
 #замена суперблока
 > e2fsck -f -b 8193 /dev/sda3

 ```

## noexec permission denied

```bash
fstab exec /path
mount|grep noexec

findmnt

chmod a+x file.sh
chown

getfacl a+c file.sh



```



## GPT MSDOS convertion

 * http://www.rodsbooks.com/gdisk/mbr2gpt.html#gpt2mbr
 * https://stewartadam.io/blog/2012/03/05/how-convert-gpt-disk-layout-ms-dosmbr-layout-without-data-loss-and-gigabyte-hybrid
## RAID


### sas

http://habrahabr.ru/company/ua-hosting/blog/273715/

### замена сбойного диска

```bash
 Исходная ситуация

Исходные настройки:

# cat /proc/mdstat
Personalities : [raid1]
md3 : active raid1 sda4[0] sdb4[1]
      1822442815 blocks super 1.2 [2/2] [UU]

md2 : active raid1 sda3[0] sdb3[1]
      1073740664 blocks super 1.2 [2/2] [UU]

md1 : active raid1 sda2[0] sdb2[1]
      524276 blocks super 1.2 [2/2] [UU]

md0 : active raid1 sda1[0] sdb1[1]
      33553336 blocks super 1.2 [2/2] [UU]

unused devices: <none>

Всего четыре массива:

    /dev/md0 — swap
    /dev/md1 — /boot
    /dev/md2 — /
    /dev/md3 — /home 

Например, /dev/sdb — это сбойный диск. [U_] или [_U] показывает, что массив не синхронизирован. 
Когда массив в порядке, он отображается как [UU].

# cat /proc/mdstat
Personalities : [raid1]
md3 : active raid1 sda4[0] sdb4[1](F)
      1822442815 blocks super 1.2 [2/1] [U_]

md2 : active raid1 sda3[0] sdb3[1](F)
      1073740664 blocks super 1.2 [2/1] [U_]

md1 : active raid1 sda2[0] sdb2[1](F)
      524276 blocks super 1.2 [2/1] [U_]

md0 : active raid1 sda1[0] sdb1[1](F)
      33553336 blocks super 1.2 [2/1] [U_]

unused devices: <none>

Вносить изменения в программном RAID можно из работающей системы. 
Если один из дисков не отображается в массиве как показано ниже, 
то можете сразу согласовать время замены диска.

# cat /proc/mdstat
Personalities : [raid1]
md3 : active raid1 sda4[0]
      1822442815 blocks super 1.2 [2/1] [U_]

md2 : active raid1 sda3[0]
      1073740664 blocks super 1.2 [2/1] [U_]

md1 : active raid1 sda2[0]
      524276 blocks super 1.2 [2/1] [U_]

md0 : active raid1 sda1[0]
      33553336 blocks super 1.2 [2/1] [U_]

unused devices: <none>

Изъятие повреждённого жёсткого диска

Перед установкой нового диска необходимо удалить сбойный диск из RAID-массива. 
Это необходимо сделать для каждого раздела.

# mdadm /dev/md0 -r /dev/sdb1
# mdadm /dev/md1 -r /dev/sdb2
# mdadm /dev/md2 -r /dev/sdb3
# mdadm /dev/md3 -r /dev/sdb4

Следующая команда показывает диски, входящие в массив:

# mdadm --detail /dev/md0

В некоторых случаях, жёсткий диск может быть повреждён частично, например, 
статус [U_] только у массива /dev/md0, а все другие массивы имеют статус [UU]. 
В таком случае команда

# mdadm /dev/md1 -r /dev/sdb2

не пройдёт, так как устройство /dev/md1 в порядке.

Чтобы это исправить, нужно сначала выполнить команду

# mdadm --manage /dev/md1 --fail /dev/sdb2

чтобы изменить статус RAID-массива на [U_].
Согласование с поддержкой времени замены повреждённого жёсткого диска

Для того, чтобы заменить вышедший из строя диск необходимо заранее 
согласовать с поддержкой время замены. Сервер будет необходимо остановить 
на короткое время.

Пожалуйста, используйте для этого форму контакта в панели Robot.
Подготовка нового жёсткого диска

Оба диска в массиве должны иметь абсолютно одинаковое разбиение. 
В зависимости от используемого типа таблицы разделов (MBR или GPT) необходимо 
использовать соответствующие утилиты для копирования таблицы разделов.
 Как правило, GPT используется в дисках более 2ТБ (например, EX4 и EX6).
Жёсткий диск с GPT

На жёстком диске хранится несколько копий таблицы разделов GUID (GPT), 
поэтому для её редактирования следует использовать утилиты, 
поддерживающие GPT, например parted или GPT fdisk. Утилита sgdisk из 
GPT fdisk (уже установленная в Rescue-системе) позволяет простым 
способом скопировать таблицу разделов на новый жёсткий диск. 
Пример копирования таблицы разделов с sda на sdb:

sgdisk -R /dev/sdb /dev/sda

Далее жёсткому диску надо задать новый случайный UUID:

sgdisk -G /dev/sdb

После этого диск можно добавлять в массив. В заключение надо установить на него загрузчик.
Жёсткий диск с MBR

Таблица разделов может быть просто скопирована на новый диск с помощью sfdisk:

# sfdisk -d /dev/sda | sfdisk /dev/sdb

где /dev/sda — это источник, а /dev/sdb — жёсткий диск назначения.

(Опционально): если разделы не видны в системе, то таблица разделов должна быть перечитана ядром:

# sfdisk -R /dev/sdb

Конечно же, разделы можно создать вручную с помощью fdisk, cfdisk 
или других инструментов. Разделы должны иметь тип Linux raid autodetect (ID fd).
Добавление нового жёсткого диска

Как только повреждённый диск удалён, можно добавлять новый. 
Это необходимо сделать для каждого раздела.

# mdadm /dev/md0 -a /dev/sdb1
# mdadm /dev/md1 -a /dev/sdb2
# mdadm /dev/md2 -a /dev/sdb3
# mdadm /dev/md3 -a /dev/sdb4

Новый жёсткий диск теперь является частью массива, и теперь 
массив производит синхронизацию. Эта процедура, в зависимости 
от размера, может занять некоторое время. Статус процедуры 
синхронизации можно просмотреть с помощью cat /proc/mdstat.


# cat /proc/mdstat
Personalities : [raid1]
md3 : active raid1 sdb4[1] sda4[0]
      1028096 blocks [2/2] [UU]
      [==========>..........]  resync =  50.0% (514048/1028096) finish=97.3min speed=65787K/sec

md2 : active raid1 sdb3[1] sda3[0]
      208768 blocks [2/2] [UU]

md1 : active raid1 sdb2[1] sda2[0]
      2104448 blocks [2/2] [UU]

md0 : active raid1 sdb1[1] sda1[0]
      208768 blocks [2/2] [UU]

unused devices: <none>

Установка загрузчика

Если вы производите починку в загруженной системе, то будет достаточно, 
в случае GRUB2, выполнить grub-install на новый жёсткий диск, например, так:

grub-install /dev/sdb

В случае Grub1 (устаревшая версия grub) то, в зависимости от того какой 
диск выпал, потребуется больше шагов

    Запустить консоль grub: grub
    Указать раздел, на котором лежит /boot: root (hd0,1) (/dev/sda2 = (hd0,1))
    Записать загрузчик в MBR: setup (hd0)
    Для того чтобы записать загрузчик на второй жёсткий диск:
        Укажите grub переключиться на sdb: device (hd0) /dev/sdb
        В точности повторить шаги 2 и 3 
    Завершить консоль grub: quit 

Probing devices to guess BIOS drives. This may take a long time.


    GNU GRUB  version 0.97  (640K lower / 3072K upper memory)

 [ Minimal BASH-like line editing is supported.  For the first word, TAB
   lists possible command completions.  Anywhere else TAB lists the possible
   completions of a device/filename.]
grub> device (hd0) /dev/sdb
device (hd0) /dev/sdb
grub> root (hd0,1)
root (hd0,1)
 Filesystem type is ext2fs, partition type 0xfd
grub> setup (hd0)
setup (hd0)
 Checking if "/boot/grub/stage1" exists... yes
 Checking if "/boot/grub/stage2" exists... yes
 Checking if "/boot/grub/e2fs_stage1_5" exists... yes
 Running "embed /boot/grub/e2fs_stage1_5 (hd0)"...  26 sectors are embedded.
succeeded
 Running "install /boot/grub/stage1 (hd0) (hd0)1+26 p (hd0,1)/boot/grub/stage2 /boot/grub/grub.conf"... succeeded
Done.
grub> quit
#

```


```bash
57 0 * * 0 root [ -x /usr/share/mdadm/checkarray ] && [ $(date +\%d) -le 7 ] && /usr/share/mdadm/checkarray --cron --all --quiet

```


```bash
echo «DEVICE containers partiotions» > /etc/mdadm.conf
mdadm --examine --scan >> /etc/mdadm.conf
mdadm --assemble --scan
cat /proc/mdstat

```

### массив из файлов loopback

http://www.thomas-krenn.com/en/wiki/Linux_Software_RAID#Superblock_Metadata_Version_1..2A

```bash
mdadm --detail /dev/md0
/dev/md0:
        Version : 1.0
  Creation Time : Fri Sep 20 19:43:26 2013
     Raid Level : raid1
     Array Size : 1953513280 (1863.02 GiB 2000.40 GB)
  Used Dev Size : 1953513280 (1863.02 GiB 2000.40 GB)
   Raid Devices : 2
  Total Devices : 2
    Persistence : Superblock is persistent

  Intent Bitmap : Internal

    Update Time : Sat Aug 23 20:13:25 2014
          State : active 
 Active Devices : 2
Working Devices : 2
 Failed Devices : 0
  Spare Devices : 0

           Name : linux-ysdc.site:0
           UUID : aa1c0325:0dedfb41:b2d55153:04fa4fb4
         Events : 15417

    Number   Major   Minor   RaidDevice State
       0       8       49        0      active sync   /dev/sdd1
       1       8       65        1      active sync   /dev/sde1

dd if=/dev/zero of=file_disk_1 count=409600
cp file_disk_1 file_disk_2
losetup -a
losetup -f --show /mnt/raid_home/file_disk_2
losetup -f --show /mnt/raid_home/file_disk_3
fdisk /dev/loop0 
mdadm --create --verbose /dev/md100 --level=1 --raid-devices=2 /dev/loop0 /dev/loop1
mdadm --detail /dev/md100 

mkfs -t ext4 /dev/md100 
mkdir /mnt/md_test
chown bsk:users /mnt/md_test/
mount /dev/md100 /mnt/md_test/
df -h

umount /mnt/md_test/
mdadm --verbose --stop /dev/md100
losetup -d /dev/loop0
losetup -d /dev/loop1
losetup -a


losetup /dev/loop2 /mnt/raid_home/file_disk_1
losetup /dev/loop3 /mnt/raid_home/file_disk_2
mdadm --assemble /dev/md100  /dev/loop2 /dev/loop3
mount /dev/md100 /mnt/md_test/
uimount /dev/md100 
umount /dev/md100 
df -h

```
