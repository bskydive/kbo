# Мониторинг



 * [Prometeus](https://prometheus.io/docs/introduction/overview/)
 * [graphite](http://graphite.readthedocs.org/en/latest/)
 * [influxdb](https://influxdata.com/)
 * [opentsdb](http://opentsdb.net/)
 * [nagios](https://www.nagios.org/)
 * [sensu](https://sensuapp.org/)

## linux monitoring performance


```bash
ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu|less
top -cd0.5 -o%CPU
zypper in sysstat operf
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