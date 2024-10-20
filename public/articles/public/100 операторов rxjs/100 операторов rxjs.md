# 100 операторов RxJs

Трудно быть стартапом. Часть 2 - учёба.

* ![картинка](гаук.jpeg)
* Оружейник Гаук демонстрирует работу книгопечатной машины. Кадр из фильма [Трудно быть богом](https://www.youtube.com/watch?v=L1wFZY7c9Kw)

## Введение

* О чём: об операторах RxJs.
* Для кого: для тех кому нужно быстро проверить оператор в работе.
* Зачем: чтобы переписать свои заметки в чистовик, поделиться опытом со страждущими.
* В чём особенность: хорошая подборка активностей и мотивация.
* [Где поддержать(похлопать)](https://medium.com/@stepanovv.ru/100-rxjs-operators-fab1338ef3b9)
* [Ещё статьи](/articles/index.html)

Итак, настало время второй статьи цикла "Трудно быть стартапом". [Предыдущая часть](https://medium.com/@stepanovv.ru/trudno-byt-startapom-gvozdi-2a95cf74ff31) завершена призывом бесплатно делиться знаниями. Сам предложил - сам сделал. Позади примерно 40 часов труда, впереди - неувядаемая слава и почёт труженика. Поехали!

Для торопливых сразу ссылка на [код библиотеки операторов](https://github.com/bskydive/rxjs-aj4vwd-stackblitz), а для самых торопливых - ссылка на [облачный сервис с развёрнутым кодом](https://stackblitz.com/edit/rxjs-aj4vwd?file=README.md).

Для тех, кто ещё остался, кратенько попытаюсь обосновать зачем я потратил своё время. Итак, вначале был гугл. Можно долго и увлекательно бултыхаться в пёстрых статьях, но чем дальше заплываешь, тем больше тонешь.

Чёткое и выверенное изложение материала, как правило, доступно за деньги. А кроме того, обёрнуто увесистой программой обучения для увеличения стоимости. И при этом никто не даёт гарантий того, что это поможет решить ваши задачи. Ведь никто не знает какие конкретно задачи вам предстоит решить `;)`.

Вот мы и пришли к задаче. Она простая - надо приспособить код фронта к генератору случайных контрактов API. Т.е. крепко изучить комбинацию потоков наблюдаемых значений -Observables. По пути, конечно, эти значения надо обложить обработчиками ошибок, интерфейсами, тестами, заглушками, авторизацией, нарезкой для листалки(pager), и, конечно же, классной крутилкой(load spinner) "ваше мнение очень важно для нас". И это не считая линтеров, соглашений по коду, архитектуры модулей и сервисов. Забегая вперёд, хочу отметить - мой стек Angular/Typescript, потому техническая часть будет именно оттуда.

В основе этого "простейшего" действия - получить данные с сервера лежат операторы RxJs. Их задача облегчить разработку и сопровождение нашего кода, но у них есть и "тёмная" сторона. Операторов много, очень-очень много. И вариантов их использования, и параметров, и особенностей исполнения тоже очень много.

При попытке решить практическую задачу находишь пример. Он, конечно же, написан с использованием техник и операторов, которые не знакомы, а зачастую с ошибками. Или код примера банально устарел, и в текущей версии RxJs не работает. Да, более старые, "накликанные" и "нацитированные" годами ссылки будут всегда верхними в выдаче. И тогда начинается сборка коллекции кодовелосипедов в "свободное" время.

Для того, чтобы быстрее понять как работает тот или иной оператор была написана библиотека примеров. Они максимально похожи друг на друга, чтобы их можно было быстро понимать и комбинировать. В практических задачах именно комбинация операторов отнимает больше всего времени. Их подбор и отладка - вот это вот то, ради чего написано 100+ примеров.

Группировка операторов
[buffering.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/buffering.ts) - Операторы буферизации buffer*, window*
[`erroring.ts`](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/erroring.ts) - Операторы обработки ошибок
[filtering.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/filtering.ts) - Операторы фильтрации
[grouping.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/grouping.ts) - Операторы группировки потоков и значений
[multicasting.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/multicasting.ts) - Операторы асинхронного/параллельного запуска потоков(распыления)
[testing.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/testing.ts) - Операторы тестирования. Не реализовано.
[timing.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/timing.ts) - Операторы времени, продолжительности и значений
[tooling.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/tooling.ts) - Операторы вспоможения в трудах
[transforming.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/transforming.ts) - Операторы трансформации потоков и значений
[utils.ts](https://github.com/bskydive/rxjs-aj4vwd-stackblitz/blob/master/src/utils.ts) - Интерфейсы и служебные функции

## Список того, к чему вы сами можете приложить руку(TODO)

* заполнить для всех примеров к объект: запуск, результат, тэги, описание, аналоги
* сделать конфигуратор операторов: тип входных значений, выходных, преобразования, аналоги
* заменить жаргонизмы на точное обозначение "подписывается, имитирует, ..."(рытьё исходников)
* добавить ссылки на https://www.learnrxjs.io/ и https://rxmarbles.com/ в описания всех операторов
* привести примеры `multicasting` к массовому варианту запуска в `index.ts`
* заполнить примерами новый файл `testing.ts` https://medium.com/@kevinkreuzer/marble-testing-with-rxjs-testing-utils-3ae36ac3346a
* написать тесты для всех примеров
* добавить в описания операторов их более простые аналоги/комбинации

## Как использовать библиотеку

Примеры разбиты на файлы, чтобы не сводить с ума линтеры, и собраны в index.ts через экспорт массивов для реализации в будущем автотестов.

Запуск всех примеров выключен(закомментирован). Чтобы их запустить - надо раскомментировать подписку subscribe. Для генерации входного потока данных вручную сделана кнопка `<button id="id-tight-button">` в `index.html`

Можно [открыть в IDE](https://github.com/bskydive/rxjs-aj4vwd-stackblitz), а можно через chrome в облаке [stackblitz](https://stackblitz.com/edit/rxjs-aj4vwd).

Необходимые операторы ищутся Ctrl+f, в конце добавляем $ к названию оператора. Например `switchMap$`. Также операторы видны в "структуре кода" - специальном окне IDE. Перед каждым примером есть небольшое описание и результат выполнения. Чтобы заглушить ненужный входной поток достаточно дописать в начале `*.pipe(*` оператор `take(0)`

 * В облаке stackblitz:
	 * обновить страницу(stackblitz)
	 * раскомментировать `*$.subscribe(*` строку необходимого оператора
	 * открыть консоль встроенного браузера(stackblitz)
 * Локально в IDE:
	```bash
		git clone https://github.com/bskydive/rxjs-aj4vwd-stackblitz.git
		cd rxjs-aj4vwd-stackblitz
		npm i
		npm run b
	```
* Список плагинов VSCode, которые относятся к теме:
	* [TSLint](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin)
	* [eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
	* [учёт времени с привязкой к git wakatime](https://marketplace.visualstudio.com/items?itemName=WakaTime.vscode-wakatime)
	* [открытый аналог локально](https://marketplace.visualstudio.com/items?itemName=hangxingliu.vscode-coding-tracker)
	* [открытый аналог локально для подсчёта эффективности без привязки к веткам и коммитам](https://marketplace.visualstudio.com/items?itemName=softwaredotcom.swdc-vscode)

## Что хорошо

 * Содержит полный список правильных способов `import {}`. Вроде бы мелочь, но автоимпорт не всегда работает корректно.
 * входные значения всегда потоки с интервалами, изредка - простые значения. Это имитирует боевые условия. Во многих примерах даются `of(1,2,3)`, которые работают совсем иначе, чем `interval()`. Например, в примерах со `switchMap` - простые значения не дают понять, что предыдущий поток может быть закрыт. `src/transforming.ts:881(switchMap3$)`
 * Выводится ожидаемое время имитации значения в потоке `interval(101).pipe(map(item=>item*101))`.
 * Интервалы имитации разведены на миллисекунду: 101, 102, 202, 203. Всегда понятно когда и в каком порядке должно быть имитировано значение.
 * К значениям из одного потока добавляются унифицированные постфиксы `'-1' | '-2' | '-dynamic'`, чтобы легче было читать вывод в консоли.
 * В примерах оставлены закомментированные операторы логирования для отладки `tap(logAll)`
 * Строка `mergeMapSrc2$.subscribe((item) => logAll('получил: ', item), null, () => logAll('mergeMap2 поток закрыт'));` унифицирована для облегчения рефакторинга
 * операторы `endWith('…')` помогают понять когда происходит завершение(отписка) потока
 * выполняется как в консоли, так и в онлайн редакторе. Некоторые примеры работают только в браузере, когда необходимо его API, например, `src/timing.ts:144(observeOn$)` или `src/filtering.ts:225(takeUntil$)`
 * большое, очень большое количество операторов. 101 оператор разобран в 108 примерах
 * все примеры рабочие и готовы к копипасту
 * примеры многопоточные

## Что плохо

 * Не весь код универсально-одинаковый. Самый неодинаковый в примерах распыления `multicasting.ts`. Также в некоторых местах необходимо делать `JSON.stringify` в типовых `*$.subscribe(*`
 * Объём работы конский, потому, извиняйте, не всё сделано идеально. Было несколько подходов к рефакторингу, после которых я не выверял заново все примеры. Да, они рабочие, но вывод может отличаться от написанного в JSDoc
 * Описания операторов в тексте могут быть не вполне корректны. Главное здесь - рабочий код, а не его описание. Чтобы выверить описание необходимо в разы больше примеров, и перелопачивание исходников.

## Типовой пример

Типовой пример описания оператора RxJs. [GIST](https://gist.github.com/bskydive/c9a497198fb3604774cdfe5b78f1813e)

```ts
	const auditProbe$ = item => { // функция-аргумент для передачи в оператор
		logAll('проверка: ' + item); // для отладки пишем полученное значение
		return interval(300).pipe(take(3)); // возвращаем наблюдатель. В данном случае - для имитации трёх значений.
		//.pipe(take(X)) - хорошее правило для ограничения утечек памяти
	}

	const audit2$ = interval(102).pipe( // поток для отладки оператора
		take(10), // ограничиваем количество значений
		map(item => item * 102), // делаем значения человеко-понятными, выводим время их имитации в мсек, выбрали 102 вместо 100 чтобы не было случайных гонок асинхронных потоков(перестраховка)
		tap(logAll), // выводим сырые значения перед отправкой в недра исследуемого оператора
		audit(auditProbe$) // исследуемый оператор
	)

	const audit1$ = interval(101).pipe( // контрольный поток для сравнения, без оператора для исследования
		take(10),
		map(item => item * 101 + '-control'), // добавляем постфикс для облегчения чтения отладки
	)

	const audit$ = of(audit1$, audit2$).pipe( // одновременно запускаем два потока
		mergeAll(), // собираем значения потоков в один, "конвертируем" потоки в значения
	);

	//запускаем потоки и выводим всё в консоль. префиксы нужны, чтобы понимать, что значение долетело до конца
	audit$.subscribe((item) =>
		logAll('получил: ', item), // пишем всё, что получили по сигналу next().
		err => logAll('ошибка:', err), // пишем что прилетело по сигналу error()
		() => logAll('audit поток закрыт') // пишем когда прилетело complete(). Отдельно указываем какой именно оператор закончил тестирование, чтобы быстрее ловить другие ошибочно не закомментированные операторы
	);
```

## Автоматическая проверка кода

По ходу дела я прикрутил в проект два линтера и несколько наборов правил:

* сорян, но табы. Они позволяют настраивать каждому своё отображение, не меняя код в репе.
* именование файлов в шашлычном стиле
* именование интерфейсов с префиксом `I`
* многие правила `es/ts lint` дублируются, часть отключено в одном из двух, но большинство оставлено, т.к. непонятно как конкретно работают правила, и непонятно что лучше.
* правила форматирования переведены в `severity: warn`.
* нельзя оставлять в коде `console.log()`
* [Финская нотация](https://medium.com/@benlesh/observables-and-finnish-notation-df8356ed1c9b). Да, она через линтер помогает, например, не проглядеть тип значений внутри операторов `map(item=>item... | map(item$=>item$...` , т.к. вместо объекта может прилететь `Observable`, и это не всегда отлавливается TSLint.
* перелопатил [все правила eslint](https://eslint.org/docs/rules/), и добавил что добавилось. Искал правило для [сложного](https://github.com/bskydive/angular-docdja) [случая](https://stackblitz.com/edit/angular-docdja), который периодически трепал мне нервы. Не нашёл :(.
* [rxjs-tslint-rules](https://github.com/cartant/rxjs-tslint-rules#rules)
* [codelyzer for Angular](https://github.com/mgechev/codelyzer)
* [angular-tslint-rules: a configuration preset for both TSLint & codelyzer](https://medium.com/burak-tasci/angular-tslint-rules-a-configuration-preset-for-both-tslint-codelyzer-8b5fa1455908)
* [RxJs: Avoiding takeUntil Leaks](https://blog.angularindepth.com/rxjs-avoiding-takeuntil-leaks-fb5182d047ef)
* [Best practices for a clean and performant Angular application](https://medium.com/free-code-camp/best-practices-for-a-clean-and-performant-angular-application-288e7b39eb6f)

## Полезные ссылки

* [Платный курс](https://app.pluralsight.com/library/courses/rxjs-operators-by-example-playbook), который можно посмотреть за время бесплатного доступа. Главное вспомнить отвязать банковскую карту до его окончания. Из этого курса я взял список операторов и их группировку.
* [Примеры операторов RxJs](https://www.learnrxjs.io/) Не все рабочие.
* [Графические примеры операторов RxJs](https://rxmarbles.com/)
* [ReactiveX документация](http://reactivex.io/documentation/operators.html)
* [RxJs документация](https://rxjs-dev.firebaseapp.com/api)

Это в большей степени конструктор, чем учебное пособие. Прочитав код, вы вряд ли его запомните. Лучше добавить или поменять в этом коде что-то на свой лад.

Это был не только конструктор, но и пример создания таких конструкторов. Полезных себе и другим. Кроме того, здесь есть что ещё поделать, это хорошая основа для крутых учебников, конфигураторов или библиотек с примерами.
Впереди более сложный вид конструктора - приложение с библиотекой компонентов и хранилищем `ngrx`. Для затравки - [годная статья](https://itnext.io/choosing-a-highly-scalable-folder-structure-in-angular-d987de65ec7)
