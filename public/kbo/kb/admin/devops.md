#  devops

 * [Основы Ansible 2.9 для сетевых инженеров](https://ansible-for-network-engineers.readthedocs.io/ru/latest/)
 * [утилиты документирования](https://github.com/documentationjs)
 * [SRE site reliability engineering](https://sre.google/books/)
* promteus - node exporter - alert manager
* logstash kibana grafana
* доступ в kibana или grafana+loki
* elasticsearch - источник данных для kibana про логи, посмотреть для чего его вкрячивают
* prometeus - источник данных(agentless node exporter) для kibana про события
* victoria metrics - аналог prometeus
* где посмотреть ограничения технологий, их предельную нагрузку? ноды, события, потоки
* ansible - хранит в себе конфиги, оркестратор, 100-200 строк в файле, есть гуй tower(500 хостов платный), avx - бесплатный гуй
* terraform(go) - оркестратор виртуалок/сетей в облаках, у провайдера должен быть коннектор
* для мониторинга облаков и биллинга - prometeus+grafana
* grafana умеет в математику
* kubernetes или docker compose - иерархия микросервисов
* artifactory или аналоги docker hub

## собесы

 * [Пришёл Intern - оказался JUNIOR Strong / Интервью на позицию DevOps Engineer / Мок собес / 1 - Александр Донской | DevOps фабрика ](https://www.youtube.com/watch?v=pLU3zrUq87Y)
 * [из ЭНИКЕЙЩИКА с двух ног В ДЕВОПС / Интервью на позицию DevOps Engineer / 2](https://www.youtube.com/watch?v=4Srds1XzXwU)

## Performance

 * http://techblog.netflix.com/2015/08/netflix-at-velocity-2015-linux.html
 * http://habrahabr.ru/company/odnoklassniki/blog/266005/
 * http://nickcraver.com/blog/2016/02/17/stack-overflow-the-architecture-2016-edition/
 * [tarantool in-memory nosql db](https://habrahabr.ru/company/oleg-bunin/blog/310690/)
 * [Разбираемся в DevOps и Js на примере Dillinger.io](https://habrahabr.ru/post/280968/)

## monorepo монорепа

 * [nrwl/NX](https://nx.dev/)
	* https://github.com/nrwl/nx

## Load balancing

 * [Введение в современную сетевую балансировку и проксирование - 2018](https://habrahabr.ru/company/mailru/blog/347026/)
 * [«Щадящая» балансировка между несколькими провайдерами на офисном шлюзе - 2016](https://habrahabr.ru/post/279777/)
 * haproxy
 * nginx
 * dns
 * ipvs
 * https://www.serverwatch.com/guides/load-balancing-software/
	* ![](./devops/load_balancing_software.jpg)

## Chat чат

 * https://rocket.chat/
 * google hangouts
 * slack
 * mattermost
 * https://matrix.org/clients/
 * https://teams.vk.com/
 * https://calls.mail.ru/
 * «МТС Линк», SberJazz, Яндекс.Телемост, «Труконф» trueconf, «VK Звонки»

##  инфраструктура

[https://habrahabr.ru/post/319582/](https://habrahabr.ru/post/319582/)

##  автоматизация

 * [Пересмотренное руководство по Grunt для начинающих - 2014](https://habrahabr.ru/post/244721/)
 * https://medium.com/@ericsimons/introducing-turbo-5x-faster-than-yarn-npm-and-runs-natively-in-browser-cc2c39715403
 * https://parceljs.org/

### bazel

 * технология google, со своей спецификой, запуск параллельно, аналог gulp, умеет кэшировать

###  webpack

 * [webpack v3 config](https://bitbucket.org/bskydive/bookstore-client/src/master/webpack/v3.vue/)
 * [webpack v4 config](https://bitbucket.org/bskydive/bookstore-client/src/master/webpack.config.js)
 * [ускорение сборки кэшированием](https://github.com/mzgoddard/hard-source-webpack-plugin)
 * https://webpack.js.org/guides/typescript/
 * [анализ](https://medium.com/@joeclever/three-simple-ways-to-inspect-a-webpack-bundle-7f6a8fe7195d)
 * [три инструмента анализа](https://webpack.js.org/api/cli/#common-options)
 * [webpack 4 angular 7](https://medium.freecodecamp.org/how-to-configure-webpack-4-with-angular-7-a-complete-guide-9a23c879f471)
 * [webpack для статических сайтов](https://github.com/tr1s/tris-webpack-boilerplate)
 * [ Удаляем лишний код из рантайма CSS Modules при помощи webpack](https://www.youtube.com/watch?v=J1gHHmABk44) [код](https://github.com/kisenka/webpack-workshop)
 * [webpack boilerplate](https://github.com/tr1s/tris-webpack-boilerplate)

#### v3
 * [ускорение сборки webpack ](https://habrahabr.ru/company/skbkontur/blog/351080/)
 * http://frontender.info/packing-the-web-like-a-boss/

#### v4

 * [05.2018](https://tproger.ru/translations/configure-webpack4/)

#### 3-->4
 * https://thebrainfiles.wearebrain.com/moving-from-webpack-3-to-webpack-4-f8cdacd290f9
 * https://bluebottle.idv.tw/?p=12482
 * https://blog.johnnyreilly.com/2018/01/finding-webpack-4-use-map.html
 * https://medium.com/webpack/webpack-4-migration-guide-for-plugins-loaders-20a79b927202
 * https://gist.github.com/gricard/e8057f7de1029f9036a990af95c62ba8

 * https://github.com/zouhir/jarvis
 * https://slack.engineering/keep-webpack-fast-a-field-guide-for-better-build-performance-f56a5995e8f1
 * https://habrahabr.ru/company/devexpress/blog/319906/
 * https://medium.com/webmonkeys/an-introduction-to-webpacks-philosophy-78a02461c17f

#### webpack-angular

 * v3
	* https://github.com/gdi2290/angular-starter/wiki
	* https://medium.com/@MarkPieszak/using-pug-or-jade-templates-with-the-angular-cli-9e37334db5bc
	* https://github.com/gdi2290/angular-starter/wiki/How-to-add-.pug-support
 * v4
	* https://medium.com/javascript-tales/angular-4-pug-html-loader-uglify-992416d51f98
	* https://github.com/willyelm/angular-seed
 * v3-v4
	* https://bluebottle.idv.tw/?p=12482
	* https://gist.github.com/gricard/e8057f7de1029f9036a990af95c62ba8
	* https://thebrainfiles.wearebrain.com/moving-from-webpack-3-to-webpack-4-f8cdacd290f9
	* https://github.com/webpack/webpack-dev-server/issues/1324

###  browserify

 * https://habrahabr.ru/post/224825/
 * [gulp+browserify](http://frontender.info/gulp-browserify-starter-faq/)
 * https://www.viget.com/articles/gulp-browserify-starter-faq
 * https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
 * http://www.sitepoint.com/introduction-gulp-js/
