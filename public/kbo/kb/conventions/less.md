# Соглашения про LESS/CSS

## Формат и организация кода

1. Отступы кодируются табуляцией, чтобы каждый мог установить комфортный ему размер отступов, не меняя код в репозитории.
1. Включить проверку орфографии, чтобы облегчить рефакторинг. Плагина необходимо два, и ещё их надо активировать. 
	* `streetsidesoftware.code-spell-checker`
	* `streetsidesoftware.code-spell-checker-russian`
1. Сразу ориентироваться на библиотеку стилей. Для этого разбить стили на модули:
	* clear.scss - все общие стили body,*,html.тэги
	* variables.scss - все общие переменные шрифты,украшения, цвета, размеры.
	* имяБлока.scss - на каждый блок свой файл стилей для импорта в компоненты ангуляр.


## взаимодействие с дизайнером

1. Проверять плагином https://chrome.google.com/webstore/detail/perfectpixel-by-welldonec/dkaagdgjmgdmbnecmcefdhjekcoceebi расстояние между строками/блоками. Публикуем скрины со сравнением в задачу/чат. И помним, что +-3 пикселя - это норм.
1. Дизайнеры иногда косячат, когда много повторяющихся строк/столбцов. Интервалы должны быть вроде одинаковые, но рука дрогнула. Такую кривизну необходимо обсудить и устранять.
1. Проверять вёрстку только с импортированными общими стилями из проекта.

## Шрифты

1. Использовать шрифт iconfont из векторных svg изображений для отображения иконок там, где это возможно. Вектор экономит траффик, шрифт экономит и унифицирует код.
1. Сделать в icomoon.io и поддерживать тестовый preview.html для шрифтов в репу для ускорения поиска названия иконки.
1. Шрифт необходимо модифицировать через icomoon app. Для этого необходимо сохранять не только шрифт, но и исходники.
	* Выгрузить и распаковать самый поздний архив со шрифтом
		* Проверить контрольные суммы файлов шрифтов в проекте и из архива. Они должны совпадать.
		* `sha256sum -b src/assets/fonts/iconfont/*` 
		* `sha256sum -b designthings/шрифт/iconfont_2017.08.30_18.41_42_font/fonts/*`
		* Если не совпали - ищи более свжий архив с исходниками или конвертируй шрифт в svg спрайт
		* Загружаем selection.json в [icomoon](https://icomoon.io/app/). Если json потерян, можно загрузить svg спрайт, но слетят все настройки и порядок иконок.
		* `меню справа "три палочки" --> remove set`
		* `меню вверху слева "+" --> import icons`
	* Новые иконки необходимо подготовить в inkScape
    	* Высота иконки и документа 32px, положение иконки по центру вертикально и горизонтально
    	* Перед изменением размера иконки необходимо зафиксировать соотношение сторон - "замочек" между шириной и высотой в меню
    	* Если иконка не квадратная, то будут проблемы с выравниванием.
    	* Иконки должны быть объединены в один контур (ctrl+k). 
    	* После разгруппировки (shift+ctrl+g) контур не распадается на фигуры, их нельзя растащить мышкой.
    	* Цвет заливки - чёрный #000000. Он будет изменяться при помощи CSS: color
	* Для добавления новой иконки
		* `меню вверху слева "+" --> import icons`
		* Название иконки пишем через тире, без префикса `icon-`, т.к. он добавляется автоматически
	* Для удаления икноки её необходимо убрать из выделенных
	* Для выгрузки шрифта необходимо перейти на вкладку справа внизу `Generate Font`
		* Настройки шрифта - `"шестерёнка"` справа от `download` оставляем по-умолчанию, за исключением версии
		* `"Font name"` - `iconfont`
		* `"Class prefix"` - `icon-`
		* `"support ie8"` - включаем для генерации ttf
		* `"Em square height"` - `1024`
		* `"Baseline Height"` - `14.2857`
		* `"Whitespace width"` - `25`
		* `"version"` - `MMDD` `HHmm`
		* `"generate variables for"` - `less`
		* `"CSS selector"` - `use attribute selector`
		* Имя файла для архива шрифтов: `iconfont_2017.08.30_18.41_42_font.zip` Указываем дату, время, количество иконок
	* После выгрузки шрифтов архив необходимо сохранить в [репозитории git]()
	* Для выгрузки исходников - `genegrate svg and more` слева внизу
		* Настройки исходников - `"шестерёнка"` справа от `download` оставляем по-умолчанию
		* `Class prefix` - `icon-`
		* `use class selector` - `.icon`
		* `color` - `000000`
		* `Photoshop custom shapes` - `+`
		* `Tiles` - `+`
		* `Sprite columns` - `16`
		* `Margin` - `16`
		* Имя файла для архива исходников: `iconfont_2017.08.30_18.41_42_icons.zip` Указываем дату, время, количество иконок
	* После выгрузки исходников архив необходимо сохранить в [репозитории git]()
	* Для добавления шрифта в проект необходимо распаковать `iconfont*_font.zip`
		* Четрыре файла шрифтов из `iconfont_2017.08.30_18.41_42_font/fonts/` копируются с заменой в `web/assets/src/assets/less/fonts/`
		* Меняем файл `web/assets/src/assets/less/fonts/iconfont.less` 
		* Оставляем без изменений верхнюю строку `@icomoon-font-path : "../../fonts/iconfont";` Остальное содержимое стираем
		* Добавляем содержимое из `iconfont_2017.08.30_18.41_42_font/fonts/variables.less` за исключением верхней строчки `@icomoon-font-path: "fonts";`
		* Добавляем содержимое из `iconfont_2017.08.30_18.41_42_font/fonts/style.less` за исключением верхней строчки `@import "variables";`
		* Для многоцветных иконок необходимо чуть доработать напильником, т.к. штатные margin и `icon- .path` не заработали
		* Если иконки только добавляли, и загружали через json, то достаточно добавить новые строчки про иконки из `variables.less` и `style.less`, а также меняем `@font-face` 
        * Если иконки удаляли или рефакторили, то оставляем без изменений только верхние строки
			```less
			[class$="-path1"], [class*="-path1"], [class$="-path2"], [class*="-path2"], [class$="-path3"], [class*="-path3"] {
             	position: absolute;
             }
            ```
        * Меняем названия классов и конвертируем смещение
        	```less
        	.icon-users .path2 {
            	&:before {
            		content: @icon-users-path2;
            		margin-left: -1.1259765625em;
            		color: rgb(44, 47, 51);
            	}
            }
        	```
        	на
        	```less
        	.icon-users-path2 {
            	&:before {
            		content: @icon-users-path2;
            		left: -18px;
            		color: rgb(44, 47, 51);
            	}
            }
        	```
        * добавляем в PUG стили всех частей иконки и структуру под `position:absolute`
			```pug
			.c-counter-icon
				.c-counter-icon-applicant
					.icon-users-path1
					.icon-users-path2
					.icon-users-path3
			```
		* в less компонента добавляем
			```less
				&-icon {
            		display: inline-block;
            		vertical-align: text-bottom;//дополнительное выравнивание по вертикали
            		margin-bottom: -2px;//дополнительное выравнивание по вертикали
            		margin-right: 19px;
            		position: relative;//опора для иконок
            		width: 57px;
            
            		&-applicant {
            			position: absolute;
            			font-size: 32px;
            			bottom: 37px;
            			left: 9px;
            		}
         		}
			```
	* Пересобираем проект, проверяем наличие иконок		
1. Добавлять минимум шрифтов. Курсив точно не нужен, он сильно утяжеляет сборку. Баузер сам выбирает что лучше загрузить по весу файла и скорости сети, имхо. ttf толще, но быстрее грузится. woff2 - наоборот


## svg

1. Выбираем для иконок svg подключение по url, хранение в отдельных файлах
 
	```pug
		svg.icon.icon--arrowDown
			use([attr.xlink:href]="getIconPath('iconName')") //-->img/icon--iconName.svg#icon--iconName
	```
	* HTML+CSS должен стоить дороже CSS. У нас DOM перегружен. 
	* В спрайтах/шрифтах есть проблема версионности. непонятно какие иконки поменялись. Шрифты намного более сложно обновлять. Надо менять 3-4 файла, и целиком стиль. Тут можно только сам стиль менять.
	* fill наследуется от элемента к svg
1. иконки интерактивных элементов навешивать на отдельный тэг, чтобы видеть тэг в исходниках.
 
	```pug
		input.app-blockName-activator(
			id='{{ "id-blockName-"+blockItem.value }}'
			type="checkbox"
		)
		.app-blockName
			label.app-blockName-control(
					for='{{ "id-blockName-"+blockItem.value }}'
				) надпись
				svg.app-blockName-icon
					use([attr.xlink:href]="getIconPath('iconName')") //-->img/icon--iconName.svg#icon--iconName
	```
1. названия иконок должны описывать иконки, а не их действия, чтобы можно было представлять как они выглядят по их названию. На действие могут потом другую иконку повесить. Если разработчик новый - он не сразу поймёт где какое действие находится.

## Приёмы программирования
	
1. Объявление кнопок через a или button
	```pug
		a.c-bootstrap-button.c-bootstrap-button-large.c-bootstrap-button-white.c-bootstrap-button-white-filled(href='/soiskatel' target='blank') Создать резюме
			a.c-bootstrap-button.c-bootstrap-button-large.c-bootstrap-button-white(href='/rabotodatel' target='blank') Разместить вакансию
	```
1. Структура каталогов примерно соответствует проектной. pug должен лежать в одном каталоге с scss, т.к. они оба импортируются в .ts файл компоненты. Исключение - общие стили, они бьются по предметной области - шрифты, иконки, сбросы

1. использовать только человеко-понятные названия классов. 
	* `f_chB --> app-js_checkbox --> app{js{ &-checkbox{}}}`
	* `b-filterItem_bvar --> app-b-filterItem_expandable --> app{&-b{&-filterItem{&_expandable{}}}}`

1. Файлы-переменные находятся только внутри использующей их папки-компонента для удобства миграции кода.

1. Директива PUG/PUG/LESS `import` используется только внутри папки-компонента. У компонента могут быть подпапки, например, для блоков страницы. В них допустимо ссылаться на родительскую папку `../`, т.к. это неотделимые от компонента части. 

1. Следует использовать JS/PUG/LESS отдельно и по назначению. Нежелательно менять CSS код внутри компонета при помощи JS. Это существенно ограничивает используемые возможности CSS, затрудняет рефакторинг и миграцию кода. 

1. Слова в названиях классов LESS разделяются `-`, "шашлычный стиль", без прописных букв.

1. Названия классов должны начинаться с префикса `app-`, названия идентификаторов с `i-` для того, чтобы их можно было отличать друг от друга и от классов библиотек jQuery/Bootstrap/Angular* при отладке.

1. Названия классов в less должны быть вложенными. Это экономит код LESS за счёт PUG, и упрощает рефакторинг за счёт наследования(перекрытия стилей). 
	90% кода вёрстки находится в LESS против 10% внутри PUG.
	```less
		.c-landing-project {
        	&-comfort {
        		&-cards {
        
        			> ul {
        				> li {
        					> a {
        						&:hover {
        						}
        					}
        				}
        			}
        
        			.card {
        
        				> h5 {
        					font-size: 15px;
        					line-height: 1.65;
        				}
        				.icon {
        					color: @var-color-bright-blue;
        
        					.podium {
        						@media (max-width: 767px) {
        							font-size: 100px;
        						}
        
        						@media (min-width: 768px) {
        							font-size: 100px;
        						}
        
        						@media (min-width: 992px) {
        							font-size: 120px;
        						}
        					}
        				}
        			}
        		}
        	}
        }
	``` 

1. Для размеров текста НЕ используем pt, используем px, т.к. размер текста сильно будет отличаться от картинки.

1. При определении стилей `<a>` внутри :hover необходимо также переопределть стили :focus, как минимум color и text-decoration, 
	иначе после перехода по сссылке, применятся унаследованные стили.

1. Для того, чтобы при изменении текста многоколоночная вёрстка карточек оставалась стабильной, необходимо:
 	* использовать одинаковую высоту и ширину каждой карточки.
 	* задавать сокрытие лишнего текста - overflow:hidden; 

1. @media выражения крайне желательно помещать внутрь классов. Разделение стилей класса по нескольким местам в файле ухудшает удобство отладки. 
	#### Хорошо:
	```less
		.с-main-page {
			&-comfort {
				&-header {
					@media (max-width : 767px) {
						padding-bottom : 21px;
						font-size      : 12px;
					}
					
					@media (min-width : 768px) {
						padding-bottom : 10px;
					}
					
					@media (min-width : 992px) {
						padding-bottom : 30px;
					}
					
					@media (min-width : 1200px) {
						padding-bottom : 33px;
						font-size      : 18px;
					}
				}
			}
		}
	```

	#### Плохо:
	```less
		@media (max-width : 767px) {
			.с-main-page-comfort-header {
				padding-bottom : 21px;
				font-size      : 12px;
			}
		}
		
		@media (min-width : 768px) {
			.с-main-page-comfort-header {
				padding-bottom : 10px;
			}
		}
		
		@media (min-width : 992px) {
			.с-main-page-comfort-header {
				padding-bottom : 30px;
			}
		}
		
		@media (min-width : 1200px) {
			.с-main-page-comfort-header {
				padding-bottom : 33px;
				font-size      : 18px;
			}
		}
	```
	
1. Ограничения для дизайна по ширине экрана(контента):
	* 375(315),768(708),992(932),1200(1140),
	* автоматические margin для промежуточных значений,
	* фон заполняет всю ширину экрана
	* для ширины 0-375 контент/кнопки растягивается автоматически на 100%

1. Для @media устанавливается шаблон их использования, который подходит к обозначениям разных разрешений макетов.
	
	#### Названия макетов: 
	* *-375.psd
	* *-768.psd
	* *-992.psd
	* *-1200.psd
	
	#### Полный шаблон: 
	
	Здесь подразумевается наследование стилей, что сильно экономит время при первоначальной вёрстке сложных адаптивных блоков. 
	При этом, важно следить за строгой иерархией классов, чтобы стили внутри медиавыражений корректно перекрывали друг друга. 

	```less
		&-button{
	
			@media (max-width : 767px) {
			
			}
			
			@media (min-width : 768px) {
				
			}
			
			@media (min-width : 992px) {
				
			}
			
			@media (min-width : 1200px) {
				
			}
		}
	```
	
	### Примеры:

	#### Полный шаблон: 

	```less
		&-button{
	
			@media (max-width : 767px) {//здесь исключение вместо min-width:376px, т.к. необходимо захватить от 0 до 375
				padding-bottom : 21px;
				font-size      : 12px;
			}
			
			@media (min-width : 768px) {//*-768.psd
				padding-bottom : 10px;
			}
			
			@media (min-width : 992px) {//*-992.psd
				padding-bottom : 30px;
			}
			
			@media (min-width : 1200px) {//*-1200.psd
				padding-bottom : 33px;
				font-size      : 18px;
			}
		}
	```
	
	#### частичный шаблон: 
	```less
		> h3 {
	
			@media (max-width : 991px) {//*-375.psd, *-768.psd
				padding-top    : 47px;
			}
	
			@media (min-width : 992px) {//*-992.psd, *-1200.psd
				padding-top    : 49px;
			}
		}
	
		> a {
			@media (max-width : 767px) {
				margin-top : 35px;
				font-size  : 12px;
			}
	
			@media (min-width : 768px) {
				margin-top : 33px;
				font-size  : 14px;
			}
	
			@media (min-width : 992px) {
				margin-top    : 35px;
			}	
		}
	```
	
	#### При использовании max-width придётся использовать перевёрнутый шаблон, иначе не сработает CSS:
	
	```less
		&-button{
			@media (min-width : 1200px) {//*-1200.psd
    				
			}

			@media (max-width : 1199px) {//*-992.psd
				
			}

			@media (max-width : 991px) {//*-768.psd
				
			}

			@media (max-width : 767px) {//*-375.psd
			
			}
		}
	```

1. Избегать использования !important;. Стили зачастую накладываются в несколько слоёв, а !important; потребует рефакторить исходный компонент.
	
1. В случае необходимости перекрывать стили директивой !important, необходимо комментировать что и где перекоывается
 
	```less
		a {
			&:hover{
				text-decoration: none !important; //перекрытие унаследованного стиля src/less/base.less:81
			}
		}
	```

1. Общие стили документа вынесены в bootstrap.less, префикс классов .c-bootstrap-*. Для главной страницы договорились не использовать стили фреймворков

1. Стандартные имена классов:
	* section - секция блоков в PUG, содержит min-height, background-*
	* *-col-* - столбец для выравнивания нескольких элементов в одной строке. Не обязательно вкладывать в *-row-*, это самодокументирование кода.
	* *-row-* - строка
	* Там, где допустимо использовать bootstrap grid, используем стандартные row/col

1. Свойства пишутся без сокращений: background-color, background-width, padding-left

1. Стандартная структура главной страницы и лендингов. Заготовка для решения проблемы индексации SPA для SEO
	```pug
		section.c-header-section
			include menu
			include header
		section.c-search-section
			include search
		section.c-vacancies-section.c-bootstrap-clearfix
			vacancies-short-list
		section.c-targets-section
			include targets
		section.c-publications-section
			include publications
		section.c-footer-section
			include footer
	```

1. Стандартная структура элементов для стиля блока(pug/PUG). Используется там, где нельзя использовать bootstrap grid стили container/row/col
	```pug
		.c-bootstrap-row.c-bootstrap-container
			.c-header-col-left
				.c-header-stepanovv-img
		a(href='//stepanovv.ru' target='_blank')
		img.c-header-stepanovv-img-large(src="/img/main-page/stepanovv.png" alt='stepanovv' title='stepanovv')
				.c-header-title 
		p Карьерный ресурс для руководителей, готовых сделать следующий шаг
			.c-header-col-left-buttons
				a.c-bootstrap-button.c-bootstrap-button-large.c-bootstrap-button-white.c-bootstrap-button-white-filled(href='/soiskatel' target='blank') Создать резюме
	```
	
1. Указывать везде (**min**-width: 375/768/992/1200) - точно

1. Указывать везде (**max**-width: 374/767/991/1199) - на 1 меньше

1. Воздерживаться от использования position:absolute, предпочитать float. Это облегчает дальнейший рефакторинг.

1. Для изменения фона родителя при наведении на потомка необходимо использовать составные селекторы, т.к. фон потомков перекрывает фон родителя
	https://codepen.io/anon/pen/MVoyEP?editors=1100
	```pug
		.c-list-stacked
			.c-list-stacked-item
				//two below elements should change their bg-color to grey at hover on above element
				.c-list-stacked-item-name 1111
				.c-list-stacked-item-type 222
	```

	```stylus
		.c-list-stacked 
        	font-size 14px
        	display block
        	
        	&-item 
        		width 100%
        		display inline-block
        		position relative
        
        		&-name
        			color black
        			background-color white
        			width 49%
        			padding 6px
        			display inline-block
        
        		&-type 
        			color grey
        			width 49%
        			padding 6px
        			background-color lightgrey
        			display inline-block
        		
        		&:hover &-name, &:hover &-type
        			background-color red;
        			cursor pointer
        		
	``` 

	```less
	.c-list-stacked-item:hover .c-list-stacked-item-name,
    .c-list-stacked-item:hover .c-list-stacked-item-type {
        background-color: #f00;
    }
    //или
	&:hover &-name, &:hover &-type {
            cursor: pointer;
            background-color: @var-color-hover;
        }
	
	```
1. для сброса кэша favicon в браузере надо добавить параметр 
    ```html
    <link rel="icon" type="image/x-icon" href="favicon.ico?any=param">

    ```
1. вместо сокрытия элементов управления лучше делать их выключенными, и менять к ним всплывающую подсказку - "элемент такой-то, выключен, чтобы включить сделайте это"

1. В мобильных ОС и браузерах необходимы свои префиксы, например для IOS8+transform, тестирование на живых устройствах, т.к. рендеринг отличается. Необходимы отдельные классы стилей под каждую платформу

 1. Назначать высоту блоков с вертикальной прокруткой динамически вместо привязки к высоте экрана `height: 65vh`
 
	```scss
		.my-block {
			display: flex;
			max-height: 600px;
		}

		.my-container {
			display: flex;
			flex-direction: column;
			flex-shrink: 0;
			align-self: stretch; //фиксация для дочерней прокрутки
			
			&-scroll {
				display: flex;
				flex-direction: column;
				padding-right: 15px; //от прокрутки
				flex-grow: 1;
				overflow-y: auto; //чтобы не прыгала ширина при выпадании списков
				overflow-x: hidden; //убираем глюки появления прокрутки
			}
		}
	```

	```html
		<div class='my-block'>
			<div class='my-container'>
				<div class='my-scroll'>
				</div>
			</div>
		</div>
	```

1. Общая раскладка

	```sass
		html, body {
			display: flex;
			flex-direction: column;
			height: 100%;
			width: 100%;
		}

		.header {
			display: flex;
			flex-direction: column;
			height: 50px;
		}

		.main {
			display: flex;
			flex-direction: column;
			flex-shrink: 1;
			flex-grow: 1;
			align-self: stretch;
			overflow-y: hidden;//для перноса прокруток в блоки
		}

		.footer {
			display: flex;
			flex-direction: column;
			height: 50px;
		}
	```
1. Предпочтительнее не использовать сокращённую запись свойств из-за [неочевидного поведения](https://developer.mozilla.org/en-US/docs/Web/CSS/Shorthand_properties) значений по-умлочанию. 