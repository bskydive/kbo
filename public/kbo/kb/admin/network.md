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
mtr -o "LDRS NBAWV GJMXI" -f -b -s 1500 -i 0.1 91.240.86.5
```
ping добавляет 28 бит!


## VPN

 * [Запуск отдельных приложений через OpenVPN без контейнеров и виртуализации - network namespace](https://habrahabr.ru/post/310646/)
 * [Заворачиваем весь трафик локальной сети в vpn без ограничения скорости - pfsense](https://habr.com/ru/company/postuf/blog/475068/)

## DNS

[DNS вручную](https://habrahabr.ru/post/346098/)

[Что такое DNS](https://habrahabr.ru/post/303446/)

[DKIM, DMARC и SPF](https://habrahabr.ru/post/343128/)