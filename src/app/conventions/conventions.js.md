# Соглашения про javaScript, DOM, BOM

## [Соглашения](/txt/conventions.md.html)

## [Соглашения про javaScript, DOM, BOM](/txt/conventions.js.md.html)

## [Соглашения про LESS/CSS](/txt/conventions.less.md.html)

## [Соглашения про Ангуляр](/txt/conventions.angular.md.html)

## [Соглашения про VUE](/txt/conventions.vue.md.html)

## [Соглашения - черновик](/txt/conventions.draft.md.html)

## События

1. В chrome заблокирован вывод window.confirm по событию закрытия вкладки. 
	Поэтому, выполняем [хак](https://stackoverflow.com/questions/7794301/window-onunload-is-not-working-properly-in-chrome-browser-can-any-one-help-me)
	
	```js
	$window.onbeforeunload = function (event)
								{
									$scope.openModalAutoComplete();
									return 'Необходимо ваше внимание';
								};
	```

1. Перменные необходимо называть существительными, описывающими их назначение(содержимое), "верблюжьим"(camelCase) регистром.

	```js
	let applicantSurName = '';
	```

1. Названия логических(boolean) переменных необходимо начинать с `is`

	```js
	let isModalVisible = false;
	```

1. Константы необходимо именовать в верхнем регистре(заглавными). Разделитель - подчёркивание.

	```js
	const NUMBER_VOCABULARY_POSITION = 888;

	```
	
1. Числовые значения не обозначающие количество/порядковый номер необходимо объявлять как константы для удобства чтения.

	Неверно:
	
	```js
		if (user.type === 888) {}
	```
	
	Верно:
    	
    ```js
    	const USER_TYPE_RECRUITER = 888;
    	if (user.type === USER_TYPE_RECRUITER) {}
    ```
    
1. Константы, логически отосящиеся к сервисам необходимо объявлять внутри них для сокращения кода.
	
	```js
        if (user.type === authService.USER_TYPE_RECRUITER) {}
	```

1. При написании и правке кода необходимо убирать ненужные комментарии и console.log

1. Использовать для логирования на продуктиве `src/app/common/services/error-service.js` вместо console.log

	Пример:
	```js
		 errorService.error(
    	 error,
    	 'Ошибка при сохранении позиции applicantService.positionName',
    	 {isUseLogger: true},
    	 'warning',
    	 'src/app/applicant/profile/profile-controller.js',
    	 'initUser.openModalOnMouseLeave-->applicantService.update',
    	 'PG-1481'
     );
	```

1. При рефакторинге кода необходимо [описывать функции](http://usejsdoc.org/) для удобства чтения.
	Если потратили время на разбор, то необходимо сохранить и переиспользовтаь результаты труда.
	
	пример:
	```js
	/**
		* Что делает функция с точки зрения бизнес-логики, а не перечисление названий переменных.
	 	* Крайне желательно указать где её вызывают
 		* Крайне желательно описать формат объектов переменных на вход и выход 
		*
		* @param {тип_данных} название_входного_параметра - описание возможных вариантов значений
		* @return {тип_данных} -  описание возможных вариантов значений
		*/
	
	```
	

1. Функции с возвратом промиссов должны возвращать одинаковый тип данных

	Верно:
	```js
	function fun1(){
		if (var1){	
			return service1.fun2()
						.then(data => {
							//...
							resolve(data);
						})
						.catch(error => {
							//...
							reject(error);
						});
		} else {
			return Promise.reject(false);//либо id ошибки внутри объекта аналогичного error
		}
	};
	```
	
	НеВерно:
	```js
	function fun1(){
    	if (var1){
			return service1.fun2()
								.then(data => {
									//...
									resolve(data);
								});
   		} else {
   			reject('error text');
  		}
    };
	```
	
1. В код вывода в консоль при отладке необходимо вставлять указание на место вызова, чтобы быстрее удалять ненужный код.
	В intellij* IDE это ctrl+shift+alt+c, ctrl+v

	```js
	console.log('src/app/main/login/login-modal-controller.js:68',user);

	```
	
1. Для перехвата catch() промисов необходимо возвращать промис:

	Верно:
	```js
		loginToken = function (token) {
        		this.cleanUserLocalData();
        		return userService.getByToken(token)
        				.then(user => {
        					return Promise.resolve(this.setUserLocalData(user));
        				})
        				.catch(error => {
        					return Promise.reject(error);
        				});
        	};

		loginToken(authService.getToken())
        						.then(user => {
        						})
        						.catch(error => {
	       						 });
	
	``` 
	
	НеВерно:
	```js
		loginToken = function (token) {
				this.cleanUserLocalData();
				return userService.getByToken(token)
						.then(user => {
							return this.setUserLocalData(user);
						})
						.catch(error => {
							return error;
						});
			};

		loginToken(authService.getToken())
								.then(user => {
								//пойдёт тут даже при loginToken.reject
								})
								.catch(error => {
								 });
	``` 
	
1. Если для одинарного показа модального окна необходимо перед вызовом функции показа записывать 
	`localStorage.setItem('isModalXYZOpenedOnce' , '1')`, то необходимо 
   добавить в `authService.cleanUserLocalData --> localStorage.removeItem('isModalXYZOpenedOnce')`. 
   Т.к. после логина нового пользователя он может быть уже другим даже на одном и том же браузере.
   
1. Использовать вызовы сервисов вместо прямого доступа к переменным. Это сокращает код.
	`authService.getUserLocalData().typeName` вместо $rootScope.user.typeName
	
1. Дублированный код необходимо переносить в отдельный сервис/функцию.

1. Использовать для отображения и логгирования ошибок errorService: `src/app/common/services/error-service.js`:

	Пример:
	```js
			errorService.error(
      	 error,
      	 'Ошибка при сохранении позиции applicantService.positionName',
      	 {isUseLogger: true},
      	 'warning',
      	 'src/app/applicant/profile/profile-controller.js',
      	 'initUser.openModalOnMouseLeave-->applicantService.update',
      	 'PG-1481'
      );
      $rootScope.$emit('error.event', {
      		objError: err,
      		additionalDescription: 'Ошибка при сохранении позиции applicantService.positionName',
      		responseOnError: {
      			isUseNotify: true
      		},
      		level: 'error',
      		file: 'app/v2/page/main/main-page/main-page-controller.js:113',
      		method: 'main-page.authService.login',
      		bugRelated: ''
      });
      errorService.error(
      	 {},
      	 'Пожалуйста введите корректные данные',
      	 {isUseModal: true},
       )
	```
1. Использовать для конструкций вида:
	```js
	if (applicant && applicant.relations && applicant.relations.login && typeof(applicant.relations.login.loginCount) === 'number' &&
  		applicant.relations.login.loginCount === 2) {}
  	```
	Сервис dataTypeService, который позволяет с помощью метода safeCheck, привести к такому виду:
  	```js
  		if(dataTypeService.safeCheck(applicant, 'relations.login.loginCount', dataTypeService.NUMBER, -1) === 2) {}
  	```
1. Значения по-умолчанию для переменных, в случае, если их не определили:
	```js
		const NUMBER_DEFAULT = -1;
		const BOOLEAN_DEFAULT = false;
		const STRING_DEFAULT = '';
		const ARRAY_DEFAULT = [];
	```
	Необходимо учитывать при составлении названий переменных
