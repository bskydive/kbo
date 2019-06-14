# Соглашения про Ангуляр

## Ангуляр 1

1. Перед реализацией нового компонента освежаем знания чтением документации. Она устаревает.
	* [ui-bootstrap](https://angular-ui.github.io/bootstrap/)
	* [ui-router](https://ui-router.github.io/docs/)
		* https://ui-router.github.io/ng1/docs/latest/modules/directives.html
		* https://github.com/angular-ui/ui-router/wiki/Quick-Reference#ui-sref
	* [angular-ui](https://github.com/angular-ui)
	* [api docs](https://docs.angularjs.org/api)

1. Для реализации всплывающей подсказки с текстом [достаточно](https://angular-ui.github.io/bootstrap/#!#popover) трёх дата-тэгов
	```pug
		a(href='' ng-if='!company.isVerified || !$edit.company.isVerified'
		uib-popover="После модерации регистрационных данных вы сможете опубликовать свои вакансии"
		popover-placement="top"
		type="button"
		popover-trigger="'outsideClick'"
		) Редактирование профиля
	```
	
1. Для реализации всплывающей подсказки с HTML [достаточно](https://angular-ui.github.io/bootstrap/#!#popover) использовать: `uib-popover-html="'...'"`
	Обязательно обернуть внутренности в одинарные кавычки!
	```pug
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
	```pug
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
	
## Angular 2+
	
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
         * APP-1746
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

1. Приём для обхода `one-time devMode unidirectional-data-flow-violation error`
    ```js
    onSomeEventFromChild(){
        setTimeout(() => {
			this.isStateChanged = false;
		}, 1);
	}
	```
1. В сложных интерфейсах лучше делать CSS код для интерактива. На переключение - невидимый` <input id=id class='c0' style="display:none">`, `<label for=id class="c1">`, селектор `c0:checked~c1{...}` , `c0:not(:checked)~c1{...}`. На сортировку добавляем `display: flex;	flex-direction: column-reverse;`. Чтобы прибить элемент к потолку можно использовать `display:flex;order:1` Это лучший способ разгрузить Zone.js

1. Чтобы менять css во вложенных компонентах необходимо отключать `encapsulation: ViewEncapsulation.None` . Для обоих случаев желательно указать стили компонента или псевдокласс(для включенной инкапсуляции).
	```css
		my-component, :host {
			display: flex;
			//требуется для предотвращения схлопывания при включенной прокрутке overflow-y+stretch
			flex-shrink: 0;
			flex-direction: column;
		}

		.my-component {
			//...
		}
	```

1. Для общей раскладки компонентов необходимо зафиксировать высоту страницы, заголовка и подвала, а тело растянуть. При этом, проверить и аккуратно обработать инкапсуляцию и overflow.

1. в тестах необходимо добавлять подавление ошибок для вложенных объектов входных параметров `@Input()`
	```ts
		beforeEach(async(() => {
			TestBed.configureTestingModule({
				declarations: [SomeComponent],
				schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA]
			})
				.compileComponents();
		}));
	```
1. В маршрутах наверху должны быть более частные пути, внизу - более общие

	```ts
	const routes: Routes = [
		{ // ошибка 1
			path: '',
			component: SomeComponent,
		},
		{ // ошибка 2
			path: ':userId',
			component: UsersComponent,
			children: [
				{
					path: 'clients',
					component: ClientsComponent
				}
			]
		},
		{ // из-за ошибки 1 и 2 - нерабочий маршрут
			path: 'clientsTest',
			component: ClientsComponent
		},
	];
	```

	```ts
	const routes: Routes = [
		{
			//	TODO @deprecated Для тестирования
			path: 'clientsTest',
			component: ClientsComponent
		},
		{
			path: ':userId',
			component: UsersComponent,
			children: [
				{
					path: 'clients',
					component: ClientsComponent
				}
			]
		},
		{
			path: '',
			component: SomeComponent,
		},
	];
	```
1. Иногда возникает ошибка karma/jasmine про несуществующий класс из-за отсутствия импорта в .spec.ts, хотя линтер молчит.
	```html
		<div (click)="location.back()"></div>
	```
	```ts
		constructor(
			public location: Location
		){}
	```
	```ts
		const locationSpy = jasmine.createSpyObj('Location', ['back']);
	```
1. Необходимо именовать классы и интерфейсы с использованием уникальных префиксов. Названия `state, action, store` мешают при автоматическом импорте и валидации, т.к. смешиваются с библиотечными из npm

1. Для хранилища ngrx необходимо выбрать подход - совместное или отдельное хранилище для выделенного элемента и его списка. При совместном хранении значительно сокращается и упрощается код.

1. Если у вас отдельные хранилища ngrx для отдельного элемента и списка, то необходимо выбрать подход - от отдельного элемента или от списка. Если от списка, то у отдельного пользователя не будет эффектов на загрузку с сервера(только из хранилища списка), но будут эффекты на сохранение(в хранилище списка и/или на сервер). В противном случае загружаем эффектом отдельный элемент с сервера при обращении, и в тот же эффект обновление загруженного элемента в хранилище.

1. Для сохранения данных необходимо выбрать подход - сохранять только локально, локально и на сервер, только на сервер и немедленная загрузка в локальное хранилище.