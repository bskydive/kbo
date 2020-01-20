# agile tools

## итого:
* bitbucket: git+wiki
* trello бизнес + corello + butler +15$
* wakatime +5$
* google doc
* figma: редактирование, zeplin просмотр
* discord общение голосом и текстом
* sentry.io логирование
* slack опционально для оповещений
* бесплатный хостинг: heroku
* zoom.us - видеоконференции

## справочная

| № | ФИО | роль | город | время MSK+X | рабочее время MSK | на связи MSK | skype(резервная связь) | тел(экстренная связь) | gmail(для сервисов/календарей) | примечание |
| --- | --- 				| --- 		| --- 			| --- | --- | --- | --- 			| --- 			| --- 						| --- 	|
| 10 |               		|        	| Москва 		| +0 |  9-18 |  9-18 |          	| 8  | @gmail.com				| 		|
| 11 |               		|        	| Москва 		| +0 |  9-18 |  9-18 |          	| 8  | @gmail.com				| 		|
| 12 |               		|        	| Москва 		| +0 |  9-18 |  9-18 |          	| 8  | @gmail.com				| 		|

## planning poker

 * [чёткая треня](https://play.planningpoker.com/plans) [бесплатно](http://www.votingpoker.com)
 * [жирный плагин](https://marketplace.atlassian.com/apps/700473/agile-poker-estimation-tool-for-jira)

## trello


 * numberstats - суммирование. необходимо проверить, т.к. это сторонний плагин. нужен фильтр по людям и ролям
 * сортировка внутри колод делается плагином butler - это кнопка со скриптами
 * hourlytime - надо попробовать - там есть отчёты в ексель но 5 долл в мес
 * timecamp - учёт времени, на одного бесплатно. Кнопка с таймером в карточку и отдельная вкладка с временем в заголовке
 * фильтрация есть по табличкам(ролям), срокам и персонам
 * роли - таблички(tag)
 * приоритеты/статусы раскладываются по колодам карт. Небытие, долгий ящик(веха), неделя(спринт), сегодня, сейчас(1 карточка максимум).
 * передача карточек через редактирование участников
 * фильтрация по спринтам не нужна, у нас есть доска, в ней всё актуально. Т.е. канбан
 * есть:
	* передача карточек людям
	* группировка по статусу
	* время завершения
	* приоритеты
	* фильтрация по персонам
	* фильтрация по спринтам
	* фильтрация по ролям
	* сортировка по приоритетам
	* суммирование потраченного времени по людям
	* фильтрация по срокам
	* интеграция гит
	* интеграция фигма
	* интеграция диск
	* ссылка на карточку
 * интеграция: 
	 * google drive
	 * draw.io
	 * figma
	 * zeplin
	 * timecamp
	 * hangouts chat двунаправленный
	 * gitlab
	 * bitbucket
	 * VSCode через плагин
	 * [slack](https://help.trello.com/article/1049-slack-app)
	 * [timecamp](https://www.timecamp.com/app#/timesheets/timer)
	 * [discord](https://discordbots.org/bot/trello) [](https://www.youtube.com/watch?v=f3HHi7h_R9o)
	 * [api key](https://trello.com/app-key) и нажать там на генерацию токена
	 * 
 * planning pocker в каждой карточке
 * есть локальные плагины для IDE https://marketplace.visualstudio.com/items?itemName=mkloubert.vscode-kanban
 * 

### статьи

 * [советы от timedoctor](https://www.timedoctor.com/blog/how-to-use-trello/)
 * https://trello.com/tour

### Zapier

* 5 минут интервал
* trello->discord
* ```
	{{59072091__card__shortUrl}}
	Карточка: "{{59072091__card__name}}" TId: "{{59072091__card__idShort}}"
	Роли: {{59072091__card__labels[]name}}
	Событие: {{59072091__type}}
	Колода: "{{59072091__data__listBefore__name}}" до: "{{59072091__data__listBefore__name}}" после: "{{59072091__data__listAfter__name}}"
	```
* google calendar - содание мероприятия создаёт карточку

### buttler

* при создании карточки добавлять участников, покер
* при перемещении карточки по колодам назначать дату завершения
* при истечении срока завершения в колодах кроме "готово" делать оповещение или перемещать в другие колоды
* ```
	when a card is added to list "сегодня" by anyone, set due today
	when a card is added to list "на неделе" by anyone, set due the next friday
	when a card is created in the board by anyone, add member @user01165944 to the card, and add the lime "ФРОНТ" label to the card
	when a card is added to list "Долгий ящик" by anyone, remove the due date from the card
	when a card is added to list "небытие" by anyone, remove the due date from the card
	when a card is added to list "Готово" by anyone, remove the due date from the card
	```

## slack

 * [tips](https://slack.com/intl/en-ru/slack-tips/all)

## Sentry

 * [project settings-legacy plugins-trello](https://sentry.io/settings/maiks/projects/angular/plugins/trello/)
 * [trello issues](https://sentry.io/integrations/trello/)
 * https://sentry.io/integrations/
 * [похоже, что интеграция не работает. Кнопки создать карточку нет](https://forum.sentry.io/t/trello-integration-setup/3433)
 * [slack](https://github.com/getsentry/sentry/tree/master/src/sentry/integrations/slack)
 * админка: фильтры, предпросмотр json в списках, события в чятик, создание карточек из событий, сбор системной информации, свои тэги
 * если надо будет вручную писать агент для сбора данных, добавить в него вручную информацию о браузере: user-agent, размер окна
 * ТЗ на админку сервиса логирования ошибок: фильтр по типам, тэгам(desc/lvl/data/...), дате
 * ТЗ на сервис сбора ошибок: приём и разбор по тэгам(desc/lvl/data/...) post запроса с телом json
 * приём сообщений: запрос post, тело json, внутри парсинг по тэгам.
	```js
		error.log({data:this.data, desc:'error happens' });
		error.log({
			data:this.data,
			desc:'error happens',
			lvl: this.error.ELvl.warn,
			src:'src/app/services/error.service.ts:61',
			mtd:'log()',
			task:'0000'
			});
	```

## swagger

* https://github.com/swagger-api/swagger-codegen
* https://app.swaggerhub.com/
* Java server
```
Лучшим инструментом для редактирования swagger в yaml является плагин для Intellij IDEA под названием Swagger от некоего Zalando и плагин Swagger к плагину Swagger от Zalando.
Это единственный бесплатный плагин поддерживающий спецификацию openapi 3.0.
Но при копирование любых блоков пересчитывайте отступы. Т.к. интеллисенсе в плагине не идеально и он задвигает некоторые блоки на недопустимую глубину. В yaml вложеность блоков прописана на уровне синтаксиса элементов.

Не трогайте SwaggerHub от swagger.io . Если тронули, то неверьте его higlight-ингу - он бежбожно врет, особенно когда выдает странные ошибки "здесь должа быть стринг".
Если и это вас не напугало, то к редактированию документа приступайте, только после верификации email, иначе потеряете все что сделали после 10 минут после начала работы.

После редактирования файла его надо проверять по swagger-ui на валидность. Нужно будет прочитать все созданные методы в swagger-ui и проверить, что метод получает и возвращается все что вы прописали.
После swagger-ui надо проверить на ошибки при помощи генератора сервера и клиента, в процессе генерации они выдают ошибки.


Пример конфигурационного json для бэкенда(gen_opt.json):
```json
{
	"modelPackage":"ru.voicecom.maics.services.auth.dto", 
	"apiPackage":"ru.voicecom.maics.services.auth.api",
	"invokerPackage":"ru.voicecom.maics.services.auth",
	"groupId":"ru.voicecom.maics",
	"artifactId":"auth",
	"artifactVersion": "0.1-snapshot",
	"localVariablePrefix": "",
	"serializableModel": true,
	"hideGenerationTimestamp": true,
	"java8": true,
	"useBeanValidation": true
}
```

команда по генерации сервера по yaml(при помощи swagger-codegen-cli):
```bash
  java -jar /d/bin/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate \
  -i maics/servers/api/api.yaml \
  -l spring --library spring-mvc \
  -c gen_opt.json \
  -o auth-now2
```

swagger-codegen-cli можно взять с https://github.com/swagger-api/swagger-codegen
```

## wakatime.com

 * время работы над кодом из плагинов к IDE
 * интеграция гитлаб, бб, гх
 *  https://wakatime.com/
 * открытый аналог локально: https://marketplace.visualstudio.com/items?itemName=hangxingliu.vscode-coding-tracker
 * аналог похуже, нет привязки к веткам и коммитам https://marketplace.visualstudio.com/items?itemName=softwaredotcom.swdc-vscode

## heroku

### в облаке

* сделать pipeline
* сделать app и добавить nodejs build pack в pipeline
* привязать тестовый апп к продуктивному в pipeline

### локально

* общий ман со стартом через node+express https://medium.com/@hellotunmbi/how-to-deploy-angular-application-to-heroku-1d56e09c5147
* лимиты https://devcenter.heroku.com/articles/limits
* сколько израсходовано https://dashboard.heroku.com/account/billing
* выкурить стартовый ман https://devcenter.heroku.com/articles/deploying-nodejs
* подкрутить GC node [procfile](https://devcenter.heroku.com/articles/procfile): `web: node --optimize_for_size --max_old_space_size=460 --gc_interval=100 server.js` https://devcenter.heroku.com/articles/node-best-practices#avoid-garbage 
* сделать в package.json scripts `npm run start --port 5000` https://devcenter.heroku.com/articles/dynos#local-environment-variables
* добавить в package.json scripts `"heroku-postbuild": "ng build --aot --prod"`
* при необходимости перенести  `"@angular/cli": "^7.3.3","@angular/compiler-cli": "^7.2.6",` в секцию "dependencies" - иначе не найдёт `ng`
* проверить `npm run heroku-postbuild`
* проверить `heroku local web`
* указать версию ноды https://devcenter.heroku.com/articles/deploying-nodejs
* запушить ветку в мастер хероку `git push heroku T68-aggrid:master` https://devcenter.heroku.com/articles/multiple-environments#advanced-linking-local-branches-to-remote-apps
* выбрать тип виртуалки https://devcenter.heroku.com/articles/dyno-types для 1 гига от 50 долл/мес/дина проверка: `heroku ps:scale`
* поширить память, она 512 `heroku config:set WEB_MEMORY=1024`
* команды для виртуалок https://devcenter.heroku.com/articles/dynos#cli-commands-for-dyno-management
* `heroku logs --tail`
* `heroku labs:enable log-runtime-metrics`

## time camp

 * https://appimage.github.io/TimeCampDesktop/
 * `zypper in libappindicator1 libdbus-1-3 libgtk-2_0-0 libindicator7 liblzma5 libnotify4 libsqlcipher-3_20_1-0 libsqlite3-0 libudev1 libX11-6 libXss1 ImageMagick`

## gitlab pages

 * надо сделать репу в гитлаб, можно приватную. 
 * Там вот сделать каталог public, в ём отгородить index.html и 404.html. Симлинки вроде не катят.
 * закопать .gitlab-ci.yml в корень проекта:
	```
		image: alpine:latest

		pages:
		stage: deploy
		script:
		- echo 'Nothing to do...'
		artifacts:
			paths:
			- public
		only:
		- master
	```
 * Потом настроить на вкладке CI/CD pipeline
 * для bitbucket надо index+404 разместить в корне
 
## готовые дизайн системы и библиотеки кода

 * https://akveo.github.io/ngx-admin/

## микрофоны видеокамеры гарнитуры для конференций

 * [Опыт записи подкастов Веб-стандарты и devSchacht 2018](https://www.youtube.com/watch?v=_ChmShmST-s)
 * [Мегаобзор микрофонов для записи подкастов 2015](https://habr.com/ru/company/audiomania/blog/385995/)
 * []()