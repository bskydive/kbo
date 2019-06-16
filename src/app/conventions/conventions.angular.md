# Соглашения про Ангуляр

## [Соглашения](/txt/conventions.md.html)

## [Соглашения про javaScript, DOM, BOM](/txt/conventions.js.md.html)

## [Соглашения про LESS/CSS](/txt/conventions.less.md.html)

## [Соглашения про Ангуляр](/txt/conventions.angular.md.html)

## [Соглашения - черновик](/txt/conventions.draft.md.html)

## ui-bootstrap

1. Перед реализацией нового компонента освежаем знания чтением документации. Она устаревает.
	* [ui-bootstrap](https://angular-ui.github.io/bootstrap/)
	* [ui-router](https://ui-router.github.io/docs/)
		* https://ui-router.github.io/ng1/docs/latest/modules/directives.html
		* https://github.com/angular-ui/ui-router/wiki/Quick-Reference#ui-sref
	* [angular-ui](https://github.com/angular-ui)
	* [api docs](https://docs.angularjs.org/api)

1. Для реализации всплывающей подсказки с текстом [достаточно](https://angular-ui.github.io/bootstrap/#!#popover) трёх дата-тэгов
	```jade
		a(href='' ng-if='!company.isVerified || !$edit.company.isVerified'
		uib-popover="После модерации регистрационных данных вы сможете опубликовать свои вакансии"
		popover-placement="top"
		type="button"
		popover-trigger="'outsideClick'"
		) Редактирование профиля
	```
	
1. Для реализации всплывающей подсказки с HTML [достаточно](https://angular-ui.github.io/bootstrap/#!#popover) использовать: `uib-popover-html="'...'"`
	Обязательно обернуть внутренности в одинарные кавычки!
	```jade
		a(href='' ng-if='!company.isVerified || !$edit.company.isVerified'
		uib-popover-html="'<div><h4>Модерация</h4></div>" +
		"<p> Ваша компания проходит модерацию. Редактирование информации будет доступно после одобрения службой технической поддержки. В связи с большим объёмом заявок" +
		" срок модерации - до 5 рабочих дней. Приносим извинения за доставленные неудобства.</p></div>'"
		popover-placement="bottom-left"
		type="button"
		popover-trigger="'outsideClick'"
		) Редактирование профиля
	```

1. Для коррекции стиля подсказки необходимо добавить опцию `popover-class`
	```jade
		.c-bootstrap-body-help-icon(
		uib-popover="После модерации регистрационных данных вы сможете опубликовать свои вакансии"
		popover-placement="top"
		type="button"
		popover-trigger="'outsideClick'"
		popover-class=".c-bootstrap-body-help-icon-uibfix"
		)
	```
	```less
		.c-bootstrap-body-help-icon{
			position: fixed;
        	top:93% !important;
       	
			&-uibfix {//костыль для правильного позиционирования подсказки .uib-popover-popup
    			position: fixed;
    			top:93% !important;
    		}
		}
	```
1. Для добавления нестандартных сочетаний открытия/закрытия подсказок:
	[пример](http://plnkr.co/edit/ufB0QvsiL1G2sOp99Pd8?p=preview)	
	[доки](https://github.com/angular-ui/bootstrap/tree/master/src/tooltip/docs)
	```js
		//для вызова самописного триггера можно сделать инъекцию $element и вызвать $element.triggerHandler('outsideClick');
		//объявляем в настройках компонента
		module.exports = angular
        		.module('common')
        		.config(function setIt($uibTooltipProvider){
        
        			$uibTooltipProvider.setTriggers([{
        				//'триггер для открытия':'триггер для закрытия'
       					//mouseenter, mouseleave, click, outsideClick, focus, blur, none
                        'outsideClick':'outsideClick',
                        //другой вариант
						show:'outsideClick',
						hide:'outsideClick'
        			}]);
        		}).name;
	```
	можно [обернуть](https://github.com/angular-ui/bootstrap/issues/590) в [директиву](http://plnkr.co/edit/94ZHgQ?p=preview) через `.compile`
	и переписать поведение
	
1. Для сокрытия залипшей в мобильном режиме подсказки необходимо скрыть её в коде контроллера. 
	Встроенный атрибут `popover-is-open` не всегда работает
	```js
		window.document.querySelector('i#id-recruiter-profile-edit-help-icon+div.popover').style.visibility='hidden';//костыль от залипания подсказки
	```
	
## Angular
	
1. Использовать для разделителей элементов списков `<li>` css атрибут `content`
	вместо их сборки внутри директив `inlineList(items,separator)`. Это уменьшит код
	и предотвратит ошибки, например, пропадание лидирующего пробела в `<span> * </span>`
	
	```less
		li:not(:first-child) {
			span:before {
				content: @var-list-separator-icon;
				font-size:16px;
			}
		}
	```
	
1. Нежелательно устаналивать заголовки глобально, т.к. их необходимо очищать после вызовов
	```js
		$http.defaults.headers.common.relations = 'lastExperience'; 
	```
	Для экономии кода и предотвращения ошибок лучше описывать их в `options`.
	Сервис [http](https://docs.angularjs.org/#setting-http-headers) должен корректно их добавить в вызов	
	```js
		let options = {};
		options.headers = {
			'relations': 'lastExperience'
			};
		return apiService.call('GET', `/message/thread/${req}`, options)
    ```
    
1. Нельзя называть компоненты именами тэгов. При вызове section/header/и т.д. будут скомпилированы компоненты вместо тэгов.
 	Для предотвращения можно настроить линтеры или ввести префиксы a-(angular).
 	```js
		module.exports = angular
        		.module('a-main-header-module')
        		.component('a-main-header', {
        			controller: mainHeaderController,
        			controllerAs: '$amh',
        			templateUrl: require('./a-main-header-view.jade'),
        			bindings: {}
        		})
        		.name;
	```
1. Шаблон для контроллера компонента
	```js
		'use strict';
        /**
         * PG-1746
         *
         * Описание:
         *
         * Структура блоков HTML:
         *
         * Ограничения:
         *
         * Примеры:
         *
         * */
        
        require('./list-stacked-view.less');
        
        function listStackedController(dataTypeService,
        							   errorService) {
        
        	let vm = this;
        
        	/**
        	 * Инициализирует и очищает от некорректных значений входные данные
        	 */
        	function parseValues() {
        
        	}
        
        	function init() {
        		parseValues();
        	};
        
        	/**
        	 * bindings изменились, нужно переинициализировать данные
        	 */
        	vm.$onChanges = function () {
        		parseValues();
        	};
        
        	init();
        
        }
        
        module.exports = angular
        		.module('common')
        		.component('listStacked', {
        			controller: listStackedController,
        			controllerAs: '$ls',
        			templateUrl: require('./list-stacked-view.jade'),
        			bindings: {}
        		})
        		.name;
	```
1. Параметры вложенных компонентов должны либо транслироваться наружу, до самого верхнего, либо прятаться внутри. 
	Лишние bindings замедляют приложение, а искать где передаётся параметр внутри вложений будет усложнять рефакторинг, приводить к неочевидному поведению компонентов. 

1. Название параметров должны согласовываться с поведением по-умолчанию. 
	`isSomethingVisible` в случае её отсутствия должно быть устаноылено в `false`, т.е. скрыто
	И наоборот, `isSomethingHidden` по-умолчанию `false`, т.е. показано

1. необходимо переносить максимум кода внутрь js из html для облегчения отладки, поиска и валидации
	параметры компонентов необходимо передавать как один объект в html коде, и работать с его свойствами в js 	
	