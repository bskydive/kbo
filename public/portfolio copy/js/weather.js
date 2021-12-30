



function weatherController() {
	let app = this;

	const apiKey = "9810b9f35c8f7b1ee6ae08d2d6f49e06";




	app.vm = new Vue({
		el: '#vue-main-controller',
		data() { 
			return {
				weatherList: [],
				inputLon: '', 
				inputLat: '',
				locationLabels: ['', '', ''], 
				unitNameIdActive: 0, 
				locationIdActive: 0, 
				langIdActive: 1, 
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
					windUnitCap: [" m/s", " feet/s"], 
					pressUnitCap: [" hPa", " гПа"],
					tempUnitCap: [" C", " K"],
					langJson: ["en", "ru"],
					unitsJson: ["metric", "imperial"],
					unitNameMetric: ['Metric units', 'Метрические единицы'],
					unitNameImperial: ['Imperial units', 'Имперские единицы']
				}
			};
		},
		created() { 
			this.refreshData();
		},
		computed: { 

		},
		watch: { 

		},
		methods: { 
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
				this.refreshData();
			},
			setLangRu() {
				this.langIdActive = 1;
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
				this.locationHeader = this.localization.loadingHeader[this.langIdActive]; 
				this.weatherList = [];
				this.locationLabels = [];

				let inputLatitude = parseFloat(this.inputLat);
				let inputLongitude = parseFloat(this.inputLon);

				if (inputLatitude.isNaN || inputLongitude.isNaN) {
					let coords = getCoordLocal();
					if (coords.latitude >= 0 && coords.longitude >= 0) { 
						this.inputLat = String(coords.latitude);
						this.inputLon = String(coords.longitude);
					}
				}

				getCoordinates(inputLatitude, inputLongitude)
					.then(getWeather)
					.then(parseResponse)
					.then(weatherListParsed => {
						weatherListParsed.locationLabels.forEach(item => { 
							this.locationLabels.push(item);
						});

						weatherListParsed.weatherList.forEach(item => { 
							this.weatherList.push(item);
						});

						this.locationHeader = this.localization.locationHeader[this.langIdActive];

					})
					.catch(err => {

						this.locationHeader = vm.localization.locationRestricted[vm.langIdActive];
						console.error('portfolio/src/app/weather/weather.js:471', err);
					});
			}
		}
	});


	function getResponse(remoteUrl) {
		return new Promise((resolve, reject) => {

			let request = new XMLHttpRequest();

			request.open('GET', remoteUrl, true);

			request.responseType = 'json';

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
					}

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
		});
	}




	function getWeatherIcon(weatherIcon) {
		return "https://openweathermap.org/img/w/" + weatherIcon + ".png";
	}

	function parseResponse(response) {
		let result = {
			locationLabels: [],
			weatherList: []
		};

		if ((typeof (response) === 'object') && (typeof (response.list) === 'object') && (response.list.length > 0)) {
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
				}, { 
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
			return Promise.resolve(result);
		} else {
			return Promise.reject(['invalid response=', response]);
		}
	}

	function getWeather(coords) {

		let coordsParsed = coords.coords;

		if (typeof (coordsParsed.latitude) === 'number' && coordsParsed.latitude >= 0 &&
			typeof (coordsParsed.longitude) === 'number' && coordsParsed.longitude >= 0) {

			let httpText = "https://api.openweathermap.org/data/2.5/find?" +
				"units=" + vm.localization.unitsJson[vm.unitNameIdActive] +
				"&lang=" + vm.localization.langJson[vm.langIdActive] +
				"&lat=" + (Math.round(coordsParsed.latitude * 100) / 100).toString() +
				"&lon=" + (Math.round(coordsParsed.longitude * 100) / 100).toString() +
				"&cnt=3" +
				"&appid=" + apiKey; 
			return getResponse(httpText);
		} else {
			return Promise.reject(['Введите координаты вручную', coords]);
		}
	}

	function getCoordLocal() {
		let result = {
			latitude: parseFloat(window.localStorage.getItem('input-latitude')),
			longitude: parseFloat(window.localStorage.getItem('input-longitude'))
		};
		return result;
	};

	function setCoordsLocal(inputLatitude, inputLongitude) {
		window.localStorage.setItem('input-latitude', String(inputLatitude)); 
		window.localStorage.setItem('input-longitude', String(inputLongitude));
	};

	function getCoordinates(inputLat, inputLon) {
		let inputLatitude = parseFloat(this.inputLat);
		let inputLongitude = parseFloat(this.inputLon);

		return new Promise((resolve, reject) => {
			let coords = {
				coords: {
					latitude: NaN,
					longitude: NaN
				}
			};

			if (inputLatitude >= 0 && inputLongitude >= 0) { 
				coords.coords.latitude = inputLatitude;
				coords.coords.longitude = inputLongitude;

				setCoordsLocal(inputLatitude, inputLongitude); 

				return resolve(coords);
			}


			if (coords.coords.latitude >= 0 && coords.coords.longitude >= 0) { 
				return resolve(coords);
			}

			return getBrowserCoordinates(resolve, reject); 
		});
	}

	function getBrowserCoordinates(resolve, reject) {
		let options = { 
			enableHighAccuracy: true,
			timeout: 5000,
			maximumAge: 75000
		};

		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(resolve, reject, options); 
		} else {
			return Promise.reject(['Введите координаты вручную', coords]);
		}
	}

}


window.addEventListener("load", function () {
	weatherController();
});
