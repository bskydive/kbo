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

 * https://www.cyberciti.biz/tips/identifying-linux-bottlenecks-sar-graphs-with-ksar.html
 * https://github.com/vlsi/ksar
 * https://linoxide.com/linux-command/linux-pidstat-monitor-statistics-procesess/
 * https://www.thegeekstuff.com/2014/11/pidstat-examples/

```bash
pidstat -utdrhl |less
pidstat -utdrhl |sort -k9 |less
```
 * https://github.com/morucci/pidstat-grapher/blob/master/pidstat-grapher.py
 * https://www.thegeekstuff.com/2011/03/sar-examples

 ```bash
# vi /etc/cron.d/sysstat
*/10 * * * * root /usr/local/lib/sa/sa1 1 1
53 23 * * * root /usr/local/lib/sa/sa2 -A
 ```
 