
## webdav

```bash
tar -czf distr.os.soft_`date +%H.%M.%S_%d.%m.%Y`.tar.gz /distr
tar -czf etc.os.soft_`date +%H.%M.%S_%d.%m.%Y`.tar.gz /distr

nginx stop
drush arb -r /home/user/drupal-dir --destination=/distr/backup/user-full-backup-`date +%H.%M.%S_%d.%m.%Y`.tar.gz

drush arr /distr/backup/user-full-backup-21.31.16_12.10.2013.tar.gz --destination=/home/user/drupal-dir/ --overwrite

wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
yum install ./rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

yum install davfs2

mkdir /mnt/backup-ext
cat >> /etc/fstab
https://webdav.yandex.ru:443 /mnt/backup-ext/ davfs gid=davfs2,uid=davfs2,noauto    0    0

mount
```
## свой сервер

[свой сервер](./home-cloud#syncthing)

