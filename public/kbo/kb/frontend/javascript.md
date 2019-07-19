#  Javascript

##  лучшие практики

[стили](/kbo/developer/frontend.md)

## links

 * [ES6](https://medium.com/p/3d28884c59d4)
 * https://mbeaudru.github.io/modern-js-cheatsheet/
 * [ООП js](https://www.youtube.com/watch?v=Qn3Qah7W6Vs)
 * [современный жс](http://courses.angularclass.com/courses/modern-javascript)
 * [блог ведущего курсы обучения smartjs](https://medium.com/@xanf)
 * [события](http://latentflip.com/loupe/)
 * https://tproger.ru/translations/event-emitter-javascript/
 * http://www.2ality.com/2016/10/understanding-promises.html

## обучение

 * http://www.javascripter.net/
 * https://learn.javascript.ru/
 * http://frontender.info/const-immutability/
 * http://frontender.info/es6-in-depth-iterators-and-the-for-of-loop/
 * http://frontender.info/es6-in-depth-generators/
 * http://frontender.info/promises/

## инструменты 

 * [импорт, трансформация и анализ json/csv](http://www.data-forge-js.com/)
    * [Редактируем CSV-файлы, чтобы не сломать данные](https://habr.com/company/hflabs/blog/432906/)
 * ABstract syntax tree анализатор
    * http://resources.jointjs.com/demos/javascript-ast
    * http://astexplorer.net/
    * http://esprima.org/demo/parse.html#
 
## валидаторы syntax check

 * https://eslint.org/docs/rules/
 * https://palantir.github.io/tslint/rules/
 * https://github.com/Gillespie59/eslint-plugin-angular
 
## ботанство

 * http://dmitrysoshnikov.com/ecmascript/javascript-the-core-2nd-edition-rus/
 * https://medium.com/@DmitrySoshnikov
 * [параллельные конкурентные потоки многопоточность](https://hacks.mozilla.org/2017/06/a-crash-course-in-memory-management/)
 * [Основы движков JavaScript: общие формы и Inline кэширование. Часть 2](https://habr.com/ru/company/otus/blog/447220/)
 * [Функциональный JavaScript: пять способов нахождения среднего арифметического элементов массива и метод .reduce()](https://habr.com/ru/company/ruvds/blog/458030/)

## алгоритмы

 * [двоичное дерево](https://www.nickang.com/binary-search-tree-explained/)
 
 
## ООП prototype наследование

 * (Каждый программист на javascript должен написать свою реализацию классов)[https://habr.com/post/132698/#comment_4404597]

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

 * https://www.tsmean.com/articles/
 * [знакомство с typescript 2015](https://msdn.microsoft.com/ru-ru/magazine/dn890374.aspx)
 * https://www.sitepen.com/blog/2014/08/22/advanced-typescript-concepts-classes-types/
 * https://www.sitepen.com/blog/2013/12/31/definitive-guide-to-typescript/
 * [доки](https://www.gitbook.com/book/basarat/typescript)
 * https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
 * http://2ality.com/2018/03/javascript-typescript-reasonml.html
 * https://medium.freecodecamp.org/typescript-javascript-with-super-powers-a333b0fcabc9
  * https://www.typescriptlang.org/index.html#download-links
 * https://github.com/Microsoft/TypeScript-React-Conversion-Guide#typescript-react-conversion-guide
 * http://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
 * https://habrahabr.ru/company/piter/blog/347364/
 * [typescript на node сервере](https://habr.com/ru/post/328466/)

##  шаблоны patterns

 * [инструменты проектирование](/kbo/инструменты/инструменты#проектирование)
 * [Создание архитектуры программы или как проектировать табуретку](https://habr.com/post/276593/)
 * [SOLID ](info.javarush.ru/translation/2013/08/06/Пять-основных-принципов-дизайна-классов-S-O-L-I-D-в-Java.html)
    * [источник](http://howtodoinjava.com/2013/06/07/5-class-design-principles-solid-in-java/)

| смысл | название | перевод |
| --- | --- | --- |
| На каждый объект должна быть возложена одна единственная обязанность. | Single Responsibility Principle | (Принцип единственной обязанности) |
| Программные сущности (классы, модули, функции и т.п.) должны быть открыты для расширения, но закрыты для изменения. | Open Closed Principle | (Принцип открытости/закрытости) |
| Объекты в программе могут быть заменены их наследниками без изменения свойств программы. | Liskov’s Substitution Principle | (Принцип подстановки Барбары Лисков) |
| Клиенты не должны быть вынуждены реализовывать ненужные методы, которые они не будут использовать | Interface Segregation Principle | (Принцип разделения интерфейса) |
| Зависимости внутри системы строятся на основе абстракций. Модули верхнего уровня не зависят от модулей нижнего уровня. Абстракции не должны зависеть от деталей. Детали должны зависеть от абстракций. | Dependency Inversion Principle | (Принцип инверсии зависимостей) |
| | | |
| | | | |
 
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

##  стандарты

https://timothygu.me/es-howto/

##  популярность технологий

https://stateofjs.com/2017/front-end/results

##  производительность highload

 * https://www.safaribooksonline.com/library/view/high-performance-javascript/9781449382308/ch04s03.html
 * http://voidcanvas.com/javascript-performant-coding-tips/

##  state management

 * [firebase](https://habrahabr.ru/post/344248/)
 * [vibe.js](https://habrahabr.ru/post/341126/)
 * redux
 * mobx-tree-store

##  очереди

 * [трансдьюсеры](https://habrahabr.ru/company/ruvds/blog/329536/)
 * https://medium.com/@roman01la/understanding-transducers-in-javascript-3500d3bd9624

##  большие числа

 * https://habrahabr.ru/post/308874/
 * [bigint](https://habr.com/post/354930/)

##  тесты

 * http://perfectionkills.com/javascript-quiz-es6/
 * http://www.javatpoint.com/javascript-quiz
 * https://tests4geeks.com/test/javascript
 * https://proglib.io/p/interview-javascript-programmer/


##  service workers

 * https://blog.sessionstack.com/how-javascript-works-the-mechanics-of-web-push-notifications-290176c5c55d
 * [The difference between ServiceWorkers, WebWorkers and WebSockets](https://aarontgrogg.com/blog/2015/07/20/the-difference-between-service-workers-web-workers-and-websockets/)


##  async await

 * https://habrahabr.ru/company/ruvds/blog/353658/
 * [JavaScript. Работаем с исключениями и данными в конструкциях async/await без блоков try-catch](https://habr.com/post/358896/)

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
 * https://www.youtube.com/watch?v=j4_9BZezSUA
 
## массивы loop for

 * [Полезные приёмы работы с массивами в JavaScript 2018](https://habr.com/company/ruvds/blog/358306/)

## очереди queue

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
 * Функция первого класса: функция, которая может быть использованна в качестве обычных данных: т.е. сохранена в переменную, передана в качестве аргумента, или возвращена в качестве значения из другой функции. 
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

##  Замыкание

 * Это функции с отдельной областью видимости, сохраняющие все ссылки на внешние переменные. Используются для экономии кода при массовом использовании одной функции с разными входными значениями. Опасна сложностью в понимании принципов её работы, и, как следствие, нивелировании экономии на написании кода поиском причин нештатной работы этого кода.
 * в JavaScript область действия переменной определяется по её расположению в коде (это очевидно лексически), и вложенные функции имеют доступ к переменным, объявленным вовне. Этот механизм и называется Lexical scoping (область действия, ограниченная лексически).
 * https://developer.mozilla.org/ru/docs/Web/JavaScript/Closures
 * https://habrahabr.ru/company/ruvds/blog/340194/
 * https://medium.com/dailyjs/i-never-understood-javascript-closures-9663703368e8


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
