#  Javascript

##  лучшие практики

 * [стили](/kbo/developer/frontend.md)
 * https://proglib.io/p/12-javascript-tricks
 * [Концепции чистого кода адаптированные для TypeScript, вдохновленные clean-code-javascript](https://github.com/Real001/clean-code-typescript)
 * [You don't (may not) need Lodash/Underscore](https://github.com/you-dont-need/You-Dont-Need-Lodash-Underscore)

## links

 * [версии ECMA и функции](http://kangax.github.io/compat-table/es6/)
 * [ES6](https://medium.com/p/3d28884c59d4)
 * https://mbeaudru.github.io/modern-js-cheatsheet/
 * [современный жс](http://courses.angularclass.com/courses/modern-javascript)
 * [блог ведущего курсы обучения smartjs](https://medium.com/@xanf)
 * [события](http://latentflip.com/loupe/)
 * https://tproger.ru/translations/event-emitter-javascript/
 * http://www.2ality.com/2016/10/understanding-promises.html
 * [наставления с примерами по созданию популярных сервисов ](https://github.com/danistefanovic/build-your-own-x)

## обучение

 * http://www.javascripter.net/
 * https://learn.javascript.ru/
 * http://frontender.info/const-immutability/
 * http://frontender.info/es6-in-depth-iterators-and-the-for-of-loop/
 * http://frontender.info/es6-in-depth-generators/
 * http://frontender.info/promises/
 * https://proglib.io/p/javascript-junior

## инструменты 

 * [импорт, трансформация и анализ json/csv](http://www.data-forge-js.com/)
    * [Редактируем CSV-файлы, чтобы не сломать данные](https://habr.com/company/hflabs/blog/432906/)
 * ABstract syntax tree анализатор
    * http://resources.jointjs.com/demos/javascript-ast
    * http://astexplorer.net/
    * http://esprima.org/demo/parse.html#
 * как сократить объём загрузки за счёт полифилов https://web.dev/publish-modern-javascript/ https://estimator.dev/
 * 
## валидаторы syntax check

 * https://eslint.org/docs/rules/
 * https://palantir.github.io/tslint/rules/
 
## ботанство

 * http://dmitrysoshnikov.com/ecmascript/javascript-the-core-2nd-edition-rus/
 * https://medium.com/@DmitrySoshnikov
 * [параллельные конкурентные потоки многопоточность](https://hacks.mozilla.org/2017/06/a-crash-course-in-memory-management/)
 * [Основы движков JavaScript: общие формы и Inline кэширование. Часть 2](https://habr.com/ru/company/otus/blog/447220/)
 * [Функциональный JavaScript: пять способов нахождения среднего арифметического элементов массива и метод .reduce()](https://habr.com/ru/company/ruvds/blog/458030/)
 * [Часто задаваемые вопросы о системах типов](https://habr.com/ru/company/ruvds/blog/462481/)
 * [производительность javascript](https://habr.com/ru/company/mailru/blog/321748/)
 * [функциональное программирование](https://habr.com/ru/company/mailru/blog/327522/)
 * [глюки javascript](https://habr.com/ru/company/mailru/blog/335292/)
 * [история развития инструментов для  javascript](https://habr.com/ru/company/mailru/blog/340922/)
 * [ошибочное понимание DRY](https://habr.com/ru/company/mailru/blog/349978/)
 * [сборник ошибок JS](https://habr.com/ru/company/jugru/blog/494256/)
 * [How JavaScript works: Event loop and the rise of Async programming + 5 ways to better coding with async/await Alexander Zlatkov](https://blog.sessionstack.com/how-javascript-works-event-loop-and-the-rise-of-async-programming-5-ways-to-better-coding-with-2f077c4438b5)

## V8 движок

 * интерпретатор ES+WASM [ignition/байткод](https://v8.dev/blog/ignition-interpreter) и компилятор[turbofan JIT](https://v8.dev/docs/turbofan)
 * преза v8 2017 https://docs.google.com/presentation/d/1chhN90uB8yPaIhx_h2M3lPyxPgdPmkADqSNAoXYQiVE/edit#slide=id.g18d89eb289_1_362

## модель памяти memory model
 * https://geekbrains.ru/posts/javascript_internals_part1
 * куча, стэк и очередь. В стэк попадают через event loop
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management
	* GC garbage collection
	* вместо алгоритма подсчёта ссылок сейчас браузеры применяют алгоритм проверки доступности(mark-compact). Например, циклические ссылки не считаются мусором в первом варианте, даже если на них нет ссылок извне.
	* активные функции помечаются как корни, и от них проверяется доступность
	
 * [mark and sweep GC garbage collection](https://www.geeksforgeeks.org/mark-and-sweep-garbage-collection-algorithm/)
 * [Как работает JavaScript: часть вторая GC утечки](https://geekbrains.ru/posts/javascript_internals_part2)
 ```js
	var theThing = null;
	var replaceThing = function () {
		var originalThing = theThing;
		var unused = function () {
			if (originalThing) // a reference to 'originalThing'
				console.log("hi");
			};

			theThing = {
				longStr: new Array(1000000).join('*'),
				someMethod: function () {
					console.log("message");
			}
		};
	};

	setInterval(replaceThing, 1000);

 ```

## вопросы интервью

 * https://proglib.io/p/9-js-questions

## загрузка сторонних скриптов 

 * http://www.lukasjakob.com/how-to-dynamically-load-external-scripts-in-angular/
 * использовать jsonp callback
	```html
		<script src="https://apis.google.com/js/platform.js?onload=onLoadCallback" async defer></script>
	```
 * можно указать в html `<script>` со скриптом загрузчика скриптов, если требуется обновление мобильного приложения внутри phonegap
 * https://stackoverflow.com/questions/34489916/how-to-load-external-scripts-dynamically-in-angular?noredirect=1

## алгоритмы

 * [двоичное дерево](https://www.nickang.com/binary-search-tree-explained/)
 * [JavaScript Algorithms and Data Structures](https://github.com/trekhleb/javascript-algorithms)
 * [multi-month study plan for going from web developer to software engineer for a large company](https://github.com/jwasham/coding-interview-university)
 * [Data structures introduction](https://www.youtube.com/watch?v=Qmt0QwzEmh0&list=PLDV1Zeh2NRsB6SWUrDFW2RmDotAfPbeHu)
 
## ООП prototype наследование

 * [Каждый программист на javascript должен написать свою реализацию классов](https://habr.com/post/132698/#comment_4404597)
 * [Распространённые заблуждения о наследовании в JavaScript](https://medium.com/devschacht/eric-elliott-common-misconceptions-about-inheritance-in-javascript-f6137fc3a45a)
 * [Александр Самиляк об ООП в яваскрипте. Часть первая](https://www.youtube.com/watch?v=Qn3Qah7W6Vs) artlebedev

##  курсы

 * https://frontend.center
 * https://htmlacademy.ru/courses
 * https://egghead.io/courses/professor-frisby-introduces-function-composition
 * https://www.youtube.com/playlist?list=PLWKjhJtqVAbk2qRZtWSzCIN38JC_NdhW5
 * https://www.udacity.com/course/javascript-basics--ud804
 * https://proglib.io/p/learning-modern-javascript/
 * http://smartjs.academy/
 * https://htmlacademy.ru/courses

## книги

 * https://github.com/devSchacht/You-Dont-Know-JS
 * https://www.manning.com/books/angular-development-with-typescript-second-edition

## препроцессоры

 * [статическая типизация flow facebook](https://flow.org/en/docs/getting-started/)
 * [javascript linter](https://github.com/saadq/lynt)

##  typescript 

 * [см.](/kbo/kb/frontend/framework/angular2.md:1067)
 * https://www.tsmean.com/articles/
 * [знакомство с typescript 2015](https://msdn.microsoft.com/ru-ru/magazine/dn890374.aspx)
 * https://www.sitepen.com/blog/2014/08/22/advanced-typescript-concepts-classes-types/
 * https://www.sitepen.com/blog/2013/12/31/definitive-guide-to-typescript/
 * [доки](https://www.gitbook.com/book/basarat/typescript)
 * http://2ality.com/2018/03/javascript-typescript-reasonml.html
 * https://medium.freecodecamp.org/typescript-javascript-with-super-powers-a333b0fcabc9
 * https://www.typescriptlang.org/index.html#download-links
 * https://github.com/Microsoft/TypeScript-React-Conversion-Guide#typescript-react-conversion-guide
 * http://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
 * https://habrahabr.ru/company/piter/blog/347364/
 * [typescript на node сервере](https://habr.com/ru/post/328466/)
 * [расширенный ликбез 2019](https://www.youtube.com/watch?v=_-tSzfGkrew)
 * [TypeScript. Магия выражений](typescript)
 * [typescript deep dive](https://habr.com/ru/company/oleg-bunin/blog/499634/) Михаил Башуров (saitonakamura) — Senior Frontend Engineer в компании WiseBits
 * [Runtime type checking with io-ts in Typescript](https://medium.com/@ottoki/runtime-type-checking-with-io-ts-in-typescript-14465169fb02) https://github.com/gcanti/io-ts

### собеседование typescript

 * [Собеседование по TypeScript: 20 вопросов и ответов](https://habr.com/ru/company/ruvds/blog/419993/)

##  шаблоны patterns

 * [Шаблоны проектирования в JavaScript простыми словами](https://proglib.io/p/js-design-patterns/)
 * [Паттерны JavaScript: курс, который упростит разработку](https://proglib.io/p/javascript-patterns/)
 * Шаблоны проектирования простым языком.
 	* [Порождающие шаблоны](https://tproger.ru/translations/design-patterns-simple-words-1/)
 	* [Структурные шаблоны](https://tproger.ru/translations/design-patterns-simple-words-2/)
 	* [Поведенческие шаблоны](https://tproger.ru/translations/design-patterns-simple-words-3/)
 * [Шаблоны проектирования с человеческим лицом](https://habr.com/ru/company/mailru/blog/325492/)
 * [инструменты проектирование](/kbo/инструменты/инструменты#проектирование)
 * [Создание архитектуры программы или как проектировать табуретку](https://habr.com/post/276593/)
 * [синглтоны и общие экземпляры](https://habr.com/ru/company/mailru/blog/334078/)
 * [шпаргалка по шаблонам проектирования](https://habr.com/ru/post/210288/)
 * [Структурные шаблоны проектирования в ES6+ на примере Игры престолов](https://habr.com/ru/post/496148/)
 * [Принципы проектирования классов (S.O.L.I.D.) 2009](https://blog.byndyu.ru/2009/10/solid.html)
	* [Принцип единственности ответственности](https://blog.byndyu.ru/2009/10/blog-post.html)
	* [Принцип открытости/закрытости](https://blog.byndyu.ru/2009/10/blog-post_14.html)
	* [Принцип замещения Лисков](https://blog.byndyu.ru/2009/10/blog-post_29.html)
	* [Принцип разделения интерфейса](https://blog.byndyu.ru/2009/11/blog-post_19.html)
	* [Принцип инверсии зависимости ](https://blog.byndyu.ru/2009/12/blog-post.html)
 * [Шпаргалка по SOLID принципам 2014](http://sergeyteplyakov.blogspot.com/2014/10/solid.html)
	* [Single Responsibility Principle](http://sergeyteplyakov.blogspot.com/2014/08/single-responsibility-principle.html)
	* [Open/Closed Principle](http://sergeyteplyakov.blogspot.com/2014/08/open-closed-principle.html)
	* [Liskov Substitution Principle](http://sergeyteplyakov.blogspot.com/2014/09/liskov-substitution-principle.html)
	* [Interface Segregation Principle](http://sergeyteplyakov.blogspot.com/2014/08/interface-segregation-principle.html)
	* [The Dependency Inversion Principle DI](http://sergeyteplyakov.blogspot.com/2014/09/the-dependency-inversion-principle.html)
		* [Критический взгляд на принцип инверсии зависимостей](http://sergeyteplyakov.blogspot.com/2013/04/blog-post.html)
 * [SOLID ](https://info.javarush.ru/translation/2013/08/06/Пять-основных-принципов-дизайна-классов-S-O-L-I-D-в-Java.html)
    * [источник](http://howtodoinjava.com/2013/06/07/5-class-design-principles-solid-in-java/)
	* [SOLID php](https://habr.com/ru/company/mailru/blog/412699/)
	* [SOLID javascript Охрименко](https://www.youtube.com/watch?v=wi3wPzReKZQ)
		* битовая маска может кодировать больше чем одно значение - нарушение принципа SRP
	* SOLID:

| смысл                                                                                 | название                        | перевод                              |
|---------------------------------------------------------------------------------------|---------------------------------|--------------------------------------|
| На каждый объект должна быть возложена одна единственная обязанность.                 | Single Responsibility Principle | (Принцип единственной обязанности)   |
| Программные сущности (классы, модули, функции и т.п.) должны быть открыты 
для расширения, но закрыты для изменения.                                               | Open Closed Principle           | (Принцип открытости/закрытости)      |
| Объекты в программе могут быть заменены их наследниками без изменения 
свойств программы.                                                                      | Liskov’s Substitution Principle | (Принцип подстановки Барбары Лисков) |
| Клиенты не должны быть вынуждены реализовывать ненужные методы, которые 
они не будут использовать                                                               | Interface Segregation Principle | (Принцип разделения интерфейса)      |
| Зависимости внутри системы строятся на основе абстракций. Модули верхнего 
уровня не зависят от модулей нижнего уровня. Абстракции не должны зависеть 
от деталей. Детали должны зависеть от абстракций. | Dependency Inversion Principle      | (Принцип инверсии зависимостей) |                                      |
|                                                                                       |                                 |                                      |
| | | | |

 * [GRASP паттерны проектирования](https://habr.com/ru/post/92570/)
 * GoF - gang of four

### momentjs date дата 

```js
	import * as moment from 'moment';
	
	
	// https://momentjs.com/docs/#/displaying/format/
	
	export const DATE_FORMAT = {
		emptyDataText: '',
		parse: {
			dateInput: 'X',
			// dateInput: 'YYYY MM DD HH:mm:SS',
		},
		display: {
			dateInput: 'DD.MM.YYYY',
			dateOutput: 'YYYY MM DD HH:mm:SS',
			monthYearLabel: 'MMM YYYY',
			// locale: 'ru'
			// dateA11yLabel: 'YYYY MM DD HH:mm:SS',
			// monthYearA11yLabel: 'MMMM YYYY',
		},
	};
	moment().format('X'));
	moment().unix();
	moment(date, DATE_FORMAT.parse.dateInput).format(DATE_FORMAT.display.dateInput);
	moment(params.toDate, DATE_FORMAT.parse.dateInput).day()
	moment().add(1,'day').format(DATE_FORMAT.display.dateOutput);

```
 * [You Dont Need Momentjs](https://github.com/you-dont-need/You-Dont-Need-Momentjs)  Moment.js/Luxon/date-fns/dayjs/vanillajs comparison and samples

##  UUID

https://github.com/kelektiv/node-uuid/

v4
https://gist.github.com/jed/982883

```js
var hex = [];

for (var i = 0; i < 256; i++) {
    hex[i] = (i < 16 ? '0' : '') + (i).toString(16);
}

function makeUUID() {
    var r = crypto.getRandomValues(new Uint8Array(16));

    r[6] = r[6] & 0x0f | 0x40;
    r[8] = r[8] & 0x3f | 0x80;

    return (
        hex[r[0]] +
        hex[r[1]] +
        hex[r[2]] +
        hex[r[3]] +
        "-" +
        hex[r[4]] +
        hex[r[5]] +
        "-" +
        hex[r[6]] +
        hex[r[7]] +
        "-" +
        hex[r[8]] +
        hex[r[9]] +
        "-" +
        hex[r[10]] +
        hex[r[11]] +
        hex[r[12]] +
        hex[r[13]] +
        hex[r[14]] +
        hex[r[15]]
    );
}
```

https://stackoverflow.com/questions/10867405/generating-v5-uuid-what-is-name-and-namespace
https://tools.ietf.org/html/rfc4122#appendix-C

```js
   uuid_t NameSpace_DNS = { /* 6ba7b810-9dad-11d1-80b4-00c04fd430c8 */
   uuid_t NameSpace_URL = { /* 6ba7b811-9dad-11d1-80b4-00c04fd430c8 */
   uuid_t NameSpace_OID = { /* 6ba7b812-9dad-11d1-80b4-00c04fd430c8 */
   uuid_t NameSpace_X500 = { /* 6ba7b814-9dad-11d1-80b4-00c04fd430c8 */
```

https://stackoverflow.com/questions/7905929/how-to-test-valid-uuid-guid#13653180

```js
// Note that the only difference is the version number, which is explained in 4.1.3. Version chapter of UUID 4122 RFC.
// The version number is the first character of the third group : [VERSION_NUMBER][0-9A-F]{3} :

    UUID v1 :
    /^[0-9A-F]{8}-[0-9A-F]{4}-[1][0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i

    UUID v2 :
    /^[0-9A-F]{8}-[0-9A-F]{4}-[2][0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i

    UUID v3 :
    /^[0-9A-F]{8}-[0-9A-F]{4}-[3][0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i

    UUID v4 :
    /^[0-9A-F]{8}-[0-9A-F]{4}-[4][0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i

    UUID v5 :
    /^[0-9A-F]{8}-[0-9A-F]{4}-[5][0-9A-F]{3}-[89AB][0-9A-F]{3}-[0-9A-F]{12}$/i
```

## Буфер обмена

 * [navigator.clipboard](https://habr.com/company/ruvds/blog/358494/)

## file файлы

 * [открыть файл](https://developer.mozilla.org/en-US/docs/Web/API/File/Using_files_from_web_applications)
	```html
		<input 
			id="id-file-input"
			type="file"
			accept=".jpg,.jpeg,.png"
			(change)="uploadFile()"
			#inputFileDOMElem
			[attr.disabled]="isDisabled ? 'disabled' : null">
		<label 
			id="id-file-input-label"
			for="inputFileDOMElem">
			<div>Upload file</div>
		</label>
	```
	
	```ts
		let file: File = null;
		const MAX_FILE_SIZE_BYTES = (1000*1000*10); // 10M
		let content = null;
		let fileReader: FileReader = new FileReader();
		let fileAPIDOMWrapper = new FormData();
		let url = 'http://localhost:4200/api/uploadFile';
		let headers = new HttpHeaders({'Accept': 'application/json'})

		if (
			this.inputFileDOMElem.nativeElement.files instanceof Array &&
			this.inputFileDOMElem.nativeElement.files.length > 0
		) {
			// file selected
			this.file = this.inputFileDOMElem.nativeElement.files[0]
		}
		if (
			file instanceof File &&
			['image/jpeg', 'image/png'].includes(file.type) &&
			file.size <= MAX_FILE_SIZE_BYTES
			) {
			// file is valid, proceed to download
			
			fileAPIDOMWrapper.append('uploadedImage', file);
			
			this.http.post(url, fileAPIDOMWrapper, headers, reportProgress: true).pipe(
				take(1),
				catchError((error, cause) => {
					console.log('file upload error', error);
					return of();
				})
			).subscribe(result => console.log('file uploaded', result));
			// get content
			fileReader.onload = function () {
				content = this.result
				console.log('file content', content);
			};
			fileReader.readAsArrayBuffer(file);
		}
	```

 * 

##  стандарты

https://timothygu.me/es-howto/

##  популярность технологий

https://stateofjs.com/2017/front-end/results

##  производительность highload

 * https://www.safaribooksonline.com/library/view/high-performance-javascript/9781449382308/ch04s03.html
 * http://voidcanvas.com/javascript-performant-coding-tips/
 * [измерение производительности javascript](https://habr.com/ru/company/mailru/blog/272087/)
 * [убийцы оптимизации](https://habr.com/ru/company/mailru/blog/273839/)
 * [firebase уменьшение объёма](https://habrahabr.ru/post/344248/)

##  state management

 * [akita](https://github.com/datorama/akita)
 * [vibe.js](https://habrahabr.ru/post/341126/)
 * redux
 * mobx-tree-store

##  большие числа

 * [64-битная арифметика в браузере и WebAssembly](https://habrahabr.ru/post/308874/)
 * [bigint](https://habr.com/post/354930/)
 * [The Essential Guide To JavaScript’s Newest Data Type: BigInt 2019](https://www.smashingmagazine.com/2019/07/essential-guide-javascript-newest-data-type-bigint/)
 * https://github.com/MikeMcl/bignumber.js/

##  тесты

 * http://perfectionkills.com/javascript-quiz-es6/
 * http://www.javatpoint.com/javascript-quiz
 * https://tests4geeks.com/test/javascript
 * https://proglib.io/p/interview-javascript-programmer/


##  service workers

 * https://blog.sessionstack.com/how-javascript-works-the-mechanics-of-web-push-notifications-290176c5c55d
 * [The difference between ServiceWorkers, WebWorkers and WebSockets](https://aarontgrogg.com/blog/2015/07/20/the-difference-between-service-workers-web-workers-and-websockets/)
 * [Как заставить ваши веб-приложения работать в автономном режиме](https://habr.com/ru/company/edison/blog/474374/)


##  async await

 * https://habrahabr.ru/company/ruvds/blog/353658/
 * [JavaScript. Работаем с исключениями и данными в конструкциях async/await без блоков try-catch](https://habr.com/post/358896/)

## IIFE 

 * 

##  promise

```js

function* @returns Promise.resolve(object)|Promise.error(text)

startPromise(a,b,c)
    .then(function1)
    .then(function2)
    .catch(errorHandlerFunction)

```

 * если вернуть новый промис, то стартует новая цепочка для .catch

 * https://www.dwmkerr.com/promises-in-angularjs-the-definitive-guide/#advancedpromiseschaining
 * https://blog.bloomca.me/2018/03/24/async-patterns-js.html
 * https://habrahabr.ru/company/ruvds/blog/340194/
 * http://www.datchley.name/promise-patterns-anti-patterns/
 * https://hackernoon.com/javascript-promises-best-practices-anti-patterns-b32309f65551
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
 * https://benmccormick.org/2015/12/30/es6-patterns-converting-callbacks-to-promises/
 * [отменяемые обещания](https://github.com/ericelliott/speculation)
 * [Руководство по промисам для тех, кто хочет в них разобраться](https://habr.com/company/ruvds/blog/358808/)

## event loop событийный цикл

 * основной поток
 * очередь задач JS
 * очередь рендернига(requestAnimationFrame): style calc, layout calc, painting
 * синхронный код блокирует рендеринг: while(true)
 * асинхронный код не блокирует, т.к. есть минимальная задержка 4мс между задачами 
    ```js
        function loop(){setTimeout(loop,0)}
    ```
 * браузер задерживает очередь рендеринга
 * [Jake Archibald: все что я знаю про Event Loop в JavaScript (2018)](https://www.youtube.com/watch?v=j4_9BZezSUA)
	* очередь задач, очередь задач анимации(requestAnimationFrame), очередь микрозадач(promise)
	* либо задачи, либо задачи анимации+рендеринг(стили, раскладка, рисование)
	* рендеринг запускается не раньше 1/60 секунды, т.к. нет смысла обновляться чаще чем монитор
	* очередь задач пополняется(запускает рендеринг) после выполнения текущей задачи
	* очередь задач анимации пополняется(запускает рендеринг) после очистки зафиксированной текущей очереди
	* очередь микрозадач пополняется(запускает рендеринг) всей очереди
	* запуск задач не из браузерного апи, в коде тестов, блокируется до окончания выполнения текущей задачи
 * [Филипп Робертс: Что за чертовщина такая event loop? | JSConf EU 2014](https://www.youtube.com/watch?v=8aGhZQkoFbQ)
	* асинхронные задачи setTimeout,XHR выполняются браузером в отдельных очередях
 * [Further Adventures of the Event Loop - Erin Zimmer - JSConf EU 2018](https://www.youtube.com/watch?v=u1kqx6AenYw)
 
## массивы loop for

 * [Полезные приёмы работы с массивами в JavaScript 2018](https://habr.com/company/ruvds/blog/358306/)

## очереди queue

 * [трансдьюсеры](https://habrahabr.ru/company/ruvds/blog/329536/)
 * https://medium.com/@roman01la/understanding-transducers-in-javascript-3500d3bd9624
 * [быстрая очередь](https://www.nickang.com/implementing-queue-javascript/)
 
```js
	/**
	* Implementation of Queue.
	*/
	class Queue {
		/**
		* Create a queue.
		*/
		constructor () {
			this.store = {};
			this.front = 0;
			this.end = 0;
		}
	}
	
	/**
	* Add item to end of queue.
	* @param {*} The data to store in the position.
	*/
	Queue.prototype.enqueue = function (data) {
		this.store[this.end] = data;
		this.end++;
	};
	
	/**
	* Remove item from queue and return its data.
	* @return {*} The data stored in item.
	*/
	Queue.prototype.dequeue = function () {
		if (this.front === this.end) return null;
	
		const data = this.store[this.front];
		delete this.store[this.front];
		this.front++;
		return data;
	};
	
	/**
	* Return current size of queue.
	* @return {number} Size of queue.
	*/
	Queue.prototype.size = function () {
		return this.end - this.front;
	};
	
	/**
	* Return item at front of queue without dequeueing.
	* @return {*} The data stored in item.
	*/
	Queue.prototype.peek = function () {
		if (this.size() === 0) return null;
		return this.store[this.front];
	};

```

##  свойства объектов

 * http://getinstance.info/articles/javascript/attributes-of-object-properties-in-javascript/
 * [глубокое копирование deep clone](https://www.webreflection.co.uk/blog/2015/10/06/how-to-copy-objects-in-javascript)
 
```js
	obj2 = obj1.map(item => Object.assign({}, item));
	obj2 = JSON.parse(JSON.stringify(obj1));
	function copy(o) {
		var output, v, key;
		output = Array.isArray(o) ? [] : {};
		for (key in o) {
			v = o[key];
			output[key] = (typeof v === "object") ? copy(v) : v;
		}
		return output;
	}
```
 * [ещё одна функция глубокого копирования](https://medium.com/@tkssharma/objects-in-javascript-object-assign-deep-copy-64106c9aefab)
 
```js
	function cloneObject(obj) {
		var clone = {};
		for(var i in obj) {
			if(obj[i] != null &&  typeof(obj[i])=="object")
				clone[i] = cloneObject(obj[i]);
			else
				clone[i] = obj[i];
		}
		return clone;
	}
```
 * [глубокое клонирование класса с методами](https://www.nickang.com/how-to-clone-class-instance-javascript/)
 
```js
	function copyInstance (original) {
	var copied = Object.assign(
		Object.create(
		Object.getPrototypeOf(original)
		),
		original
	);
	return copied;
	}
```
 * глубокое клонирование, сломано

```ts
	cloneDeep<T>(obj: T) {
		let clone: T = Object.assign({}, obj);
		const keys: string[] = Object.keys(obj);

		for (let indexL0 = 0; indexL0 < keys.length; indexL0++) {
			if (obj[keys[indexL0]] !== null) {
				if (typeof obj[keys[indexL0]] === "object") {
					if (obj[keys[indexL0]] instanceof Array) {
						for (let indexL1 = 0; indexL1 < obj[keys[indexL0]].length; indexL1++) {
							clone[keys[indexL0]] = Object.assign({}, obj[keys[indexL0]]);
						}
					} else {
						clone[keys[indexL0]] = this.cloneDeep(obj[keys[indexL0]]);
					}
				} else {
					clone[keys[indexL0]] = obj[keys[indexL0]];
				}
			}
		}
		return clone;
	}
```

 * глубокое клонирование [lodash](https://www.blazemeter.com/blog/the-correct-way-to-import-lodash-libraries-a-benchmark)
 
```js
import cloneDeep from loDash;
let clone = cloneDeep(orig);

```

## Общие понятия

 * Контекст исполнения — это абстрактное понятие, используемое спецификацией ECMAScript для типизации и разграничения исполняемого кода. 
 * Стек контекстов исполнения: Стек контекстов исполнения — это LIFO структура, используемая для контроля и очередности исполнения кода.
 * Каждый контекст исполнения имеет ассоциированное с ним лексическое окружение (lexical environment).
 * Лексическое окружение — это структура, используемая для ассоциации идентификаторов, появляющихся в контексте, с их значениями. Каждое лексическое окружение также может иметь ссылку на родительское окружение.
 * Функции в ECMAScript являются объектами первого класса (first-class objects). Эта концепция является фундаментальной для функционального программирования, аспекты которого поддерживаются в JavaScript.
 * Функция первого класса: функция, которая может быть использована в качестве обычных данных: т.е. сохранена в переменную, передана в качестве аргумента, или возвращена в качестве значения из другой функции. 
 * Свободная переменная: переменная, не являющаяся ни параметром, ни локальной переменной данной функции. 
 * Статическая/лексическая область видимости: язык программирования использует статическую область видимости, если только по анализу исходного кода, можно определить, в каком лексическом окружении будут разрешены свободные переменные.
 * Замыкание — это функция, захватывающая лексическое окружение того контекста, где она создана. В дальнейшем это окружение используется для разрешения идентификаторов.
 * https://www.youtube.com/watch?v=-GWOP5JdPpo
 * инструкции - набор выражений или инструкций до разделителя(;)
 * выражение - возвращает значение
    * простое/основное primary expression - без вложенных: литералы, идентификаторы, ключевые слова
    * сложное/вторичное secondary expression - c вложенными
 * инструкции
 * литералы - парсер не вычисляет значение, а получает его из кода
 *
 
##  const

 * https://jamie.build/const

## spread

* расщепление на массив элементов

##  this

 * [Javascript-джедай #18 - this и непрямой вызов методов](https://www.youtube.com/watch?v=213r4EOHfF0)
 * контекст можно присвоить через метод 
    * Object.call(context,arguments)
    * Object.apply(context,[arguments])
    * newObject = Object.bind(context) - без выполнения Object
 * Значение this называется контекстом вызова(лексическим окружением) и будет определено в момент вызова функции.
 * ES5 по-умолчанию использует global namespace - window, а ES6 и use strict делают его undefined, например, у стрелочных функций
 * Если одну и ту же функцию запускать в контексте разных объектов, она будет получать разный this:
    * this равен объекту перед точкой:
    ```js
    var user = { firstName: "Вася" };
    var admin = { firstName: "Админ" };

    function func() {
    alert( this.firstName );
    }

    user.f = func;
    admin.g = func;

    user.f(); // Вася
    admin.g(); // Админ
    admin['g'](); // Админ

    ```
    * вызов без контекста в режиме use strict вместо глобального объекта this будет undefined:
    ```js

    function func() {
    "use strict";
    alert( this ); // выведет undefined (кроме IE9-)
    }

    func();

    ```

## void

 * https://medium.com/@frontman/используем-void-в-js-3da5ed447369/

##  Стрелочные функции

https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Functions/Arrow_functions$revision/1236769 
Объявление через => - это синтаксический сахар для сокращения кода с огромной кучей ограничений.

##  Замыкание closure

 * Это функции с отдельной областью видимости, сохраняющие все ссылки на внешние переменные. Используются для экономии кода при массовом использовании одной функции с разными входными значениями. Опасна сложностью в понимании принципов её работы, и, как следствие, нивелировании экономии на написании кода поиском причин нештатной работы этого кода.
 * в JavaScript область действия переменной определяется по её расположению в коде (это очевидно лексически), и вложенные функции имеют доступ к переменным, объявленным вовне. Этот механизм и называется Lexical scoping (область действия, ограниченная лексически).
 * https://developer.mozilla.org/ru/docs/Web/JavaScript/Closures
 * https://habrahabr.ru/company/ruvds/blog/340194/
 * https://medium.com/dailyjs/i-never-understood-javascript-closures-9663703368e8
 * https://proglib.io/p/js-closures-1/
 * https://proglib.io/p/js-closures-2/


##  Поднятие пременных

[Поднятие](https://developer.mozilla.org/ru/docs/Web/JavaScript/Guide/Grammar_and_types#Поднятие_переменных/) - это выбор наиболее глобальной области видимости переменной среди всех мест объявления и использования переменной.

##  наследование в прототипном стиле

```js
// --------- Класс-Родитель ------------
// Конструктор родителя пишет свойства конкретного объекта
function Animal(name) {
  this.name = name;
  this.speed = 0;
}

// Методы хранятся в прототипе
Animal.prototype.run = function() {
  alert(this.name + " бежит!")
}

// --------- Класс-потомок -----------
// Конструктор потомка
function Rabbit(name) {
  Animal.apply(this, arguments);
}

// Унаследовать
Rabbit.prototype = Object.create(Animal.prototype);

// Желательно и constructor сохранить
Rabbit.prototype.constructor = Rabbit;

// Методы потомка
Rabbit.prototype.run = function() {
  // Вызов метода родителя внутри своего
  Animal.prototype.run.apply(this);
  alert( this.name + " подпрыгивает!" );
};

// Готово, можно создавать объекты
var rabbit = new Rabbit('Кроль');
rabbit.run();


```
