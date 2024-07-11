# Nginx


 * [moodle](./moodle.md)
 * [openmeetings](./openmeetings.md)
 * [redmine](./redmine.md)
 * [Nginx. О чем не пишут в книгах](https://habr.com/ru/post/561758/)
 * http://openresty.org/download/agentzh-nginx-tutorials-en.html

## multilocation

 * https://serverfault.com/questions/361159/nginx-multiple-location-issues
 * https://stackoverflow.com/questions/10084137/nginx-aliaslocation-directive#10102539
 * http://nginx.org/en/docs/http/ngx_http_core_module.html#alias
 * https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms

## nginx cli

```bash
nginx -s #сигнал
    #stop — быстрое завершение
    #quit — плавное завершение
    #reload — перезагрузка конфигурационного файла
    #reopen — переоткрытие лог-файлов

# проверить
nginx -t -c nginx.conf
```

## load balancing

 * [Using nginx as HTTP load balancer](https://nginx.org/en/docs/http/load_balancing.html)
    * round-robin — requests to the application servers are distributed in a round-robin fashion,
    * least-connected — next request is assigned to the server with the least number of active connections,
    * ip-hash — a hash-function is used to determine what server should be selected for the next request (based on the client's IP address).
 * [](https://docs.nginx.com/nginx/admin-guide/load-balancer/tcp-udp-load-balancer/)
 * []()
 * []()

```json
http {
    upstream myapp1 {
		#least_conn;
		#ip_hash;
        server srv1.example.com;
        server srv2.example.com;
        server srv3.example.com;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://myapp1;
        }
    }
}

```

## SSL nginx

 * [ликбез ispsystem](https://doc.ispsystem.ru/index.php/Установка_SSL-сертификата/)
 * [openssl cli](https://www.sslshopper.com/article-most-common-openssl-commands.html)
 * [gitlab pages ssl](https://gitlab.com/stepanovv/kbo/pages/domains/stepanovv.ru	)
 * обновление ключа

	```bash
		openssl req -text -noout -verify -in 5353333.csr
		openssl rsa -check -in 5353333.key
		# openssl verify -noout -in 5353333/www_stepanovv_ru.crt
		openssl x509 -dates -noout -in 5353333/www_stepanovv_ru.crt

		cat 5353333/www_stepanovv_ru.crt > stepanovv.ru.chained.crt
		cat 5353333/www_stepanovv_ru.ca-bundle >> stepanovv.ru.chained.crt
		openssl x509 -noout -text -in stepanovv.ru.chained.crt | less
		openssl x509 -enddate -noout -in stepanovv.ru.chained.crt

		cat 5353333.key > stepanovv.ru.key
		openssl rsa -check -in stepanovv.ru.key

		openssl dhparam -out dhparam2048.pem 2048

		openssl s_client -connect stepanovv.ru:443
		openssl s_client -showcerts -connect stepanovv.ru:443
		nmap -p 443 --script ssl-cert stepanovv.ru
	```

 * самоподписанный ключ [тыц](https://www.digitalocean.com/community/tutorials/how-to-create-an-ssl-certificate-on-nginx-for-ubuntu-14-04)

```bash
	#putty
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./nginx.key -out ./nginx.crt
	#для IIS
	pkcs12 -export -out nginx_iis.pfx -inkey ./nginx.key -in nginx.crt -name 'nginx'
	#2023 openssl 1.1.1+
	openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -keyout gitlab.key -out gitlab.crt -subj "/CN=gitlab"
```

 * [strict trabsport security](https://www.nginx.com/blog/http-strict-transport-security-hsts-and-nginx/)
 * [ssl getting started](https://www.nginx.com/blog/nginx-https-101-ssl-basics-getting-started/)
 * [усиление ssl hardening](https://blog.ukrnames.com/administrirovanie/usilenie-ssl-dlya-veb-servera-nginx)
 * [rewrite](https://wiki.nginx.org/blog/creating-nginx-rewrite-rules/)
 * [цепочки сертификатов chained.*](http://nginx.org/ru/docs/http/configuring_https_servers.html#chains)

### http 2

 * https://dassur.ma/things/h2setup/
 ```
        server {
        listen 443 ssl http2 default_server;
        ssl_certificate    /path/to/server.cert;
        ssl_certificate_key /path/to/server.key;
        # ...
        # Copy from the HTTP server
        # ...
    }
 ```
 ```js
    var fs = require('fs');
    var http2 = require('http2');
    var options = {
    key: fs.readFileSync('/path/to/server.key'),
    cert: fs.readFileSync('/path/to/server.cert')
    };
    http2.createServer(options, function(request, response) {
    response.end('Hello world!');
    }).listen(8080);
 ```

### debian

comment out

/etc/nginx/sites-available/default

### letsencrypt free cert

нужно было всего лишь использовать listen без указания домена/IP-адреса (listen 443 default;). Для переезда с другого SSL сертификата мне проще было закомментировать настройки связанные с HTTPS чтобы Let's Encrypt смог его «обновить с HTTP до HTTPS». Если домен совсем не слушал 80 порт, то конфиг добавится в /etc/nginx/nginx.conf, что тоже заняло некоторое время на выяснение причин происходящих чудес.

Ещё из неприятных особенностей — когда Let's Encrypt патчит конфиги — он их полностью переформатирует — убираются «лишние» пустые строки, отступы становятся строго 4 пробела (для меня это ок), комментарии на одной строке с настройкой разносятся на две строки (получается комментарий к чему-то становится после того, что нужно было прокомментировать).

## repo

http://habrahabr.ru/post/173125/

```bash
cat nginx.repo
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=0
enabled=1

> ln -s /distr/nginx.repo /etc/yum.repos.d/nginx.repo
```

## php

```
php.ini
cgi.fix_pathinfo=0;
upload_max_filesize = 100M
post_max_size = 100M
max_execution_time = 300
```

## security

```
server_tokens off;
limit_conn one 3;
client_max_body_size 100m;
	fastcgi_read_timeout 300;
	fastcgi_send_timeout 300;
```


## log

```bash
awk F '{print $3}' /var/log/nginx/access.log |less
```

## drupal

https://lelutin.ca/posts/Drupal_7_and_Nginx_1.0.4_on_Debian_Squeeze/

## secure ddos

 * http://pkgs.repoforge.org/stress/
 * http://people.seas.harvard.edu/~apw/stress/
 * http://snippets.aktagon.com/snippets/554-how-to-secure-an-nginx-server-with-fail2ban
 * http://habrahabr.ru/company/netangels/blog/149302/
 * http://www.netangels.ru/support/vds-howto/ddos/
