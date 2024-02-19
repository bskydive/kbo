# WEB

 * SPA vs MPA
	* pros/cons
 * SSR
	* pros/cons

 1. Оптимизация:


## производительность

 * repaint/reflow
 * Критические этапы рендеринга [critical render path](https://developer.mozilla.org/ru/docs/Web/Performance/Critical_rendering_path)
	* Загрузка веб-страницы или приложения начинается с запроса HTML
	* HTML преобразуется в DOM-дерево
	* Ссылки на внешние ресурсы порождают новые запросы HTML: файлы стилей, скриптов, ссылки на изображения.
	* Некоторые запросы являются блокирующими
	* браузер конструирует CSSOM модель.
	* CSS-правила ниспадают каскадом. вложенные узлы наследуют стили от родительских.
	* Если формирование DOM инкрементально, CSSOM - нет. CSS блокирует рендер. Инкрементальная обработка недоступна для CSS, потому что набор следующих правил может перезаписать предыдущие. Это может привести к лишнему вызову компоновки и перерасчёта стилей.
	* браузер строит дерево рендера (render tree), в котором вычисляет стили для каждого видимого элемента страницы.
	* компоновка (layout), которая определяет положение и размеры элементов этого дерева.
 	* страница рендерится. Или "отрисовывается" (paint) на экране.
 * профилирование и оптимизация
 	* JS/CSS/DOM/SVG/Шрифты/Файлы
	* https://developer.mozilla.org/en-US/docs/Learn/Performance/CSS
	* https://developer.mozilla.org/en-US/docs/Learn/Performance/Multimedia
	* https://developer.mozilla.org/en-US/docs/Learn/Performance/JavaScript
	* https://developer.mozilla.org/en-US/docs/Learn/Performance/HTML
	* сеть
	* утечки памяти
 * отладка
	* JS/CSS/DOM
	* сеть
 * обфускация и минификация
	* JS/CSS/HTML
 * Долгие вычисления Long computations
 * Framework optimization techniques (Angular, React, or others)
 * RAIL
 * SVG vs canvas (with prior experience)
 * Service workers / Web workers

## Сеть

 * articles-manager/теория/сети.md

## Сборщики

 * NPM и YARN в чем разница?
 * Как достать конфигурацию из Angular CLI с помощью Webpack.
 * новинки webpack

## CSS

 * Пре/пост процессоры
	* LESS, SASS/SCSS, Stylus, PostCSS, tailwind
 * Методологии
	* BEM, OOCSS, SMACSS, ITCSS, Atomic CSS
 * семантичная вёрстка
 * [Медиа запросы](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Media_queries)
	* `@media media-type and (media-feature-rule) {`
	* media-type: all, print, screen
	* [and/not/or](https://developer.mozilla.org/en-US/docs/Web/CSS/@media#logical_operators)
		* `@media not all and (min-width: 600px), screen and (orientation: landscape) {`
	* [media-feature-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries#media_features)
		* описывают свойства user-agent, устройства или окружения
 * [типовые раскладки](https://developer.mozilla.org/en-US/docs/Web/CSS/Layout_cookbook)
 * [отзывчивый дизайн раскладок](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Responsive_Design)
	* статическая/overflow
	* резиновая/Responsive
	* адаптивная
	* Mobile/Desktop First
 * Progressive Enhancement vs Graceful Degradation approaches
 * Анимация
	* типы: js/css/framework
	* CSS анимации
 * CSS переменные
 * colors
 * fonts
 * Блочная модель box-model
 * [Позиционирование](https://developer.mozilla.org/ru/docs/Web/CSS/position)
	* static
		* не работают top, right, bottom, left, z-index
		* позволяет элементу находиться в обычном его состоянии, расположенном на своём месте в документе
		* значение по умолчанию.
	* relative
		* работают top, right, bottom, left, z-index
		* новый стыкующийся контекст если z-index !== auto
	* absolute
		* относительно relative или absolute
		* Если элемент имеет поля, они добавляются к смещению
		* выход из основного потока
	* fixed
		* как absolute
		* игнорирует прокрутку
	* sticky
		* прилипает(игнорирует прокрутку) на значение не менее установленных top, right, bottom, left
		* гибрид относительного и фиксированного позиционирования
    * Позиционируемый элемент — все, кроме static
    * Относительно позиционируемый элемент relative
    * Абсолютно позиционируемый элемент — absolute или fixed
    * Элемент с липкой позицией — sticky
 * display
	* none
	* inline
	* inline-block
	* block
	* flex
	* grid
	* table
 * подходы к кроссбраузерной вёрстке: сброс и нормализация(более предсказуемый вид ранее не использованных тэгов)
 * https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_shadow_DOM

### HTML

 * iframe - браузер в браузере, browsing context, своя история сессии
 * семантичная вёрстка
 * [https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API](Intersection Observer API) lets code register a callback function that is executed whenever an element they wish to monitor enters or exits another element (or the viewport)
 * mutation observer
	* https://developers.google.com/web/updates/2012/02/Detect-DOM-changes-with-Mutation-Observers
		```js
			//Here's an example of listing inserted nodes with Mutation Events:

			var insertedNodes = [];
			document.addEventListener("DOMNodeInserted", function(e) {
				insertedNodes.push(e.target);
			}, false);
			console.log(insertedNodes);

			//And here's how it looks with Mutation Observers:

			var insertedNodes = [];
			var observer = new MutationObserver(function(mutations) {
				mutations.forEach(function(mutation) {
				for (var i = 0; i < mutation.addedNodes.length; i++)
					insertedNodes.push(mutation.addedNodes[i]);
				})
			});
			observer.observe(document.documentElement, { childList: true });
			console.log(insertedNodes);
		```
## ИБ

 * CORS
 * [CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
 * Авторизация
	* JWT
	* OAuth
	* Basic
	* Cookie based
	* SSO
 * HTTP заголовки
	* strict-transport-security
	* x-frame-options
	* HttpOnly cookies
	* content-security-policy
	* x-xss-protection
	* HTTP Strict Transport Security (HSTS)
	* HTTP Public Key Pinning (HPKP)
 * Атаки
 	* OWASP Top 10
	* SQL Injection
	* XSS
	* [CSRF](https://owasp.org/www-community/attacks/csrf)
	* DoS
	* Password Attack
	* Man-in-the-Middle
	* Eavesdropping Attack
	* Insider Threats
	* Drive-By Download Attack
	* theft of credentials or an escalation of permissions
	* CSRF
	* Phishing
	* Malicious redirects
 * Разрешение инцидентов
	* monitoring
	* logging
	* firewalls
	* headers
	* packages i.e. "helmet" package
 * JWT
	* Где лучше хранить JWT в cookie или localstorage. Почему?

## Проектирование/шаблоны

 * articles-manager/теория/шаблоны.md

## SQL

 * http://sqlfiddle.com/
 *

## бесконечная прокрутка

 * intersection observer
 * scroll+debounce