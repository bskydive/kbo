#  Javascript

##  лучшие практики

 * [стили](/kbo/developer/frontend.md)
 * https://proglib.io/p/12-javascript-tricks
 * [Концепции чистого кода адаптированные для TypeScript, вдохновленные clean-code-javascript](https://github.com/Real001/clean-code-typescript)
 * [You don't (may not) need Lodash/Underscore](https://github.com/you-dont-need/You-Dont-Need-Lodash-Underscore)
 * [Infinite Scroll using Generators!](https://ashishshubham.medium.com/infinite-scroll-using-generators-bbacbf6cafd9)
 * Рефакторинг. Улучшение существующего кода про тестирование, Мартин Фаулер
 * Рефакторинг с использованием шаблонов, Джошуа Кериевски
 * Эффективная работа с унаследованным кодом, Майкл К. Физерс

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
 * https://javascriptweekly.com/

## обучение

 * http://www.javascripter.net/
 * https://learn.javascript.ru/
 * http://frontender.info/const-immutability/
 * http://frontender.info/es6-in-depth-iterators-and-the-for-of-loop/
 * http://frontender.info/es6-in-depth-generators/
 * http://frontender.info/promises/
 * https://proglib.io/p/javascript-junior
 * [Тотальный JavaScript: изучаем JS с акцентом на практической составляющей](https://habr.com/ru/post/543646/) https://github.com/harryheman/JavaScript-Total

## задачи собес

 * https://coderoad.ru/45136221/Javascript-задача-кодирования-с-setTimeout-асинхронным-выходом
 * https://gist.github.com/codedokode/ce30e7a036f18f416ae0
 * https://medium.com/@olgakozlova/задача-на-асинхронность-promises-и-таймеры-2a3b537c901d/
 * https://tproger.ru/translations/common-javascript-interview-challenges/
 * [70 вопросов по JavaScript для подготовки к собеседованию](https://habr.com/ru/post/486820/)
 * [Каверзные вопросы и задачи по JavaScript из собеседований](https://proglib.io/p/tricky-challenges-js/)
 * [5 типовых задач на собеседованиях по JavaScript](https://medium.com/webbdev/js-2b0820b3788f)
 * [43 JavaScript Questions, With Their Answers Explained](https://javascriptweekly.com/link/81865/web)
 * [10 Interview Questions Every JavaScript Developer Should Know 2020](https://medium.com/javascript-scene/10-interview-questions-every-javascript-developer-should-know-6fa6bdf5ad95)

 *

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
 * [eslint tinkoff conventions](https://github.com/TinkoffCreditSystems/linters)


## ботанство

 * http://dmitrysoshnikov.com/ecmascript/javascript-the-core-2nd-edition-rus/

	```js
		let x = 10;

		function foo() {
		console.log(x);
		}

		function bar(funArg) {
			let x = 20;
			funArg(); // 10, но не 20!
		}

		// Передаем `foo` в качестве аргумента в `bar`.
		bar(foo);
	```
 * https://medium.com/@DmitrySoshnikov
 * [параллельные конкурентные потоки многопоточность](https://hacks.mozilla.org/2017/06/a-crash-course-in-memory-management/)
 * [Основы движков JavaScript: общие формы и Inline кэширование. Часть 2](https://habr.com/ru/company/otus/blog/447220/)
 * [Часто задаваемые вопросы о системах типов](https://habr.com/ru/company/ruvds/blog/462481/)
 * [производительность javascript](https://habr.com/ru/company/mailru/blog/321748/)
 * [глюки javascript](https://habr.com/ru/company/mailru/blog/335292/)
 * [история развития инструментов для  javascript](https://habr.com/ru/company/mailru/blog/340922/)
 * [ошибочное понимание DRY](https://habr.com/ru/company/mailru/blog/349978/)
 * [How JavaScript works: Event loop and the rise of Async programming + 5 ways to better coding with async/await Alexander Zlatkov](https://blog.sessionstack.com/how-javascript-works-event-loop-and-the-rise-of-async-programming-5-ways-to-better-coding-with-2f077c4438b5)
 * [Как работает JavaScript: часть первая](https://gb.ru/posts/javascript_internals_part1) https://gb.ru/posts/javascript_internals_part2 https://gb.ru/posts/javascript_internals_part3
 * [Планировщик задач на JavaScript](https://habr.com/ru/post/26215/)
 * [Знай свой инструмент: Event Loop в libuv](https://habr.com/ru/post/336498/)
 * [Как управлять event loop в JavaScript. Часть 1](https://skillbox.ru/media/code/event_loop_chast_1/)
 * [A crash course in memory management](https://hacks.mozilla.org/2017/06/a-crash-course-in-memory-management/)
 * [Diving Deeper in JavaScripts Objects - A Closer Look at JavaScript Object Descriptors](https://blog.bitsrc.io/diving-deeper-in-javascripts-objects-318b1e13dc12?gi=f92e90c386f5)
 * [сборщики мусора JAVA](https://habr.com/ru/post/269621/)

### функциональное программирование

 * [Функциональный JavaScript: пять способов нахождения среднего арифметического элементов массива и метод .reduce()](https://habr.com/ru/company/ruvds/blog/458030/)
 * [функциональное программирование](https://habr.com/ru/company/mailru/blog/327522/)
 * [Concepts of Functional Programming in Javascript](https://medium.com/the-renaissance-developer/concepts-of-functional-programming-in-javascript-6bc84220d2aa)



## singleton

 * Примеры: https://github.com/bskydive/typescript-ey6nut-algs
 * es6 modules+classes https://code.tutsplus.com/tutorials/how-to-implement-the-singleton-pattern-in-javascript-es6--cms-39927
 * symbol singleton
	* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/for
	* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol
	* https://coderoad.ru/26205565/Преобразование-Singleton-JS-объектов-использования-классов-на-ES6
 * IIFE singleton
	* https://stackoverflow.com/questions/27701887/what-is-instance-in-javascript
	* https://www.digitalocean.com/community/conceptual_articles/singleton-design-pattern-in-javascript
 * es6 class singleton
	* https://stackoverflow.com/questions/1479319/simplest-cleanest-way-to-implement-a-singleton-in-javascript

## V8 движок

 * интерпретатор ES+WASM [ignition/байткод](https://v8.dev/blog/ignition-interpreter) и компилятор[turbofan JIT](https://v8.dev/docs/turbofan)
 * преза v8 2017 https://docs.google.com/presentation/d/1chhN90uB8yPaIhx_h2M3lPyxPgdPmkADqSNAoXYQiVE/edit#slide=id.g18d89eb289_1_362
 * [Основы движков JavaScript: общие формы и Inline кэширование. Часть 1](https://habr.com/ru/company/otus/blog/446446/)

## модель памяти memory model

 * Примеры: https://github.com/bskydive/typescript-ey6nut-algs
 * https://geekbrains.ru/posts/javascript_internals_part1
 * куча, стэк и очередь. В стэк попадают через event loop
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Memory_Management
	* GC garbage collection
	* вместо алгоритма подсчёта ссылок сейчас браузеры применяют алгоритм проверки доступности(mark-compact). Например, циклические ссылки не считаются мусором в первом варианте, даже если на них нет ссылок извне.
	* активные функции помечаются как корни, и от них проверяется доступность
 * [mark and sweep GC garbage collection](https://www.geeksforgeeks.org/mark-and-sweep-garbage-collection-algorithm/)
 * [Как работает JavaScript: часть вторая GC утечки](https://geekbrains.ru/posts/javascript_internals_part2)

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
 * debounce throttle
	* https://betterprogramming.pub/how-to-use-debounce-and-throttle-in-javascript-da95dc151f7b
	* https://stephencharlesweiss.com/javascript-debounce-throttle-function/

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
 * https://medium.com/@fivedicephoto/understanding-enums-in-typescript-d4dcb40c1413
 * https://levelup.gitconnected.com/typescript-best-practices-namespaces-exceptions-and-type-definitions-131d85579fa3
 * [12 советов по внедрению TypeScript в React-приложениях](https://habr.com/ru/company/tinkoff/blog/505488/)
 * [Номинативная типизация в TypeScript или как защитить свой интерфейс от чужих идентификаторов](https://habr.com/ru/post/446768/)
 * https://stackoverflow.com/questions/49761972/difference-between-string-enums-and-string-literal-types-in-ts/54455743#54455743
 * [The TypeScript Tax: A Cost vs Benefit Analysis](https://javascriptweekly.com/link/81862/web)
 * [7 New and Exciting TypeScript Features](https://blog.bitsrc.io/7-new-and-exciting-typescript-features-48b760ae0b73)
 * [warning TS(2564)](https://www.ryadel.com/en/ts2564-ts-property-has-no-initializer-typescript-error-fix-visual-studio-2017-vs2017/)
	```json
		tsconfig.json
		"compilerOptions": {
			"strictPropertyInitialization": false
	```
 * for (of) - итерируемые
	* `for (const [key,value] of Object.entries(obj) {}`
 * for (in) - перечисляемые
	* `for (const key in Object.entries(obj) { obj[key as keyof typeof obj] }`

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
 * [SOLID ](https://info.javarush.ru/translation/2013/08/06/Пять-основных-принципов-дизайна-классов-S-O-L-I-D-в-Java.html)
    * [источник](http://howtodoinjava.com/2013/06/07/5-class-design-principles-solid-in-java/)
	* [SOLID php](https://habr.com/ru/company/mailru/blog/412699/)
	* [SOLID Typescript](https://medium.com/proximity-labs/solid-principles-using-typescript-5175aa06b583)
	* [SOLID javascript Охрименко](https://www.youtube.com/watch?v=wi3wPzReKZQ)
		* битовая маска может кодировать больше чем одно значение - нарушение принципа SRP
 * [GRASP паттерны проектирования](https://habr.com/ru/post/92570/) - 9шт
 * GoF - gang of four - 23шт
 * [MVC vs MVP vs MVVM](https://habr.com/ru/post/215605/) https://habr.com/ru/company/mobileup/blog/313538/
 * [Хороший дизайн должен быть SOLID - 2008](http://igor.quatrocode.com/2008/09/solid-top-5.html)

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
 * [Luxon — новая библиотека для работы с датами от команды Moment.js](https://habr.com/ru/post/433850/)
 * [$mol_time — работаем с датами и временем правильно](https://habr.com/ru/post/263041/)

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

## file файлы upload save

 * [Интерактивная выгрузка файлов на сервер с помощью RxJS](https://medium.com/ngx/upload-files-with-rxjs-eaf2027266f1)
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
	uploadFile(){
		let file: File = null;
		const MAX_FILE_SIZE_BYTES = (1000*1000*10); // 10M
		let content: ArrayBuffer = null;
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
			// https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types
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
				// content = this.result;
                content = e?.target?.result;
				console.log('file content', content);
			};

			// fire content reading
			//fileReader.readAsText(file);
			fileReader.readAsArrayBuffer(file);
		}
	}
	```

 *

##  стандарты

https://timothygu.me/es-howto/

##  популярность технологий

https://stateofjs.com/2017/front-end/results

##  производительность highload performance

 * https://www.safaribooksonline.com/library/view/high-performance-javascript/9781449382308/ch04s03.html
 * http://voidcanvas.com/javascript-performant-coding-tips/
 * [измерение производительности javascript](https://habr.com/ru/company/mailru/blog/272087/)
 * [убийцы оптимизации](https://habr.com/ru/company/mailru/blog/273839/)
 * [firebase уменьшение объёма](https://habrahabr.ru/post/344248/)

##  state management

 * [akita](https://github.com/datorama/akita)
	* [I Built the Ngrx Demo App with Akita. Here’s the Result.](https://engineering.datorama.com/i-built-the-ngrx-demo-app-with-akita-heres-the-result-57f83fe92192)
 * [vibe.js](https://habrahabr.ru/post/341126/)
 * redux
 * mobx-tree-store

## DOM jQuery

 * [Используем DOM как Pro](https://webdevblog.ru/ispolzuem-dom-kak-pro/)

##  большие числа

 * [64-битная арифметика в браузере и WebAssembly](https://habrahabr.ru/post/308874/)
 * [bigint](https://habr.com/post/354930/)
 * [The Essential Guide To JavaScript's Newest Data Type: BigInt 2019](https://www.smashingmagazine.com/2019/07/essential-guide-javascript-newest-data-type-bigint/)
 * https://github.com/MikeMcl/bignumber.js/


## строки string

 * https://stackoverflow.com/questions/9932957/how-can-i-remove-a-character-from-a-string-using-javascript

	```js
		value.split(',').join('')
	```
 * https://tproger.ru/articles/metody-strok-v-javascript-shpargalka-dlja-nachinajushhih/
 * https://mathiasbynens.be/notes/javascript-unicode
 * замена набора символов `str.replace(/[aeiou]/gi, "");`
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt
 * https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode
 * https://github.com/mathiasbynens/punycode.js/blob/master/punycode.js
 *
 *


## типы данных

 * [maybe](https://dev.to/aminnairi/the-maybe-data-type-in-javascript-3bj8)

##  тесты

 * http://perfectionkills.com/javascript-quiz-es6/
 * http://www.javatpoint.com/javascript-quiz
 * https://tests4geeks.com/test/javascript
 * https://proglib.io/p/interview-javascript-programmer/
 * https://typeofnan.dev/10-javascript-quiz-questions-and-answers/


##  service workers

 * https://blog.sessionstack.com/how-javascript-works-the-mechanics-of-web-push-notifications-290176c5c55d
 * [web push notifications](https://web-push-book.gauntface.com/introduction/)
 * [The difference between ServiceWorkers, WebWorkers and WebSockets](https://aarontgrogg.com/blog/2015/07/20/the-difference-between-service-workers-web-workers-and-websockets/)
 * [Как заставить ваши веб-приложения работать в автономном режиме](https://habr.com/ru/company/edison/blog/474374/)
 * [Launching ServiceWorker without breaking the web](https://jakearchibald.com/2014/launching-sw-without-breaking-the-web/)

##  async await

 * [Побег из ада async/await](https://habrahabr.ru/company/ruvds/blog/353658/)
	* прежде чем система сможет заняться следующей функцией, ей необходимо дождаться завершения выполнения предыдущей функции
	* группируйте параллельные функции
		```js
			// ошибка
			(async () => {
			const pizzaData = await getPizzaData()    // асинхронный вызов
			const drinkData = await getDrinkData()    // асинхронный вызов
			const chosenPizza = choosePizza()    // синхронный вызов
			const chosenDrink = chooseDrink()    // синхронный вызов
			await addPizzaToCart(chosenPizza)    // асинхронный вызов
			await addDrinkToCart(chosenDrink)    // асинхронный вызов
			orderItems()    // асинхронный вызов
			})()

			// решение
			async function selectPizza() {
				const pizzaData = await getPizzaData()    // асинхронный вызов
				const chosenPizza = choosePizza()    // синхронный вызов
				await addPizzaToCart(chosenPizza)    // асинхронный вызов
			}

			async function selectDrink() {
				const drinkData = await getDrinkData()    // асинхронный вызов
				const chosenDrink = chooseDrink()    // синхронный вызов
				await addDrinkToCart(chosenDrink)    // асинхронный вызов
			}

			(async () => {
				const pizzaPromise = selectPizza()
				const drinkPromise = selectDrink()
				await pizzaPromise
				await drinkPromise
				orderItems()    // асинхронный вызов
			})()

			// Задачу можно решить так, как показано выше, но я предпочитаю следующий метод

			(async () => {
				Promise.all([selectPizza(), selectDrink()]).then(orderItems)   // асинхронный вызов
			})()
		```
	*
 * [JavaScript. Работаем с исключениями и данными в конструкциях async/await без блоков try-catch](https://habr.com/post/358896/)
	* https://github.com/scopsy/await-to-js
	```js
		// wrapper.js
		const wrapper = promise => (
		promise
			.then(data => ({ data, error: null }))
			.catch(error => ({ error, data: null }))
		);

		module.exports = wrapper;

		//
		const { fetchData } = require('./api');
		const wrapper = require('./wrapper');

		const callApi = async () => {
		const { error, data } = await wrapper(fetchData(2000, false));
		if (!error) {
			console.info(data);
			return;
		}
		console.error(error);
		}

		callApi();

		/*
		OUTPUT:
		{ version: 1, hello: 'world' } (rejectPromise=false)
		{ error: 'Error Encountered', status: 'error' } (rejectPromise=true)
		*/
	```

## IIFE

 *

##  promise

 * https://dev.to/lydiahallie/javascript-visualized-promises-async-await-5gke

	```js

	function* @returns Promise.resolve(object)|Promise.error(text)

	startPromise(a,b,c)
		.then(function1)
		.then(function2)
		.catch(errorHandlerFunction)

	```
 * [Common Javascript Promise mistakes every beginner should know and avoid](https://gosink.in/common-javascript-promise-mistakes-beginners/)

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
 * [Что ты такое, Event Loop? Или как устроен цикл событий в браузере Chrome](https://habr.com/ru/post/461401/)
 * https://dev.to/sagarrth/an-overview-of-event-loop-tasks-and-microtasks-1i31

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

* проверка наличия свойств https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/hasOwnProperty `Object.prototype.hasOwnProperty.call(foo, 'bar'); // true`

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
 * [Javascript-джедай #3 - Выражения и операторы](https://www.youtube.com/watch?v=-GWOP5JdPpo)
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
