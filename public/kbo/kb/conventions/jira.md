## JIRA

Делаем только то, что есть в Джире. Джира — единый источник правды о задачах.
	* все задачи записаны в jira
	* всегда актуальный исполнитель задачи
	* всё указано в задаче
	* всегда актуальный статус в задаче и комментариях
 * Всё связано с Джирой: вся переписка, статьи в Confluence, чаты, документы, merge request и прочее должны быть двухсторонне связаны с задачей. В статье есть ссылка на задачу. В задаче есть ссылка на статью.
 * В задаче должна быть правда: Все поля задачи должны содержать верную информацию. Если ты уверен, поменяй. Если ты не уверен, напиши комментарий с предложением поменять.
 * В задаче должен быть статус: если о чём-то договорились или статус откатился назад - оставь об этом комментарий. 

    Если спрашиваешь про задачу — дай на нее ссылку
    В идеале — не спрашивай, посмотри в задаче
    Если рассказываешь про задачу — расскажи в комментариях и дай ссылку на них

Ты имеешь право создать задачу

Любое «думаю, это баг» или «может быть хорошо бы сделать» заслуживает задачи. Если это не баг, ответственное лицо его закроет. Если ты создал не так — отредактирует. Если не там — перенесет. НЕТ: «Слушай, как тебе кажется, это баг? Он вообще ваш? У кого бы узнать?» ДА: «В баге написал: вот такое поведение, как вам кажется это баг @Вася @Оля»

Примечание: в некоторых проектах существуют правила, например «укажите поле компонент», «внешние команды должны заводить багу через техподдержку». Если вы знаете эти правила — соблюдайте их. Если вы не знаете правила, лучше создать задачу с ее нарушением, чем не создать задачу.

* [стандартный минимальный процесс](https://www.atlassian.com/ru/agile/project-management/workflow)
* [настраиваемые поля](https://support.atlassian.com/jira-software-cloud/docs/available-custom-fields-for-team-managed-projects/)
* [начальный текст в поле описание](https://confluence.atlassian.com/adminjiraserver/configuring-contexts-and-default-values-for-the-description-field-1047552727.html)
* [виджеты](https://confluence.atlassian.com/jiracoreserver073/configuring-dashboards-861257079.html#CustomizingtheDashboard-add_gadget)
 1. https://jira.zyfra.com/wiki/pages/viewpage.action?pageId=102500105
* Типы задач
	1. [истории](https://www.atlassian.com/ru/agile/project-management/user-stories)
	1. [эпики](https://www.atlassian.com/ru/agile/project-management/epics)
	1. [дорожная карта](https://www.atlassian.com/ru/software/jira/features/roadmaps?tab=basic)
	1. [версии](https://www.atlassian.com/ru/agile/tutorials/versions)
	1. [бэклог](https://www.atlassian.com/ru/agile/scrum/backlogs)
 1. Настройки доски
	1. [горизонтальные плавающие линии](https://confluence.atlassian.com/jirasoftwareserver/configuring-swimlanes-938845294.html)
	1. [столбцы](https://confluence.atlassian.com/jirasoftwareserver/configuring-columns-938845277.html)
	1. [фильтры](https://confluence.atlassian.com/jirasoftwareserver/configuring-filters-938845268.html)

 * [требования к продукту](https://www.atlassian.com/ru/agile/product-management/requirements)
 * [ретроспективы](https://www.atlassian.com/ru/agile/scrum/retrospectives)
 * [эпики, истории](https://www.atlassian.com/ru/agile/project-management/epics-stories-themes)
	* [истории](https://www.atlassian.com/ru/agile/project-management/user-stories)
	* [эпики](https://www.atlassian.com/ru/agile/project-management/epics)
	* [дорожная карта](https://www.atlassian.com/ru/software/jira/features/roadmaps?tab=basic)
	* [версии](https://www.atlassian.com/ru/agile/tutorials/versions)
	* [бэклог](https://www.atlassian.com/ru/agile/scrum/backlogs)
		* https://confluence.atlassian.com/jirasoftwareserver0813/using-your-scrum-backlog-1027134824.html
 * [показатели](https://www.atlassian.com/ru/agile/project-management/metrics)
 	* [диаграмма сгорания](https://www.atlassian.com/ru/agile/tutorials/burndown-charts)
 	* [оценка](https://www.atlassian.com/ru/agile/project-management/estimation)
	* [техдолг](https://www.atlassian.com/ru/agile/software-development/technical-debt)
	* [biggantt](https://wiki.softwareplant.com/doc/all/other-features/widgets/app-widget?product=eu.softwareplant.biggantt)
 * [проверка кода](https://www.atlassian.com/ru/agile/software-development/code-reviews)
 * Отчёты
	* https://confluence.atlassian.com/jirakb/reporting-in-jira-461504615.html
	* [скорость команды](https://confluence.atlassian.com/jirakb/reporting-in-jira-461504615.html)
	* []()
	* []()
	* []()
 * JIRA.ххх ссылки
	* [типы задач, приоритеты, статусы](https://jira.XXXXXX.com/secure/ShowConstantsHelp.jspa?decorator=popup#IssueTypes)
 * столбцы доски
	* не бери
	* бери и делай
	* в работе
	* тестирование
	* почти готово
	* готово
 * отчёты
	* диаграмма сгорания работ
	* диаграмма гантта или дорожные карты
 * типы задач
	* инициатива
	* эпик
	* история
	* ошибка
	* задача
	* подзадача
 * Активность/запрос
	* должна быть присвоена метка: FE, BE, DEVOPS, UX, BA, QA
		* новое поле
		* множественный выбор из списка: тип активности
	* должно быть описание по шаблону: задача, ошибка
	* можно свободно менять тип: задача, ошибка, эпик, история, инициатива
	* должна быть оценка, если статус "в работе"
	* можно выставить спринт любому типу, кроме подзадачи
	* поля
		* тип
		* приоритет
		* затронуты версии
		* метки
		* тип активности
		* эпик
		* спринт
		* оценка
		* статус
 * спринт
 	? веха/milestone
 * шаблон ошибки
	* Окружение, стенд, версия ПО и тестовых данных в БД
	* Браузер: Edge, Safari, Chrome
	* ОС: Windows, Linux, Macos
	* Предусловие: Авторизация на портале, URL, действия
	* Шаги: воспроизведение проблемы
	* Фактический результат: описание, скрины, видео, curl/HAR из chrome devtools
	* Ожидаемый результат: описание, скрины, видео, curl/HAR из chrome devtools
 * шаблон задачи
	* История: роль, действие, ожидаемый результат
	* описание, скрины, видео
	* ссылки на аналитику/статьи в confluence
	* ссылки на swagger UI
	* пример API запроса и возврата для реализации новых контрактов или если такого описания нет в swagger
