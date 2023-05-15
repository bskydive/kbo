# Главная

## Что это?

База знаний, заметки, удобные для использования разработчиком ПО.
Заметки ведутся давно, часть информации устарела.

## Зачем это?

Для экономии времени на поиск информации.

## Как увидеть рабочий проект?

* [База знаний программиста](https://stepanovv.ru/kbo)
* [База знаний человека-мужика](https://stepanovv.ru/kbb): сорян, часть ссылок в формате dokuwiki

## Где документация по проекту?

 * https://gitlab.com/stepanovv/kbo/-/blob/master/README.md
 * https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
 * http://prismjs.com/
 * https://docsify.js.org/#/markdown
 * https://marked.js.org/#/README.md

## Какие особенности проекта?

 * Использован markdown+JS движок [docsify](https://github.com/docsifyjs/docsify/blob/develop/docs/README.md) с [открытой лицензией](https://github.com/docsifyjs/docsify/blob/develop/LICENSE)
 * Просмотр/редактирование оффлайн в любом IDE с плагинами markdown
 * просмотр/редактирование онлайн без движка docsify через bitbucket/github/gitlab
 * не требует сборки, конвертирует markdown-->html в браузере
 * текстовый поиск без необходимости индексации
 * можно настроить оповещение об изменениях через bitbucket git web hooks в slack
 * Нет автоматического оглавления. Новые файлы добавляются вручную в [sidebar.md](https://gitlab.com/stepanovv/kbo/-/blob/master/public/kbo/sidebar.md)
    * Пути указываются от [web корня](https://gitlab.com/stepanovv/kbo/-/tree/master/public)
    * Подзаголовки в оглавлении будут добавлены автоматически
 * [Плагины](http://prismjs.com/) подсветки добавляются в [index.html](https://gitlab.com/stepanovv/kbo/-/blob/master/public/index.html)
 * по отношению к оригинальному docsify добавлены собственные шрифты, изменены стили
 * есть markdown таблицы и плагин для предпросмотра картинок
 * ссылки на картинки указываются относительно текущего md файла со ссылкой

## Чего не хватает?

 * индексации структуры файлов и каталогов в оглавление
 * тэгов-ссылок с автоматической генерацией в тексте
 * RSS/xmpp оповещалки об изменениях

## С чем взаимодейстует проект?

* Работает изолированно, свои шрифты, стили, файлы.

## Как задать вопрос по проекту?

* [Контакты](https://stepanovv.ru/portfolio/portfolio.html#id-contacts)
