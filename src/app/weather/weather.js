/**
 *
 * Веб-приложение для
 *    показа погоды из openweathermap.org на основе ручного ввода координат или запроса из браузера
 *    тестирования годности vue.js
 *
 * В приложении пока один контроллер и два компонента в одном файле pug/js/css.
 * Итого, на текущий момент мне не удалось его удобно приспособить для многофайловых(модульных/компонентных) приложений
 * Особенно интересно как удобно сделать показ компонента только после того, как закончен рассчёт соседнего. https://vuejs.org/v2/guide/reactivity.html#Declaring-Reactive-Properties
 *
 * Видимо тут уже требуется vuEx
 *
 * ТУДУ:
 * todo dev/prod env, vue(env)
 * todo разделить на несколько компонентов
 * todo Show distance from current geo position to nearest weather location points
 * todo Get weather from narodmon json api
 * todo Get geo location from ipinfo.io/loc json api
 * todo Choose geo location api
 * todo Show weather history graphs: month, week, day
 * todo Show weather forecast(openweathermap only)
 * todo Make android client
 * todo Determine adblock
 * todo replace Bootstrap grid with custom container
 */



//require('weather.less');
//require('weather.pug');
//let Vue = require('../../js/vue.runtime.min');

function weatherController() {
	let app = this;

	const apiKey = "9810b9f35c8f7b1ee6ae08d2d6f49e06";

	//==============================================================================VUE===============================================================================

	/*
	const AsyncComp = () => ({
		// The component to load. Should be a Promise
		component: import('./MyComp.vue'),
		// A component to use while the async component is loading
		loading: LoadingComp,
		// A component to use if the load fails
		error: ErrorComp,
		// Delay before showing the loading component. Default: 200ms.
		delay: 200,
		// The error component will be displayed if a timeout is
		// provided and exceeded. Default: Infinity.
		timeout: 3000
	});


	let getWeatherMixin = {//заготовка для миксина. Его недостаток в том, что нельзя обращаться к данным родителя, можно только добавить ещё данных
							//возможно удастся прокинуть как-то внутрь this, но есть риск рекурсии
		created: function () {
			this.getData();
		},
		methods: {
			getData: function () {

			}
		}
	};
	*/

	///**
	// * Шаблон списка с параметрами погоды
	// * переносим максимум текста параметров из html в js
	// * https://vuejs.org/v2/guide/components.html#DOM-Template-Parsing-Caveats
	// */
	//function initListComponentTemplate() {
	//
	//	let ListTemplate = '<li>{{item.value}}<span>{{item.description}}</span></li>';
	//
	//	Vue.component(
	//			'list-component', {
	//				props: ['item'],
	//				template: ListTemplate
	//			}
	//	);
	//}

	/**
	 * Инициализация экземпляра класса Vue, который определён в <script> без import/require в js
	 *     https://vuejs.org/v2/guide/installation.html#Direct-lt-script-gt-Include
	 */
	app.vm = new Vue({
		el: '#vue-main-controller',
		data() { //реактивные переменные
			return {
				weatherList: [],
				inputLon: '', //значения полей ввода координат
				inputLat: '',
				locationLabels: ['', '', ''], //надписи на кнопках выбора локаций
				unitNameIdActive: 0, //индекс массива текущей системы единиц измерения
				locationIdActive: 0, //индекс массива текущей локации
				langIdActive: 1, //индекс массива текущего языка
				locationHeader: '',
				localization: {
					locationHeader: ["Weather geo location: ", "Точка определения погоды: "],
					loadingHeader: ["Waiting for server response ... ", "Ожидаем ответа сервера ..."],
					locationNameEmpty: ['Unknown', 'Неизвестно'],
					locationRestricted: ['Allow browser to show your coordinates or enter coordinates manually', 'Разрешите браузеру передать Ваши координаты или ведите координаты вручную'],
					locationLonDesc: ["Longitude", "Долгота"],
					locationLatDesc: ["Latitude", "Широта"],
					pressureDesc: ["Atmospheric pressure", "Атмосферное давление"],
					temperatureDesc: ["Air temperature", "Температура воздуха"],
					humidityDesc: ["Air humidity", "Влажность воздуха"],
					windDesc: ["Wind speed", "Скорость ветра"],
					windUnitCap: [" m/s", " feet/s"], //todo сделать перевод на русский язык
					pressUnitCap: [" hPa", " гПа"],
					tempUnitCap: [" C", " K"],
					langJson: ["en", "ru"],
					unitsJson: ["metric", "imperial"],
					unitNameMetric: ['Metric units', 'Метрические единицы'],
					unitNameImperial: ['Imperial units', 'Имперские единицы']
				}
			};
		},
		created() { //инициализация
			this.refreshData();
		},
		computed: { //обёртки для рендеринга html без реактивности

		},
		watch: { //наблюдатели для переменных

		},
		methods: { //для методов https://vuejs.org/v2/guide/computed.html#Computed-Caching-vs-Methods
			switchUnit(selectedId) {
				let result = parseInt(selectedId);
				const MAX_UNIT_ID_COUNT = 2;
				if (result > 0 && result <= MAX_UNIT_ID_COUNT) {
					this.unitNameIdActive = result;
				} else {
					this.unitNameIdActive = 0;
				}
			},
			switchLocation(selectedId) {
				let result = parseInt(selectedId);
				const MAX_UNIT_ID_COUNT = 2;
				if (result > 0 && result <= MAX_UNIT_ID_COUNT) {
					this.locationIdActive = result;
				} else {
					this.locationIdActive = 0;
				}
			},
			isLangEn() {
				return this.langIdActive === 0;
			},
			isLangRu() {
				return this.langIdActive === 1;
			},
			setLangEn() {
				this.langIdActive = 0;
				//				console.log('lang',langIdActive, this.langIdActive);
				this.refreshData();
			},
			setLangRu() {
				this.langIdActive = 1;
				//				console.log('lang',langIdActive, this.langIdActive);
				this.refreshData();
			},
			setUnitNameMetric() {
				this.unitNameIdActive = 0;
				this.refreshData();
			},
			setUnitNameImperial() {
				this.unitNameIdActive = 1;
				this.refreshData();
			},
			isUnitNameMetric() {
				return this.unitNameIdActive === 0;
			},
			isUnitNameImperial() {
				return this.unitNameIdActive === 1;
			},
			isLocationActive(index) {
				//				console.log('location',index,locationIdActive, index === locationIdActive);
				return index === this.locationIdActive;
			},
			setLocationIdActive(index) {
				this.locationIdActive = index;
			},
			updateArrayReactive(src, dst) {
				dst = [];
				src.forEach(item => {
					dst.push(item);
				});
			},
			clearCoordsLocal() {
				setCoordsLocal(-1, -1);
				this.inputLat = '';
				this.inputLon = '';
			},
			refreshData() {
				//			console.log('portfolio/src/app/weather/weather.js:443', this.weatherList);
				//todo get country&units from BOM
				this.locationHeader = this.localization.loadingHeader[this.langIdActive]; //загружаем данные
				this.weatherList = [];
				this.locationLabels = [];

				//костыль пока не решена проблема проброса изнутри цепочки промисов в vm
				let inputLatitude = parseFloat(this.inputLat);
				let inputLongitude = parseFloat(this.inputLon);

				if (inputLatitude.isNaN || inputLongitude.isNaN) {
					let coords = getCoordLocal();
					if (coords.latitude >= 0 && coords.longitude >= 0) { //если есть локально сохранённые координаты
						this.inputLat = String(coords.latitude);
						this.inputLon = String(coords.longitude);
					}
				}

				getCoordinates(inputLatitude, inputLongitude)
					.then(getWeather)
					.then(parseResponse)
					.then(weatherListParsed => {
						//						console.log('portfolio/src/app/weather/weather.js:465', this.weatherList);
						weatherListParsed.locationLabels.forEach(item => { //да, надо ещё раз пушить, чтобы сработала реактивность
							this.locationLabels.push(item);
						});

						weatherListParsed.weatherList.forEach(item => { //да, надо ещё раз пушить, чтобы сработала реактивность
							this.weatherList.push(item);
						});

						this.locationHeader = this.localization.locationHeader[this.langIdActive];

						//						console.log('portfolio/src/app/weather/weather.js:469', this.weatherList);
					})
					.catch(err => {

						this.locationHeader = vm.localization.locationRestricted[vm.langIdActive];
						console.error('portfolio/src/app/weather/weather.js:471', err);
					});
			}
		}
	});

	//==============================================================================XHR===============================================================================

	/**
	 * Асинхронный запрос погоды на сервер
	 *
	 * @param remoteUrl - подготовленная строка с ключом, параметрами и координатами
	 * @returns {Promise} - resolve(response:object) || reject({message:string,request:object})
	 * @async
	 * todo разнообразить возврат ошибок, надо переводить
	 */
	function getResponse(remoteUrl) {
		return new Promise((resolve, reject) => {

			let request = new XMLHttpRequest();

			request.open('GET', remoteUrl, true);

			request.responseType = 'json';
			//    request.mode='cors';
			//    console.log(request);

			request.timeout = 5000;

			request.ontimeout = function () {
				reject({
					message: "Timeout of " + (request.timeout / 1000).toString() + "sec exceeded ",
					request: request
				});
			};

			request.onload = function () {
				if (request.status >= 200 && request.status <= 400) {

					if (request.responseType !== "json") {
						//todo add empty response type parser
					}

					//				console.debug("Loaded content:",request);
					resolve(request.response);
				} else {
					reject({
						message: "Response failed: ",
						request: request
					});
				}
			};

			request.onerror = function () {
				reject({
					message: "Request failed: ",
					request: request
				});
			};

			request.onabort = function () {
				reject({
					message: "Response aborted: ",
					request: request
				});
			};

			request.onprogress = function () {
				if (request.lengthComputable) {
					let percentComplete = request.loaded / request.total;
					console.info('loaded: ' + percentComplete);
				} else {
					console.warn('Unable to compute progress information since the total size is unknown');
				}
			};

			request.send();
			//		console.info('request send');
		});
	}

	//==============================================================================NARODMON==========================================================================

	//function getCoordinatesNM(){
	//    //http://narodmon.ru/api?cmd=sensorsNearby&lat=55.75&lng=37.62&radius=2&types=1,2&uuid=UUID&api_key=API_KEY&lang=en
	//}

	//==============================================================================WEATHER===========================================================================

	/**
	 * Получаем изображение иконки с официального сайта
	 * @param weatherIcon {string} - название иконки
	 * @returns {string} - url иконки
	 */
	function getWeatherIcon(weatherIcon) {
		return "https://openweathermap.org/img/w/" + weatherIcon + ".png";
	}

	//var jsonOWMDesc = {//openweathermap.org
	//
	//        coord: {
	//            lon: "Weather geo location, longitude",
	//            lat: "Weather geo location, latitude"
	//        },
	//        weather: {
	//            id: "Weather condition id",
	//            main: "Group of weather parameters (Rain, Snow, Extreme etc_)",
	//            description: "Weather condition within the group",
	//            icon: "Weather icon id"
	//        },
	//        base: "Internal parameter",
	//        main: {
	//            temp: "Temperature",
	//            pressure: "Atmospheric pressure", //(on the sea level, if there is no sea_level or grnd_level data), hPa",
	//            humidity: "Humidity",
	//
	//            temp_min: "Minimum temperature at the moment_ ",
	//            temp_max: "Maximum temperature at the moment_ ",
	//            sea_level: "Atmospheric pressure on the sea level, hPa",
	//            grnd_level: "Atmospheric pressure on the ground level, hPa"
	//        },
	//        wind: {
	//            "speed": "Wind speed_ Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour_",
	//            "deg": "Wind direction, degrees (meteorological)"
	//        },
	//        clouds: {
	//            "all": "Cloudiness, %"
	//        },
	//        rain: {
	//            "3h": "Rain volume for the last 3 hours"
	//        },
	//        snow: {
	//            "3h": "Snow volume for the last 3 hours"
	//        },
	//        dt: "Time of data calculation, unix, UTC",
	//        sys: {
	//            type: "Internal parameter",
	//            id: "Internal parameter",
	//            message: "Internal parameter",
	//            country: "Country code",
	//            sunrise: "Sunrise time, unix, UTC",
	//            sunset: "Sunset time, unix, UTC"
	//        },
	//        id: "City ID",
	//        name: "City name",
	//        cod: "Internal parameter"
	//    },
	//
	//imperialCountries = ['US', 'BS', 'BZ', 'KY', 'PW'],
	/**
	 * Преобразование json openweathermap.org в два массива
	 * weatherList необходим отдельно, т.к. он подаётся на v-for, для которого нужен одинаковый формат всех значений
	 * http://openweathermap.org/current#current_JSON
	 * @param response
	 * @returns {Promise<array,array>} - resolve([{description:string,value:string}] reject([message:string, response:object]))
	 * todo заменить v-html на разные строки в шаблоне. Пока непонятно как менять шаблон в зависимости от содержимого - https://vuejs.org/v2/guide/syntax.html#Raw-HTML
	 * todo упростить вёрстку и стили
	 */
	function parseResponse(response) {
		let result = {
			locationLabels: [],
			weatherList: []
		};

		if ((typeof (response) === 'object') && (typeof (response.list) === 'object') && (response.list.length > 0)) {
			//		console.log('portfolio/src/app/weather/weather.js:202',response);
			response.list.forEach(item => {

				result.locationLabels.push(item.name);

				result.weatherList.push([{
					value: item.coord.lat,
					description: vm.localization.locationLatDesc[vm.langIdActive]
				}, {
					value: item.coord.lon,
					description: vm.localization.locationLonDesc[vm.langIdActive]
				}, {
					img: getWeatherIcon(item.weather[0].icon),
					description: item.weather[0].description
				}, { //тут требуется v-html, чтобы не строка оборачивалась в кавычки, иначе знак процента не интерпретируется
					value: item.main.temp + "&deg;" + vm.localization.tempUnitCap[vm.unitNameIdActive],
					description: vm.localization.temperatureDesc[vm.langIdActive]
				}, {
					value: item.main.pressure + vm.localization.pressUnitCap[vm.langIdActive],
					description: vm.localization.pressureDesc[vm.langIdActive]
				}, {
					value: item.main.humidity + " %",
					description: vm.localization.humidityDesc[vm.langIdActive]
				}, {
					value: item.wind.speed + vm.localization.windUnitCap[vm.unitNameIdActive],
					description: vm.localization.windDesc[vm.langIdActive]
				}]);
			});
			//		console.log('portfolio/src/app/weather/weather.js:243', result);
			return Promise.resolve(result);
		} else {
			//		console.log('invalid response=' + response);
			return Promise.reject(['invalid response=', response]);
		}
	}

	/**
	 * Преобразование полученных от браузера координат для запроса погоды на сервер
	 * @param coords - объект, полученный от браузера с координатами GPS
	 * todo сделать поддержку narodmon.ru
	 */
	function getWeather(coords) {

		let coordsParsed = coords.coords;

		//		console.log('portfolio/src/app/weather/weather.js:414', coordsParsed, typeof(coordsParsed.latitude));
		if (typeof (coordsParsed.latitude) === 'number' && coordsParsed.latitude >= 0 &&
			typeof (coordsParsed.longitude) === 'number' && coordsParsed.longitude >= 0) {

			let httpText = "https://api.openweathermap.org/data/2.5/find?" +
				"units=" + vm.localization.unitsJson[vm.unitNameIdActive] +
				"&lang=" + vm.localization.langJson[vm.langIdActive] +
				"&lat=" + (Math.round(coordsParsed.latitude * 100) / 100).toString() +
				"&lon=" + (Math.round(coordsParsed.longitude * 100) / 100).toString() +
				"&cnt=3" +
				"&appid=" + apiKey; //2de143494c0b295cca9337e1e96b00e0
			//		console.log("httpText:", httpText);
			return getResponse(httpText);
			//				.then(jsonResponse => parseResponse(jsonResponse))
			//				.catch(err => {console.error(err);});
		} else {
			//			console.log('Введите координаты вручную',coords);
			return Promise.reject(['Введите координаты вручную', coords]);
		}
	}

	/**
	 * Получение координат локально сохранённых
	 * @returns {{latitude: number, longitude: number}}
	 */
	function getCoordLocal() {
		let result = {
			latitude: parseFloat(window.localStorage.getItem('input-latitude')),
			longitude: parseFloat(window.localStorage.getItem('input-longitude'))
		};
		//		console.log('portfolio/src/app/weather/weather.js:445', app.vm);
		return result;
	};

	/**
	 * Сохранение координат локально
	 * @param inputLatitude {number}
	 * @param inputLongitude {number}
	 */
	function setCoordsLocal(inputLatitude, inputLongitude) {
		window.localStorage.setItem('input-latitude', String(inputLatitude)); //сохраняем их локально
		window.localStorage.setItem('input-longitude', String(inputLongitude));
	};

	/**
	 * Получение координат локально или на сервере, и передача их далее в обработчик
	 * Приоритеты:
	 * 1 введённые вручную
	 * 2 сохранённые локально(поднимаются в поля ввода из хранилища автоматически внутри компонента vue)
	 * 3 из браузера
	 * 4 ошибка
	 *
	 * используется единый формат: https://developer.mozilla.org/en-US/docs/Web/API/Coordinates
	 *
	 * @returns {Promise<function(object), object>} - resolve(getWeather(coords)) или reject({message:string})
	 * todo сделать синхронизацию из внешней функции-промиса внутрь vm.
	 */
	function getCoordinates(inputLat, inputLon) {
		//		console.log('portfolio/src/app/weather/weather.js:468', inputLat, inputLon);//vm=undefined
		let inputLatitude = parseFloat(this.inputLat);
		let inputLongitude = parseFloat(this.inputLon);

		return new Promise((resolve, reject) => {
			let coords = {
				coords: {
					latitude: NaN,
					longitude: NaN
				}
			};

			if (inputLatitude >= 0 && inputLongitude >= 0) { //если пользователь ввёл координаты вручную
				coords.coords.latitude = inputLatitude;
				coords.coords.longitude = inputLongitude;

				setCoordsLocal(inputLatitude, inputLongitude); //сохраняем их локально

				//				console.log('portfolio/src/app/weather/weather.js:468', coords);
				return resolve(coords);
			}

			//			coords.coords = getCoordLocal();//костыль

			if (coords.coords.latitude >= 0 && coords.coords.longitude >= 0) { //если есть локально сохранённые координаты
				//				console.log('portfolio/src/app/weather/weather.js:478', coords);
				return resolve(coords);
			}

			return getBrowserCoordinates(resolve, reject); //берём из браузера
		});
	}

	/**
	 * получение координат из браузера
	 * @param resolve {function} - функция в случае успешного получения координат
	 * @param reject {function} - функция в случае фиаско получения координат - http://devdocs.io/dom/positionerror
	 *
	 * https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/Using_geolocation
	 *
	 */
	function getBrowserCoordinates(resolve, reject) {
		let options = { //https://developer.mozilla.org/en-US/docs/Web/API/PositionOptions
			enableHighAccuracy: true,
			timeout: 5000,
			maximumAge: 75000
		};

		if (navigator.geolocation) {
			//			console.log('portfolio/src/app/weather/weather.js:502', navigator.geolocation);
			navigator.geolocation.getCurrentPosition(resolve, reject, options); //передаём координаты в обработчик resolve
		} else {
			//			console.log('Введите координаты вручную',coords);
			return Promise.reject(['Введите координаты вручную', coords]);
		}
	}

}

//==============================================================================INIT==============================================================================

window.addEventListener("load", function () {
	weatherController();
});
