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
 * нужны: фильтры, предпросмотр json в списках, события в чятик, создание карточек из событий, сбор системной информации, свои тэги

## swagger

* https://github.com/swagger-api/swagger-codegen
* https://app.swaggerhub.com/

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