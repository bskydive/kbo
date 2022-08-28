# network сеть

* [отладка сетевого стека linux](https://habr.com/ru/company/mailru/blog/314168)
* [Настройка сетевого стека Linux для высоконагруженных систем 2021](https://habr.com/ru/company/otus/blog/550820/)
	* https://levelup.gitconnected.com/linux-kernel-tuning-for-high-performance-networking-configuring-kernel-settings-96b519a3305f

## HTTP

 * [HTTP-заголовки для ответственного разработчика](https://habr.com/ru/company/mailru/blog/450816/)
 * [http протокол - Иван Бибилов 2014](https://www.youtube.com/watch?v=yUHlrabtEaU)
 * [http2 и спрайты](https://habr.com/ru/post/308862/)
 * [TLS](https://www.freecodecamp.org/news/what-is-tls-transport-layer-security-encryption-explained-in-plain-english/)

## netstat --> ss

* netstat -rn --> ip route
* route add --> ip route add 192.168.0.0/24 via 192.168.0.253 dev eth2
* [ip route static](https://www.thegeekstuff.com/2014/08/add-route-ip-command/)
* [ip route runtime](https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/)
*
```bash
    arp → ip n (ip neighbor)
    ifconfig → ip a (ip addr), ip link, ip -s (ip -stats)
    iptunnel → ip tunnel
    iwconfig → iw
    nameif → ip link, ifrename
    netstat → ss, ip route (for netstat -r), ip -s link (for netstat -i), ip maddr (for netstat -g)
	ss | less  # get all connections
	ss -t      # get tcp connections not in listen mode (server programs)
	ss -u      # get udp connections not in listen mode
	ss -x      # get unix socket pipe connections
	ss -ta     # get all tcp connections
	ss -au     # get all udp connections
	ss -nt     # all tcp without host name
	ss -ltn    # listening tcp without host resolution
	ss -ltp    # listening tcp with PID and name
	ss -s      # prints statstics
	ss -tn -o  # tcp connection with domain host and show keepalive timer
	ss -tl4    # ip4 connections
```


## ss

https://habrahabr.ru/company/ruvds/blog/346744/

## mtr

```bash
mtr -o "LDRS NBAWV GJMXI" -b -s 1500 -i 0.1 91.240.86.5
```
ping добавляет 28 бит!


## VPN

 * [Запуск отдельных приложений через OpenVPN без контейнеров и виртуализации - network namespace](https://habrahabr.ru/post/310646/)
 * [Заворачиваем весь трафик локальной сети в vpn без ограничения скорости - pfsense](https://habr.com/ru/company/postuf/blog/475068/)
 * https://help.keenetic.com/hc/ru/articles/360010592379-WireGuard-VPN
 * [Настройка маршрутизации в сети с неподконтрольным роутером](https://habr.com/ru/post/599623/)
 * [Связываем две локальные сети с помощью Wireguard VPN на выделенном сервере](https://habr.com/ru/post/599623/)
	* https://bitbucket.org/padavan/rt-n56u/wiki/Home
	* https://github.com/Entware/Entware-ng

## openvpn

 * https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-centos-8-ru
 * https://linuxize.com/post/how-to-configure-and-manage-firewall-on-centos-8/#opening-a-source-port
 *
```bash
	yum install epel-release
	yum openvpn easy-rsa


	firewall-cmd --zone=public --add-port=443/tcp
	firewall-cmd --zone=public --add-port=443/udp
	firewall-cmd --runtime-to-permanent
	firewall-cmd --zone=public --list-ports

```

```bash
	export user="user"
	export client="client2"
	export server="server" # change server.conf cert&key!
	export port="443"
	export protocol="udp"

	mkdir ~/easy-rsa
	ln -s /usr/share/easy-rsa/3/* ~/easy-rsa/
	chown sammy ~/easy-rsa
	chmod 700 ~/easy-rsa
	cd ~/easy-rsa
	cat>> vars
	set_var EASYRSA_ALGO "ec"
	set_var EASYRSA_DIGEST "sha512"
	./easyrsa init-pki

	# на сервере OpenVPN не нужно создавать центр сертификации. Ваш сервер ЦС отвечает за валидацию и подпись сертификатов. PKI на вашем сервере VPN используется только в качестве удобного и централизованного места хранения запросов сертификата и публичных сертификатов.

	#сгенерируем закрытый ключ и запрос подписи сертификата на вашем сервере OpenVPN. После этого вы передадите запрос в ваш центр сертификации для подписи, создав необходимый сертификат. После подписи сертификата вы передадите его назад на сервер OpenVPN и установите его для использования на сервере.

	# запрос на подпись сертификата (CSR):
	# easy-rsa/pki/private/server.key закрытый ключ для сервера
	# easy-rsa/pki/reqs/server.req файл запроса сертификата с именем server.req

	cd ~/easy-rsa
	./easyrsa gen-req ${server} nopass
	# su
	cp /home/${user}/easy-rsa/pki/private/${server}.key /etc/openvpn/server/

	cd ~/easy-rsa
	#./easyrsa import-req /tmp/${server}.req ${server} # copy req to ~/easy-rsa/pki/reqs/${server}.req
	./easyrsa sign-req server ${server}

	# server.crt содержит открытый ключ шифрования сервера OpenVPN, а также новую подпись от сервера ЦС


	sudo cp /home/${user}/easy-rsa/pki/issued/${server}.crt /etc/openvpn/server
	sudo cp /home/${user}/easy-rsa/pki/ca.crt /etc/openvpn/server

	# В качестве дополнительного уровня безопасности мы добавим дополнительный общий секретный ключ, который будет использовать сервер и все клиенты. Справляться с неудостоверенным трафиком, сканированием портов и DoS-атаками, которые могут связывать ресурсы сервера. Она также затрудняет выявление сетевого трафика OpenVPN

	cd ~/easy-rsa

	openvpn --genkey --secret ta.key

	sudo cp /home/${user}/easy-rsa/ta.key /etc/openvpn/server

	# создадим одну пару из ключа и сертификата для клиентской системы

	mkdir -p ~/client-configs/keys
	chmod -R 700 ~/client-configs
	cd ~/easy-rsa
	./easyrsa gen-req ${client} nopass
	cp ~/easy-rsa/pki/private/${client}.key ~/client-configs/keys/
	# ./easyrsa import-req /tmp/${client}.req ${client} # copy req to ~/easy-rsa/pki/reqs/${client}.req
	./easyrsa sign-req client ${client} nopass
	# yes
	cp ~/easy-rsa/pki/issued/${client}.crt ~/client-configs/keys/

	cp ~/easy-rsa/ta.key ~/client-configs/keys/
	sudo cp /etc/openvpn/server/ca.crt /home/${user}/client-configs/keys/
	chown ${user}:${user} /home/${user}/client-configs/keys/*

	# Настройка OpenVPN

	cp /usr/share/doc/openvpn/sample/sample-config-files/server.conf /etc/openvpn/server/
	mcedit /etc/openvpn/server/server.conf

	# TLS
	;dh dh2048.pem
	;tls-auth ta.key 0 # This file is secret
	;cipher AES-256-CBC
	dh none
	tls-crypt ta.key
	cipher AES-256-GCM
	auth SHA256

	# без TLS
	tls-auth ta.key 0 # This file is secret
	cipher AES-256-CBC
	dh dh2048.pem
	;tls-crypt ta.key
	;cipher AES-256-GCM
	;auth SHA256
	;dh none



	user nobody
	group nobody

	push "redirect-gateway def1 bypass-dhcp"

	# https://www.opendns.com/

	push "dhcp-option DNS 208.67.222.222"
	push "dhcp-option DNS 208.67.220.220"

	port ${port}

	# Optional TCP!
	proto tcp
	explicit-exit-notify 0


	#cert ${server}.crt
	#key ${server}.key


	echo "net.ipv4.ip_forward = 1" >>  /etc/sysctl.conf
	sysctl -p
	firewall-cmd --get-active-zones
	firewall-cmd --zone=trusted --add-interface=tun0
	firewall-cmd --permanent --zone=trusted --add-interface=tun0


	firewall-cmd --permanent --add-service openvpn
	firewall-cmd --permanent --zone=trusted --add-service openvpn
	firewall-cmd --reload
	firewall-cmd --list-services --zone=trusted
	# openvpn

	firewall-cmd --add-masquerade
	firewall-cmd --add-masquerade --permanent
	firewall-cmd --query-masquerade
	# yes


	DEVICE=$(ip route | awk '/^default via/ {print $5}')

	firewall-cmd --permanent --direct --passthrough ipv4 -t nat -A POSTROUTING -s 10.8.0.0/24 -o $DEVICE -j MASQUERADE

	firewall-cmd --reload
	systemctl enable openvpn-server@server.service
	systemctl start openvpn-server@server.service
	systemctl status openvpn-server@server.service

	# Создание инфраструктуры конфигурации клиентских систем

	mkdir -p ~/client-configs/files
	cp /usr/share/doc/openvpn/sample/sample-config-files/client.conf ~/client-configs/base.conf

	mcedit  ~/client-configs/base.conf
	proto udp
	user nobody
	group nobody

	# Поставьте знак комментария перед строками этих директив, поскольку вы вскоре добавите сертификаты и ключи в сам файл
	;ca ca.crt
	;cert client.crt
	;key client.key
	tls-auth ta.key 1

	cipher AES-256-GCM
	auth SHA256
	key-direction 1

	# без TLS
	tls-crypt ta.key
	cipher AES-256-CBC

	# включать только для клиентов Linux с файлом /etc/openvpn/update-resolv-conf
	; script-security 2
	; up /etc/openvpn/update-resolv-conf
	; down /etc/openvpn/update-resolv-conf


	cat >> ~/client-configs/make_config.sh
	#!/bin/bash

	# First argument: Client identifier

	KEY_DIR=~/client-configs/keys
	OUTPUT_DIR=~/client-configs/files
	BASE_CONFIG=~/client-configs/base.conf

	cat ${BASE_CONFIG} \
	<(echo -e '<ca>') \
	${KEY_DIR}/ca.crt \
	<(echo -e '</ca>\n<cert>') \
	${KEY_DIR}/${1}.crt \
	<(echo -e '</cert>\n<key>') \
	${KEY_DIR}/${1}.key \
	<(echo -e '</key>\n<tls-crypt>') \
	${KEY_DIR}/ta.key \
	<(echo -e '</tls-crypt>') \
	> ${OUTPUT_DIR}/${1}.ovpn

	chmod 700 ~/client-configs/make_config.sh

	cd ~/client-configs
	./make_config.sh client1

	openvpn --config client1.ovpn

	systemctl status openvpn-server@server.service



```

## DNS

[DNS вручную](https://habrahabr.ru/post/346098/)

[Что такое DNS](https://habrahabr.ru/post/303446/)

[DKIM, DMARC и SPF](https://habrahabr.ru/post/343128/)


## ipv6

 * [Список брокеров IPv6](https://ru.wikipedia.org/wiki/%D0%A1%D0%BF%D0%B8%D1%81%D0%BE%D0%BA_%D0%B1%D1%80%D0%BE%D0%BA%D0%B5%D1%80%D0%BE%D0%B2_IPv6)
 * [Настройка keenetic подключения по протоколу IPv6 через туннельный брокер (для версий NDMS 2.11 и более ранних) ](https://help.keenetic.com/hc/ru/articles/213968509-%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0-%D0%BF%D0%BE%D0%B4%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%BD%D0%B8%D1%8F-%D0%BF%D0%BE-%D0%BF%D1%80%D0%BE%D1%82%D0%BE%D0%BA%D0%BE%D0%BB%D1%83-IPv6-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-%D1%82%D1%83%D0%BD%D0%BD%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9-%D0%B1%D1%80%D0%BE%D0%BA%D0%B5%D1%80-%D0%B4%D0%BB%D1%8F-%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B9-NDMS-2-11-%D0%B8-%D0%B1%D0%BE%D0%BB%D0%B5%D0%B5-%D1%80%D0%B0%D0%BD%D0%BD%D0%B8%D1%85-)
 * [MikroTik — 6in4 или IPv6 без поддержки провайдера](https://habr.com/ru/post/189008/)
 * [IPv6 в каждый дом: Cвой собственный IPv6 сервер брокер (6in4)](https://habr.com/ru/post/352146/)
 * [ликбез IPv6 для домашних сетей](https://habr.com/ru/post/159775/)
