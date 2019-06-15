## pug


 1. Использовать миксины pug для ускорения во время исполнения. Повторяшки делаются во время сборки 
 
	```pug
		mixin card(url,imgFileName,altText,text, url2, text2)
			li
				a(href= url, target="_blank")
					img(src="img/" + imgFileName, alt= altText)
					.c-portfolio-thumbnail-label.c-portfolio-text-b
						p= text

		+card(
		"https://profgallery.ru","pg_thumb.jpg","Thumbnail of screenshot",
		"HR портал на angularJS")
		+card(
		"https://stepanovv.ru/store","bookstoreclient_thumb.png","Thumbnail of screenshot",
		"Веб-клиент сервиса книжного магазина на Angular5")
	```
 1. заключать все круглые и квадратные скобки, спецтеги(*ngIf) в кавычки
 1. убирать табы/пробелы в конце строк
 1. использовать ginie.pug2html плагин vscode для устранения косяков препроцессора
 
