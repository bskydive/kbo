# Ubuntu



```bash
apt-get install aptitude
aptitude update
aptitude upgrade
aptitude install npm nodejs nodejs-legacy openssh-server

aptitude install language-pack-kde-ru firefox-locale-ru libreoffice-l10n-ru libreoffice-help-ru thunderbird-locale-ru
```
http://help.ubuntu.ru/wiki/%D1%80%D1%83%D1%81%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D1%8F_ubuntu

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