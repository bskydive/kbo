##  HTML5

 * histori api
 * [Прекратите использовать location.hash, да здравствует HTML5 History API!](https://habrahabr.ru/post/200106/)
 * [Hash-навигация в AJAX-сайтах](https://habrahabr.ru/post/114911/)
 * https://developers.google.com/web/
 * [HTML5 Input Types: Where Are They Now? 2019](https://www.smashingmagazine.com/2019/01/html5-input-types/)
 * [используй DOM как профессионал 2019](https://proglib.io/p/ne-pasi-zadnih-ispolzuy-dom-kak-professional-2019-09-11)

## HTML drag and drop

 * [перетаскивание](https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
 * [Using the HTML5 Drag and Drop API](https://web.dev/articles/drag-and-drop?hl=en)


## http2

 * бинарный, многопоточная загрузка в одном соединении TCP, server push(promise push), TLS, сжатие и подрезка заголовков
 ```html
	<link rel='dns-prefetch' href='//xxx.com'>
	<link rel='preconnect' href='//xxx.com'>
	<link rel='prefetch' href='/some.html' as='html'>
	<link rel='prefetch' href='/some.js' as='script'>
	<link rel='prefetch' href='/theme.css' as='style'>
	<!--><audio><video> </-->
	<link rel='preload' href='' as='media'>
	<!--><script> </-->
	<link rel='preload' href='' as='script'>
	<!--> </-->
	<link rel='preload' href='' as='style'>
	<!--><img><picture><image> </-->
	<link rel='preload' href='' as='image'>
	<!-->service worker </-->
	<link rel='preload' href='' as='worker'>
	<!--><embed> </-->
	<link rel='preload' href='' as='embed'>
	<!--><object> </-->
	<link rel='preload' href='' as='object'>
	<!--> <iframe> <frame> </-->
	<link rel='preload' href='' as='document'>
 ```
 * nghttp прокси и набор утилит для отладки
 * [HTTP/2 уже здесь но спрайт-сеты ещё не умерли. перевод](https://habrahabr.ru/post/308862/)
 * [Что надо знать о HTTP/2 2016 Майоров](https://www.youtube.com/watch?v=4yyhqMh9FcY)

## iframe

 * загружает по ссылке, можно текст из URL BLOB https://dev.to/pulljosh/how-to-load-html-css-and-js-code-into-an-iframe-2blc
 * [Исчерпывающий путеводитель по тегу iframe](https://habr.com/ru/post/488516/)
 * https://blog.theodo.com/2018/01/responsive-iframes-css-trick/
 * https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
 * https://javascript.info/cross-window-communication

## favicon

https://mobiforge.com/design-development/adding-favicons-in-a-multi-browser-multi-platform-world

## validation

 * https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/Constraint_validation
 * автодополнение
    https://developer.mozilla.org/ru/docs/Web/HTML/Element/Input
    https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete
    https://developers.google.com/web/updates/2015/06/checkout-faster-with-autofill

## производительность

 * [link preload](https://www.smashingmagazine.com/2016/02/preload-what-is-it-good-for/)
 * [Оптимизация загрузки изображений](https://habr.com/ru/post/482820/)
 * [How to Optimize Page Load Times: A Different Slant on the Frustration Index](https://calendar.perfplanet.com/2019/how-to-optimize-page-load-times-a-different-slant-on-the-frustration-index/)


