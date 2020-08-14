# network сеть

* [отладка сетевого стека linux](https://habr.com/ru/company/mailru/blog/314168)

## HTTP

 * [HTTP-заголовки для ответственного разработчика](https://habr.com/ru/company/mailru/blog/450816/)

## netstat

* netstat -rn --> ip route
* route add --> ip route add 192.168.0.0/24 via 192.168.0.253 dev eth2
* [ip route static](https://www.thegeekstuff.com/2014/08/add-route-ip-command/)
* [ip route runtime](https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/)

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