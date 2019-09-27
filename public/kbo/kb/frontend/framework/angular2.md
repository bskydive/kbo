# Angular2+

## блоги

* angular in depth(aggrid)
* https://tyapk.ru/blog/category/angular
* https://tyapk.ru/blog/category/rxjs

## документация

 * https://dou.ua/lenta/articles/three-years-with-angular/
 * [генератор документации](https://compodoc.github.io/compodoc/)
 

## инструменты

 * [библиотека ng-packagr](https://www.youtube.com/watch?v=cgQILJjeDw0)

## оптимизация

 * https://github.com/Angular-RU/change-detection-tree
 * [bazel в помощь webpack](https://codeburst.io/bazel-an-experimental-and-unofficial-feature-of-angular-6-946e880b4637)
 * [Превышаем скоростные лимиты с Angular 2 / Алексей Охрименко (IPONWEB)](https://www.youtube.com/watch?v=vuPH9J_yonM)
	* [слайды](https://www.slideshare.net/profyclub_ru/angular-2-iponweb-68717237)
	* [код](https://gist.github.com/aiboy/887f430f34e8501c852ab5914ba0f875)
	* env=production
	* ngFor-->trackBy
	* ng build --aot; ng serve --aot
	* webworker(ложится DOM, надо структурировать гриды в кластеры)
	* CD
	* ng2-redux или ngrx/store(observable driven) или ng-mobx(CD off)
	* ```ts
		this.form.valueChanges 
		.debounce(500)/**/
		.distinctUntilChanged()/*прерывает debounce при изменении*/
		.filter((value) => this.form.valid) 
		.switchMap((value) => { return http.post(‘/api’, value) })
			/*incremental backoff - увеличение задержки при повтороной отправке*/
			.retryWhen(attempts => attempts
				.zip(Observable.range(1, 3), (_, i) => i)
				.flatMap((i: number) => { return Observable.timer(i * 1000); }) 
		))
	```
 * Perceive performance [NAS, Predictions, Preloading, Presudo-Isomorphism / Охрименко Алексей (Acronis)](https://www.slideshare.net/profyclub_ru/1-nas-predictions-preloading-presudo-isomorphism) неблокирующие состояния приложения, предсказания, предзагрузки, псевдоизоморфизм
	* [implementation of Design pattern MALEVICH](https://github.com/aiboy/COD.js)
	* загрузка тяжёлых частей асинхронно, с помощью JS/AJAX, пачкой.
 * Perceive performance [В погоне за производительностью. Психология пользователя / Денис Мишунов (Digital Garden AS)](https://www.youtube.com/watch?v=_0gqOMvNy18)
 * [20 тысяч лье по Angular 4». Александр Трищенко, DataArt](https://www.youtube.com/watch?v=TIMUy9WDuS0)
 * https://github.com/mgechev/angular-performance-checklist
 * https://www.lucidchart.com/techblog/2016/05/04/angular-2-best-practices-change-detector-performance/

## AOT ahead of time compilation

 * http://blog.mgechev.com/2016/08/14/ahead-of-time-compilation-angular-offline-precompilation/
 * https://angular.io/guide/aot-compiler
 * много ограничений, не поддерживает стрелочные функции

## Zone

```ts
processOutsideAngularZone() { 
	this.progress = 0; 
	this.zone.runOutsideAngular(//выполнить вне зоны, без CD
		() => {
			this.increaseProgress(//сделать что-то
				() => { 
					this.zone.run(//запустить проверку CD
						() => { 
							console.log('Outside Done!'); 
						}
					); 
				}
			); 
		}
	); 
} 

```

```ts
 constructor(private cd: ChangeDetectorRef) {} 

 ngOnInit() { 
	 this.addItemStream.subscribe(
		() => { 
			 this.counter++; // application state changed 
			 this.cd.markForCheck(); // marks path 
			}
		) 
	} 
} 
```

## state management NGRX REDUX

 * [Manage Action Flow(http/api) in @ngrx with @ngrx/effects](https://blog.nextzy.me/manage-action-flow-in-ngrx-with-ngrx-effects-1fda3fa06c2f)
 * [State Management in Angular with @ngrx](https://blog.nextzy.me/state-management-in-angular-with-ngrx-da57e59c7c89)
 *  ofType uses filter operator of rxjs library, meaning that `this.action$.ofType(CREATE_TASK)` can be expanded to `this.action$.filter(action => action.type === CREATE_TASK)`
 * https://ngrx.io/docs
 * [angular firebase](https://www.toptal.com/angular/state-management-in-angular-using-firebase)
 * [расширения для Chrome/FF](http://extension.remotedev.io/)
 * [отладка](https://github.com/ngrx/store-devtools)
 * https://www.youtube.com/watch?v=FE71r5WJWSQ&list=PLW2eQOsUPlWJRfWGOi9gZdc3rE4Fke0Wv&index=9
 * https://github.com/ngrx/example-app.git
 * [Create the NgRx Feature Module Code](https://www.intertech.com/Blog/ngrx-tutorial-add-state-to-feature-module/)
	* в корневом модуле импорт 
	* ```ts
		//src/app/users/store/selectors/index.selector.ts
		export const getState = createFeatureSelector<IIndexUsersState>('usersFeatureState');
		export const getUserState = createSelector(getState, (state: IIndexUsersState) => state.user);
		export const getUserData = createSelector(getState, (state: IIndexUsersState) => state.user.data);
		export const getUsersState = createSelector(getState, (state: IIndexUsersState) => state.users);
		export const getUsersData = createSelector(getState, (state: IIndexUsersState) => state.users.data);
		//src/app/users/store/users-store.module.ts
		@NgModule({
			imports: [
				HttpClientModule,
				StoreModule.forFeature('usersFeatureState', reducers),
				EffectsModule.forFeature(effects),
				// !environment.production ? StoreDevtoolsModule.instrument() : [],
			],
			exports: [
				StoreModule,
				EffectsModule,
				// !environment.production ? StoreDevtoolsModule : [],
			]
		})
		export class UsersStoreModule { }
		//src/app/root.module.ts
		@NgModule({
			imports: [
				HttpClientModule,
				StoreModule.forRoot({}),
				EffectsModule.forRoot([]),
				// UsersModule,-->root-routing.module
				!environment.production ? StoreDevtoolsModule.instrument() : [],
		//src/app/root-routing.module.ts
		const routes: Routes = [
			{
				path: '',
				redirectTo: '/library',
				pathMatch: 'full',
			},
			{
				path: 'login',
				loadChildren: './auth/auth.module#AuthModule'
			},
			{
				path: '',
				canActivateChild: [AuthGuard],
				component: LayoutComponent,
				children: [
					{
						path: 'users',
						loadChildren: './users/users.module#UsersModule'
					}
				]
			},
			{
				path: '**',
				redirectTo: '/library',
				pathMatch: 'full',
			},
			{
				path: 'library',
				component: LibraryComponent,
			}
		];
	```

## CD change detection

 * abstract syntax tree
 * https://blog.thoughtram.io/angular/2016/02/22/angular-2-change-detection-explained.html
 * https://angular.io/api/core/ChangeDetectionStrategy

```ts
	@Component({ 
		template: ` <h2>{{vData.name}}</h2> <span>{{vData.email}}</span> `, 
		changeDetection: ChangeDetectionStrategy.OnPush 
		}) 
		
	class VCardCmp { 
		@Input() vData; 
		}
```

## webworker

 * https://blog.angularindepth.com/angular-with-web-workers-step-by-step-dc11d5872135
 * https://angular.io/api/platform-webworker
 * в мобильных браузерах могут быть лимиты по памяти на webworker

```ts
import {bootstrapWorkerUi} from '@angular/platform-webworker'; 
import {enableProdMode} from '@angular/core'; 

export function main() { 
	enableProdMode(); 
	bootstrapWorkerUi('loader.js'); 
}
```

```ts
@NgModule({ 
		imports: [WorkerAppModule], 
		bootstrap: [AppComponent], 
		declarations: [AppComponent] 
		}) 
		
class WebWorkerModule {} 

export function main() { 
	enableProdMode(); 
	platformWorkerAppDynamic().bootstrapModule(WebWorkerModule); 
	}
```
## курсы

 * https://codelabs.developers.google.com/
 * https://www.codewars.com/?language=typescript
 * https://ultimateangular.com/#
 * https://blog.angularindepth.com/
 * https://basarat.gitbooks.io/typescript/content/docs/types/type-assertion.html

## security

 * [auth0 SSO](https://auth0.com/blog/angular-2-authentication/)
 * https://www.tsmean.com/articles/authentication/express-session-angular/

## angular state management router

 * https://www.bersling.com/2017/06/05/state-management-ngrxstore-vs-angular-services/

## forms control

 * https://blog.thoughtram.io/angular/2016/07/27/custom-form-controls-in-angular-2.html
 * template driven привязывают данные в html тэгах как параметры DOM, а весь код генерируют во время исполнения
 * reactive driven привязывают данные в js при помощи специальных классов, поэтому можно писать свои валидаторы, делать синхронные и асинхронные(через собственный наблюдатель) валидации
 * [forms validation](https://netbasal.com/make-your-angular-forms-error-messages-magically-appear-1e32350b7fa5)
 * [ошибка линтера Angular FormControl.errors.required](https://github.com/angular/vscode-ng-language-service/issues/149)

## angular6

 * https://codingthesmartway.com/angular-elements-a-practical-introduction-to-web-components-with-angular-6/

## IDE

https://stackblitz.com/edit/angular-jhutmd?file=app%2Fapp.component.html

## тест

 * https://simontest.net/
 * https://github.com/angular/in-memory-web-api

## rxjs реактивное программирование reactive observable


## tslint eslint линтеры

 * [tslint](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin) 
 * [eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) 
 * devdependencies
```json
 		"@typescript-eslint/parser": "^1.13.0",
		"codelyzer": "~4.5.0",
		"eslint": "^6.1.0",
		"eslint-config-standard": "^13.0.1",
		"eslint-plugin-import": "^2.18.2",
		"eslint-plugin-node": "^9.1.0",
		"eslint-plugin-promise": "^4.2.1",
		"eslint-plugin-standard": "^4.0.0",
		"rxjs-tslint-rules": "^4.24.3",
		"ts-node": "~7.0.0",
		"tslint": "^5.18.0",
		"tslint-angular": "^3.0.2",
		"typescript": "^3.2.4"
```
 * [A preset with TSLint rules for development of Angular applications. The preset contains both, tslint core rules, and codelyzer rules, which are going to perform Angular specific linting.](https://github.com/mgechev/tslint-angular)
 * [A set of tslint rules for static code analysis of Angular TypeScript projects.](https://github.com/mgechev/codelyzer)
 * [миграция ещё не закончена](https://github.com/angular-eslint/angular-eslint)

## ликбез

 * сделано для обработки асинхронных непрерывных потоков данных
 * [The introduction to Reactive Programming you've been missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)
 * http://rxmarbles.com/
 * http://reactivex.io/documentation/operators/flatmap.html
 * [примеры и актуальность методов](https://rxjs-dev.firebaseapp.com/api)
 * [js observable](https://www.youtube.com/watch?v=NK-WzH3RBds)
 * [частые ошибки](https://medium.com/@paynoattn/3-common-mistakes-i-see-people-use-in-rx-and-the-observable-pattern-ba55fee3d031)
 * [расшепление потоков forkJoin](https://blog.angularindepth.com/practical-rxjs-in-the-wild-requests-with-concatmap-vs-mergemap-vs-forkjoin-11e5b2efe293)
    ```js
        forkJoin(
            dictRow.users.map(
                (personRow: IUser) => http.get({requestParams: { Id: userRow.id }
                }).pipe(
                    map((userFull: IUserFull) => {
                        if (dictRow.users instanceof Array && dictRow.users.length > 0) {
                            dictRow.users = Object.assign(dictRow.users, { devices: userFull.devices });;
                        }
                        return dictRow;
                    })
                )
            )
        ).subscribe(dicts => {
            this.showDicts(dicts);
        })
    ```
 * https://stackoverflow.com/questions/38000982/rxjs-observable-returning-array-run-another-function-with-each-array-iteration
 * https://blog.angularindepth.com/tagged/rxjs
 * https://blog.callstack.io/manage-async-code-like-a-pro-with-rxjs-43e22c6880af
 * https://github.com/JayKan/RxJS-Playground
 * [вечнозелёная документация для людей](http://reactive.how/)


### rxjs v5-v6

 * [почему сделали .pipe()](https://github.com/ReactiveX/rxjs/blob/91088dae1df097be2370c73300ffa11b27fd0100/doc/pipeable-operators.md)
 * http://reactive.how/rxjs/explorer
    
### expand

```js
@example Start emitting the powers of two on every click, at most 10 of them 
var clicks = Rx.Observable.fromEvent(document, 'click'); 
var powersOfTwo = clicks .mapTo(1) 
.expand(x => Rx.Observable.of(2 * x).delay(1000)) 
.take(10); 
powersOfTwo.subscribe(x => console.log(x));

/**
 * @param {function(value: T, index: number) => Observable} project - A function that, when applied to an item emitted by the source or the output Observable, returns an Observable. 
 * @param {number} [concurrent=Number.POSITIVE_INFINITY]  - Maximum number of input Observables being subscribed to concurrently. 
 * @param {Scheduler} [scheduler=null] The IScheduler to use for subscribing to each projected inner Observable. 
 * @return {Observable} An Observable that emits the source values and also result of applying the projection function to each value emitted on the output Observable and and merging the results of the Observables obtained from this transformation. 
 * @method expand 
 * @owner Observable
 */

```
 
### concatmap

 * https://rxjs-dev.firebaseapp.com/api/operators/concatMap
 * Note: concatMap is equivalent to mergeMap with concurrency parameter set to 1.

```js
//@example For each click event, tick every second from 0 to 3, with no concurrency 

Rx.Observable.fromEvent(document, 'click')
.concatMap(ev => Rx.Observable.interval(1000).take(4))
.subscribe(x => console.log(x));

// Results in the following: 
// (results are not concurrent) 
// For every click on the "document" it will emit values 0 to 3 spaced 
// on a 1000ms interval 
// one click = 1000ms-> 0 -1000ms-> 1 -1000ms-> 2 -1000ms-> 3

/**
 * `@param {function(value: T, ?index: number): ObservableInput} project - A function that, when applied to an item emitted by the source Observable, returns an Observable. 
 * `@return {Observable} An Observable that emits the result of applying the projection function (and the optional resultSelector) to each item emitted by the source Observable and taking values from each projected inner Observable sequentially. 
 * @method concatMap 
 * `@owner Observable
 */

```

### flatMap

 * https://stackoverflow.com/questions/36984059/rxjs-array-of-observable-to-array
 
 ```js
 getPostsPerUser() {
  return this.http.get('/users')
    .map(res => res.json())
    .flatMap((result : Array<User>) => {
      return Observable.forkJoin(
        result.map((user : User) => user.getPosts());
    });
}

//Observable.forkJoin allows you to wait for all observables to have received data.
//The code above assumes that user.getPosts() returns an observable...
//With this, you will receive an array of array of posts:

this.getPostsPerUser().subscribe(result => {
  var postsUser1 = result[0];
  var postsUser2 = result[1];
  (...)
});

 
 ```

### concat

@example Concatenate a timer counting from 0 to 3 with a synchronous sequence from 1 to 10 

```js
var timer = Rx.Observable.interval(1000).take(4); var sequence = Rx.Observable.range(1, 10); 
var result = Rx.Observable.concat(timer, sequence); result.subscribe(x => console.log(x));

// results in: 
// 0 -1000ms-> 1 -1000ms-> 2 -1000ms-> 3 -immediate-> 1 ... 10

@example Concatenate an array of 3 Observables 
var timer1 = Rx.Observable.interval(1000).take(10); 
var timer2 = Rx.Observable.interval(2000).take(6); 
var timer3 = Rx.Observable.interval(500).take(10); 
var result = Rx.Observable.concat([timer1, timer2, timer3]); 

// note that array is passed result.subscribe(x => console.log(x));

// results in the following: 
// (Prints to console sequentially) 
// -1000ms-> 0 -1000ms-> 1 -1000ms-> ... 9 
// -2000ms-> 0 -2000ms-> 1 -2000ms-> ... 5 
// -500ms-> 0 -500ms-> 1 -500ms-> ... 9

@example Concatenate the same Observable to repeat it 

const timer = Rx.Observable.interval(1000).take(2);

Rx.Observable.concat(timer, timer) // concating the same Observable! 
.subscribe( value => console.log(value), err => {}, () => console.log('...and it is done!') );

// Logs: 
// 0 after 1s 
// 1 after 2s 
// 0 after 3s 
// 1 after 4s 
// "...and it is done!" also after 4s

/**
 * @param {ObservableInput} input1 - An input Observable to concatenate with others. 
 * @param {ObservableInput} input2 - An input Observable to concatenate with others. More than one input Observables may be given as argument. 
 * @param {Scheduler} [scheduler=null] - An optional IScheduler to schedule each Observable subscription on. 
 * @static true 
 * @return {Observable} All values of each passed Observable merged into a single Observable, in order, in serial fashion. 
 * @name concat 
 * @owner Observable
 */
 ```

### reduce

 * аккумулятор входящих 
    * The seed will be used as an initial acc (accumulation)
    * When the input stream emits an event value v:
    *     v and the latest acc are given to the accumulator
    *     The returned value will be used as the next acc
    * When the input stream completes, the output stream emits the last acc and completes
 * @example Count the number of click events that happened in 5 seconds 
 
 ```js
 var clicksInFiveSeconds = Rx.Observable.fromEvent(document, 'click') 
 .takeUntil(Rx.Observable.interval(5000)); 
 var ones = clicksInFiveSeconds.mapTo(1); 
 var seed = 0; 
 var count = ones.reduce((acc, one) => acc + one, seed); 
 count.subscribe(x => console.log(x));

@param {function(acc: R, value: T, index: number): R} accumulator - The accumulator function called on each source value. 
@param {R} [seed] The initial accumulation value. 
@return {Observable} An Observable that emits a single value that is the result of accumulating the values emitted by the source Observable. 
@method reduce @owner Observable
```

### switchMap

 * http://reactivex.io/documentation/operators/switch.html
 * @example Rerun an interval Observable on every click event 

```js
var clicks = Rx.Observable.fromEvent(document, 'click'); 
var result = clicks.switchMap((ev) => Rx.Observable.interval(1000)); 
result.subscribe(x => console.log(x));

@param {function(value: T, ?index: number): ObservableInput} project - A function that, when applied to an item emitted by the source Observable, returns an Observable. 
@return {Observable} An Observable that emits the result of applying the projection function (and the optional resultSelector) to each item emitted by the source Observable and taking only the values from the most recently projected inner Observable. 
@method switchMap 
@owner Observable
```

### scan

 * аккумулятор входящих и веер 
    * The seed will be used as an initial acc (accumulation)
    * When the input stream emits an event value v:
    *     v and the latest acc are given to the accumulator
    *     The returned value is emitted and will be used as the next acc
    * When the input stream completes, the output stream completes
 * http://reactive.how/reduce
 * http://reactive.how/scan
 * @example Count the number of click events 

```js
var clicks = Rx.Observable.fromEvent(document, 'click'); 
var ones = clicks.mapTo(1); 
var seed = 0; 
var count = ones.scan((acc, one) => acc + one, seed); 
count.subscribe(x => console.log(x));

/**
 * @param {function(acc: R, value: T, index: number): R} accumulator - The accumulator function called on each source value. 
 * @param {T|R} [seed] The initial accumulation value. 
 * @return {Observable} An observable of the accumulated values. 
 * @method scan 
 * @owner Observable
 */
```

## angular v5-v6 миграция

 * https://blog.angular.io/version-6-of-angular-now-available-cc56b0efa7a4
 * https://github.com/ReactiveX/rxjs/blob/master/MIGRATION.md#rxjs-v5x-to-v6-update-guide
 * https://habr.com/company/ispsystem/blog/358696/
 * https://update.angular.io/

## pitfalls грабли

 * Basic level - [Angular Elements – A Practical Introduction To Web Components With Angular 6](https://www.tsmean.com/articles/angular/pitfalls/)
 * [angular faq](https://rahulrsingh09.github.io/AngularConcepts/faq)
 * [обход подводных камней angular](https://habr.com/ru/company/ruvds/blog/459304/)

### drag перетаскивание resize

 * https://embed.plnkr.co/plunk/ewAxhp
 
### CORS

 * [нельзя отловить 302](https://stackoverflow.com/questions/37671166/angular2-how-to-prevent-from-http-redirection) вываливается JSON parse error, приходится ловить catchError, и внутри код 200 - это ошибка+302
 * в проблеме 302 косвенно может участвовать webpack. Если он от cli, то всегда сначала открывает index.html. Т.е. веб-сервер при ошибке тыла делает CORS-->302-->/ а вебпак открывает index.html. При попытке переимновать файл и index в angular.json вываливается ошибка `emitting index-html-webpack-plugin: Error: ENOENT: no such file or directory`
 

### rxjs Observable<any> import

 * вылезает несовместимость между разными способами импорта
    ```js
        import { ErrorObservable } from 'rxjs/observable/ErrorObservable';
        import { catchError } from 'rxjs/operators';
        import { retry } from 'rxjs/operators';
        import { of } from 'rxjs/observable/of';
        import { Observable } from 'rxjs/internal/Observable';
    ```
 
 
### angular reactive form

 * нельзя использовать `[(ngModel)]` [в реактивных формах](https://angular.io/api/forms/FormControlDirective#use-with-ngmodel)  надо `this.formControl.setValue('some value');` `<div>{{this.formControl.value}}</div>`

### VSCode webpack angular-cli

 * валится при автоматическом импорте `isNull(value)`

```
    import { isNull } from '@angular/compiler/src/output/output_ast';
    // WARNING in ./node_modules/@angular/compiler/src/output/output_ast.js
    // 10:24-31 Critical dependency: require function is used in a way in which dependencies cannot be statically extracted
    
```
 
### @Input()

 * работает постоянно, потому необходимо ограничивать его запуск


### angular router

 * крошки 
 	* [словарь в маршрутизаторе](https://medium.com/@bo.vandersteene/angular-5-breadcrumb-c225fd9df5cf)
 	* [ngrx router state](https://www.intertech.com/Blog/ngrx-tutorial-add-router-info-to-state/)
 	* [ngrx route resolve](https://hackernoon.com/angular-ngrx-resolving-route-data-53f88e0b8a5d)
 * текущий маршрут
	```ts
	

	constructor(
		private router: Router,
		private route: ActivatedRoute,
	) {}
	
	ngOnInit() {
		const url = this.route.snapshot.firstChild.url.join('');
		const url = this.router.url;

		this.router.events.pipe(
			filter(event => event instanceof NavigationEnd)
		).subscribe((event: NavigationEnd) => {
			console.log(event.url);
		});
	}
	```
 * route guard
	```ts
		this.router.routerState.snapshot.root.firstChild.routeConfig.canActivate
	```
 * `Can't bind to 'active' since it isn't a known property of 'a'` (импорт MatTabsModule)[https://github.com/angular/material2/issues/11372]

### mat-icon

 * [нельзя выбрать другие типы иконок](https://github.com/google/material-design-icons/issues/773)

### nav tab

 * не работает disabled
```css
	@import './colors.scss';
	
	& .mat-tab-link {
		color: black;
		opacity: 1;

		&:hover {
			opacity: 1;
			color: map-get($md-palette-blue, 500);
		}
	}

	& .mat-tab {
		&-label-active {
		color: map-get($md-palette-blue, 400);
		opacity: 1; //default 0,6

		&:hover,
		&:active,
		&:visited {
			color: map-get($md-palette-blue, 400);
			opacity: 1;
		}
		
		&-disabled {
		color: grey;
		cursor: default;

		&:hover {
			color: grey;
			cursor: default;
		}
	}
```
```html
	<nav mat-tab-nav-bar>
		<span *ngFor="let link of links" >
			<a mat-tab-link [routerLink]="link.path" routerLinkActive #rla="routerLinkActive" [active]="rla.isActive" *ngIf="!link.isDisabled">
				<mat-icon>{{link.icon}}</mat-icon>
				<span>{{link.label}}</span>
			</a>
			
			<a mat-tab-link *ngIf="link.isDisabled" [disabled]="link.isDisabled">
				<mat-icon>{{link.icon}}</mat-icon>
				<span>{{link.label}}</span>
			</a>
		</span>
	</nav>
```
 
### oncahnge mat-select dropdown

 * реакция на выбор
    * https://stackoverflow.com/questions/50222738/angular-6-material-mat-select-change-method-removed
    * используем ```<select (selectionChange)="onChange($event.value)></select>"```
    * https://angular.io/api/forms/NgModel#properties

### mat-paginator mat-table

 * несколько листалок должны использовать разные id
    ```ts
    	@ViewChild('paginatorCases') paginatorCases: MatPaginator;
        @ViewChild('paginatorExperts') paginatorExperts: MatPaginator;
        @ViewChild('paginatorPersons') paginatorPersons: MatPaginator;
        
        ngAfterViewInit() {
		this.dataSourceCases.paginator = this.paginatorCases;
		this.dataSourceExperts.paginator = this.paginatorExperts;
		this.dataSourcePersons.paginator = this.paginatorPersons;
	}
    ```
    ```html
        <!--  ... -->
    	<mat-paginator #paginatorPersons
    	<!--  ... -->
    	<mat-paginator #paginatorExperts
    	<!--  ... -->
    	<mat-paginator #paginatorCases
    ```
    
 * pageIndex не меняет положения таблицы. Надо вызывать спустя тик. Присваивать можно в DOM, dataSource.paginator, paginator. Но присвоение размера страницы нигде, кроме как через DOM не работает
```html
	<mat-table #idTable matSort [dataSource]="table.dataSource" multiTemplateDataRows>
	...
	</mat-table>
	<mat-paginator #idPaginator [pageSize]="table.paginator.currentSize" [showFirstLastButtons]="table.paginator.isFirstLastButtonsVisible" (page)="pageChange($event)" [pageIndex]="table.paginator.currentIndex">
	</mat-paginator>
```

```ts
	table = {
		dataSource: new MatTableDataSource<IData>([DATA_DEFAULT]),
		selection: new SelectionModel<IData>(this.allowMultiSelect, this.initialSelection),
		selectedRow: JSON.parse(JSON.stringify(DATA_DEFAULT)),//нетронутые данные для определения было ли редактирование
		isEditStart: false,
		displayedColumns: [
			'select',
			'source',
			'dest',
			'type',
			'date',
			'direction',
		],
		paginator: {//присваиваем напрямую в DOM
			currentSize: 20,
			sizes: [20, 50],
			currentIndex: 0,
			isFirstLastButtonsVisible: false,
		},
	};
	
	@ViewChild('idPaginator', { read: MatPaginator }) paginator: MatPaginator;
	@ViewChild('idTable', { read: MatSort }) sortResults: MatSort;
	
	ngAfterViewInit() {
		if (!(this.table.dataSource.paginator instanceof MatPaginator)) {
			this.table.dataSource.paginator = this.paginator;
		}
		
		if (!(this.table.dataSource.sort instanceof MatSort)) {
			this.table.dataSource.sort = this.sortResults;
		}
	}

	const oldIndex= this.paginator.pageIndex;
	this.table.dataSource.data = [];
	this.table.selection.clear();

	this.table.dataSource.data = JSON.parse(JSON.stringify(data));
	
	setTimeout(() => {
		this.table.paginator.index= oldIndex;
	}
```
 
### mat-datepicker

 * блокирование ручного ввода даты
 ```html
    <input 
    (keydown)="$event.stopPropagation();$event.preventDefault()"
    >
 ```
 
### moment date

```js
	import * as moment from 'moment';
	
	
	// https://momentjs.com/docs/#/displaying/format/
	
	export const DATE_FORMAT = {
		emptyDataText: '',
		parse: {
			dateInput: 'X',
			// dateInput: 'YYYY MM DD HH:mm:SS',
		},
		display: {
			dateInput: 'DD.MM.YYYY',
			dateOutput: 'YYYY MM DD HH:mm:SS',
			monthYearLabel: 'MMM YYYY',
			// locale: 'ru'
			// dateA11yLabel: 'YYYY MM DD HH:mm:SS',
			// monthYearA11yLabel: 'MMMM YYYY',
		},
	};
	moment().format('X'));
	moment().unix();
	moment(date, DATE_FORMAT.parse.dateInput).format(DATE_FORMAT.display.dateInput);
	moment(params.toDate, DATE_FORMAT.parse.dateInput).day()
	moment().add(1,'day').format(DATE_FORMAT.display.dateOutput);

```
 
### tree дерево

 * сложный тип https://material.angular.io/components/tree
```html
	<mat-tree [dataSource]="dataSource" [treeControl]="treeControl">
		<mat-tree-node *matTreeNodeDef="let node" matTreeNodeToggle matTreeNodePadding>
			<button mat-icon-button disabled></button>
			{{node.filename}} : {{node.type}}
		</mat-tree-node>

		<mat-tree-node *matTreeNodeDef="let node;when: hasChild" matTreeNodePadding>
			<button mat-icon-button matTreeNodeToggle [attr.aria-label]="'toggle ' + node.filename">
				<mat-icon class="mat-icon-rtl-mirror">
					{{treeControl.isExpanded(node) ? 'expand_more' : 'chevron_right'}}
				</mat-icon>
			</button>
			{{node.filename}} : {{node.type}}
		</mat-tree-node>
	</mat-tree>
```

```ts
	//    @NgModule({ imports: [ MatTreeModule,
	import { FlatTreeControl } from '@angular/cdk/tree';
	import { MatTreeFlattener, MatTreeFlatDataSource } from '@angular/material/tree';

	/** 
	* Сложный вложенный тип для описания деревьев
	* https://basarat.gitbooks.io/typescript/docs/types/index-signatures.html
	*/
	interface IPersonTree {
		[keyName: string]: {
			personName: string;
			personDevices: {
				[keyName: string]: {
					deviceType: string;
					deviceNotes: string;
				}
			}
		};
	};

	/**
	* File node data with nested structure.
	* Each node has a filename, and a type or a list of children.
	*/
	export class FileNode {
		children?: FileNode[];
		filename: string;
		type: any;
	}

	/** Flat node with expandable and level information */
	export class FileFlatNode {
		constructor(
			public expandable: boolean, public filename: string, public level: number, public type: any) { }
	}

	_assignedTree: IPersonTree = {};
	treeControl: FlatTreeControl<FileFlatNode>;
	treeFlattener: MatTreeFlattener<FileNode, FileFlatNode>;
	dataSource: MatTreeFlatDataSource<FileNode, FileFlatNode>;
	private _getLevel = (node: FileFlatNode) => node.level;
	private _isExpandable = (node: FileFlatNode) => node.expandable;
	private _getChildren = (node: FileNode): FileNode[] => node.children;
	transformer = (node: FileNode, level: number) => {
		return new FileFlatNode(!!node.children, node.filename, level, node.type);
	}
	hasChild = (_: number, _nodeData: FileFlatNode) => _nodeData.expandable;

	/**
	* Build the file structure tree. The 'value' is the Json object, or a sub-tree of a Json object.
	* The return value is the list of 'FileNode'.
	*/
	buildFileTree(obj: object, level: number): FileNode[] {
		return Object.keys(obj).reduce<FileNode[]>((accumulator, key) => {
			const value = obj[key];
			const node = new FileNode();
			node.filename = key;

			if (value != null) {
				if (typeof value === 'object') {
					node.children = this.buildFileTree(value, level + 1);
				} else {
					node.type = value;
				}
			}

			return accumulator.concat(node);
		}, []);
	}

	@Input 
	set value(value){

	this._assignedTree = {};
		this._personsAssigned.forEach(personItem => {
			this._personsAssignedTree[personItem.id] = {
				personName: personItem.name,
				personDevices: personItem.devices.reduce((devicesTree, deviceItem, { }) => {
					devicesTree[deviceItem.id] = {
						deviceType: deviceItem.type,
						deviceNotes: deviceItem.notes
					};
					return devicesTree
				}, {})
			}
		});
		this.treeFlattener = new MatTreeFlattener(
			this.transformer, this._getLevel, this._isExpandable, this._getChildren
		);
		this.treeControl = new FlatTreeControl<FileFlatNode>(this._getLevel, this._isExpandable);
		this.dataSource = new MatTreeFlatDataSource(this.treeControl, this.treeFlattener);
		this.dataSource.data = JSON.parse(JSON.stringify(this.buildFileTree(this._personsAssignedTree,0)));
	}
```
 
### debug

 * ворон ловит больше ошибок чем хром
 * отладку через ноду пока запустить не удалось, можно только через хром

### typescript

 * [interface или type](https://medium.com/@martin_hotell/interface-vs-type-alias-in-typescript-2-7-2a8f1777af4c)
 * [тяжело итерировать по необъявленным свойствам и непонятно как комбинировать с объявленными](https://www.sitepen.com/blog/2014/08/22/advanced-typescript-concepts-classes-types/)
 * [properties is undefined](http://blogs.microsoft.co.il/gilf/2013/01/22/creating-properties-in-typescript/)
 * https://stackoverflow.com/questions/40636292/get-properties-of-a-class-using-typescript
 * https://stackoverflow.com/questions/16508435/implementing-typescript-interface-with-bare-function-signature-plus-other-fields
 * можно сделать необязательными параметры и присвоить изначально пустой объект, чтобы можно было свойства добавлять, либо посмтрть на extends {}
 * https://stackoverflow.com/questions/47139581/upgraded-to-angular-5-ts6046-and-ts5024-errors

```js
	{
		"extends": "../tsconfig.json",
		"compilerOptions": {
			"outDir": "../out-tsc/app",
			"module": "amd",
			"target": "es2017",
			"baseUrl": "",
			"lib": [
			"es2017"
			],
			"types": []
	},
		"exclude": [
			"test.ts",
			"**/*.spec.ts"
		]
	}
```
	
 * интерфейс деревьев - сложный вложенный тип https://basarat.gitbooks.io/typescript/docs/types/index-signatures.html
 
```ts
	export interface ITree {
		[keyName: string]: ITreeItem;
	}
```

 * функция с выбором из 2 типов
 
```ts
	func<T extends (IInterface1|IInterface2)>(params: { param1: T[], param2: string[] }) {
		let result: T[] = [];
	}

	func<T extends [])>(params: { param1: T[], param2: string[] }) {
		let result: T[] = [];
	}
```

### subscribe

 * [You should NEVER subscribe in the method that creates the observable](https://stackoverflow.com/questions/46906027/angular-cannot-read-property-subscribe-of-undefined)

### ngfor

[нельзя итерировать по свойствам объекта Property binding ngFor not used by any directive on an embedded template](https://webcake.co/object-properties-in-angular-2s-ngfor/)

### css
 
 * глобальные стили css
	* https://stackoverflow.com/questions/37689673/angular2-styling-issues-caused-by-dom-attributes-ngcontent-vs-nghost
	* https://angular.io/guide/component-styles#view-encapsulation
	* ```ts
		import {Component, ViewEncapsulation} from 'angular2/core'

		@Component({
		selector: 'my-comp',
		encapsulation: ViewEncapsulation.None,
		...
		});
		```
	* [::ng-deep](https://stackoverflow.com/questions/36224276/angular2-adding-ngcontent-mav-x-to-styles#36225709)	
 * [синтаксис для pug. angular pug Syntax Error: Assigning to rvalue](https://github.com/tycho01/pug-plugin-ng)
	```pug
	'[class.c-header-nav-list-inline-active]'="isActiveAll"
	button#foo.bar(#myVar='' md-raised-button='' '[disabled]'="isDisabled" '(click)'="boom") text
	```
 * [property binding](https://angular.io/guide/template-syntax#attribute-binding)
 ```html 
	<tr><td [attr.colspan]="1 + 1">One-Two</td></tr>
 ```	

### внешние апи

 * [сравнение concatmap mergemap forkjoin](https://blog.angularindepth.com/practical-rxjs-in-the-wild-requests-with-concatmap-vs-mergemap-vs-forkjoin-11e5b2efe293?gi=1816e10164d)

### зависимости

 * [extends](https://angular.io/guide/hierarchical-dependency-injection)
 * https://stackoverflow.com/questions/33970645/how-to-extend-a-component-with-dependency-injection-in-angular-2#40592524
 * barrel, circular dependency
	* https://github.com/angular/angular.io/issues/1301
	* https://stackoverflow.com/questions/36378751/angular2-2-services-depending-on-each-other
	* https://stackoverflow.com/questions/40525850/circular-dependency-injection-angular-2
	* https://stackoverflow.com/questions/37997824/angular-di-error-exception-cant-resolve-all-parameters
 * import order matter
	* https://stackoverflow.com/questions/37902476/automatic-ordering-of-exports-in-index-ts-makes-app-crash/37907696#37907696
	* https://angular.io/guide/dependency-injection-in-action
	* https://stackoverflow.com/questions/39062930/what-is-difference-between-declarations-providers-and-import-in-ngmodule#39063231
 * https://blog.angularindepth.com/angular-dependency-injection-and-tree-shakeable-tokens-4588a8f70d5d
 * https://hacks.mozilla.org/2015/08/es6-in-depth-modules/
 * https://angular.io/guide/ngmodule-vs-jsmodule
  
### component interaction child to parent

 * event bubbling не работает в @output, только до родителя
 * можно сделать сервис, но будут проблемы с удалением компонентов, т.к. html-->[property] ссылаются на удалённые данные, и надо использовать обозреватели
 * цепочка @output может не завестись из-за асинхронных догонялок
 * можно передать обработчик в потомка через обратный вызов и bind(this) в родительском компоненте
 * https://www.youtube.com/watch?v=Mx_x2bYj3To
 * https://github.com/angular/angular/issues/2296
 * https://www.radzen.com/blog/angular-event-bubbling/
 * [через сервис](https://angular.io/guide/component-interaction#parent-and-children-communicate-via-a-service)
 * [можно целиком переопределить компонент через динамическую директиву](https://angular.io/guide/dynamic-component-loader)
 * [можно посмотреть в сторону динамических и реактивных форм(можно переопределять value-accessor)](https://youtu.be/cPpghyAoV0w?t=4548)
 * [формы ориентированные на шаблон(много логики в html-->ngModel](https://youtu.be/cPpghyAoV0w?t=2877)
 * [вложенные компоненты](https://codecraft.tv/courses/angular/quickstart/nesting-components-and-inputs/)

## lang

### httpCLient

 * запрос на html файл `responseType: 'text' as 'text'`

```js
const httpOptions = {
			headers: new HttpHeaders({
				'Content-Type': 'application/json',
				// 'Content-Type': 'text/html',
				// 'Authorization': 'my-auth-token',
				// 'Access-Control-Request-Headers': 'X-Custom-Header'
				// 'Host': 'jsteam.sibedge.com',
				// 'Connection': 'keep-alive',
				// 'Cache-Control': 'max-age=0',
				// 'Upgrade-Insecure-Requests': '1',
				// 'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36',
				// 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8',
				// 'Accept-Encoding': 'gzip, deflate'
			}),
			params: new HttpParams().set('param', 'value')
		};
		// httpOptions.headers.append('Content-Type', 'text/html');
		this.http.get('https://dog.ceo/api/breeds/list/all')
			.pipe(
				// retry(3),
				map(result => {
					console.log('src/app/main/picture/picture.component.ts:77', result);
					return Object.keys(result['message']);
				}),
				catchError(() => {
					this.isLoadingResults = false;
					return from([]);
				})
			)
			.subscribe(data => {
				// console.log('src/app/main/picture/picture.component.ts:93', data);
				this.dataSource.data = data;
			});

```

### interceptors

 * https://medium.com/@ryanchenkie_40935/angular-authentication-using-the-http-client-and-http-interceptors-2f9d1540eb8
 * http://stepansuvorov.com/blog/2014/04/angularjs-interceptors-%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D1%8B/

## книги

 * https://www.manning.com/books/angular-development-with-typescript-second-edition

## install

 * [ошибка node-gyp](https://github.com/nodejs/node-gyp/issues/454)
 * https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04#how-to-install-using-nvm
 * [репа nvm](https://github.com/creationix/nvm)
 
 ```bash
	zypper rm nodejs
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
	nvm install node
	nvm use node
 ```

## сборка

 * 
 * webpack config eject 
 
```bash

	npm i -D webpack uglifyjs-webpack-plugin copy-webpack-plugin clean-webpack-plugin html-webpack-plugin extract-text-webpack-plugin webpack-merge stylus pug browser-sync-webpack-plugin browser-sync babel-loader css-loader csso csso-loader file-loader image-webpack-loader img-loader postcss postcss-import postcss-loader postcss-url pug-html-loader raw-loader stylus-loader to-string-loader url-loader webpack-cli webpack-dev-server webpack-merge html-loader scss-loader

	ng new angular4 --style stylus
	ng eject ##нужна 1 версия cli
```

 * темы
 
```css
	/*styles.css*/
	/* @import '~@angular/material/prebuilt-themes/deeppurple-amber.css'; */
	@import '~@angular/material/prebuilt-themes/indigo-pink.css';
	/* @import '~@angular/material/prebuilt-themes/pink-bluegrey.css'; */
	/* @import '~@angular/material/prebuilt-themes/purple-green.css'; */

```

 * https ng serve
 
```bash
	NODE_ENV=development;ng serve --ssl 'true' --ssl-key 'util/nginx.key' --ssl-cert='util/nginx.crt'
```

 * [env variables переменные окружения angular](https://medium.com/@kudresov/a-better-way-to-inject-environmental-variables-in-angular-d3b2d01a3c5e)
 * выключить ошибку препроцессора typescript
 
```bash
	ng config cli.warnings.typescriptMismatch false
```
 
 * Минификация uglifyjs es6 сломана, надо пользовать closure или terser
 
```
https://github.com/webpack-contrib/uglifyjs-webpack-plugin/issues/104
npm i uglifyjs-webpack-plugin@1
https://github.com/webpack-contrib/uglifyjs-webpack-plugin/releases
https://github.com/webpack-contrib/terser-webpack-plugin
https://webpack.js.org/plugins/terser-webpack-plugin/#src/components/Sidebar/Sidebar.jsx
```

 * ошибки сборки для e2e

```
tsconfig.json
либо настроить общий конфиг(npm i @types/jasmine)
 "types": [
      "jasmine",
      "jasminewd2",
      "node"
    ]
    
либо убрать из него:
"exclude": [
    "node_modules",
    "dist",
    "./**/*.spec.ts",
    "./**/*.e2e.ts"
  ],
```

 * ошибки сборки es6 https://medium.com/@martin_hotell/tree-shake-lodash-with-webpack-jest-and-typescript-2734fa13b5cd
 
```
tsconfig.json
"target": "es5",
```

 * ошибки конвертации html --> pug
 
```
кдлассы, параметры тэгов в скобках, после # теряют заглавный регистр
многие параметры в квадратных скобках, всё со звёздочкой необходимо брать в кавычки
параметры тэгов без присвоения необходимо брать в кавычки, иначе после конвертирования в html к ним прибавят =''
иденитификаторы после хэш необходимо брать в кавычки, чтобы их не переделало в id=''
```

## graphQL

 * https://medium.com/@sergeyfetiskin/testing-apollo-graphql-in-your-angular-application-595f0a04aad3
 * [что не так с graphql](https://habr.com/post/425041/)
 
## internatiolization перевод locale translate

 * http://www.ngx-translate.com/
 * [мультиязычность в ангуляр](https://www.creativebloq.com/how-to/add-multi-language-support-to-angular)
 
## UI/UX framework фреймворки

 * [Clarity ](https://vmware.github.io/clarity/)
 * [Bootstrap ](getbootstrap.ru)
 * [Material Design ](https://material.io/develop/web/)
 * [+ components for web ](material-components.github.io/)
 * [Materialize ](https://materializecss.com)
 * [Material-UI ](material-ui.com)
 * [Ousens UI ](onsen.io)
 * [SalesForce ](www.lightningdesignsystem.com)
 * [Carbon design system ](www.carbondesignsystem.com)
 * [Webix ](webix.com)
 * [Fluent design ](https://en.wikipedia.org/wiki/Fluent_Design_System)
 * [PrimeNg ](https://primefaces.org/primeng/#/dialog)
 
## angular material

### генераторы

 * [для react](https://material-ui.com/getting-started/installation/)

### ликбез

 * https://material.angular.io/guide/theming
 * https://material.angular.io/guide/theming-your-components
 * https://github.com/angular/material2/blob/master/src/lib/core/theming/_theming.scss
 * https://material.angular.io/guide/customizing-component-styles
 * http://blog.bogdancarpean.com/create-custom-color-theme-on-angular-material/

### цвета color
 
 * необходимо вручную сгенерировать набор фон-текст для нормальной читаемости, есть [генератор контрастов](http://mcg.mbitson.com/)
    материал не умеет делать это автоматом
 * далее делаем тему на основе сгенерированной палитры(primary/secondary/accent) [полное руководство](https://blog.thoughtram.io/angular/2017/05/23/custom-themes-with-angular-material.html)
    и присваиваем на все стили [вручную из переменных палитры](https://stackoverflow.com/questions/47497743/how-to-create-a-custom-color-theme-with-angular5-and-angular-materials)
 * [наставление](https://material.io/design/color/the-color-system.html#color-usage-palettes)
 * [очень ограниченный инструмент для просмотра сгенерированных тем](https://material.io/tools/color/)
 * [подробнее про расширенный набор из 12 категорий цвета](https://material.io/design/material-theming/implementing-your-theme.html)
 
### типографика шрифты font

 * точно так же необходимо сгенерировать пары: размер шрифта+высота строки+толщина, также можно добавить межсимвольные интервалы
 * желательно прикинуть как они будут смотреться на трёх основных фонах: primary/secondary/accent, т.е. комбинация размер+толщина+цвет фона+межсимвольный интервал. Пока я не нашёл инструментов для расчёта таких контрастов.
 * [стандартные коды](https://github.com/angular/material2/blob/master/src/lib/core/typography/_typography.scss)
 * [наставление](https://material.io/guidelines/style/typography.html)
 * [рекомендации по контрасту](https://material.io/design/usability/accessibility.html#color-contrast)
 * [подробнее про 13 категорий текста](https://material.io/design/material-theming/implementing-your-theme.html#typography)
 
### иконки

 * http://google.github.io/material-design-icons/#icon-font-for-the-web
 * https://github.com/google/material-design-icons/blob/master/iconfont/codepoints
 * https://material.angular.io/components/icon/api
 
### поля ввода

 * [спецификация состояний поля ввода](https://material.io/design/components/text-fields.html#spec)
 * [общие правила применения состояний](https://material.io/design/interaction/states.html#)
 