# Nodejs

## courses

https://nodejs.org/en/foundation/education/

## links

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

## install

### nvm

 * https://github.com/creationix/nvm
 * https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04
 ```bash
 > nvm install node
 > yum install gcc-c++ ##node_gyp g++ fix
 > ## ~/.nvm/versions/node/v10.7.0/bin/node
 > 
 
 ```

## npm local server

 * https://github.com/an9eldust/packrat
 * https://www.npmjs.com/package/sinopia

## REST

 * http://www.tutorialspoint.com/nodejs/nodejs_restful_api.htm
 * https://stormpath.com/blog/tutorial-build-rest-api-mobile-apps-using-node-js
 * http://cwbuecheler.com/web/tutorials/2014/restful-web-app-node-express-mongodb/

## performance

 * http://voidcanvas.com/javascript-performant-coding-tips/
 * [упаковка сообщений в бинарный вид](https://habr.com/post/277823/)

## security

 * [cors](https://expressjs.com/en/resources/middleware/cors.html)
 * [helmet](https://www.npmjs.com/package/helmet)

## db

 * http://programminglife.io/nodejs-sequelize-postgresql-tutorial/
 * http://mherman.org/blog/2015/02/12/postgresql-and-nodejs/

## многопоточность

потоки бьют входные данные на части, и позволяют обрабатывать их не дожидаясь полной загрузки.
pipe добавляют последовательные конвейеры.

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

## http

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

## test

 * [CodeceptJS — современные end2end тесты для NodeJS 2017](https://habrahabr.ru/post/319656/)
