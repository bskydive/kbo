# ssh

 * [https://habr.com/ru/company/vdsina/blog/472746/](Терминальный сервер для админа; Ни единого SSH-разрыва)
 * [Магия SSH](https://habr.com/post/331348/)

```bash
ssh-keygen -b 2048 -t rsa -f /distr/mykey.priv
#засылай в редмайн /distr/mykey.priv.pub
#заходи от ПОЛЬЗОВАТЕЛЯ:
ssh -p0000 user@11.12.11.12 -i /distr/mykey.priv

ssh-copy-id -i ~/.ssh/id_rsa.pub user@0.0.0.0

```

 * проброс портов
 	* from local to remote `ssh -L LOCAL_PORT:localhost:REMOTE_PORT REMOTE_USER@REMOTE_HOST`
	* from remote to local `ssh -R REMOTE_PORT:localhost:LOCAL_PORT REMOTE_USER@REMOTE_HOST`
	* `ssh -fNL`
 *

## ssh welcome

 * [disable ssh welcome screen](https://linuxconfig.org/disable-dynamic-motd-and-news-on-ubuntu-20-04-focal-fossa-linux)
 * https://superuser.com/questions/1840229/how-to-disable-motd-from-debian-12

```bash
/etc/default/motd-news
#ENABLED=0

chmod -x /etc/update-motd.d/90-updates-available
chmod -x /etc/update-motd.d/*

/etc/ssh/sshd_config
#PrintMotd no

/etc/pam.d/sshd
# # session    optional     pam_motd.so  motd=/run/motd.dynamic
# # session    optional     pam_motd.so noupdate

grep -ril motd /etc/zsh /etc/bash.bashrc /etc/profile /etc/profile.d

```


## SSHD

```bash
useradd -m user-ssh
passwd user-ssh
passwd
vi /etc/ssh/sshd_config

Ports 0000
AllowUsers user-ssh
PermitRootLogin no
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys

service ssh reload
service ssh restart

mkdir /home/user-ssh/.ssh
cat >> /home/user-ssh/.ssh/authorized_keys
chown -R user-ssh:user-ssh /home/user-ssh
chmod 700 /home/user-ssh/.ssh

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







