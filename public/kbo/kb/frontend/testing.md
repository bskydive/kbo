# Тестирование

## лучшие практики

 * [eslint wemake](https://sobolevn.me/2019/02/engineering-guide-to-user-stories)

## TDD

 * https://bespoyasov.ru/ttt-tdd/
 * [Engineering guide to writing correct User Stories](https://sobolevn.me/2019/02/engineering-guide-to-user-stories)

##  unit

 * [принципы Unit-тестирования в сложных приложениях 2016](https://habrahabr.ru/post/310826/)
	* Так как сообщество сходится во мнении, что нет нужды в тестировании тривиального функционала, то вполне очевидно, что чем проще код или гениальнее разработчики, тем меньше поводов создавать тесты вообще и модульные тесты в частности. И наоборот, чем сложнее код или посредственнее разработчики, тем поводов больше. Т.е., если вы в одиночку разрабатываете проект на 100К строк кода, то вы вполне можете обойтись без тестов вообще, но как только к проекту подключается еще один разработчик (не такой гениальный, как вы), то необходимость создания тестов резко возрастает. А если этот разработчик еще и junior, то тесты становятся жизненно важны, т.к. даже ваша гениальность может спасовать перед тем энтузиазмом, с которым junior вносит ошибки в ваш любимый код.
 * [property based testing](https://www.youtube.com/watch?v=H-cBhNMxlCw) [jsverify](https://github.com/jsverify/jsverify) [fast check](https://github.com/dubzzz/fast-check)
 * [Unit testing in JavaScript Part 5 - Mocking continued - funfunfunction](https://www.youtube.com/watch?v=ZbModC5pqv0&list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr&index=6)
 * [зачем тестировать код перед кодированием TDD](https://www.youtube.com/watch?v=XsFQEUP1MxI&list=PL0zVEGEvSaeF_zoW9o66wa_UCNE3a7BEr&index=2)

### karma + jasmine

 * https://simontest.net/
 * https://github.com/angular/in-memory-web-api
 * [Angular: Интеграционное тестирование (Shallow testing)](https://habr.com/ru/company/veeam/blog/486994/)
 * [Three Ways to Test Angular Components](https://vsavkin.com/three-ways-to-test-angular-2-components-dcea8e90bd8d) isolated/shallow/integration
 * [Angular Testing Series: Why Your Angular Tests Probably Smell](https://betterprogramming.pub/angular-testing-series-why-your-angular-tests-probably-smell-ebab93c59e0)
 * https://github.com/ngneat/spectator
 * https://dev.to/qarunqb/tdd-in-angular-dependency-injection-and-mocking-4jnh
 * [Angular: Unit Testing Jasmine, Karma (step by step)](https://medium.com/swlh/angular-unit-testing-jasmine-karma-step-by-step-e3376d110ab4)
 * [Настройка VSCdode debug test](https://stackoverflow.com/questions/43916649/debug-tests-in-ng-test/44308743#44308743)
 * [запуск одного теста](https://stackoverflow.com/questions/26552729/karma-run-single-test)
	`fit fdescribe`
 * проверка сложных объектов
	* https://rav.pw/jasmine-custom-matchers/
	* https://masonwebdev.wordpress.com/2016/05/10/jasmine-spy-matching-functions-and-testing-with-es6/
	* https://github.com/JamieMason/Jasmine-Matchers
	* https://jasmine.github.io/tutorials/custom_argument_matchers
 * console.log
	`src/karma.conf.js-->logLevel: config.LOG_DEBUG,`
 * для автоподстановки

	```ts
		declare global {
			namespace jasmine {
				interface Matchers<T> {
					toBeSomeEqual: (expected: IData) => any;
				}
			}
		}
	```
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


### async test асинхронные

 * Чтобы тесты rxjs+DOM нормально заработали, надо
	* добавить в src/test.ts строку `import 'zone.js/dist/zone-patch-rxjs-fake-async';`
	* не забыть подключить стили и сторонние библиотеки в секцию angular.json—>projects.architect.test.options
 * https://angular.io/guide/testing-components-scenarios#using-the-rxjs-scheduler-inside-fakeasync
 * https://stackoverflow.com/questions/43060886/angular-2-fakeasync-waiting-for-timeout-in-a-function-using-tick
 * https://dev.to/itnext/tools-for-rxjs-code-unit-testing-in-angular-8-apps-free-udemy-video-course-3bbj
 * https://medium.com/angular-in-depth/how-to-test-observables-a00038c7faad
 *
 *
 *

### jest

 * [Тестирование JavaScript кода с Jest для чайников. Часть 1](https://habr.com/ru/post/502302/)
 * https://jestjs.io/docs/api
	* https://jestjs.io/docs/mock-functions
	* https://jestjs.io/docs/es6-class-mocks
	* https://jestjs.io/docs/mock-function-api
	* https://jestjs.io/docs/ecmascript-modules
	* https://jestjs.io/docs/testing-frameworks
 * https://github.com/jsdom/jsdom
 * https://itnext.io/testing-angular-applications-with-jest-and-spectator-c05991579807?gi=e4e9f3404fe0
 * [Jest set, clear and reset mock/spy/stub implementation](https://codewithhugo.com/jest-stub-mock-spy-set-clear/)
	* mockClear clears only data pertaining to mock calls, which means we get a fresh dataset to assert over with toHaveBeenX methods.
    * mockReset resets to mock to its initial implementation, on a spy makes the implementation be a noop (function that does nothing).
 * [Angular 11 - Setting up Jest](https://dev.to/alfredoperez/angular-10-setting-up-jest-2m0l)
	```ts
		src/tsconfig.spec.json: include
		src/tsconfig.app.json: exclude
		cypress-test/tsconfig.cypress.json:include
		.storybook/tsconfig.json:exclude
	```

 * https://www.devcurry.com/2020/09/testing-angular-component-using-jest.html
 * https://codewithhugo.com/jest-fn-spyon-stub-mock/

 * https://ordina-jworks.github.io/testing/2018/08/03/testing-angular-with-jest.html
 * https://fireship.io/snippets/testing-rxjs-observables-with-jest/
 * https://www.npmjs.com/package/jest-preset-angular
 * опция рендеринга https://jestjs.io/ru/docs/mock-function-api/#jestmockedsource-options

### spectator

 * https://github.com/ngneat/spectator#component-providers
 * https://netbasal.gitbooks.io/spectator/content/
 * очень похож на jasmine, можно подсмотреть в доки https://angular.io/guide/testing-components-basics
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
 * нельзя тестировать прямые манипуляции DOM

 ```ts
	this.renderer.setStyle(
			(this.element.nativeElement as HTMLElement).querySelector('table'),
			'height',
			`calc(45px + ${paginatorOffsetRows}*84px)`,
		);
 ```
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

		// для взаимодействия с DOM через ngIf надо присваивать в свойства компонента, через ngOnChanges не работает
		// [class.disabled]="paginatorConfig.isDisabled"
		paginatorConfig = {
			isDisabled: true,
		};
		spectatorHost.component.ngOnChanges(({ // так не работает
			paginatorConfig: { currentValue: paginatorConfig },
		} as unknown) as SimpleChanges);
		spectatorHost.component.paginatorConfig.isDisabled = true; // так работает
		spectatorHost.detectChanges();

		expect(paginatorComponent).toHaveClass('disabled');
	```
 * shallow - теститрование без рендеринга
	* https://itnext.io/testing-angular-applications-with-jest-and-spectator-c05991579807#252f
	* https://github.com/ngneat/spectator#testing-components
	```js
		const createComponent = createComponentFactory({
		component: ButtonComponent,
		imports: [],
		providers: [],
		declarations: [],
		entryComponents: [],
		componentProviders: [], // Override the component's providers
		componentViewProviders: [], // Override the component's view providers
		overrideModules: [], // Override modules
		overrideComponents: [], // Override components in case of testing standalone component
		overrideDirectives: [], // Override directives in case of testing standalone directive
		overridePipes: [], // Override pipes in case of testing standalone pipe
		mocks: [], // Providers that will automatically be mocked
		componentMocks: [], // Component providers that will automatically be mocked
		componentViewProvidersMocks: [], // Component view providers that will be automatically mocked
		detectChanges: false, // Defaults to true
		declareComponent: false, // Defaults to true
		disableAnimations: false, // Defaults to true
		shallow: true, // Defaults to false
		});
	```
	* https://jestjs.io/ru/docs/mock-function-api/#jestmockedsource-options

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
 * эмулятор macos/ios https://github.com/actions/virtual-environments/blob/main/images/macos/macos-10.15-Readme.md

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


