
const quotes = [
	['Программисты', '#',
		'бантики бантиками, а техдолг техдолгом и архитектура архитектурой',
		'я своё веское слово выгрыз в граните, облил кровью, и запил пивом',
		'потому что DRY противоречит KISS',
		'Это потому что имя нашего стартапа - Внезапность',
		'Не слышал что ли как гугл закэшировал интранет wiki яндекса, а потом яндекс её перезакешировал сам из гугла? Это как Siri посадить разговаривать с Алисой',
		'C# - это соль диез',
		'Карточная игра Стартап - она про дилемму заключённых',
		'какие у тебя предложения по снижению технического долга? У меня полный MR этих предложений!',
		'по нашей системе у нас долг такого размера — это не технический долг, а скорее техническая ипотека.',
		'Все ошибки в программе делают разработчики',
		'Показ проходит так: все чинно рассаживаются вокруг стола, тимлид достаёт ноутбук, и начинает всех удивлять',
		'Настало моё время офуительных историй в стиле {username}.',
		'Вот какой у нас теперь фольклор богатый. Будет чего джунам рассказывать.',
		'на выходные накопилось так много отдыха, что поработать не успел',
		'программист - проекту: соберись, тряпка!',
		'тут ядрёным Авгиевым буреломом запахло',
		'когда делаешь сео, то сразу отдельный широкополосный выделенный penetration uplink образуется. И ладно бы к менеджерам, они занятые. Так нет, к маркетологам, которым натурально нечего делать.',
		'внедряем agile в сжатые сраки',
		'потому что у нас бизнес, а не технологически ориентированный проект',
		'потому что сроки считали верстальщики',
		'так сложилось исторически',
		'синканёмся на дейлике, заассайним ишью, бэкендеры заэкспандяд ноду, т.е.: заслушаем доклады на утренней линейке, нарежем задачи, тыловики поширят узел',
		'мы бежим впереди машиниста, который бежит впереди паровоза, чтобы показать куда ехать',
		'https://www.youtube.com/watch?v=u-ZREh7geL8 Zimtstern Leaves Spot - TransWorld SNOWboarding >катим в прод досрочно глазами менеджера<',
		'https://www.youtube.com/watch?v=3Szc_pOz9fw Громыка - Говорил я вам >ретроспектива<',
		'https://www.youtube.com/watch?v=-jDKJT2dDZQ Urban Freeride lives - Fabio Wibmer >время релиза<',
		'https://www.youtube.com/watch?v=eXqPYte8tvc Evan Dobson - Time 2 - guitar >собес - покажи синьористость<',
		'девиз бизнес ориентированного проекта: "работает - не трогай", технологически ориентированного: "делай хорошо - плохо само получится".',
		'я всё, пошёл генерить серотонин',
		'тут без ста грамм не разберёшься или дебухер нам в помощь',
		'стоматологи любят пугать клиентов гнилыми зубами, а программисты так не могут. Не получится испугать заказчика гнилым кодом.',
		'Бесконечная гибкость - это хаос, белый шум, жизнь. Бесконечный порядок - это пустота, смерть. Всё стремится от хаоса к порядку, потому и пустота управляет всем. Наводя порядок в приложении вы делаете его менее гибким, а значит - более мёртвым',
		'если цель достойна, то и средства тоже должны быть достойными',
		'Люблю запах напалма утром после релиза',
		'Давным-давно, когда я работал в кабинете с табличкой "стенд главного конструктора". Откуда она взялась уже никто не помнил, но когда что-то ломалось вспоминали именно его - дух главного конструктора. А когда мы накрывали в этом кабинете стол, то первый тост был также за него, незримого и таинственного владельца кабинета.',
		'В этом чятике так много трындежа, что он может коллапсировать в чёрную дыру',
		'Нет стабильных приложений, есть плохо протестированные',
		'одним словом - у нас четыре буквы, из которых нельзя собрать слово счастье',
		'архитектура у нас такая: принимаем что угодно, отдаём как получится',
		'мои извилинки свернулись улиточкой',
		'Умели великие предки код писать, на века делали. До сих пор он стоит - не шелохнется. Ничем его не возьмёшь. Ни фичей крутой, ни багом лихим, ни удалым рефакторингом.',
		'у нас сверхзащищённый код: с защитой от дурака начальника, дурака пользователя и дурака программиста',
		'когда падает задача с наивысшим приоритетом, вспоминается фраза: "господин назначил меня любимой женой!"',
		'"много раз говорил" - в 21 веке это бесполезно, разговор к делу не пришьёшь, не пошаришь и не залайкаешь. Надо постить картиночки, желательно в распечатанном виде на лбу у конечного исполнителя',
		'пошёл требовать соблюдения прав файлов у админа',
		'Начинай день с простого, понятного, короткого действия, помогающего расти и побеждать',
		'Регулярность исполнения любого правила важнее, чем само правило',
		'Эффект Да́ннинга — Крю́гера — метакогнитивное искажение, которое заключается в том, что люди, имеющие низкий уровень квалификации, делают ошибочные выводы, принимают неудачные решения и при этом не способны осознавать свои ошибки в силу низкого уровня своей квалификации',
		'красноглазить по пояс в консоли',
		'проект перманентно в огне и овне',
		'CAP теорема — незаменимый помощник в переговорах. Эвристическое утверждение о том, что в любой реализации распределённых вычислений возможно обеспечить не более двух из трёх свойств: согласованность, доступность, разделяемость',
		'большинство утверждений, использующих квантор всеобщности, в жизни оказываются неверными',
		'Жадный алгоритм эффективного менеджера: выгодно делать то, что приносит прибыль здесь и сейчас. Платить за то, что сложно посчитать или долго ждать не выгодно',
		'Зрелый реакт проект - это постройка ангуляр 2+ из говна и палок. Зрелый ангуляр проект - это постепенная замена говна и палок первой версии на ангуляр 2+',
		'успехи бывают героические, а бывают и методические. Героические плохо масштабируются',
		'и тут сервис сказал: подержи моё пиво',
		'В разработке важен поиск компромиссов. Один из них между полной и полностью отсутствующей документацией. Велик соблаз приравнять неполную документацию к плохой, а плохую документацию к плохому коду. Неполная документация - это неполный код. Прототип, который работает, но делает меньше, чем должен. Неполная документация может быть качественной'
	],
	['Царь Соломон', 'http://www.adme.ru/svoboda-kultura/20-mudryh-myslej-carya-solomona-o-zhizni-886910/',
		'Всему свой час и время всякому делу под небесами: время родиться и время умирать. Время разрушать и время строить. Время разбрасывать камни и время складывать камни. Время молчать и время говорить.',
		'И глупец, когда молчит, может показаться мудрым.',
		'Обещал — исполни! Лучше не обещать, чем обещать и не исполнять.',
		'Вдвоем быть лучше, чем одному, ибо, если упадут, друг друга поднимут, но горе, если один упадет, а, чтоб поднять его, нет другого, да и если двое лежат — тепло им, одному же как согреться.',
		'Мудрая жена устраивает дом свой, а глупая разрушает его своими руками.',
		'Кто роет яму, тот упадет в нее, и кто покатит вверх камень, к тому он воротится.',
		'Я увидел: нет большего блага, чем радоваться своим делам, ибо в этом и доля человека, — ибо кто его приведет посмотреть, что будет после.',
		'Нет человека, властного над ветром, — и над смертным часом нет власти, и отпуска нет на войне, и не выручит нечестие нечестивца.',
		'Кто хранит уста свои — тот бережет душу свою, а кто широко растворяет рот — тому беда.',
		'Долготерпеливый лучше храброго, и владеющий собою лучше завоевателя города.',
		'Не поможет богатство в день гнева, правда же спасет от смерти.',
		'Благоразумный видит беду и укрывается, а неопытные идут вперед и наказываются.',
		'Главное — мудрость: приобретай мудрость и всем имением твоим приобретай разум.',
		'Жесток гнев, неукротима ярость; но кто устоит против ревности.',
		'Кто находится между живыми, тому есть еще надежда.',
		'Ненависть возбуждает раздоры, но любовь покрывает все грехи.',
		'Полезнее мудрость, чем глупость, как полезнее свет, чем тьма. Но единая участь постигнет и мудрого, и глупого.',
		'И при смехе иногда болит сердце, и концом радости бывает печаль.',
		'Придет гордость, придет и посрамление; но со смиренными мудрость.'
	],

	['Конфуций', 'http://www.adme.ru/svoboda-kultura/10-mudrejshih-citat-konfuciya-858410/',
		'Неважно, как медленно вы идете, до тех пор, пока вы не остановитесь.',
		'Никогда не заводите дружбу с человеком, который не лучше вас самих.',
		'Когда ты разгневан, думай о последствиях.',
		'Если очевидно, что цели не могут быть достигнуты, не корректируйте цели, корректируйте действия.',
		'Если ты ненавидишь — значит, тебя победили.',
		'Благородный человек предъявляет требования к себе, низкий человек предъявляет требования к другим.',
		'Чем бы вы ни занимались в жизни, делайте это всем своим сердцем.',
		'Давай наставления только тому, кто ищет знаний, обнаружив свое невежество.',
		'Несдержанность в мелочах погубит великое дело.',
		'Если тебе плюют в спину, значит, ты впереди.'
	],

	['Далай Лама', 'http://www.adme.ru/svoboda-kultura/15-urokov-zhizni-ot-dalaj-lamy-858760/',
		'Будьте добрее, когда это возможно. А это возможно всегда.',
		'Процветание приходит благодаря действиям, а не благодаря молитвам.',
		'Высокомерие никогда не оправданно. Оно происходит из низкой самооценки или временных, поверхностных достижений.',
		'Когда человеку кажется, что все идет наперекосяк, в его жизнь пытается войти нечто чудесное.',
		'Люди были созданы для того, чтобы их любили, а вещи были созданы для того, чтобы ими пользовались. Мир в хаосе потому, что все наоборот.',
		'Тема сострадания вовсе не имеет отношения к религии. Это общечеловеческое дело, единое условие выживания человеческой расы.',
		'Если можешь помочь, помоги. Если нет, хотя бы не вреди.',
		'Я не отмечаю дни рождения. Для меня этот день ничем не отличается от других. В некотором роде каждый день — день рождения. Вы просыпаетесь утром, все свежо и ново, и главное, чтобы этот новый день принес вам что-то важное.',
		'Цель нашей жизни — стать счастливыми.',
		'Сохраняя положительное отношение к жизни, можно быть счастливым даже в самых неблагоприятных условиях.',
		'Наши враги дают нам прекрасную возможность практиковать терпение, стойкость и сострадание.',
		'Я считаю, что действительно настоящая религия — это доброе сердце.',
		'Мы должны властвовать над технологиями, а не становиться их рабами.',
		'Великие перемены начинаются с отдельных людей; в основе мира во всем мире лежат внутреннее спокойствие и мир в сердце каждого отдельного человека. Каждый из нас может внести свой вклад.',
		'Каждый из нас несет ответственность за все человечество. В этом заключается моя простая религия. Нет нужды в храмах, нет нужды в сложной философии. Наш собственный мозг, наше сердце — вот наш храм; наша философия — доброта.',
		'Больше всего меня удивляет человеческая природа. Потому что человек жертвует своим здоровьем, чтобы заработать деньги. Затем он жертвует деньгами, чтобы восстановить своё здоровье. И потом он так беспокоится о будущем, что не наслаждается настоящим; в результате – не живёт ни в настоящем, ни в будущем. Он живёт так, как будто никогда не умрёт, а потом умирает так, как будто никогда не жил'
	],

	['Фридрих Ницше', 'http://www.adme.ru/tvorchestvo-pisateli/30-genialnyh-citat-mihaila-zhvaneckogo-867060/ © AdMe.ru',
		'Кто сражается с чудовищами, тому следует остерегаться, чтобы самому при этом не стать чудовищем. И если ты долго смотришь в бездну, то бездна тоже смотрит в тебя.',
		'Если вы решили действовать — закройте двери для сомнений.',
		'И если у тебя нет больше ни одной лестницы, ты должен научиться взбираться на собственную голову: как же иначе хотел бы ты подняться выше.',
		'Смерть достаточно близка, чтобы можно было не страшиться жизни.',
		'Много говорить о себе — тоже способ себя скрывать.',
		'Величайшие события — это не наши самые шумные, а наши самые тихие часы.',
		'Есть два пути избавить вас от страдания: быстрая смерть и продолжительная любовь.',
		'Чем свободнее и сильнее индивидуум, тем взыскательнее становится его любовь.',
		'«Возлюби ближнего своего» — это значит прежде всего: «Оставь ближнего своего в покое!» — И как раз эта деталь добродетели связана с наибольшими трудностями.',
		'Даже у Бога есть свой ад — это любовь его к людям.',
		'С человеком происходит то же, что и с деревом. Чем больше стремится он вверх, к свету, тем глубже впиваются корни его в землю, вниз, в мрак и глубину, — ко злу.',
		'Человек — это канат, натянутый между животным и сверхчеловеком, — канат над пропастью. В человеке ценно то, что он мост, а не цель.',
		'Стыдиться своей безнравственности — это первая ступень лестницы, на вершине которой будешь стыдиться своей нравственности.'
	],

	['Габриель Гарсиа Маркес', 'http://www.adme.ru/vdohnovenie-919705/ego-sto-let-odinochestva-zakonchilis-670955/ © AdMe.ru',
		'Не дай себе умереть, не испытав этого чуда — спать с тем, кого любишь.',
		'Людям, которых любят, следовало бы умирать вместе со всеми их вещами.',
		'Всякая вещь — живая. Надо только суметь разбудить ее душу.',
		'Если вы встретите свою настоящую любовь, то она от вас никуда не денется — ни через неделю, ни через месяц, ни через год.',
		'Если во что-то вовлечена женщина, я знаю, что все будет хорошо. Мне совершенно ясно, что женщины правят миром.',
		'За обеденным столом можно любить так же, как в постели.',
		'Улыбайся, не доставляй беде удовольствия.',
		'В семейной жизни куда легче уклониться от катастроф, нежели от досадных мелочных пустяков.',
		'Минута примирения стоит больше закадычной дружбы.',
		'Я всегда говорил и никогда не откажусь от своих слов, что самые интересные люди живут в России.',
		'СССР — это 22 400 000 квадратных километров без единой рекламы кока-колы.',
		'Человек не рождается раз и навсегда в тот день, когда мать производит его на свет, жизнь заставляет его снова и снова — много раз — родиться заново самому.',
		'Кто ждет долго, может подождать еще немного.',
		'Нас окружают необыкновенные, фантастические вещи, а писатели упорно рассказывают нам о маловажных, повседневных событиях.',
		'Дивное свойство — способность думать о прошлых радостях без горечи и раскаяния.',
		'Вдохновение приходит только во время работы.',
		'Знание и мудрость приходят к нам тогда, когда они уже не нужны.',
		'Будь спокоен. Умереть труднее, чем кажется.',
		'Великие бедствия всегда порождали великое изобилие. Они заставляют людей хотеть жить.'
	],

	['Братья Стругацкие', 'http://fit4brain.com/7488',
		'83% всех дней в году начинаются одинаково: звенит будильник.',
		'Целыми неделями тратишь душу на пошлую болтовню, а когда встречаешь настоящего человека, поговорить нет времени.',
		'Детей бить нельзя. Их и без тебя будут всю жизнь колотить кому не лень, а если тебе хочется его ударить, дай лучше по морде самому себе, это будет полезней.',
		'Все правильно: деньги нужны человеку для того, чтобы никогда о них не думать.',
		'Мухи-то воображают, что они летят, когда бьются в стекло. А я воображаю, что я иду. Только потому, что передвигаю ногами.',
		'Просто удивительно, как быстро проходят волны восторга. Грызть себя, уязвлять себя, нудить и зудеть можно часами и сутками, а восторг приходит и тут же уходит.',
		'Если во имя идеала человеку приходится делать подлости, то цена этому идеалу — дерьмо.',
		'Волчица говорит своим волчатам: «Кусайте, как я», и этого достаточно, и зайчиха учит зайчат: «Удирайте, как я», и этого тоже достаточно, но человек-то учит детеныша: «Думай, как я», а это уже преступление.',
		'Почему не помолчать, когда все ясно без слов?',
		'Лучше двадцать раз ошибиться в человеке, чем относиться с подозрением к каждому.',
		'А какой смысл покупать машину, чтобы разъезжать по асфальту? Там, где асфальт, ничего интересного, а где интересно, там нет асфальта.',
		'Фантазия — бесценная вещь, но нельзя ей давать дорогу внутрь. Только вовне, только вовне.',
		'Скептицизм и цинизм в жизни стоят дешево, потому что это много легче и скучнее, нежели удивляться и радоваться жизни.',
		'Среди них никто точно не знал, что такое счастье и в чём именно смысл жизни. И они приняли рабочую гипотезу, что счастье — в непрерывном познании неизвестного, и смысл жизни в том же.',
		'Что это такое — нужен? Это когда нельзя обойтись без. Это когда все время думаешь о. Это когда всю жизнь стремишься к.',
		'Это что-то вроде демократических выборов: большинство всегда за сволочь.',
		'Какой смысл говорить о будущем? О будущем не говорят, его делают!',
		'Там, где торжествует серость, к власти всегда приходят чёрные.',
		'Но ведь не может быть так, чтобы среди тысячи дорог не нашлось верной!',
		'Не в громе космической катастрофы, не в пламени атомной войны и даже не в тисках перенаселения, а в сытой, спокойной тишине кончается история человечества.',
		'Нет на свете ничего такого, чего нельзя было бы исправить.',
		'Не каждому дано быть добрым. Это такой же талант, как музыкальный слух или ясновидение, только более редкий.',
		'Счастье — это когда ты хочешь то, что можешь, и можешь то, что хочешь.',
		'Иногда я спрашиваю себя: какого черта мы так крутимся? Чтобы заработать деньги? Но на кой черт нам деньги, если мы только и делаем, что крутимся?',
		'Будь оно все проклято, ведь я ничего не могу придумать, кроме этих его слов: СЧАСТЬЕ ДЛЯ ВСЕХ, ДАРОМ, И ПУСТЬ НИКТО НЕ УЙДЕТ ОБИЖЕННЫЙ!'
	],

	['Юрий Никулин', 'http://fit4brain.com/2416',
		'Даже после небольшой улыбки в организме обязательно дохнет один маленький микроб.',
		'Много доброго можно сделать, если у тебя хорошее настроение.',
		'Если каждый из нас сумеет сделать счастливым другого человека — хотя бы одного, на земле все будут счастливы.',
		'Никогда не мстите подлым людям. Просто станьте счастливыми. И они это не переживут.',
		'Порой что-то отложишь на завтра и с ужасом думаешь: а завтра — это же практически через несколько часов!',
		'Будьте самоучками, не ждите, пока вас научит жизнь.',
		'В природе ничего не пропадает, кроме исполнившихся надежд.',
		'Комедия — дело серьезное!',
		'И у нас, ребята, будут наши победы. Главное, чтобы они были не с оружием в руках.',
		'Я буду счастлив, если обо мне потом скажут: он был добрый человек. Это не значит, что я всегда добрый. Но доброта — на первом месте.',
		'Жизнь у людей отнимает страшно много времени.',
		'Я всегда радовался, когда вызывал смех у людей. Кто смеется добрым смехом, заражает добротой и других. После такого смеха иной становится атмосфера: мы забываем многие жизненные неприятности, неудобства.',
		'Когда ты подпрыгиваешь от радости, смотри, чтобы кто-нибудь не выбил у тебя из-под ног землю.',
		'История из жизни. Гид во время экскурсии: — А сейчас мы проедем эту большую стену, и вы увидите район, где все бросили пить и курить. Мы оживились. Кинулись к окнам автобуса. Кончилась стена, и мы увидели огромное городское кладбище.',
		'В моей жизни не раз определяющую роль играл именно случай. Анализируя прошлое и раздумывая о нем, я прихожу к выводу, что он бывает только у тех, кто ищет, кто хочет, кто ждет появления этого случая и делает все от себя зависящее для того, чтобы исполнить свою мечту.'
	],

	['Карлос Кастанеда', 'http://fit4brain.com/5796',
		'Каждый идет своим путём. Но все дороги всё равно идут в никуда. Значит, весь смысл в самой дороге, как по ней идти… Если идешь с удовольствием, значит, это твоя дорога. Если тебе плохо – в любой момент можешь сойти с нее, как бы далеко ни зашел. И это будет правильно.',
		'Единственный по-настоящему мудрый советчик, который у нас есть, – это смерть. Каждый раз, когда ты чувствуешь, как это часто с тобой бывает, что всё складывается из рук вон плохо и ты на грани полного краха, повернись налево и спроси у своей смерти, так ли это. И твоя смерть ответит, что ты ошибаешься, и что кроме её прикосновения нет ничего, что действительно имело бы значение. Твоя смерть скажет: «Но я же ещё не коснулась тебя!»',
		'Бесполезно тратить всю свою жизнь на один-единственный путь, особенно, если этот путь не имеет сердца.',
		'Не объясняй слишком многого. В каждом объяснении скрывается извинение. Так что, когда ты объясняешь, почему ты не можешь делать то или другое, на самом деле ты извиняешься за свои недостатки, надеясь, что слушающие тебя будут добры и простят их.',
		'Чтобы извлечь из жизни максимум, человек должен уметь изменяться. К сожалению, человек изменяется с большим трудом, и изменения эти происходят очень медленно. Многие тратят на это годы. Самым трудным является по-настоящему захотеть измениться.',
		'Я никогда ни на кого не сержусь. Ни один человек не может сделать ничего такого, что заслуживало бы такой моей реакции. На людей сердишься, когда чувствуешь, что их поступки важны. Ничего подобного я давно не чувствую.',
		'Люди, как правило, не отдают себе отчета в том, что в любой момент могут выбросить из своей жизни всё что угодно. В любое время. Мгновенно.',
		'Ты всегда должен помнить, что путь – это только путь. Если ты чувствуешь, что тебе не следовало бы идти по нему, то не должен оставаться на нем ни при каких обстоятельствах.',
		'Ты не должен путать одиночество и уединение. Одиночество для меня понятие психологическое, душевное, уединённость же — физическое. Первое отупляет, второе — успокаивает.',
		'Поступай так, словно это сон. Действуй смело и не ищи оправданий.',
		'Если тебе не нравится то, что ты получаешь, измени то, что ты даешь.',
		'Нам требуется всё наше время и вся наша энергия, чтобы победить идиотизм в себе. Это и есть то, что имеет значение. Остальное не имеет никакой важности…',
		'Весь фокус в том, на что ориентироваться... Каждый из нас сам делает себя либо несчастным, либо сильным. Объём работы, необходимой и в первом, и во втором случае, – один и тот же.',
		'Искусство состоит в сохранении равновесия между ужасом быть человеком и чудом быть человеком.',
		'Чтобы стать человеком знания, нужно быть воином, а не ноющим ребенком. Бороться, не сдаваясь, не жалуясь, не отступая, бороться до тех пор, пока не увидишь. И всё это лишь для того, чтобы понять, что в мире нет ничего, что действительно имело бы значение.'
	],

	['Dawn Gluskin', 'http://fit4brain.com/4497',
		'Счастье – внутри. Мы тратим слишком много времени на поиски одобрения и утешения со стороны. И всегда оказывается, что не там ищем. Загляните внутрь.',
		'Будьте благодарны за все. За хорошее, за плохое, за ужасное. Жизнь сама по себе – это бесценный дар. А удовольствие и боль – это часть нашего пути.',
		'Измените восприятие – и ваша жизнь изменится. Когда вы чувствуете страх, злость, обиду, просто взгляните на ситуацию под другим углом.',
		'Невозможно осчастливить всех, оставаясь верным себе. Но все же лучше рискнуть и оказаться непонятым, чем быть любимым, но притворяться тем, кем ты не являешься на самом деле.',
		'Мир вокруг – это зеркало. То, что мы любим в других – это отражение того, что мы любим в себе. То, что нас огорчает в других – это индикатор того, на что нам нужно обратить внимание в самих себе.',
		'Каждый человек появляется в нашей жизни с какой-то целью. А мы уже сами решаем, учиться ли на уроках, которые он нам преподает или нет. Чем хуже его роль в нашей жизни, тем серьезнее урок. Мотайте на ус.',
		'Верьте. Просто знайте, что в самые тяжелые времена Вселенная подставит спину, и все будет в порядке.',
		'Не принимайте все слишком близко к сердцу. Поступки других людей – это отражение того, что происходит в их личной жизни. И как правило, к вам это не имеет никакого отношения.',
		'Природа лечит. Прогулка на свежем воздухе и вид красивых пейзажей удивительным образом способны очистить голову от ненужных мыслей, вернуть к жизни и поднять настроение.',
		'Обиженные люди обижают людей. И все равно любите их. Хотя никто не запрещает вам любить их на расстоянии.',
		'Чтобы излечиться, нужно это прочувствовать. Поставьте ваши страхи и слабости прямо перед собой и направьте на них яркий луч света, потому что единственный способ избавиться от них – это пройти сквозь них. Смотреть правде в глаза больно. Но, клянусь, в перспективе оно того действительно стоит.',
		'Перфекционизм – это иллюзия. Самая, надо сказать, болезненная. Расслабьтесь. Стремитесь к совершенству, но позвольте себе делать ошибки и быть счастливым независимо от результата.',
		'Снимите шоры с глаз. Не концентрируйтесь исключительно на собственных целях и желаниях. Вы рискуете упустить красоту этой жизни и людей вас окружающих. Мир удивителен, когда вы идете по нему с широко открытыми глазами.',
		'Празднуйте ваши победы. Смакуйте каждый, пусть даже самый маленький успех.',
		'Умей прощать. В первую очередь это нужно тебе, а не тем, кто тебя обидел. Прощая, ты обретаешь покой и свободу, которые заслуживаешь. Прощай легко и быстро.',
		'Мы все обладаем невероятной интуицией. Если остановиться, замереть и прислушаться, то можно услышать голос своей внутренней мудрости. Слушайте тихий шепот вашего сердца. Оно знает дорогу.',
		'Пусть ваша душа поет! Будьте настоящими. На Земле нет никого такого же, как вы. Будьте искренними, живите и дышите полной грудью, двигаясь к намеченным целям.',
		'Мы все творцы. Серьезно! При должном упорстве, концентрации и настойчивости возможно все. Помните об этом.',
		'Я излучаю свет. Вы излучаете свет. Мы все излучаем свет. Некоторые отбрасывают тень на свою собственную яркость. Будьте лучом света для других и указывайте им путь.',
		'Не воспринимайте жизнь слишком серьезно! Все равно никто не уйдет живым. Улыбнись. Позвольте себе быть глупыми. Пользуйтесь моментом. Развлекайтесь.',
		'Окружайте себя людьми, которые вас любят и поддерживают. И сами любите и поддерживайте их. Жизнь слишком коротка для чего-то меньшего.',
		'Кружитесь по жизни в свободном танце. Если у вас есть большая мечта, следуйте за ней со всей страстью. Но нежно и на определенном расстоянии, чтобы быть достаточно гибким и подвижным, подстраиваясь под меняющийся ритм жизни.',
		'Чем больше даешь, тем больше получаешь. Делитесь мудростью, любовью, талантом. Делитесь легко. И вы увидите, как много в этой жизни прекрасного к вам возвращается.',
		'Главное не раздать себя полностью. Потому что если внутренняя чаша опустеет, то больше нечего будет дать. Важно соблюдать баланс.',
		'Говорите «Да!» всему тому, от чего загораются ваши глаза. Говорите непримиримое «Нет» всему, что вас не интересует или на что у вас нет времени. Время — самый ценный ресурс, который не возобновляется. Расходуйте его разумно.',
		'Иногда мы перерастаем дружбу. Это не значит, что мы или друзья плохие. Просто наши пути расходятся. Сохраните их в своем сердце, но если они начинают вас обижать или сдерживать, значит пришло время установить дистанцию и отпустить вашу дружбу.',
		'Страх — очень хороший показатель того, чего мы на самом деле хотим и что нам нужно в этой жизни. Позвольте ему быть вашим компасом и наслаждайтесь волнующими приключениями, к которым он вас ведет.',
		'Преодолеть собственный страх – это самая полезная вещь, которую вы можете для себя сделать. Тем самым вы доказываете сами себе, что можете все. Это – генератор уверенности в себе.',
		'Наше тело – это транспорт, который везет нас к нашей мечте. Любите его, относитесь бережно и заботливо, если хотите чувствовать себя бодрым и энергичным. Но не зацикливайтесь. Внешность субъективна и со временем так или иначе меняется. Чувствовать себя комфортно и удобно в собственном теле – вот что самое главное.',
		'Как можно чаще говорите и показывайте близким, как вы их любите. Этого не бывает слишком много. Ваше время, присутствие рядом, любовь и искренняя забота о них – самый лучший подарок.',
		'Живите настоящим. Это единственное, что у нас сейчас есть. Учитесь на ошибках прошлого и наслаждайтесь приятными воспоминаниями, но не цепляйтесь за них и не позволяйте им вас преследовать. Мечтайте о будущем, но без фанатизма и одержимости. Любите настоящее.',
		'Жизнь – это череда взлетов и падений. Чтобы раскрыть весь свой потенциал, нам необходимо и то, и другое. Просто держитесь покрепче и наслаждайтесь поездкой.',
		'Мы все – одна большая человеческая семья. Никто из нас не лучше и не хуже других. Просто на каком-то этапе жизни мы знаем, что делать. В следующий раз это будет кто-то другой.',
		'Будьте благодарны каждый день за все то, что вы в жизни имеете. Таким образом вы создаете вокруг себя пространство для еще большего изобилия, притягивая радость, любовь, здоровье и процветание.',
		'Вы не центр Вселенной. Хотя иногда ваше эго заставляет вас так думать. Не стоит. Посмотрите на мир и людей вокруг, и вы узнаете много нового и прекрасного.',
		'Миру нужно больше любви, света и смеха.',
		'Вы сам себе гуру. Большую часть жизни нам говорят, что делать, как думать, что есть хорошо и как добиться успеха. Не стоит всему этому безоговорочно верить. Думайте сами за себя. Как только вы начнете следовать собственной интуиции, вы почувствуете себя до смешного счастливым.'
	],
	['Будда', 'http://www.adme.ru/svoboda-psihologiya/25-urokov-buddy-kotorye-pomogut-izbavitsya-ot-volnenij-1153760/',
		'Спокойствие находится внутри вас. Не ищите его вовне.',
		'Когда ум ясен, радость следует за вами, словно тень, и никогда не покидает вас.',
		'Мы сформированы из наших мыслей. Мы становимся тем, о чем думаем.',
		'Секрет здорового ума и тела заключается в том, чтобы не сокрушаться над прошлым, не слишком беспокоиться о будущем и осознанно жить настоящим моментом.',
		'Злиться — это все равно что держать раскаленный уголь в своих ладонях, намереваясь бросить его в кого-то. Но обжигает он в первую очередь вас.',
		'Ваше предназначение в жизни — найти свое предназначение и посвятить ему все свое сердце и душу.',
		'Глупец, который знает свою глупость, тем самым уже мудр, а глупец, мнящий себя мудрым, воистину, как говорится, глупец.',
		'Каждое утро мы рождаемся вновь. Только то, что вы делаете сейчас, имеет настоящее значение.',
		'На свете не существует пожара более сильного, чем страсть, акулы более свирепой, чем ненависть, и урагана более опустошительного, чем жадность.',
		'Счастье не зависит от того, кто вы есть или что у вас есть. Оно зависит исключительно от того, что вы думаете.',
		'Вы не будете наказаны за свой гнев, вы будете наказаны вашим гневом.',
		'Понять всё — значит простить всё.',
		'Лучше ошибиться тысячи раз, приняв негодяя за святого, чем один раз, приняв святого за негодяя.',
		'Ненависть никогда не истребится ненавистью, а только любовью.',
		'Все, что мы есть, — это результат наших мыслей.',
		'Весь секрет существования заключается в избавлении от страхов. Не бойся того, что с тобой будет, твое будущее от этого не изменится, зато настоящее станет спокойным.',
		'Нет пути к счастью. Счастье и есть путь.',
		'Боль неизбежна. Но страдание — личный выбор каждого.',
		'Счастье никогда не придет к тому, кто не ценит того, что уже имеет.',
		'Тысячи свечей можно зажечь от единственной свечи, и жизнь ее не станет короче. Счастья не становится меньше, когда им делишься.',
		'Если рука не ранена, можно нести яд в руке. Яд не повредит не имеющего ран. Кто сам не делает зла, не подвержен злу.',
		'Даже разумный человек будет глупеть, если он не будет самосовершенствоваться.',
		'Одно полезное слово, услышав которое становятся спокойными, лучше тысячи речей, составленных из бесполезных слов.',
		'Победи себя, и выиграешь тысячи битв.'
	],
	['Пётр Мамонов', 'http://www.adme.ru/vdohnovenie/prostye-pravila-zhizni-ot-petra-mamonova-472805/',
		'Не обижайте людей и не обижайтесь на других.',
		'Как можно чаще прикасайтесь к любимому человеку.',
		'Всегда смотрите в глаза собеседнику.',
		'Не бойтесь перемен, но и не желайте их.',
		'Идите на компромиссы.',
		'Делайте праздник из каждого события.',
		'Играйте музыку, пойте любимые песни как можно чаще.',
		'Ходите на концерты.',
		'Засыпайте с улыбкой.',
		'Всегда поздравляйте друзей с днем рождения.',
		'Дарите подарки.',
		'Звоните родителям.',
		'Почаще улыбайтесь себе в зеркале.',
		'Не бойтесь казаться смешным.',
		'Не считайте невежество и бедность за порок.',
		'Не учите других, как им поступать в личной жизни.',
		'Ведите дневник.',
		'Делитесь знаниями.',
		'Думайте о любимых.',
		'Меняйтесь.',
		'Нарушайте правила.',
		'Оставайтесь собой.',
		'Не смотрите телевизор.',
		'Позволяйте другим заботиться о вас.',
		'Ищите во всем светлую сторону.',
		'Делитесь радостью от просмотренных фильмов и услышанной музыки.',
		'Не стесняйтесь своих юношеских стихов.',
		'Будьте безрассудны ко всему, кроме детей.',
		'Удивляйтесь миру.',
		'Верьте в себя.',
		'В отпуске отключайте мобильный телефон.',
		'Всегда говорите спасибо.',
		'Берегите тех, кто вас любит.',
		'Будьте лучшим для любимого человека.',
		'Не ругайте ничего из того, что вы сделали, и не критикуйте выбор других людей.',
		'Не тратьте время на людей, которым вы безразличны.',
		'Учитесь проигрывать и не сожалеть об этом.',
	],
	['Уильям Шекспир', 'http://fit4brain.com/7591',
		'Совсем не знак бездушья – молчаливость. Гремит лишь то, что пусто изнутри.',
		'Так сладок мед, что, наконец, он горек. Избыток вкуса убивает вкус.',
		'Мы раздражаемся по пустякам, когда задеты чем-нибудь серьезным.',
		'Клятвы, данные в бурю, забываются в тихую погоду.',
		'Природа-мать мудра, да сын безмозглый.',
		'Где мало слов, там вес они имеют.',
		'Любовь бежит от тех, кто гонится за нею, а тем, кто прочь бежит, кидается на шею.',
		'Глупость и мудрость с такой же легкостью схватываются, как и заразные болезни. Поэтому выбирай себе товарищей.',
		'Чтобы поймать счастье, надо уметь бегать.',
		'Большинство людей предпочитают глупость мудрости, ибо глупость смешит, а мудрость печалит.',
		'Надежда на наслаждение почти так же приятна, как и само наслаждение.',
		'Не слишком разжигайте печь для своих врагов, иначе вы сгорите в ней сами.',
		'У каждого безумия есть своя логика.',
		'Влюбиться можно в красоту, но полюбить – лишь только душу.',
		'Одним взглядом можно убить любовь, одним же взглядом можно воскресить её.',
		'Трус умирает при каждой опасности, грозящей ему, храброго же смерть настигает только раз.',
		'Три правила достижения успеха: знать больше, чем остальные; работать больше, чем остальные; ожидать меньше, чем остальные.',
		'Нет ничего ни плохого, ни хорошего в этом мире. Есть только наше отношение к чему-либо.',
		'Самое лучшее – прямо и просто сказанное слово.',
		'Грехи других судить Вы так усердно рвётесь – начните со своих и до чужих не доберётесь.',
		'Ад пуст. Все бесы здесь.'
	],
	['Карл Густав Юнг', 'http://fit4brain.com/10187',
		'Все, что раздражает в других, может вести к пониманию себя.',
		'Если вы одаренный человек, это не значит, что вы что-то получили. Это значит, что вы можете что-то отдать.',
		'Покажите мне психически здорового человека, и я вам его вылечу.',
		'Мы тянемся в прошлое, к своим родителям, и вперед, к нашим детям, в будущее, которого мы никогда не увидим, но о котором нам хочется позаботиться.',
		'То, чему ты сопротивляешься, остается.',
		'Депрессия подобна даме в черном. Если она пришла, не гони ее прочь, а пригласи к столу как гостью и послушай то, о чем она намерена сказать.',
		'Бывает, руки справляются с загадкой, против которой интеллект бессилен.',
		'Сновидение — маленькая, хорошо спрятанная дверь, которая ведет в ту изначальную космическую ночь, которой была душа еще до возникновения сознания.',
		'Все, что не устраивает нас в других, позволяет понять самих себя.',
		'Кто не прошел через чистилище собственных страстей, тот не преодолел их до конца.',
		'Ваш взор станет ясным лишь тогда, когда вы сможете заглянуть в свою собственную душу.',
		'Я не то, что со мной случилось, я — то, чем я решил стать.',
		'Мы можем думать, что полностью контролируем себя. Однако друг может без труда рассказать нам о нас такое, о чем мы не имеем ни малейшего представления.',
		'«Магический» — просто другое слово для обозначения психического.',
		'Наши личности являются частью окружающего нас мира, и их тайна так же безгранична.',
		'Встреча двух личностей подобна контакту двух химических веществ: если есть хоть малейшая реакция, изменяются оба элемента.',
		'Самое тяжкое бремя, которое ложится на плечи ребенка, — это непрожитая жизнь его родителей.',
		'Твое видение станет ясным, только если ты сможешь заглянуть в свое сердце. Кто смотрит наружу — видит лишь сны, кто смотрит в себя — пробуждается.',
		'Одиночество обусловлено не отсутствием людей вокруг, а невозможностью говорить с людьми о том, что кажется тебе существенным, или неприемлемостью твоих воззрений для других.',
		'Не удерживай того, кто уходит от тебя. Иначе не придет тот, кто идет к тебе.'
	],
	['George Carlin', 'http://fit4brain.com/8253',
		'Знаем, как выжить, но не знаем, как жить.',
		'Мне нравится, когда цветок или пучок травы растет сквозь щель в бетоне. Это, черт возьми, героически.',
		'По-моему, нужно создать горячую линию, где никогда не будут брать трубку: для тех, кто никогда не следует советам.',
		'В жизни все просто: счастье целиком зависит от везения и от генов. Все сводится к генам и к везению. А если задуматься, то и гены — это вопрос везения.',
		'Если вы хотите узнать, как помочь своим детям, — отстаньте от них!',
		'Есть немало людей, озабоченных безопасностью атомных станций и не пристегивающихся в машине.',
		'Люди, которые видят в жизни что-то большее, чем простое развлечение, не уловили сути.',
		'С планетой все в порядке. Это людям п#здец!',
		'Недавно я понял, для чего нужна электронная почта. Чтобы общаться с теми, с кем не хочешь разговаривать.',
		'Не смейте недооценивать возможности тупых людей, собравшихся в большие группы.',
		'Каждый третий житель планеты страдает от той или иной формы психического заболевания. Подумайте о ваших двух лучших друзьях. Если они в порядке, то это должно быть вы.',
		'Дом — это то место, где хранится наше барахло в то время, пока мы находимся вне дома, чтобы добыть больше барахла.',
		'Что хорошего в эгоистах? Они не обсуждают других людей.',
		'Если все дети особые, почему из них вырастают обычные взрослые?',
		'Внутри каждого циника сидит разочарованный идеалист.',
		'Говорим слишком много, любим слишком редко и ненавидим слишком часто.',
		'Живи так, будто этот день — последний, и однажды так оно и окажется. А ты будешь во всеоружии.',
		'Не успеешь найти смысл жизни, как его уже поменяли.'
	]

];

function showQuote() {

	function getRandomNum(min, max) {
		let cryptoList = new Int8Array(max);
		let result = Math.floor(Math.random() * (max - min)) + min; 

		let cryptoResult = 0;

		for (let i = 0; i < max; i++) {
			cryptoList = window.crypto.getRandomValues(cryptoList);
			cryptoResult = Math.abs(cryptoList[Math.floor(Math.random() * (cryptoList.length))]);

			if (cryptoResult >= min && cryptoResult < max) {
				result = cryptoResult;
				break;
			}
			if (i >= max) {
				console.log('window.crypto.getRandomValues failed, switch to Math.random()');
			}
		}
		return result;
	}

	let authorInd = getRandomNum(0, quotes.length);
	if (document.querySelector('#id-a-quoteAuthor').innerText === quotes[authorInd][0]) {
		authorInd = getRandomNum(0, quotes.length); 
	}

	let quoteInd = getRandomNum(2, quotes[authorInd].length - 2); 
	if (document.querySelector('#id-p-quoteText').innerHTML === quotes[authorInd][quoteInd]) {
		quoteInd = getRandomNum(2, quotes[authorInd].length - 2); 
	}

	document.querySelector('#id-p-quoteText').innerHTML = quotes[authorInd][quoteInd];

	document.querySelector('#id-a-quoteAuthor').setAttribute('href', quotes[authorInd][1]);
	document.querySelector('#id-a-quoteAuthor').innerHTML = quotes[authorInd][0];

	let quoteTwitText = quotes[authorInd][quoteInd] + ' &hashtags=' + quotes[authorInd][0].replace(/\s+/g, '');

	if (quoteTwitText.length > 140) {
		quoteTwitText = quotes[authorInd][quoteInd].substring(0, 140 - 6 - quotes[authorInd][0].length) + ' ...' + ' &hashtags=' + quotes[authorInd][0].replace(/\s+/g, ''); 
	}

	document.querySelector('#id_twitOutBtn').setAttribute('href', 'https://twitter.com/intent/tweet?text=' + quoteTwitText);
}

function init() {
	let quotesall = 0;

	for (let i = 0; i < quotes.length - 1; i++) {
		for (let j = 0; j < quotes[i].length; j++) {
			quotesall++;
		}
	}

	document.querySelector('#id_divHeaderText').innerHTML = ' авторов: ' + quotes.length.toString() + ' цитат: ' + quotesall.toString() + ' ';

	document.querySelector('#id_getQuoteBtn').addEventListener('click', showQuote);

	showQuote();
}

window.addEventListener('load', init);
