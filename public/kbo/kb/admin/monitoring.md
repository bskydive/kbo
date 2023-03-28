# Мониторинг



 * [Prometeus](https://prometheus.io/docs/introduction/overview/)
 * [graphite](http://graphite.readthedocs.org/en/latest/)
 * [influxdb](https://influxdata.com/)
 * [opentsdb](http://opentsdb.net/)
 * [nagios](https://www.nagios.org/)
 * [sensu](https://sensuapp.org/)
 * [monitorix](https://www.monitorix.org/features.html)
 * [Мониторим парк ИБП. Ч.3, заключительная](https://habr.com/ru/post/562952/)

## linux monitoring performance


```bash
ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu|less
top -cd0.5 -o%CPU
zypper in sysstat operf
```

## strace ptrace

```bash
	lsof -c ${procName}|less
	strace -p ${PID} -f -e trace=all -s 10000 -o ./log/`${procName}`.strace.all.log
	strace -p ${PID} -f -e trace=network -s 10000 -o ./log/`${procName}`.strace.network.log
	tail -f /var/log/${procName}/error.log | ./log/`${procName}`.error.log
	# high memory usage
	top -d1 -o RES -c
	# high CPU TIME
	top -d1 -o TIME+ -c
```

## Network debug

 * код статуса

	```bash
	code=`curl -X 'GET' -sw '%{http_code}' -m 100 --max-redirs 10 --retry 3 -H 'Accept: */*' -H 'Origin: localhost' -H 'Referer: localhost' -o /dev/null 'https://api.waifu.pics/sfw/waifu'`;\
	[[ ${code} == '200' ]] && echo okok

	```
 * метрики API
	* response time
	* response body length или sha256
	* response http code
	* response headers
	* response body
	* logging: output+timestamp+server_address+query headers(tail/head/sah256)+query body(tail/head/sha356) --> ${some_metric_log}.log

## log

```bash
	# сортировка по минутам: сортируем всё, выбираем столбец минут, суммируем и выводим по счётчику +1 минута(если 0 - выводим 0)
	# 2022-08-01T00:31:54.540548+03:00 localhost kwin_x11[2602]: file:///usr/share/kwin/decorations/kwin4_decoration_qml_plastik/contents/ui/main.qml:91: TypeError: Type error
	grep -iE 'error|warn' /doc/messages-20220808.log |sort -nk1 -r |less
	#awk '{print $0|"sort -t',' -nk3 "}'
	#cat input.txt | awk -F '|' '{sprintf("date +%%s -d \"%s\"", $3) | getline tm};
	grep -iE 'error|warn' /doc/messages-20220807.log | awk '{sprintf("date +%%s -d \"%s\"", $1) | getline tm}' | less

	grep -iE 'error|warn' /doc/messages-20220807.log | awk '{print strftime("Time = %m/%d/%Y %H:%M:%S", $1)}' | less

# sort log by date
grep -iE 'error|warn' /doc/messages-20220807.log | awk 'BEGIN {cmd = "date +%s"} { cmd | getline result; close(cmd); print result, $0 }' | sort -nk1 > /doc/messages-20220807.sorted.log

# save the result in array

grep -iE 'error|warn' /doc/messages-20220807.log | awk 'BEGIN {cmd = "date +%s"} { cmd | getline varConverted; close(cmd); result[NR] = varConverted " " $0 } END { for (i = NR; i > 0; i--) print result[i]}' | less

#

cat /doc/messages-20220807.sorted.log | awk 'BEGIN {nextTick = 0; tick = 60} { if curSec = $1;  } END { for (i = NR; i > 0; i--) print result[i]}' | less


```

### sar

собирает статистику из /proc/ в файл по всем подсистемам ПК

 * https://www.cyberciti.biz/tips/identifying-linux-bottlenecks-sar-graphs-with-ksar.html
 * [рисовалка графиков](https://github.com/vlsi/ksar) умеет запускать мониторинг
 * https://www.thegeekstuff.com/2011/03/sar-examples

 ```bash
# vi /etc/cron.d/sysstat
*/10 * * * * root /usr/local/lib/sa/sa1 1 1
53 23 * * * root /usr/local/lib/sa/sa2 -A
 ```

 * [Мониторинг для бедных или SAR + MySQL + Gnuplot](https://habr.com/ru/post/252201/)

### pidstat

собирает статистику из /proc по процессам

 * http://rus-linux.net/MyLDP/admin/pidstat.html

 * https://linoxide.com/linux-command/linux-pidstat-monitor-statistics-procesess/
 * https://www.thegeekstuff.com/2014/11/pidstat-examples/
```bash
pidstat -utdrhl |less
pidstat -utdrhl |sort -k9 |less
```
 * https://github.com/morucci/pidstat-grapher/blob/master/pidstat-grapher.py

### iostat

 * [iostat gnuplot](https://github.com/markcurtis1970/graph-iostats)

### psacct

 * https://www.tecmint.com/how-to-monitor-user-activity-with-psacct-or-acct-tools/

## баланс сотового

 * [мегафон](https://habr.com/ru/post/357610/)
 * [скрипт на несколько операторов](https://github.com/svetlyak40wt/mobile-balance)
 * [модем](https://www.linux.org.ru/forum/general/9934896)
 * [Мониторинг балансов сотовых телефонов, провайдеров ](https://habr.com/ru/post/114177/) zabbix
 * https://github.com/GreyCat/spmon
 * [Nagios мониторинг баланса мобильного телефона](https://habr.com/ru/post/113878/)

```