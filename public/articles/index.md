# Почитайка

Это репозиторий для совместной работы над статьями.

Раньше я писал на medium, однако там появилась неприятная практика ограничения [доступа](https://wptavern.com/freecodecamp-moves-off-of-medium-after-being-pressured-to-put-articles-behind-paywalls).

Через git можно клонировать к себе статьи, [наблюдать](https://gitlab.com/stepanovv/kbo/activity) за их изменениями. Есть [RSS](https://gitlab.com/stepanovv/kbo.atom).

Статьи, в основном, для разработчиков, потому можно читать и в IDE.

Для англоязычной аудитории статьи опубликованы в DevTo.

## Ссылки

 * [Medium](https://medium.com/@stepanovv.ru)
 * DevTo
	* [JS code quality starter pack: linters, conventions, best practices](https://dev.to/bskydive/javascript-code-conventions-starter-pack-3jff)
 * git HTML:
	* [От дизайна до кода без совещаний. Страшная сила красоты](https://stepanovv.ru/articles/public/страшная%20сила%20красоты/страшная%20сила%20красоты.html)
	* [Советы про удалёнку в карантине](https://stepanovv.ru/articles/public/Советы%20про%20удалёнку/советы%20про%20удалёнку.html)
	* [Шаг в виртуальность](https://stepanovv.ru/articles/public/шаг%20в%20виртуальность/шаг%20в%20виртуальность.html)
	* [JS code quality starter pack](https://stepanovv.ru/articles/public/JS%20code%20quality%20starter%20pack/js%20code%20quality%20starter%20pack.html)
	* [100 операторов rxjs](https://stepanovv.ru/articles/public/100%20операторов%20rxjs/100%20операторов%20rxjs.md)
	* [Качество кода](https://stepanovv.ru/articles/public/качество%20кода/качество_кода.html)
 * git markdown:
	* [От дизайна до кода без совещаний. Страшная сила красоты](https://gitlab.com/stepanovv/kbo/-/blob/master/public/articles/public/страшная%20сила%20красоты/страшная%20сила%20красоты.md)
	* [Советы про удалёнку в карантине](https://gitlab.com/stepanovv/kbo/-/blob/master/public/articles/public/Советы%20про%20удалёнку/советы%20про%20удалёнку.md)
	* [Шаг в виртуальность](https://gitlab.com/stepanovv/kbo/-/blob/master/public/articles/public/шаг%20в%20виртуальность/шаг%20в%20виртуальность.md)
	* [JS code quality starter pack](https://gitlab.com/stepanovv/kbo/-/blob/master/public/articles/public/JS%20code%20quality%20starter%20pack/js%20code%20quality%20starter%20pack.md)
	* [100 операторов rxjs](https://gitlab.com/stepanovv/kbo/-/blob/master/public/articles/public/100%20операторов%20rxjs/100%20операторов%20rxjs.md)
	* [Качество кода](https://stepanovv.ru/articles/public/качество%20кода/качество_кода.md)

## Как отправить изменения

 * [конвертировать](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf) `md` в `html`
 * отправить в репу

	```bash
		cd public/articles/
		npm i
		npm run spell
		git push origin develop
	```
 * сделать запрос: https://gitlab.com/stepanovv/articles/-/merge_requests

## ЗЫ

 * проверено [yaspeller](https://yandex.ru/dev/speller/)
 * [Контакты автора](https://stepanovv.ru/portfolio/portfolio.html#id-contacts)
 * поставить звёздочку в [gitlab](https://gitlab.com/stepanovv/kbo)
 * похлопать в [medium](https://medium.com/@stepanovv.ru/)
