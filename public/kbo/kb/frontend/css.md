#	css

## производительность и оптимизация

 * https://medium.com/web-standards/critical-and-progressive-css-d6611f034d7d
 * [https://github.com/GoogleChromeLabs/css-paint-polyfill](https://github.com/GoogleChromeLabs/css-paint-polyfill)

## css шлюзы gateway

для расчёта адаптива

 * [Математика CSS-шлюзов](https://habr.com/ru/company/mailru/blog/315196/)

## DOM/BOM API

 * [houdini/csstom](https://medium.com/@lucyhackwrench/поддержка-css-typed-om-появилась-в-chrome-как-это-облегчит-жизнь-разработчикам-31b086851465/)
 * http://bradfrost.com/blog/link/whats-wrong-with-css-in-js/
 * https://micahgodbolt.com/blog/what-s-right-with-css-in-js/

## styled components

 * [эволюция css](https://habr.com/ru/company/mailru/blog/319956/)

## фигуры

* [стрелки](https://freebiesupply.com/blog/css-arrows/)
* clip-path обрезка
	* [как понять свойство clip-path](https://habr.com/ru/company/skillfactory/blog/539064/)
	* https://bennettfeely.com/clippy/ `clip-path: polygon(21% 0, 78% 0, 100% 100%, 0% 100%);`
	* [overlapping css tabs](https://codepen.io/raymassie/pen/NMELNP)
* крутилки spinner https://loading.io/css/
## обзоры, лучшие практики

 * https://css-irl.info/
 * https://shop.smashingmagazine.com/products/smashing-book-5-real-life-responsive-web-design
 * https://www.joeforshaw.com/blog/css-the-bad-bits-and-how-to-avoid-them
 * https://medium.com/@ABatickaya/хорошие-и-плохие-css-практики-для-начинающих-619289ce8bae/
 * [архитектура css](https://web-standards.ru/articles/css-architecture/)
 * http://www.cleancss.com/css-beautify/
 * http://lesscss.org/features/#variables-feature
 * https://mrmlnc.gitbooks.io/less-guidebook-for-beginners/content/chapter_2/media-queries.html
 * [специфичность не каскад](http://css-live.ru/css/nikto-ne-znaet-css-specifichnost-ne-kaskad.html)
 * [специфичность по рыбам](http://www.standardista.com/css3/css-specificity/)
 * [специфичность по ситхам](https://stuffandnonsense.co.uk/archives/css_specificity_wars.html)
 * [сильные стороны css](http://css-live.ru/articles/ustojchivyj-deklarativnyj-kontekstnyj-novyj-vzglyad-na-silnye-storony-css.html)
 * [ограничения сокращённой записи свойств](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties#Tricky_edge_cases)
 * [ТОП-6 рецептов на чистом HTML и CSS без использования JS](https://proglib.io/p/html-css-tricks/)
	* Липкие блоки
	* Прокрутка, привязка, выравнивание
	* Кирпичная кладка на HTML и CSS
	* Псевдокласс placeholder-shown
	* вкладки через :target
	* Аккордеон <details> и <summary>
	*
 * [Keeping it simple with CSS that scales - css conventions](https://archive.hankchizljaw.com/wrote/keeping-it-simple-with-css-that-scales/)
 * [prefers-color-scheme: Hello darkness, my old friend](https://web.dev/prefers-color-scheme/)
### решение проблем

 * [Шпаргалка по вёрстке 2012](https://habr.com/post/163871/)
 * [шпаргалка по специфичности селекторов](http://css-live.ru/css/pravilnaya-shpargalka-po-css-kaskadu.html)
 * [набор простых приёмов на 30 секунд](https://habr.com/ru/company/mailru/blog/350160/)

#### схлопывание

 * схлопывание не работает в следующих случаях:
	* с «плавающими» блоками, которые используют свойство float;
	* с корневыми элементами(html, body);
	* с абсолютно позиционируемыми элементами, имеющих свойство и значение position:absolute;
	* в строчных элементах.
	* Если элементы имеют значение свойства overflow, отличимое от visible, то в таких элементах не схлопываются отступы с отступами их наследников.
	* Элементы со свойством cleared не схлопываются верхними отступами с нижними отступами их родителей.
 * [Победа над неочевидным. Схлопывание внешних отступов](https://habr.com/post/257327/)
 * [Схлопывание внешних отступов mdn](https://developer.mozilla.org/ru/docs/Web/CSS/CSS_Box_Model/Mastering_margin_collapsing)

#### треугольный ярлычок

 * [Все о свойстве border http://net.tutsplus.com/tutorials/html-css-techniques/css-refreshers-borders/ ](https://habr.com/post/141658/)

 ```css
	.arrow {//треугольная стрелка вверх ^
		width: 0;
		height: 0;
		border: 100px solid transparent;//ширина основания
		border-bottom-color: blue;//определяем направление стрелки
	}
 ```

#### границы-рисунки

 * www.xiper.net/manuals/css/properties/border-image.html
 * css-tricks.com/understanding-border-image/
 * www.w3schools.com/cssref/css3_pr_border-image.asp
 * ejohn.org/blog/border-image-in-firefox/
 * www.dynamicdrive.com/style/csslibrary/item/image_frames_using_css3_border_image/
 * [Демо](www.norabrowndesign.com/css-experiments/border-image-anim.html)
 * [генератор](http://border-image.com/#{%22src%22%3A%22http%3A%2F%2Fwww.w3.org%2FTR%2Fcss3-background%2Fborder.png%22%2C%22linkBorder%22%3Atrue%2C%22borderWidth%22%3A[0%2C0%2C0%2C0]%2C%22imageOffset%22%3A[27%2C27%2C27%2C27]%2C%22setRepat%22%3Afalse%2C%22repeat%22%3A[%22repeat%22%2C%22repeat%22]%2C%22scaleFactor%22%3A3%2C%22setRepeat%22%3Atrue})

## методологии

 * БЭМ
	* https://ru.bem.info/methodology/key-concepts/
	* [бэм препроцессор и линтер](https://suitcss.github.io/)
	* семантические названия
	* название блока создаёт пространство имён, использовать элементы вне блока нельзя
	* `block-name__elem-name--mod-name`
 * smacss
 * oocss
 * https://medium.com/@stepanovv.ru/правильный-css-oocss-smacss-bem-и-sass-49351a119283/
 * [Эволюция CSS: от CSS, SASS, BEM и CSS-модулей до styled-components](https://habr.com/ru/company/vk/blog/319956/)

## каскад наследование специфичность

 * https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Cascade_and_inheritance
 * каскад - порядок имеет значение
 * наследование
 * специфичность

## layout

 * [Нетривиальная расстановка элементов на flexbox без media-запросов	](https://habr.com/ru/post/473186/)
 * https://www.developerdrive.com/holy-grail-layout-flexbox/
 * [раскладки layout](https://every-layout.dev/)
 * [Типовые раскладки](http://learnlayout.com/)
 * https://csslayout.io/

 ```html
	<div>
		<header class="header">
			...
		</header>
		<div class="container">
			<!-- Sidebar -->
			<aside class="container__sidebar">
				...
			</aside>

			<!-- Main -->
			<main class="container__main">
				...
			</main>
		</div>
	</div>
 ```
 ```css
 	.header {
		/* Stick to the top */
		position: sticky;
		top: 0;
	}
	.container {
		display: flex;
	}

	.container__sidebar {
		width: 30%;
	}

	.container__main {
		/* Take the remaining width */
		flex: 1;

		/* Make it scrollable */
		overflow: auto;
	}
 ```
 * [CSS Grid Layout Generator](https://css-grid-layout-generator.pw/)

### adaptive vs responsive layout

http://itchief.ru/lessons/bootstrap-3/lesson-no.-6-adaptive-site-layout-on-the-engine,-twitter-bootstrap

### инструменты

 * https://wireframe.cc/
 * http://www.shoelace.io/


## css стилизация прокрутки scroll

 * https://ishadeed.com/article/css-scroll-snap/
 * https://developer.mozilla.org/en-US/docs/Web/CSS/scrollbar-width
 * https://www.filamentgroup.com/lab/scrollbars/
 * https://css-tricks.com/custom-scrollbars-in-webkit/
 * https://stackoverflow.com/questions/11691718/css-webkit-scrollbar-and-safari
 *
	```scss
		& ::-webkit-scrollbar {
			position: absolute;
			padding-top: 0;
			padding-bottom: 0;
			padding-left: $width-scroll;
			padding-right: $width-scroll;

			&:vertical {
				width: $width-scroll;
				cursor: pointer;
			}

			&:horizontal {
				height: $width-scroll;
				cursor: pointer;
			}

			&-button {
				//кнопки прокрутки
				display: none;
			}

			&-track {
				//фон под ползунком
				background-color: transparent;

				&:vertical {
					width: $width-scroll;
				}

				&:horizontal {
					height: $width-scroll;
				}

				&-piece {
					//фон между ползунком и кнопкой
					&:vertical {
						width: $width-scroll;
					}

					&:horizontal {
						height: $width-scroll;
					}
				}
			}

			&-thumb {
				//ползунок
				-webkit-border-radius: 0px;
				border-radius: $radius-scroll-thumb;
				background-color: $color-scroll-thumb;
			}
		}
	```
 * Hiding ugly scrollbars in the browser
	```css
	/* Hide scrollbar for Chrome, Safari, and Opera */
	html::-webkit-scrollbar {
	display: none;
	}

	/* Hide scrollbar for IE and Edge */
	html {
	-ms-overflow-style: none;
	}

	/* Remove Scrollbar Firefox Fix, suggested in the comments */
	html {
	overflow: auto;
	scrollbar-width: none;
	}
	```

##	Анимация css

* 60 FPS	https://habrahabr.ru/post/308006/


## css flexbox

 * термины
	* container - родительский элемент
	* item - тэг на уровень ниже родительского
	*
	*
 * https://patrickbrosset.com/articles/2021-02-02-4-Weird-Tricks-To-Become-A-10x-Flexbox-Engineer/
 * https://frontender.info/a-guide-to-flexbox/
 * https://kyusuf.com/post/almost-complete-guide-to-flexbox-without-flexbox
 * https://css-tricks.com/old-flexbox-and-new-flexbox/
 * [сборник 2016](https://www.smashingmagazine.com/2016/02/the-flexbox-reading-list/)
 * [The Complete Illustrated Flexbox Tutorial](https://medium.com/p/d35c085dbf35)
 * [MDN: justify-self](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-self)
 * https://yoksel.github.io/flex-cheatsheet/
 * Вертикальная прокрутка
 	```scss
	 	.my-block {
			//уровень 0
			padding-right: 10px;//отступ справа от прокрутки если фоновый блок должен быть больше блока с прокруткой
			background-color: gray;
		 }

		.vscroll {
			// подготовка для вложенной прокрутки вертикального блока
			//уровень 1
			display: flex;
			flex-direction: column;
			align-self: stretch; //заполняем родительский контейнер по высоте
			overflow: hidden; // передаём прокрутку во 2 уровень

			&-scrollable {
				//вкладывается в контейнер с фиксированной высотой
				//уровень 2
				display: flex;
				flex-direction: column;
				padding-right: 15px; //от прокрутки
				flex-grow: 1;
				overflow-y: hidden; //чтобы не прыгала ширина при выпадании списков
				overflow-x: auto; //убираем глюки появления прокрутки
				&-xy {
					// две прокрутки
					//вкладывается в контейнер с фиксированной высотой
					//уровень 2
					display: flex;
					flex-direction: column;
					padding-right: 15px; //от прокрутки
					flex-grow: 1;
					overflow: auto;
				}
			}
		}
	```
	```html
		<!-- надо развести отступ слева и справа от прокрутки, цвет фона, учесть прыжок при появлении -->
		<div class='my-block'>
			<div class='vscroll'>
				<div class='vscroll-scrollable'>
				</div>
			</div>
		</div>
	```
 * https://tobiasahlin.com/blog/common-flexbox-patterns/

##	css grid

 * https://www.smashingmagazine.com/2018/05/future-of-web-design/
 * [Becoming a CSS Grid Ninja 05.2018](https://medium.com/@elad/becoming-a-css-grid-ninja-f4c6db018cc1)
 * https://tproger.ru/translations/css-flexbox-grid/
 * https://www.smashingmagazine.com/2018/03/understanding-logical-properties-values/
 * [проектирование UI](https://habrahabr.ru/company/ruvds/blog/350166/)
 * https://medium.freecodecamp.org/introducing-css-gridish-helping-teams-to-adapt-css-grid-today-3e031ab222de
 * https://medium.com/@PavelLaptev/learning-css-grid-with-the-swiss-2bd02e913fa
 * [Учим CSS Grid за 5 минут](https://habrahabr.ru/company/edison/blog/343614/)
 * https://www.smashingmagazine.com/2017/11/css-grid-supporting-browsers-without-grid/
 * [Как быстро спроектировать сайт с помощью CSS Grid](https://habrahabr.ru/company/edison/blog/343796/)
 * [сетка](http://css-live.ru/articles/verstka-prostoj-setki-s-folbekami-ispolzuyushhimi-direktivu-supports-feature-queries.html)
 * [медиавыражения](http://css-live.ru/articles/primenenie-mediavyrazhenij-dlya-proporcij-okna-brauzera.html)
 * http://css-live.ru/articles/eshhyo-odna-kollekciya-interesnyx-faktov-pro-css-gridy-css-grid-layout.html
 * [генератор сеток](https://cssgr.id/)
 * [Responsive tables, revisited](http://lea.verou.me/2018/05/responsive-tables-revisited/)
 * [выбор между технологиями CSS Grid Layout и CSS Flexbox Layout](https://habr.com/ru/company/ruvds/blog/448916/)
 * [Простой генератор CSS-гридов Сары Дрэснер](https://cssgrid-generator.netlify.com/)
 * [A Complete Guide to Grid 2019](https://css-tricks.com/snippets/css/complete-guide-grid/)
 * [Inspect CSS Grid 2020](https://docs.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/css/grid)
 * [Create a CSS Grid Image Gallery (With Blur Effect and Interaction Media Queries)](https://webdesign.tutsplus.com/tutorials/create-a-css-grid-image-gallery-with-blur-effect-and-interaction-media-queries--cms-32287)

###  ликбез

 *
	```scss
		@supports not (display: grid) {}

		.old-ms-grid { // ие11 поддерживает старую версию гридов
			display: -ms-grid;
			-ms-grid-columns: 15em auto 20 em;
		}

		// классическая раскладка
		html, body {
			height: 100%
		}
		body {
			display: grid;
			grid-template-columns: 15em auto 15em;
			grid-template-rows: min-content auto min-content;
		}
		header, footer {
			grid-column-start: 1;
			grid-column-end: 4;
		}
	```
 * термины
	* cells
	* gaps(gutters) - поля между ячейками
	* tracks - columns|rows
	* lines - границы дорожек
	* areas - отдельный набор ячеек
	* items - логическая структура, блок
	* explicit grid - явно определены правила
	* implicit grid - неявно, без правил, создаётся автоматическая раскладка
 * операторы
	* auto=1fr - fractional unit
	* minmax(minSize, maxSize)
	* fitcontent(maxSize) = minmax(max-content, maxSize)
	* repeat(count, ...value) - вместо числа можно auto-fill|auto-fit
	* auto-fill - заполнение
	* auto-fit - заполнение с растяжением
	* grid-template можно сократить до grid
 	* grid-auto-flow
		* column - заполнять сначала весь столбец
		* row(default) - заполнять сначала строки
		* автоматически из атрибута `dir:rtl`, `writing-mode:vertical-rl;`
		* dense `grid-auto-flow: dense row;` - разрешить заполнять предыдущие свободные места
	* grid-auto-rows - автоматически создаёт строки
	* grid-auto-columns - автоматически создаёт столбцы
	* grid-row-gap, grid-column-gap, grid-gap
	* span - режим стэка|пролётов, отсчёт от ближайшего
		* `grid-column-start: 2; grid-column-end: span 3;` = `grid-column-start: 2; grid-column-end: 5;`
		* `grid-column-start: 2; grid-column-end: 4;` = `grid-column-start: span 2; grid-column-end: 4;` - здесь отсчёт span от 4
		* `grid-column-start: 1; grid-column-end: 2;` = `grid-column-start: span 2`
 	* отрицательные lines отсчитываются с конца, 1(-3) 2(-2) 3(-1)
	 	* `grid-column: 1 / -1` - растянуть на весь родительский контейнер
 	* можно задать только `grid-column-end: span 2` без start
 	* `grid-column: $start / $end`
 	* `grid-area: $row-start / $column-start / $row-end / $column-end`
	* 1fr - fraction, одна часть, 100%
 * выравнивание
	* размер ячейки по-умолчанию max-content
	* выравнивание всего элемента grid|container - `-content`
	* выравнивание внутри ячейки - `-item`
	* выравнивание ограничено размерами родительского контейнера
	* justify - горизонтельно
	* align - вертикально
	* start, center, end
	* space-between - везде 1fr между, игнорирует внешние границы
	* space-evenly - везде 1fr, включая внешние границы
	* space-around - везде 1fr, 0,5fr во внешние границы
	* stretch - для item
	* `-content`|`-item` - для всех элементов grid
	* `-self` - для одного item
	* `order: 1` - важность|вес элемента при сортировке. Сначала самый маленький.
 * перекрытие
	* элементы с одинаковыми позициями перекрывают друг друга
	* можно пользоваться z-index
 * псевдонимы
	 * naming
	 * можно писать несколько псевдонимов для линии
	 * `grid-template-rows: [a-start] 1f [a-end middle center b-start] 1fr [b-end]`
	 *
	 	```scss
			.container {
				grid-template-columns: [edge-left] repeat(auto-fill, [block-start] 1em 2em [block-end]) [edge-right];
			}
			.block-first {
				grid-column: block-start / block-end; // для нескольких генерируемых значений с одним псевдонимом выбирается первый
			}
			.block-third {
				grid-column: block-start 3 / block-end 3; // можно указать номер линии с этим псевдонимом
			}
			.block-third {
				grid-column: block-start 3 / span 3 block-end; // можно использовать относительный номер !!! может вызвать ошибку при отсутствии смежных линий
			}
		```
	 * через псевдоним области можно задать линии `grid-column`|`grid-row`
	 	```scss
			.container {
				display: grid;
				grid-template-areas: "
					header header header
					nav main aside
					footer footer footer
				";
				grid-template-rows: min-content auto min-content;
				grid-template-columns: 10em 1fr 1fr;
				header { grid-area: header;}
				nav { grid-area: nav;}
				main { grid-area: main;}
				aside { grid-area: aside;}
				footer { grid-area: footer;}
			}
		```
	 * ограничения area псевдонимов:
	 	* нельзя L
			```css
			grid-template-areas: "
						header header header
						nav main aside
						footer footer footer
					";
			```
		* нельзя пропускать ячейки, но можно заполнять троеточием ellipsis
		```css
			grid-template-areas: "
					header ... ...
					nav main ...
					footer footer footer
				";
		```
		* в firefox нужно отжать кнопку, чтобы названия стали видны в отладчике
		* псевдонимы областей автоматом создают `-start`|`-end` линии
		* псевдонимы линий автоматом создают области
		* сокращенная запись `grid` стирает псевдонимы, потому её необходимо ставить вверху класса
 * адаптивные сетки
	* начать лучше с меньшей, а потом переходить к большим размерам экрана
 * вложенные сетки
	 * по-умолчанию стили применяются только к верхнему уровню иерархии тэгов HTML
	 * для вложенных уровней тэгов можно определить заново сетку
	 	```css
			.subgrid {
				grid-column: 1/-1;
				display: grid;
				grid-template-columns: repeat(12, 1fr);
				grid-gap: 0.5em;
			}
		```
	 * для упрощения кода можно указать subgrid
	 	```css
			.subgrid {
				grid-column: 1/-1;
				display: grid;
				grid-template-columns: subgrid;
			}
		```
	 * на 2020 год очень плохая поддержка браузеров
 * изменение размеров
	 * рост от минимального размера до максимального в зависимости от ширины родительского контейнера
	 * fractional ячейки растут во вторую очередь после minmax и auto
	 * auto растёт бесконечно, но если есть fractional - до max-content

## clearing reset очистка стилей

 * [Firefoxs reset CSS](https://hg.mozilla.org/mozilla-central/file/tip/layout/style/res/html.css)
 * [Safaris reset CSS](https://trac.webkit.org/browser/trunk/Source/WebCore/css/html.css)
 * [Chromes reset CSS](https://chromium.googlesource.com/chromium/blink/+/master/Source/core/css/html.css)
 * [Microsoft IE reset CSS](https://web.archive.org/web/20170306080528/http://www.iecss.com/)
 * [Microsoft Edge reset CSS](https://web.archive.org/web/20161031003455/http://www.iecss.com/edgehtml-13.10586.)
 * [Сброс стилей с помощью CSS Reset](https://habr.com/ru/post/45296/)
 *
	```stylus
		&-clearing
			font-family Arial, Helvetica, monospace
			-webkit-text-size-adjust 100%
			-ms-text-size-adjust 100%
			box-sizing border-box
			margin 0
			padding 0
			display block
			max-width 100%
			background-color white
			overflow: auto; //убирает статическое масштабирование для экранов уже 376
			//overflow: hidden;//убирает белую полосу при смахивании влево уже 376

			a
				&:active, &:hover
					outline 0
					cursor pointer
					cursor pointer
					text-decoration none

			html, body
				width 100%
				display inline
			ul
				display inline-block
				margin 0
				padding 0

			button
				border-style none
				padding-top 0
				padding-bottom 0
	```

### css safari

 * https://www.w3docs.com/snippets/css/how-to-fix-css-issues-on-safari.html
 * https://stackoverflow.com/questions/62408108/how-to-make-css-style-work-in-safari-browser
 * https://stackoverflow.com/questions/24899943/how-do-i-make-flex-box-work-in-safari

### button

 * https://css-tricks.com/overriding-default-button-styles/
 * можно через миксин, элемент button и часть класса [class^="button-"], [class*=" button-"]
 * https://fvsch.com/code/styling-buttons/

```css
@mixin button-reset {
	padding: 0;
	border: none;
	font: inherit;
	color: inherit;
	background-color: transparent;
	cursor: pointer;
}

.my-custom-button {
	@include button-reset;
	padding: 10px;
	background-color: skyblue;
}


```

 * а можно классом

```css
.btn {
	/* default for <button>, but useful for <a> */
	display: inline-block;
	text-align: center;
	text-decoration: none;

	/* create a small space when buttons wrap on 2 lines */
	margin: 2px 0;

	/* invisible border (will be colored on hover/focus) */
	border: solid 1px transparent;
	border-radius: 4px;

	/* size comes from text & padding (no width/height) */
	padding: 0.5em 1em;

	/* make sure colors have enough contrast! */
	color: #ffffff;
	background-color: #9555af;
}
/* old-school "down" effect on click + color tweak */
.btn:active {
	transform: translateY(1px);
	filter: saturate(150%);
}
/* inverse colors on mouse-over and focus */
.btn:hover,
.btn:focus {
	color: #9555af;
	border-color: currentColor;
	background-color: white;
}
.btn {
	/* ... */
	/* all browsers: remove the default outline since
		we are rolling our own focus styles */
	outline: none;
}

/* Firefox: removes the inner border shown on focus */
.btn::-moz-focus-inner {
	border: none;
}
/* inverse colors on hover */
.btn:hover {
	color: #9050AA;
	border-color: currentColor;
	background-color: white;
}

/* make sure we have a visible focus ring */
.btn:focus {
	outline: none;
	box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.5),
	0 0 0 1.5px rgba(255, 105, 180, 0.5);
}
/* hide focus style if not from keyboard navigation */
.js-focus-visible .btn:focus:not(.focus-visible) {
	box-shadow: none;
}

```

```css
	/**
	 * Reset button styles
	 * It takes some work to achieve a "blank slate" look.
	 */
	button {
		padding: 0;
		border: none;
		font: inherit;
		color: inherit;
		background-color: transparent;
		/* show a hand cursor on hover; some argue that we
		should keep the default arrow cursor for buttons */
		cursor: pointer;
	}

	/**
	 * Button component
	 */
	.btn {
		/* default for <button>, but needed for <a> */
		display: inline-block;
		text-align: center;
		text-decoration: none;

		/* create a small space when buttons wrap on 2 lines */
		margin: 2px 0;

		/* invisible border (will be colored on hover/focus) */
		border: solid 1px transparent;
		border-radius: 4px;

		/* button size comes from text + padding, avoid height */
		padding: 0.5em 1em;

		/* make sure colors have enough contrast! */
		color: #FFFFFF;
		background-color: #9555AF;
	}

	/* old-school "down" effect on clic + color tweak */
	.btn:active {
		transform: translateY(1px);
		filter: saturate(150%);
	}

	/* inverse colors on hover */
	.btn:hover {
		color: #9050AA;
		border-color: currentColor;
		background-color: white;
	}

	/* Firefox: remove the inner border shown on focus */
	.btn::-moz-focus-inner {
		border: none;
	}

	/* make sure we have a visible focus ring */
	.btn:focus {
		outline: none;
		box-shadow: 0 0 0 3px rgba(255, 105, 180, 0.5),
		0 0 0 1.5px rgba(255, 105, 180, 0.5);
	}

	/* hide focus style if not from keyboard navigation */
	.js-focus-visible .btn:focus:not(.focus-visible) {
		box-shadow: none;
	}

```

## css свойства

### position flow

 * https://html5book.ru/css-position/

### cursor курсор

https://css-tricks.com/can-you-rotate-the-cursor-in-css/

### css display

https://bitsofco.de/how-display-contents-works/

### line-height

https://medium.com/eightshapes-llc/cropping-away-negative-impacts-of-line-height-84d744e016ce

### css text

 * http://ecard.enter-media.org/css-text-effects/
 * [высота строки текста](https://css-tricks.com/how-to-tame-line-height-in-css/)
 * троеточие
	```css
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	```
 * [переносы текста](https://justmarkup.com/log/2019/01/a-look-at-css-hyphenation-in-2019/)
 * Disable selecting text of an element отключить выделение текста
	```css
	element {
	-webkit-user-select: none; /* Safari */
	-ms-user-select: none; /* IE 10+ and Edge */
	user-select: none; /* Standard syntax */
	}
	```
 * Change the text-selection background color
	```css
	::selection {
	color: #ececec;
	background: #222831;
	}

	```
 * Breaking the text in lines without br
	```css
	element {
	white-space: pre-wrap; /*pre-wrap*/
	white-space: pre-line; /*pre-line*/
	}
	```
 * Creating space between words
	```css
	element {
	word-spacing: 6px; /* word spacing wow such */
	}
	```
 *
 ```css
 ```
 * []()

### css images

https://bennettfeely.com/clippy/

### media max min width

https://stackoverflow.com/questions/16647380/max-width-vs-min-width

##	справочинки

 * [You Don't Need JavaScript](https://github.com/you-dont-need/You-Dont-Need-JavaScript)
 ```
    Accordion / Toggle
    Carousel
    Counter of checked check-boxes
    Flip on click
    Floating label on Textfield
    Font-Face (Latin)
    Info on hover/ Popover
    Image Gallery
    Menu
    Mobile menu off canvas
    Burger menu
    Fancy menu
    Modal/Popup
    Mouse tracking
    Parallax scrolling
    Tabs
    Todo List
    Tooltips
    Treeview
    Twitter Heart Animation
    Dynamic Image Colorizing
    Ripple Effect
    Responsive Counter Showing # of Items That Didn't Fit Screen
 ```
 * http://cssreference.io/positioning/
 * https://float-layout.glitch.me/
 * vertical align
	* https://habrahabr.ru/company/netcracker/blog/277433/
	* http://christopheraue.net/2014/03/05/vertical-align/
 * центрирование
	* http://frontender.info/centering-css-complete-guide/
	* https://habrahabr.ru/post/238449/
 * [@](http://frontender.info/the-at-rules-of-css/)
 * [быстрая загрузка](http://css-live.ru/articles/budushhee-zagruzki-css.html)
 * [tabbar](http://jsfiddle.net/Vandeplas/hsELW/)
 * z-index
	* https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Positioning/Understanding_z_index
	* https://habrahabr.ru/post/166435/
 * [media и media-only](http://stackoverflow.com/questions/8549529/what-is-the-difference-between-screen-and-only-screen-in-media-queries)
 * [device-width и max-device-width](http://stackoverflow.com/questions/6747242/what-is-the-difference-between-max-device-width-and-max-width-for-mobile-web)
 * window.innerWidth window.outerWidth
 * window.screen.width window.screen.availWidth
 * [navigator.platform](http://stackoverflow.com/questions/19877924/what-is-the-list-of-possible-values-for-navigator-platform-as-of-today)

## padding margin box model

 * https://www.joshwcomeau.com/css/rules-of-margin-collapse/
 * [padding/margin](https://habrahabr.ru/company/netcracker/blog/281008/)

## cross-browser

 * https://modernizr.com/
 * https://github.com/afarkas/html5shiv
 * http://meyerweb.com/eric/tools/css/reset/reset200802.css
 * https://necolas.github.io/normalize.css/

##	adblock

 * http://w3guy.com/detecting-adblock/
 * https://github.com/sitexw/FuckAdBlock/blob/master/fuckadblock.js

##	вёрстка почтовых рассылок e-mail письма

 * https://www.smashingmagazine.com/2017/01/introduction-building-sending-html-email-for-web-developers/
 * https://habrahabr.ru/post/252279/
 * https://habrahabr.ru/company/pechkin/blog/255819/
 * https://habrahabr.ru/post/180013/
 * https://blog.edmdesigner.com/css-inliner-tools-in-email/

## карусель

 * чистый css, без смахиваний, только кнопки
	 * https://medium.com/@_jh3y/how-to-pure-css-carousel-ce1a8cb231c8
	 * https://www.mobila.name/post/53df6f9da9ec5
 * [непрерывные смахивания](https://css-tricks.com/creating-responsive-touch-friendly-carousels-with-flickity/)
 * [статические смахивания](https://owlcarousel2.github.io/OwlCarousel2/docs/api-options.html)
 * [swipe свайп](https://css-tricks.com/simple-swipe-with-vanilla-javascript/)

## валидация форм

 * https://www.quirksmode.org/blog/archives/2017/12/native_form_val.html
 * https://css-tricks.com/form-validation-part-1-constraint-validation-html/
 * https://daverupert.com/2017/11/happier-html5-forms/
 * http://html5pattern.com/

## <select> dropdown

 * [стилизация select 2019](https://css-tricks.com/the-current-state-of-styling-selects-in-2019/)
 * https://moderncss.dev/custom-select-styles-with-pure-css/

##	шаблонизаторы препроцессоры

 * [шаблонизатор temple](https://habrahabr.ru/company/oleg-bunin/blog/310868/)

### scss sass

 * [генерирование классов](https://frontstuff.io/generate-all-your-utility-classes-with-sass-maps)

## постпроцессоры

 * https://www.postcss.parts/

## стилизованные элементы управления

 * [radio](https://www.filamentgroup.com/lab/select-css.html)
 * [check](https://www.youtube.com/watch?v=E6kLaaQFctU) https://glitch.com/edit/#!/14-pepelsbey?path=images.html:1:0
