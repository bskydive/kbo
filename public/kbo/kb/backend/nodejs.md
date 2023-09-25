# Nodejs

 * https://bitbucket.org/bskydive/bookstore-server/src/master/bookStoreServer/
## courses

 * https://nodejs.org/en/foundation/education/
  * https://frontendmasters.com/learn/node-js/?utm_source=css-tricks&utm_medium=website&utm_campaign=css-tricks-tags-sidebar

## links

 * [версии и функции](https://node.green/)
 * [критика nodejs](https://habr.com/ru/post/305832/)
 * https://www.digitalocean.com/community/tutorials/how-to-deploy-node-js-applications-using-systemd-and-nginx
 * https://www.digitalocean.com/community/tutorials/how-to-setup-a-node-js-development-environment-on-a-vps-for-a-team
 * https://www.nginx.com/blog/nginx-nodejs-websockets-socketio/
 * https://habrahabr.ru/post/327058/
 * [Особенности работы и внутреннего устройства express.js](https://habr.com/post/414079/)
    * https://www.sohamkamani.com/blog/2018/05/30/understanding-how-expressjs-works/

	```js
		[Service]
		ExecStart=/usr/bin/node /opt/bookstore/bookStoreServer/bin/www
		WorkingDirectory=/opt/bookstore/bookStoreServer/
		Restart=on-failure
		TimeoutStartSec=10
		TimeoutStopSec=10
		StandardOutput=syslog
		StandardError=syslog
		SyslogIdentifier=node-bookstore
		User=bookstore
		Group=nginx
		Environment=NODE_ENV=production

		[Install]
		WantedBy=multi-user.target
	```

##  logging

 * https://www.loggly.com/ultimate-guide/node-logging-basics/
 * https://github.com/bluejamesbond/Scribe.js
 * http://stackoverflow.com/questions/11403953/winston-how-to-rotate-logs
 * http://stackoverflow.com/questions/12016474/node-js-logging
 * https://www.geeksforgeeks.org/node-js-debugging/
 * https://kittygiraudel.com/2020/09/09/writing-a-debug-script/

## framework node

 * https://nestjs.com/

## install

### nvm

 * https://github.com/nvm-sh/nvm#install--update-script
	```bash
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	```
 * https://github.com/creationix/nvm
 * https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
	```bash
		> nvm install node
		> yum install gcc-c++ ##node_gyp g++ fix
		> ## ~/.nvm/versions/node/v10.7.0/bin/node
		>
	```
 * [debug](../frontend/vscode.md#debug)

## npm local server

 * https://github.com/verdaccio/verdaccio
 * https://www.npmjs.com/package/sinopia
 * https://github.com/an9eldust/packrat


## API

 * [Портирование API на TypeScript как способ решения проблем](https://habr.com/ru/company/ruvds/blog/499664/)
 * [Node.js: документирование и визуализация API с помощью Swagger](https://habr.com/ru/company/timeweb/blog/594081/)
	* https://www.npmjs.com/package/swagger-autogen
	* https://www.npmjs.com/package/swagger-ui-express

## REST API

 * http://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm
 * https://stormpath.com/blog/tutorial-build-rest-api-mobile-apps-using-node-js
 * http://cwbuecheler.com/web/tutorials/2014/restful-web-app-node-express-mongodb/

## performance

 * http://voidcanvas.com/javascript-performant-coding-tips/
 * [упаковка сообщений в бинарный вид](https://habr.com/post/277823/)
 * https://youtu.be/n_65k_uSq2w clinic.js позволяет исследовать проблемы с производительностью node.js приложений с помощью таких инструментов как Doctor, Bubbleprof и Flame


## security

 * [cors](https://expressjs.com/en/resources/middleware/cors.html)
 * [helmet](https://www.npmjs.com/package/helmet)
 * [Руководство по аутентификации в Node.js без passport.js и сторонних сервисов](https://habr.com/ru/company/ruvds/blog/457700/)
 * [Full Stack Authentication: Cookies and Local Storage React+express](https://www.taniarascia.com/full-stack-cookies-localstorage-react-express/)
 * http://www.passportjs.org/ 300+ authentication strategies
 * [Криптография](https://nodejsdev.ru/doc/cryptography/)
 * [Node.js: шаблон сервера для аутентификации и авторизации](https://habr.com/ru/post/593063)
	* https://github.com/panva/node-oidc-provider
	* https://auth0.com/

## db

 * http://programminglife.io/nodejs-sequelize-postgresql-tutorial/
 * http://mherman.org/blog/2015/02/12/postgresql-and-nodejs/

## многопоточность

 * потоки бьют входные данные на части, и позволяют обрабатывать их не дожидаясь полной загрузки.
pipe добавляют последовательные конвейеры.
 * [события events в nodejs](https://habr.com/ru/company/mailru/blog/330048/)

## cluster

[haproxy](https://habrahabr.ru/post/270385/)

Для создания и управления группами процессов, совместно использующих одни и те же порты.

## domain

 * используется для обработки ошибок с защитой от падения экземпляра обработчика, и группировкой порождающих ошибки обработчиков. В настоящее время готовится замена на try/catch
 * http://stackoverflow.com/questions/33552400/why-is-domain-api-deprecated-in-node-js
 * https://habrahabr.ru/post/181650/
 * https://habrahabr.ru/post/314186/
 * https://nodejs.org/api/domain.html

## best practices

 * [10 привычек довольного разраба](https://habrahabr.ru/post/277707/#habracut)
 * [трудных 5 лет](https://habrahabr.ru/post/327058/)
 * [вы не знаете node](https://habrahabr.ru/company/mailru/blog/283228/)
 * [Node.js Best Practices — Using Modern Features 2020](https://levelup.gitconnected.com/node-js-best-practices-using-modern-features-1f5a4a189ec8)
 * [Node.js в 2020: Выйди и зайди нормально](https://habr.com/ru/post/497090/)
 * [функциональное программирование в nodejs](https://nodefunction.com/functional-programming/functional-programming-in-javascript-nodejs-explained-with-example/)
 * https://medium.com/thecobbles/why-we-moved-from-golang-to-nodejs-cecf66a47740

## кол-во новых строк в файле

```js
	var fs = require('fs');

	fs.readFileSync(process.argv[1], 'utf8').split('\n').length - 1
	fs.readFileSync(process.argv[1]).toString().split('\n').length - 1

	fs.readFile(process.argv[2], function(err, data) {
		if (err) {console.log(err.message);}
		else {console.log(data.toString().split('\n').length - 1); }
	});

	fs.readFile(process.argv[2],{encoding:"utf-8"}, function(err, data) {
		if (err) {console.log(err.message);}
		else {console.log(data.split('\n').length - 1); }
	});


```

## модуль

```js
	module.exports = function lsFunc(dirName, fileExt, callback) {

		var fs = require('fs'), dataOut = [];

		fs.readdir(dirName, function(err, data) {

			if (err) {
				return callback(err);
			}
			else {
				for (var i = 0; i < data.length; i++) {
					if (data[i].split('.')[1] == fileExt) {
						dataOut = dataOut.concat(data[i]);
					}
				}
				callback(null, dataOut);
			}
		});
	}

	var lsFunc1 = require("./module1.js");

	lsFunc1(process.argv[2],process.argv[3], function (err,data) {

		if (err) {
			console.log(err.message);
		}
		else {

			for (var i = 0; i<data.length; i++) {
				console.log(data[i]);
				}
			}
	});
```

## http сервер

* [lite-server](https://github.com/johnpapa/lite-server) Lightweight development only node server that serves a web app, opens it in the browser, refreshes when html or javascript change, injects CSS changes using sockets, and has a fallback page when a route is not found
* []()
* []()
```js
 var http = require('http')

     http.get(process.argv[2], function (response) {
       response.setEncoding('utf8')
       response.on('data', console.log)
       response.on('error', console.error)
     })

var http = require('http')
     var bl = require('bl')

     http.get(process.argv[2], function (response) {
       response.pipe(bl(function (err, data) {
         if (err)
           return console.error(err)
         data = data.toString()
         console.log(data.length)
         console.log(data)
       }))
     })
```

## npm

 * обновление пакетов - `npm link` или `yalc`
 * npm-check
 * https://www.npmjs.com/package/depcheck
 * [короткая шпаргалка по lockfile](https://habr.com/ru/company/alfa/blog/705876/)
 * npm строит дерево зависимостей, дедуплицирует, вычисляет совместимые версии из диапазонов.
 * yarn dedupe
 * npm audit --fix
 * semver semantic versioning семантическое версионирование
 	* Учитывая номер версии МАЖОРНАЯ.МИНОРНАЯ.ПАТЧ, следует увеличивать: МАЖОРНУЮ версию, когда сделаны обратно несовместимые изменения API.МИНОРНУЮ версию, когда вы добавляете новую функциональность, не нарушая обратной совместимости.ПАТЧ-версию, когда вы делаете обратно совместимые исправления.
 * [Convert yarn.lock to package-lock.json and vice versa.](https://www.npmjs.com/package/synp)
 *
```bash
npm i npm -g // or npm outdated; npm update
npm adduser
npm whoami
npm init
npm publish
npm i @user/package
npm view @user/package
npm version 2.0.0
npm publish
npm dist-tag @user/pkg@2.0.0 coolestversion //можно назначить на другую версию, но нельзя удалить latest

//edit,bugs,explore
```


### node-sass failed

```
npm cache clean -f
npm rebuild node-sass --force

```

## test

 * [CodeceptJS — современные end2end тесты для NodeJS 2017](https://habrahabr.ru/post/319656/)


## json

 * [парсинг json](https://habr.com/ru/company/mailru/blog/314014)
 * [json parsing is a minefield](http://seriot.ch/json/parsing.html#29)
 * [JsonDiscovery: Changing a way we 're viewing JSON in a browser](https://blog.usejournal.com/changing-a-way-were-viewing-json-in-a-browser-51eda9103fa2) [плагин](https://github.com/discoveryjs/browser-extension-json-discovery)
 * форматирование json в командной строке linux - yajl - `cat myfile.json |  json_reformat > myfile.formatted.json` https://unix.stackexchange.com/questions/444610/how-can-i-pretty-format-a-json-file-with-all-the-correct-indents-and-everything