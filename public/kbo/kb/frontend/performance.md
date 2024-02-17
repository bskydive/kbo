# Производительность


## V8

 * [площадка для тестов jsperf](https://jsperf.com/popular)
 * [блог разработчика V8](https://mrale.ph/blog/2015/04/12/jsunderhood.html)
 * [дебаггер](https://github.com/mraleph/irhydra) [видео](https://www.youtube.com/watch?v=pycQWDuCBN8)
 * [Maybe you don't need Rust and WASM to speed up your JS](https://mrale.ph/blog/2018/02/03/maybe-you-dont-need-rust-to-speed-up-your-js.html)

##  как измерить

 * https://webhint.io/
 * [Сложно о простом: как измерить время открытия страницы и не нажить себе врагов](https://habrahabr.ru/company/tensor/blog/345434/)
	* Сетевая активность
	* События
	* Визуальные изменения
	* Работоспособность
	* Ограничения клиентских устройств и каналов
	* Кэш
	* Браузеры/ОС
 * [Вы можете себе это позволить? Бюджет веб-производительности в реальном мире, Chrome](https://habrahabr.ru/post/345212/)
    * Руководители позволяют сохранить быструю работу приложения
    * На раннем этапе установлены бюджеты производительности.
    * Бюджеты масштабируются в соответствии с параметрами сети и устройств на рынке.
    * Инструменты и системы непрерывной интеграции (CI) помогают отслеживать прогресс и предотвратить регрессию.
	* Мы установили бюджет по времени пять секунд до интерактивности сайта после первой загрузки, а также две секунды при последующих загрузках. При соблюдении этих нормативов мы ограничены типичным устройством из реального мира и типичной сетевой конфигурацией. Это Android-смартфон за $200 на канале 400 Кбит/с, RTT 400 мс. Это означает бюджет ~130-170 КБ ресурсов критического пути, в зависимости от их состава: чем больше JS — тем меньше объём.
 * https://www.machmetrics.com/
 * [Производительность как восприятие: управление восприятием](https://habrahabr.ru/company/jugru/blog/343922/)
 * grunt-page-load

 * [Представляем RAIL: модель оценки производительности сайта команды Google Chrome](https://habrahabr.ru/post/308026/)
	* 100 миллисекунд: необходимо отреагировать на действие пользователя за это время, и он будет воспринимать, что реакция была немедленной. Все, что дольше этого создает ощущение  задержки между действием и реакцией.
	* 1 секунда: тот период времени, в течение которого пользователь ощущает естественным выполнение «задачи». «Задачей» может быть, например, загрузка страницы или изменение списка  товаров при изменении фильтра.
	* 16 миллисекунд: учитывая, что экран обновляется 60 раз в секунду на большинстве устройств, за такое время на экране должен появиться каждый следующий кадр (1000 / 60 = 16). Люди  очень хорошо отслеживают движение глазами, и все, что медленнее 60 кадров в секунду, нарушает их ожидания.
	* response (отклик), animation (анимация), idle (ожидание) и load (загрузка)
	* Когда пользователь нажимает на кнопку, необходимо «откликнуться» на его действие так быстро, чтобы он не заметил никакого лага
	* анимация: скроллинг, выдвигающееся сбоку меню, перетаскивание
	* Чтобы анимация выглядела непрерывной, каждый кадр анимации должен появляться на экране за менее чем 16 миллисекунд, то есть со скоростью 60 FPS. (1 секунда / 60 кадров = 16,6 миллисекунд на кадр)
	* ожидание: нужно группировать задачи, которые выполняются в это время, в блоки не более 50 миллисекунд, чтобы успеть сделать отклик за 100 миллисекунд
	* Чтобы успеть показать страницу за 1 секунду, необходимо отложить все загрузки некритических элементов на моменты ожидания действий пользователя
 * https://developers.google.com/web/updates/2018/05/first-input-delay
 * [google lighthouse](https://developers.google.com/web/updates/2018/05/lighthouse)
 * https://nooshu.github.io/blog/2019/10/02/how-to-read-a-wpt-waterfall-chart/ https://nooshu.github.io/blog/2019/12/30/how-to-read-a-wpt-connection-view-chart/

##  chrome-dev-tools chrome dev toools

 * https://medium.com/reloading/preload-prefetch-and-priorities-in-chrome-776165961bbf
 * https://habrahabr.ru/company/ruvds/blog/343888/
 * https://hospodarets.com/chrome-devtools-performance-monitor
 * https://tproger.ru/translations/chrome-devtools-load-time-optimization/
 * [How we got a 100% Lighthouse performance score for our Vue.js app](https://checklyhq.com/blog/2018/08/how-we-got-a-100-lighthouse-performance-score-for-our-vue.js-app/)

## Браузеры

 * https://www.igvita.com/posa/high-performance-networking-in-google-chrome/

## Сеть network

 * [оптимизация сетевой подсистемы браузеров](https://habr.com/company/ruvds/blog/354070/)

##  lazy load

 * http://blog.dynamicdrive.com/5-brilliant-ways-to-lazy-load-images-for-faster-page-loads/

## кэш

 * [Продуманные запросы: стратегии кэширования в век PWA](https://habr.com/ru/company/ruvds/blog/478326/)

##  сжатие изображений

 * wepb
 * https://developers.google.com/speed/webp
 * https://gtmetrix.com/blog/what-does-image-optimization-mean/
 * svgo
 * csso

##  мониториг

 * http://prgssr.ru/development/monitoring-veb-prilozhenij.html

##  профилирование

 * https://habrahabr.ru/company/yandex/blog/282159/

##  как читать графики

 * http://www.brendangregg.com/flamegraphs.html

##  общие советы оптимизации

 * [Twitter Lite и высокопроизводительные прогрессивные веб-приложения на React](https://habrahabr.ru/post/327494/)
 * [открытие страницы](https://habr.com/post/274129/)

## Кэширование и офлайн

 * [ликбез](https://habr.com/post/274129/)

##  рендеринг DOM

 * [Как работает JS: движки рендеринга веб-страниц и советы по оптимизации их производительности](https://habrahabr.ru/company/ruvds/blog/351802/)

##  minification

 * https://developers.google.com/closure/compiler/
 * https://github.com/mishoo/UglifyJS
 * http://requirejs.org/docs/optimization.html#onecss
 * https://github.com/css/csso
 * https://developers.google.com/speed/docs/insights/MinifyResources

