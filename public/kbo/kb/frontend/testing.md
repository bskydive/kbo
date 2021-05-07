# Тестирование

## TDD

 * https://bespoyasov.ru/ttt-tdd/
 * [Engineering guide to writing correct User Stories](https://sobolevn.me/2019/02/engineering-guide-to-user-stories)

##  unit
	
 * [принципы Unit-тестирования в сложных приложениях 2016](https://habrahabr.ru/post/310826/)
	* Так как сообщество сходится во мнении, что нет нужды в тестировании тривиального функционала, то вполне очевидно, что чем проще код или гениальнее разработчики, тем меньше поводов создавать тесты вообще и модульные тесты в частности. И наоборот, чем сложнее код или посредственнее разработчики, тем поводов больше. Т.е., если вы в одиночку разрабатываете проект на 100К строк кода, то вы вполне можете обойтись без тестов вообще, но как только к проекту подключается еще один разработчик (не такой гениальный, как вы), то необходимость создания тестов резко возрастает. А если этот разработчик еще и junior, то тесты становятся жизненно важны, т.к. даже ваша гениальность может спасовать перед тем энтузиазмом, с которым junior вносит ошибки в ваш любимый код.
 * [property based testing](https://www.youtube.com/watch?v=H-cBhNMxlCw) [jsverify](https://github.com/jsverify/jsverify) [fast check](https://github.com/dubzzz/fast-check)
 * [Unit testing in JavaScript Part 5 - Mocking continued - funfunfunction](https://www.youtube.com/watch?v=ZbModC5pqv0&list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr&index=6)

### karma + jasmine

 * [запуск параллельно](https://karma-runner.github.io/6.3/config/configuration-file.html#concurrency)
 * https://www.forbes.com/sites/forbesdigitalgroup/2019/05/14/improve-your-angular-jasmine-unit-test-speeds-by-500/
	* создавать testBed один раз, чтобы не компилировать заново
	* убрать утечки памяти

	```ts
		cleanHead(){
			const head: HTMLHeadElement = document.getElementsByTagName('head')[0];
			const styles: HTMLCollectionOf<HTMLStyleElement> | [] = head.getElementsByTagName('style');

			for (let i=0; i<styles.length; i++) {
				head.removeChild(styles[i]);
			}
		}

		afterAll(){
			cleanHead();
		}
	```
 * https://www.npmjs.com/package/ng-bullet - может глючить Spy потому что они не обнуляются

### jest

 * [Тестирование JavaScript кода с Jest для чайников. Часть 1](https://habr.com/ru/post/502302/)
 * https://jestjs.io/docs/api
 * https://github.com/jsdom/jsdom
 * https://itnext.io/testing-angular-applications-with-jest-and-spectator-c05991579807?gi=e4e9f3404fe0
 * [Angular 11 - Setting up Jest](https://dev.to/alfredoperez/angular-10-setting-up-jest-2m0l)

### spectator

 * https://github.com/ngneat/spectator#component-providers
 * https://netbasal.gitbooks.io/spectator/content/
 * неверный путь в импорте сломает тесты https://github.com/ngneat/spectator#jest-support

	```ts
		import { Spectator, SpectatorHost } from '@ngneat/spectator'; // wrong
		import { Spectator, SpectatorHost } from '@ngneat/spectator/jest'; // right
		const hostParamsOverrides: SpectatorHostOverrides<Table2Component<unknown>, HostComponent, HostComponent> = {...}

	```
 * нельзя дважды вызывать фабрику

	```ts
		const createHost = createHostFactory({...})
		const createComponent = createComponentFactory({...})
	```
 * нельзя навесить Spy на private
 * примеры
	```ts
		spectator.setInput('className', 'danger');
		let output;
		spectator.output('click').subscribe(result => (output = result));

		spectator.component.onClick({ type: 'click' });
		expect(output).toEqual({ type: 'click' });

		spectator.click(SpectatorElement);
		spectator.click(byText('Element'));

		import { By } from '@angular/platform-browser';
		expect(spectator.debugElement.query(By.css('button'))).toBeNull();

		spectator.component.ngOnInit(); // lifecycle hooks runs only manually

		const comparator = jest.fn();
		expect(comparator).toHaveBeenCalledWith(jasmine.any(String), jasmine.any(Number), SortDirection.ASC);

		const content: HtmlAsJson = [{
			type: 'element',
			tagName: 'p',
			attributes: [],
			children: [{
				type: 'text',
				content: 'test content',
				}],
		}];
		expect(spectator.component['content']).toEqual(content);

		it('emits click', done => {
			const data = 'data';

			spectator.component.click.subscribe(result => {
				expect(result).toEqual('data');
				done();
			});

			spectator.component.click(data);
		});

		// <loading [ngClass]="{'is-hidden':loading}"></loading>
		// .is-hidden { visibility: hidden }
		const button = host.query('.pressed');
		expect(button).not.toHaveClass('is-not-pressed');
		host.click(button);
		expect(button).toHaveClass('is-not-pressed');
	```

##  cypress test

 * ограничения
	* не поддерживает мобильные события
	* ограниченная поддержка iframe
	* ограниченная поддержка hover
	* не тестирует множественные вкладки
	* ограниченная поддержка тестирования загрузки файлов
	* 
 * особенности
 	* работает только как внешний инструмент для работающего сервиса
 	* не требует сторонних библиотек
	* написан на JS
	* более качественное тестирование
	* 
	* 
## regress регрессионные тесты

 * https://selenium-webdriver-book.github.io/
 * [Тестирование вёрстки на визуальные регрессии с помощью PhantomCSS, grunt](http://habrahabr.ru/post/271379/)
 * [тестирование вёрстки gulp+makeup](https://habrahabr.ru/company/2gis/blog/277457/)
 * [Playwright](https://habr.com/ru/company/jugru/blog/487294/) https://github.com/microsoft/playwright

## Selenium

 * [Кому еще нужен Selenium? Использует ли кто BDD в 2020? Машинное обучение в Selenium](https://habr.com/ru/company/jugru/blog/494256/)
 * [Человек-маркировщик вместо тестировщика? Стоит ли изучать Selenium в 2020?](https://habr.com/ru/post/499658/)

##  CI

 * [Тестирование кода перед коммитом с помощью Jenkins и IDE от Jetbrains (IDEA, PhpStorm...)](http://habrahabr.ru/post/182042/)
 *  Karma — test-runner для JavaScript;
	* https://karma-runner.github.io/2.0/index.html
 *  Jasmine — инструмент для определения тестов в стиле BDD;
	* https://jasmine.github.io/pages/docs_home.html
	* https://github.com/jasmine/jasmine/wiki
 *  Chai — библиотека для проверки условий, expect, assert, should;
	* https://habrahabr.ru/company/rambler-co/blog/278503/
 * Mocha для запуска тестов;
	* http://mochajs.org/
 * Sinon для проверки запуска функций и методов;
 * JSDOM для проверки функций, работающих с DOM;

## e2e

 * [Е2Е тестирование Койна](https://bespoyasov.ru/blog/coin-e2e-with-cypress/)
    * https://www.cypress.io/
 
##  кроссбраузерность

 * http://www.browsrcamp.com/
 * http://www.keynote.com/
 * https://litmus.com/
 * http://netrenderer.com/

##  test

 * dalek.js
 * phantom.js
 * gremlin.js
 * speedcurve
 * webpagetest
 * sauce labs
 * browser-perf
 * [виртуалки с ie](https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/windows/)
 * [300 бесплатных инструментов](https://habrahabr.ru/post/250621/)
 * [mocha+chai nodejs api test](https://habrahabr.ru/post/308352/)


