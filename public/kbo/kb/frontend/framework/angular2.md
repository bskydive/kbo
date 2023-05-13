# Angular2+

## блоги

* angular in depth(aggrid)
* https://tyapk.ru/blog/category/angular
* https://tyapk.ru/blog/category/rxjs
* [состояние angular 2019](https://blog.bitsrc.io/the-state-of-angular-in-2019-b5fb7783a1c6)
* [сравнение версий 2-10](https://www.ngdevelop.tech/angular/history/)
	* общие для большинства версий изменения: версии NS/RxJS, производительность, Material компоненты
	* 2 - typescript, dart
	* 4 - renderer v2
	* 5 - HttpClientModule заменил http
	* 6 - angular elements(web custom elements), tree-shakable providers(providedIn:root), rxjs 6, Ivy
	* 7 - drag and drop, node v10, service worker
	* 8 - webworker, ES6 импорт модулей `()=>`
	* 9 - Ivy по-умолчанию, ullTemplateTypeCheck, strictTemplates в tsc

		```json
			https://blog.angular.io/angular-cli-strict-mode-c94ba5965f63
			https://angular.io/guide/strict-mode
			https://angular.io/guide/template-typecheck#troubleshooting-template-errors
			flags recommended by the TypeScript team. Specifically, strict, forceConsistentCasingInFileNames, noImplicitReturns, noFallthroughCasesInSwitch
			in tsconfig.json:
				strictPropertyInitialization
				strictNullChecks
				noImplicitAny
				strictBindCallApply
				strictFunctionTypes
			Angular compiler flags strictTemplates and strictInjectionParameters

		    tsconfig.json:
			"compilerOptions": { ... },
			"angularCompilerOptions": {
				"strictTemplates": true,
				"fullTemplateTypeCheck": true, // old? https://stackoverflow.com/questions/33668739/type-checking-in-angular-2-templates
		```
	* 10 - исправили 700 и посмотрели 2000 ошибок, компонент диапазона дат
* [сравнение версий 2-8](https://medium.com/@lifenshades/difference-among-angular-8-7-6-5-4-3-2-breakdown-new-features-and-changes-811fb5f8e6f0)
* сравнение comparison с [angularjs](https://www.techaheadcorp.com/blog/angular-vs-angularjs/)

* [планы выкинуть модули](https://angular.io/guide/roadmap#simplified-angular-mental-model-with-optional-ngmodules)
* [планы выкинуть Zone](https://angular.io/guide/roadmap#leverage-full-framework-capabilities-with-zonejs-opt-out)
* [Deep Dive into the Angular Compiler | Alex Rickabaugh | #AngularConnect 2019](https://www.youtube.com/watch?v=anphffaCZrQ)

## документация

 * https://dou.ua/lenta/articles/three-years-with-angular/
 * [генератор документации](https://compodoc.github.io/compodoc/)
 * [граф зависимостей webpack-dep-graph](https://github.com/heypoom/webpack-dep-graph)
 * gephi
 * https://www.npmjs.com/package/dependency-graph
 * https://marketplace.visualstudio.com/items?itemName=juanallo.vscode-dependency-cruiser
 * https://www.npmjs.com/package/dependency-cruiser
 * https://statoscope.tech/
 *

## инструменты

 * [библиотека ng-packagr](https://www.youtube.com/watch?v=cgQILJjeDw0)
 * [Google Maps is now an Angular component](https://medium.com/angular-in-depth/google-maps-is-now-an-angular-component-821ec61d2a0)
 * [Как сделать пошаговый гайд вашего приложения (если ваш проект на Angular)](https://habr.com/ru/company/veeam/blog/486994/) подсказочник туториал обучениеи @material/cdk/overlay
 * [Angular 10, NgRx and Angular Material Starter](https://github.com/tomastrajan/angular-ngrx-material-starter)

## angular backend

 * [nestJS node backend](https://nestjs.com/)
 * [angularFire backend](https://github.com/angular/angularfire/blob/master/docs/install-and-setup.md)

## лучшие практики

 * [Clean Code Checklist in Angular](https://itnext.io/clean-code-checklist-in-angular-%EF%B8%8F-10d4db877f74)
 * [code review conventions](https://medium.com/inside-league/how-one-code-review-rule-turned-my-team-into-a-dream-team-fdb172799d11)
 * [SOLID: The Dependency Inversion Principle in Angular](https://blog.bitsrc.io/solid-the-dependency-inversion-principle-in-angular-6e4b9c484960?gi=d54f2b80e982)
 * форма авторизации [Sign-in form best practice](https://www.youtube.com/watch?v=alGcULGtiv8)

	```css
		input[type=email]:not(:plsceholder-shown):invalid {
			color: red;
		}
	```
	```html
		<form>
			<section>
				<label for="id-mail">Почта</label>
				<input id="id-mail" name="email" autocomplete="email" type="email" placeholder="почта" required>
			</section>
			<section>
				<label for="id-pass">Пароль</label>
				<input id="id-pass" *ng-if="passwordType='password'" name="current-password" type="password" placeholder="пароль" required>
				<ng-container *ng-if="passwordType='new-password'">
					<input id="id-pass" name="new-password" type="password" placeholder="пароль" required>
					<input id="id-pass" name="new-password-repeat" type="password" placeholder="пароль повторно" required>
				</ng-container>
				<ng-container *ng-if="passwordType='change-password'">
					<input id="id-pass" name="current-password" type="password" placeholder="текущий пароль" required>
					<input id="id-pass" name="new-password" type="password" placeholder="новый пароль" required>
				</ng-container>
			</section>
		</form>
	```
 * сравнение подходов(patterns) к архитектуре https://www.youtube.com/watch?v=udNHwANuicU https://github.com/obenjiro/AngularStateManagers
	 * Services - Стандартный подход работы с сервисами.
	 * CQS/CQRS - Command Query Separation. - добавление слоя запросов query
	 * Redux - Stateless Uniderectional Dataflow.
	 * Mobx - redux + CQRS - добавление слоя запросов
	 * DCI - Data Context Interaction - перенос всей логики в файл-контекст, который управлет компонентами
	 * MALEVICH - все UI данные в объекте для быстрой смены фреймворка
 * https://blog.bitsrc.io/an-opinionated-styleguide-for-angular-af623d54e2b8
 * https://itnext.io/building-an-enterprise-grade-angular-project-structure-f5be32533ba3
 * [Angular 6 Best Practices Application Directory Structure](https://infinityknow.com/angular-6-best-practices-application-directory-structure/)
 * [5 Tips to improve User Experience of your Angular app with NgRx](https://medium.com/angular-in-depth/5-tips-to-improve-user-experience-of-your-angular-app-with-ngrx-6e849ca99529)
	 *	three Actions are required for any API call:
		* Action to trigger the Effect
		* Action to wrap the successful result (typically suffixed with Success)
		* Action to reflex the error response (typically suffixed with Error)
	* Store as a cache
	* don't store data in localStorage it slows down load
	* Optimistic interactions with the UI
 * [Keeping browser tabs in sync using localStorage, NgRx, and RxJS](https://medium.com/angular-in-depth/keeping-browser-tabs-in-sync-using-localstorage-ngrx-and-rxjs-87de3bca4e2c)
 * [Best practices for a clean and performant Angular application](https://medium.com/free-code-camp/best-practices-for-a-clean-and-performant-angular-application-288e7b39eb6f)
 * [Angular Folder Structure](https://medium.com/@motcowley/angular-folder-structure-d1809be95542)
 * [How to define a highly scalable folder structure for your Angular project](https://itnext.io/choosing-a-highly-scalable-folder-structure-in-angular-d987de65ec7)
	* https://angular-folder-structure.readthedocs.io
	* https://github.com/mathisGarberg/angular-folder-structure
	* https://angular-folder-structure.readthedocs.io/en/latest/default.html
	```
		├──[+] e2e
		│   └── src
		│--[+] media (@media)
		│	│--[+] doc
		│	│--[+] api
		│	│--[+] design
		└──[+] src
			├──[+] app
			│   ├──[+] core (@app)
			│	│	├──[+] gateways
			│	│	│	│--[+] Name1Gateway
			│	│	│	│	│-- Name1.mock.ts
			│	│	│	│	│-- Name1.model.ts
			│	│	│	│	│-- Name1.service.ts
			│	│	│	│	│-- Name1.service.spec.ts
			│	│	│	│--[+] Name2Gateway
			│	│	├──[+] guards
			│	│	├──[+] interceptors
			│	│	├──[+] services
			│	│	│--[+] core-models
			│	│	└── core.module.ts
			│   ├──[+] store (@store)
			│	│	│--[+] StoreName1
			│	│	│--[+] StoreName2
			│	│	└── data.module.ts
			│   ├──[+] layout/page (@layout)
			│	│	├──[+] main
			│	│	├──[+] page-not-found
			│	│	└── layout.module.ts
			│   ├──[+] modules (@modules)
			│	│	│--[+] ModuleName1
			│	│	│--[+] ModuleName2
			│	│	└── modules.module.ts
			│   └──[+] shared (@shared)
			│		├── components
			│		│	│--[+] ComponentName1
			│		│	│--[+] ComponentName2
			│		│	└── components.module.ts
			│		├──[+] pipes
			│		├──[+] directives
			│		│--[+] shared-models
			│		└── shared.module.ts
			├──[+] assets (@assets)
			│	├──[+] images
			│	├──[+] icons
			│	├──[+] fonts
			│	├──[+] static-pages
			│	└──[+] styles
			└──[+] environments (@env)
	```
 * [High scalable folder structure in angular applications](https://medium.com/edataconsulting/high-scalable-folder-structure-in-angular-applications-a50b55f94350)
	```
		src
		|-- app
			|-- core
			|-- [+] guards
			|-- [+] interceptors
			|-- [+] services
			|-- core.module.ts
			|-- shared
				|-- components
					|-- header
					|-- footer
					|-- button
				|-- [+] pipes
				|-- [+] directives
				|-- [+] models
			|-- features
			|-- home
				|-- [+] components
				|-- [+] services
				|-- home-routing.module.ts
				|-- home.module.ts
			|-- awesome-widget
				|-- [+] components
				|-- [+] services
				|-- [+] models
				|-- awesome-widget.module.ts
			app.component.html
			app.component.css
			app.component.spec.ts
			app.component.ts
			app.module.ts
			app-routing.module.ts
	```

## performance оптимизация и утечки памяти производительность

 * https://github.com/Angular-RU/change-detection-tree
 * https://lukeliutingchun.medium.com/angular-performance-issue-caused-by-function-calls-in-template-a1a930f40464
 * https://medium.com/@dammytrager/lazy-loading-angular-modules-51b2cfdb6190
 * https://blog.bitsrc.io/top-reasons-why-your-angular-app-is-slow-c36780a0a289
 * https://netbasal.com/lazy-load-modal-components-in-angular-8cb54bba7bf7
 * https://netbasal.com/lazy-load-images-in-angular-with-two-lines-of-code-beb13cd5a1c4
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
		.switchMap((value) => { return http.post('/api', value) })
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
 * [angular performance checklist](https://github.com/mgechev/angular-performance-checklist)
 * https://www.lucidchart.com/techblog/2016/05/04/angular-2-best-practices-change-detector-performance/
 * [передвинуть](https://netbasal.com/angular-services-do-not-have-to-be-singletons-ffa879e62082?gi=c6b3d97473d8) объявления из ngModule в компонент или очистить в ngOnDestroy

 ```ts
	@NgModule({
	providers: [AdminService, AdminDataService]
	})

	@NgModule({
	providers: [AdminService, AdminDataService]
	})
 ```
 * if we call NgModuleRef.destroy() or PlatformRef.destroy() then ngOnDestroy method of singleton providers will be also executed
 * [How to create a memory leak in Angular](https://medium.com/angular-in-depth/how-to-create-a-memory-leak-in-angular-4c583ad78b8b)
 * [Главные причины медленной работы Angular-приложений](https://habr.com/ru/company/ruvds/blog/485642/)
 * для статических параметров лучше использовать @Attribute
	```ts
	@Component({
	...
	})
	export class BlogComponent {
	constructor(@Attribute("type") private type: string ) {}
	}
	```
 * [Tree-shakable dependencies in Angular projects](https://indepth.dev/tree-shakable-dependencies-in-angular-projects/)
 * [Understanding Memory Leaks in Angular](https://javascript.plainenglish.io/understanding-memory-leaks-in-angular-4a738f7ce90d?gi=a063ee65f609)
 * [Повысьте производительность SPA, разбив ваши библиотеки Angular на несколько частей](https://habr.com/ru/post/482646/)
 * [Optimize Angular bundle size in 4 steps](https://medium.com/angular-in-depth/optimize-angular-bundle-size-in-4-steps-4a3b3737bf45)

## AOT ahead of time compilation

 * http://blog.mgechev.com/2016/08/14/ahead-of-time-compilation-angular-offline-precompilation/
 * https://angular.io/guide/aot-compiler
 * много ограничений, не поддерживает стрелочные функции

## NGRX REDUX state management

 * https://medium.com/weekly-webtips/using-ngrx-store-in-2020-72f438177c77
 * https://jczacharia.medium.com/easier-angular-component-state-management-34615849a637
 * [Introducing @ngrx/entity](https://medium.com/ngrx/introducing-ngrx-entity-598176456e15)
 * https://www.bersling.com/2017/06/05/state-management-ngrxstore-vs-angular-services/
 * [An Intro to ngrx/effects , ngrx/store with Angular 4](https://medium.com/front-end-weekly/an-intro-to-ngrx-effects-ngrx-store-with-angular-4-c55c4d1d5baf)
 * [Angular NgRx Entity - Complete Practical Guide](https://blog.angular-university.io/ngrx-entity/)
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
	* https://levelup.gitconnected.com/angular-10-ngrx-store-by-example-afec6929bbf9
	* https://medium.com/angular-in-depth/using-angular-elements-with-ngrx-bc655e1eb212
	* [How to Start Flying with Angular and NgRx](https://indepth.dev/posts/1042/how-to-start-flying-with-angular-and-ngrx)
	* [How to Start Flying with Angular and NgRx](https://medium.com/angular-in-depth/how-to-start-flying-with-angular-and-ngrx-b18e84d444aa)
	* [Unit testing of ngrx-store in Angular app - 2017](https://medium.com/@aravindfz/unit-testing-of-ngrx-store-in-angular-app-d0935c8d8d1b)
	* [angular-ngrx-data — state management и CRUD за пять минут](https://habr.com/ru/post/418369/)
	* [Реактивные приложения на Angular/NGRX. Часть 1. Введение.](https://medium.com/@demyanyuk/реактивные-приложения-на-angular-ngrx-часть-1-cb7b4f2852dc)
	* [Практическое применение RxJS Написание собственного Ngrx](https://medium.com/ngx/practical-use-rxjs-81aaab57045c)
	* [Стейт-машина в Angular: учимся использовать правильно](https://medium.com/ngx/practical-use-rxjs-81aaab57045c)
		* Для сложных случаев подойдут: Dexie.js, LokiJs, sql.js, Alasql
		* Простой и надёжной шиной сообщений являются сервисы, организованные, как рекомендовано в CQS/CQRS. Есть и готовые решения — ngx-message-bus и angular-cqrs
		* Чаще, требуется только Store или Event Bus, альтернатив которым полно в сети или которые можно легко написать самостоятельно, и они не будут диктовать условия вашей архитектуре.
	* [NGRX Entities: UpdateOne and UpdateMany @ngrx/entities ](https://medium.com/@daveharmswebdev/ngrx-entities-updateone-and-updatemany-ced8863d63a6)
	* [Introducing @ngrx/entity](https://medium.com/ngrx/introducing-ngrx-entity-598176456e15)
	* [Managing State in Angular Applications using NgRx](https://blog.nrwl.io/using-ngrx-4-to-manage-state-in-angular-applications-64e7a1f84b7b)
	* [NgRx — Cherry Picking the Meta](https://medium.com/angular-in-depth/ngrx-cherry-picking-the-meta-30869953e929)
	* [@ngrx/data a full-featured entity management system](https://ngrx.io/guide/data/limitations)

## CD change detection ZoneJS

 * абстрактное синтаксическое дерево
 * [The Last Guide For Angular Change Detection You'll Ever Need 2019](https://www.mokkapps.de/blog/the-last-guide-for-angular-change-detection-you-will-ever-need)
 * https://blog.thoughtram.io/angular/2016/02/22/angular-2-change-detection-explained.html
 * https://angular.io/guide/zone
 * запуск обновления HTML:
	+ инициализация компонента - загружает bootstrap компонент и дёргает ApplicationRef.tick() для вызова change detection и View Rendering
	+ Event listener - <button (click)="onClickMe()">
	+ HTTP запрос
	+ микрозадачи, например: setTimeout(), setInterval(), Promise.then()
	+ Другие асинхронные операции, например: WebSocket.onmessage(), Canvas.toBlob(), mousemove, scroll, requestAnimationFrame()
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
 * [zonejs modules](https://github.com/angular/angular/blob/master/packages/zone.js/MODULE.md)
 * [Оптимизация обработки событий в Angular EventManagerPlugin](https://habr.com/ru/company/tinkoff/blog/429692/)
 * https://www.mokkapps.de/blog/the-last-guide-for-angular-change-detection-you-will-ever-need
 * [The Last Guide For Angular Change Detection You'll Ever Need - 2019](https://www.mokkapps.de/blog/the-last-guide-for-angular-change-detection-you-will-ever-need/)

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

 * disable zonejs

	```js
	platformBrowserDynamic().bootstrapModule(AppModule, { ngZone: 'noop' })
	.catch(err => console.error(err));
	```
 * [The difference between NgDoCheck and AsyncPipe in OnPush components](https://indepth.dev/posts/1010/the-difference-between-ngdocheck-and-asyncpipe-in-onpush-components)
## auth авторизация

 * https://codeburst.io/jwt-authentication-in-angular-48cfa882832c
 * https://medium.com/engineerbabu/angular-authentication-using-jwt-d846c5ce0ac6
 * https://medium.com/@joshthompsonsmithdev/auth0-angular-7-login-tutorial-b3111c8e32a

## rendering

 * [virtual dom](https://medium.com/angular-in-depth/introducing-to-ng-vdom-a-new-way-to-write-angular-application-60a3be805e59)

## forms

 * https://medium.com/angular-in-depth/reducing-the-forms-boilerplate-make-your-angular-forms-reusable-ee06d7c07f47
 * https://blog.angulartraining.com/dynamic-filtering-with-rxjs-and-angular-forms-a-tutorial-6daa3c44076a
 * https://bubtaylor.com/loading-angular-reactive-forms-809b7774159a?gi=a2c92d54e3df
 * https://github.com/ngneat/forms-manager
 * https://blog.thoughtram.io/angular/2016/07/27/custom-form-controls-in-angular-2.html
 * template driven привязывают данные в html тэгах как параметры DOM, а весь код генерируют во время исполнения
 * reactive driven привязывают данные в js при помощи специальных классов, поэтому можно писать свои валидаторы, делать синхронные и асинхронные(через собственный наблюдатель) валидации
 * [ошибка линтера Angular FormControl.errors.required](https://github.com/angular/vscode-ng-language-service/issues/149)
 * [Angular Forms: Useful Tips](https://medium.com/angular-in-depth/angular-forms-useful-tips-9f3a9826292e) 2020
 * [pipes in reactive forms](https://stackoverflow.com/questions/49522542/how-to-use-pipes-in-angular-5-reactive-form-input) `[value]="formGroup.get('rental').value | currency`

### forms validation

 * [forms validation](https://netbasal.com/make-your-angular-forms-error-messages-magically-appear-1e32350b7fa5)
 * https://medium.com/swlh/advanced-form-validation-with-angular-and-joi-6630f76cf8ad
 * https://medium.com/angular-in-depth/new-way-to-validate-the-angular-reactive-form-2c4fe4f13373
 * https://indepth.dev/posts/1310/creating-elegant-reactive-forms-with-rxwebvalidators
 * [model driven form](https://github.com/rxweb/rxweb/tree/master/client-side/angular/packages/reactive-form-validators#readme)
 * [валидация номера телефона](https://github.com/google/libphonenumber)

## directive components

 * [Directive Selectors, @HostBinding('rel'), :not](https://blog.angularindepth.com/beware-angular-can-steal-your-time-41fe589483df)
 * [Changing the behavior of a 3rd party Angular Component](https://medium.com/angular-in-depth/changing-the-behavior-of-a-3rd-party-angular-component-91f84fb9af28)

	```html
		<!-- notice "customRadio" directive in html below -->
		<ion-select  [(ngModel)]="mdls" customRadio>
		<ion-option *ngFor="let model of mdls" >{{model}}</ion-option>
		</ion-select>
	```

	```js
		// accessing to component through directive
		import { Directive } from '@angular/core';
		import { Host, Self, Optional } from '@angular/core';

		@Directive({
			selector: '[customRadio]',
		})
		export class CustomRadioDirective {

			constructor(
			@Host() @Self() @Optional() public hostSel : Select) {
			// Now you can access specific instance members of host directive
			let app = (<any>hostSel)._app;
			// also you can override specific methods from original host directive so that this specific instance uses your method rather than their original methods.
			hostSel.open = (ev?: UIEvent) => {
				// your custom code for open() method here..
			}
			}
		}
	```
 * controlValueAccessor
	* https://netbasal.com/attribute-directives-angular-forms-b40503643089
	* [Angular Custom Form Controls: Complete Guide - angular university 2021](https://blog.angular-university.io/angular-custom-form-controls/)
	* [Angular Forms - Kara Erickson - AngularConnect 2017](https://youtu.be/CD_t3m2WMM8?t=1411)
	* https://stackoverflow.com/questions/45536108/access-valid-value-of-custom-form-control#
	* https://stackoverflow.com/questions/45755958/how-to-get-formcontrol-instance-from-controlvalueaccessor
	* [ControlValueAccessor и contenteditable в Angular tinkoff](https://habr.com/ru/company/tinkoff/blog/443714/)
	* https://stackoverflow.com/questions/39809084/injecting-ngcontrol-in-custom-validator-directive-causes-cyclic-dependency
## проекция projection

 * ng-content
 * ngTemplateOutlet
 * https://dev.to/mustapha/angular-build-more-dynamic-components-with-ngtemplateoutlet-3nee
 * https://tutorialsforangular.com/2020/05/08/using-templateref-and-ngtemplateoutlet-to-pass-templates-between-components-in-angular/
 * https://www.tektutorialshub.com/angular/ngtemplateoutlet-in-angular/#complete-source-code
 * https://community.indepth.dev/t/ngtemplateoutlet-the-secret-to-customisation-angular-indepth/1105/3
 * [Angular — Four practical use cases of NgTemplateOutlet](https://lukeliutingchun.medium.com/angular-four-practical-use-cases-of-ngtemplateoutlet-f8e44e5483f2)

## арихитектура module federation

 * https://www.angulararchitects.io/en/book/
 * https://webpack.js.org/concepts/module-federation/
 * https://github.com/manfredsteyer/module_federation_shared_versions
 * [Example nx](https://github.com/manfredsteyer/2022_03_24)
 * https://auth0.com/blog/micro-frontends-with-angular-module-federation-and-auth0/
 *
 *
 *

## DI injectors modules services

 * https://medium.com/thinkster-io/3-angular-dependency-injection-tips-c4b5356541ee
 * https://medium.com/generic-ui/famous-angular-forroot-pattern-59b9eaa0a3f4
 * https://medium.com/@josce.james7/an-introduction-to-angular-modules-c26d441e42fa
 * https://medium.com/angular-in-depth/angular-di-getting-to-know-the-ivy-nodeinjector-33b815642a8e
 * https://lukeliutingchun.medium.com/angular-introduction-to-service-inheritance-aead1a8e1f0c
 * https://blog.bitsrc.io/solid-the-dependency-inversion-principle-in-angular-6e4b9c484960
 * [Asynchronous modules and components in Angular Ivy](https://indepth.dev/posts/1026/asynchronous-modules-and-components-in-angular-ivy)
 * [All you need to know about Ivy, The new Angular engine! 2019](https://medium.com/angular-in-depth/all-you-need-to-know-about-ivy-the-new-angular-engine-9cde471f42cf)
 * [Введение в модули Angular — корневой модуль (Root Module)](https://habr.com/ru/post/351504/)
 * [Конфигурируемые модули Angular](https://tyapk.ru/blog/post/angular-configurable-modules)

## service worker

 * https://angular.io/guide/service-worker-intro
## web workers

 * https://angular.io/guide/web-worker
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
 * [Learn Angular in this free 33-part course by Angular-expert Dan Wahlin](https://www.freecodecamp.org/news/want-to-learn-angular-heres-our-free-33-part-course-by-dan-wahlin-fc2ff27ab451/)

## security

 * [auth0 SSO](https://auth0.com/blog/angular-2-authentication/)
 * https://www.tsmean.com/articles/authentication/express-session-angular/

## router

 * https://indepth.dev/posts/1379/angular-router-revealing-some-interesting-facts-and-features
 * [Определение маршрутов](https://metanit.com/web/angular2/7.1.php)


## angular6

 * https://codingthesmartway.com/angular-elements-a-practical-introduction-to-web-components-with-angular-6/

## IDE

https://stackblitz.com/edit/angular-jhutmd?file=app%2Fapp.component.html

## network

 * https://medium.com/@sjnaveenkumar/writing-a-generic-http-module-in-angular-a56d36d584a7
 * https://javascript.plainenglish.io/the-right-way-to-make-api-calls-in-angular-5cc03a62bf43
 * https://blog.usejournal.com/how-to-map-rest-api-data-using-decorator-pattern-in-angular-6-94eb49ba16b1
 * https://levelup.gitconnected.com/the-correct-way-to-make-api-requests-in-an-angular-application-22a079fe8413
 * крутилка https://medium.com/swlh/angular-loading-spinner-using-http-interceptor-63c1bb76517b

## rxjs реактивное программирование reactive observable


### ликбез

 * [реактивная архитектура angular](https://christianlydemann.com/refactoring-angular-apps-to-reactive-architecture/)
 * сделано для обработки асинхронных непрерывных потоков данных
 * [The introduction to Reactive Programming you've been missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)
 * [View Facades + RxJS](https://medium.com/angular-in-depth/angular-you-may-not-need-ngrx-e80546cc56ee)
 * [reactive manifesto](https://www.reactivemanifesto.org/)
 * https://medium.com/swlh/basic-reactive-patterns-in-angular-b404bc127a0a
 * https://blog.bitsrc.io/10-useful-angular-features-youve-probably-never-used-e9e33f5c35a7
 * https://medium.com/its-tinkoff/best-angular-tips-90bdc1c25529
 * [The introduction to Reactive Programming you've been missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754)
 * http://rxmarbles.com/
 * http://reactivex.io/documentation/operators/flatmap.html
 * [примеры и актуальность методов](https://rxjs-dev.firebaseapp.com/api)
 * [js observable](https://www.youtube.com/watch?v=NK-WzH3RBds)
 * [частые ошибки](https://medium.com/@paynoattn/3-common-mistakes-i-see-people-use-in-rx-and-the-observable-pattern-ba55fee3d031)
 * https://itnext.io/practical-rxjs-and-angular-b8d38189bb2c
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
 * [RxJS: How to Observe an Object](https://ncjamieson.com/how-to-observe-an-object/)
 * https://medium.com/angular-in-depth/how-to-rxjs-in-angular-1037908e82a5
 * https://blog.bitsrc.io/5-common-mistakes-with-rxjs-1b09d4c19387
 * https://medium.com/angular-in-depth/reducing-the-forms-boilerplate-make-your-angular-forms-reusable-ee06d7c07f47
 * [subjects async behavior reply](https://www.learnrxjs.io/learn-rxjs/subjects)
 * [RxJS: multicast's Secret without connectable](https://cartant.medium.com/rxjs-multicasts-secret-760e1a2b176e)
 * [Live search with RxJS- the devil is in the details](https://medium.com/angular-in-depth/rxjs-live-search-the-devil-is-in-the-detail-119637186427)
 * [Hot vs Cold Observables](https://medium.com/@benlesh/hot-vs-cold-observables-f8094ed53339)
 * [Learning Observable By Building Observable](https://medium.com/@benlesh/learning-observable-by-building-observable-d5da57405d87)

### unsubscribe

 * [unsubscribe Почему вам НАДО отписываться от Observable?](https://medium.com/ngx/why-do-you-need-unsubscribe-ee0c62b5d21f)
 * https://medium.com/swlh/rxjs-angular-unsubscribe-like-a-pro-ffeedec60aa7
 * [The Best Way To Unsubscribe RxJS Observables In The Angular Applications!](https://medium.com/angular-in-depth/the-best-way-to-unsubscribe-rxjs-observable-in-the-angular-applications-d8f9aa42f6a0)
 * [Different ways of unsubscribing from RxJS Observables with Angular](https://blog.codecentric.de/en/2018/01/different-ways-unsubscribing-rxjs-observables-angular/)
 * [When to Unsubscribe in Angular](https://netbasal.com/when-to-unsubscribe-in-angular-d61c6b21bad3)



### тестирование

 * [тестирование rxJS](https://netbasal.com/testing-observables-in-angular-a2dbbfaf5329)

### курсы rxjs

 * https://www.udemy.com/course/hands-on-rxjs-for-web-development/


### tslint eslint линтеры

 * `// @ts-nocheck` https://www.typescriptlang.org/docs/handbook/intro-to-js-ts.html#ts-check
 * // eslint-disable max-lines
 * // tslint:disable:max-lines
 * фильтрация вывода линтеров

	```bash
		grep warning eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
		grep WARNING: tslint.log | colrm 1 16 | sort | uniq |less
		grep ' ✖ ' scsslint.log | colrm 1 9 | sort | uniq | less
		grep ' × ' log/scsslint.log | colrm 1 10 | tr -s ' ' | sort | uniq > log/scsslint.uniq.log # windows
	```
 * [migrate-angular-8-from-tslint-to-eslint](https://medium.com/create-code/migrate-angular-8-from-tslint-to-eslint-4b0c44c8ae38)
 * [tslint-to-eslint-config](https://github.com/typescript-eslint/tslint-to-eslint-config)
 * [tslint](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-typescript-tslint-plugin)
 * [eslint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
 * npm dev dependencies
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

 * [RxJS: Avoiding switchMap-Related Bugs](https://cartant.medium.com/switchmap-bugs-b6de69155524)

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


## Input event

 * https://netbasal.com/event-emitters-in-angular-13e84ee8d28c

## PWA

 * https://pwa.ng/

## desktop angular app

 * https://progtask.ru/angular-electron/
## web components

 * Basic level - [Angular Elements - A Practical Introduction To Web Components With Angular 6](https://www.tsmean.com/articles/angular/pitfalls/)
 * https://medium.com/angular-in-depth/angular-web-components-a-complete-guide-5270e5b07e93

## pitfalls грабли

 * [angular faq](https://rahulrsingh09.github.io/AngularConcepts/faq)
 * [подводные камни angular 2019](https://habr.com/ru/company/ruvds/blog/459304/)
 * [Angular Dependency Injection, Singleton Services, and A Loading Indicator spinner крутилка](https://medium.com/@weswhite/angular-singleton-service-and-a-loading-indicator-ca3cc7892722)
 * [Обход подводных камней Angular и экономия времени](https://habr.com/ru/company/ruvds/blog/459304/) https://blog.angularindepth.com/beware-angular-can-steal-your-time-41fe589483df

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
 * `@Input() set` сеттеры/геттеры могут вызвать асинхронные гонки https://kelly-kh-woo.medium.com/angular-stop-using-setter-for-input-or-5bdb4b990ab3


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
 * [Guards позволяют ограничить навигацию по определенным маршрутам](https://metanit.com/web/angular2/7.7.php)

### mat-icon

 * [нельзя выбрать другие типы иконок](https://github.com/google/material-design-icons/issues/773)

### nav tab

 * не работает disabled
```scss
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

### onchange mat-select dropdown

 * реакция на выбор
	* https://stackoverflow.com/questions/50222738/angular-6-material-mat-select-change-method-removed
	* используем ```<select (selectionChange)="onChange($event.value)></select>"```
	* https://angular.io/api/forms/NgModel#properties

### mat-paginator mat-table

 * https://material.angular.io/components/sort/api
 * https://material.angular.io/components/paginator/overview
 * [Angular Material Data Table: A Complete Example (Server Pagination, Filtering, Sorting)](https://blog.angular-university.io/angular-material-data-table/)
 * тестирование
 	* https://material.angular.io/guide/using-component-harnesses
	* https://material.angular.io/components/table/examples#table-harness
		* https://stackblitz.com/angular/xaamregeegko?file=src%2Fapp%2Ftable-harness-example.ts
	* https://material.angular.io/components/paginator/api#MatPaginatorHarness
 * `this.noData = this.dataSource.connect().pipe(map((item => item.length <= 0));`
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

 * [paginator изменение надписей листалки](https://stackoverflow.com/questions/54103636/how-to-change-the-text-in-the-label-in-pagination)
	```ts
		import {MatPaginatorIntl} from '@angular/material';
		import {Injectable} from '@angular/core';

		@Injectable()
		export class CustomMatPaginatorIntl extends MatPaginatorIntl {
		constructor() {
			super();

			this.getAndInitTranslations();
		}

		getAndInitTranslations() {

			this.itemsPerPageLabel = "test";
			this.nextPageLabel = "test";
			this.previousPageLabel = "test";
			this.changes.next();

		}

		getRangeLabel = (page: number, pageSize: number, length: number) =>  {
			if (length === 0 || pageSize === 0) {
			return `0 / ${length}`;
			}
			length = Math.max(length, 0);
			const startIndex = page * pageSize;
			const endIndex = startIndex < length ? Math.min(startIndex + pageSize, length) : startIndex + pageSize;
			return `${startIndex + 1} - ${endIndex} / ${length}`;
		}
		}
	```
 * прибить листалку внизу
 	* https://indepth.dev/posts/1336/how-to-do-dom-manipulation-properly-in-angular#concepts--2
	* https://www.tektutorialshub.com/angular/renderer2-angular/
	*

	```ts
		constructor(private element: ElementRef, private renderer: Renderer2) {
		// renderer2 безопаснее и не требует браузера
		}

		ngAfterViewInit() {
			this.setupPaginator();
		}

		ngOnChanges(changes: SimpleChanges): void {
			if (
				this.isPaginatorEnabled &&
				(changes.paginatorConfig && changes.paginatorConfig.currentValue && !changes.paginatorConfig.firstChange)
			) {
				this.setupPaginator();
			}
		}

		setupPaginator() {
			this.paginatorConfig = { ...this.paginatorConfig, ...TABLE_PAGINATOR_DEFAULT_OPTIONS };
			if (this.paginatorConfig.isPaginatorPulledDown) {
				this.renderer.setStyle((this.element.nativeElement as HTMLElement).querySelector('table'), 'height', `calc(20px + ${this.paginatorConfig.pageSize}*60px)`);
			}
		}
	```

 * типизирование onChanges

 ```ts
	/** типизируем свойства класса для onChanges */
	type TSomeChanges<T> = {
	[key in keyof T]: SimpleChange;
	};

	export class SomeComponent implements OnChanges {
		@Input() index: number = 0;

		ngOnChanges(changes: TTabChanges<SomeComponent>): void {
        	if (parseInt(changes?.index?.currentValue, 10) >= 0) {
				// ...
			}
		}
	}
 ```

### mat-datepicker

 * блокирование ручного ввода даты

 ```html
    <input
    (keydown)="$event.stopPropagation();$event.preventDefault()"
    >
 ```

 * генерация нескольких mat-datepicker [внутри ngFor](https://stackoverflow.com/questions/49451678/mat-datepicker-inside-ngfor)

 ```html
<div
	*ngFor="let item of itemList; let itemIndex = index; let datePickerRef = index"
>
	<mat-form-field class="material-datepicker">
		<input
			matInput
			[matDatepicker]="datePickerRef"
			placeholder="MM/DD/YY"
			[formControl]="getControlDateList().controls[Index]"
		>
		<mat-datepicker-toggle
			matSuffix
			[for]="datePickerRef"
		></mat-datepicker-toggle>
		<mat-datepicker #datePickerRef></mat-datepicker>
	</mat-form-field>
</div>
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


### subscribe

 * [You should NEVER subscribe in the method that creates the observable](https://stackoverflow.com/questions/46906027/angular-cannot-read-property-subscribe-of-undefined)

### ngfor

[нельзя итерировать по свойствам объекта Property binding ngFor not used by any directive on an embedded template](https://webcake.co/object-properties-in-angular-2s-ngfor/)

### css

 * глобальные стили css
	* [styles.css](https://github.com/angular/angular-cli/wiki/stories-global-styles)
	* https://github.com/angular/angular-cli/issues/10007
	* [Angular2 styling issues caused by DOM attributes _ngcontent-* vs. _nghost-*](https://stackoverflow.com/questions/37689673/angular2-styling-issues-caused-by-dom-attributes-ngcontent-vs-nghost)
	* [view encapsulation](https://angular.io/guide/component-styles#view-encapsulation)
	*
	```ts
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

### tsconfig

 * [import json](https://medium.com/@berrow/angular-7-import-json-14f8bba534af) https://stackoverflow.com/questions/52888238/import-json-in-angular-7-project https://stackoverflow.com/questions/46991237/how-to-import-json-file-into-a-typescript-file

	```json
	{
	"compilerOptions": {
		"allowSyntheticDefaultImports": true,
		"resolveJsonModule": true,
		//"esModuleInterop": true,
	}
	}
	```

	```ts
	import RAW_RAW from 'raw.json';
	export const RAW: IRaw = RAW_RAW;

	```

### зависимости DI dependency injection

разрешение зависимостей во время выполнения с помощью внешней библиотеки. Для этого пишутся аннотации в коде классов и делается специальный конфиг с описанием дерева зависимостей.

 * https://indepth.dev/posts/1261/what-you-always-wanted-to-know-about-angular-dependency-injection-tree
 * [внедрение зависимостей](https://devcolibri.com/basics-of-dependency-injection-for-dummies/)
 * [extends](https://angular.io/guide/hierarchical-dependency-injection)
 * https://stackoverflow.com/questions/33970645/how-to-extend-a-component-with-dependency-injection-in-angular-2#40592524
 * barrel, circular dependency
	* https://angular.io/guide/dependency-injection-in-action#break-circularities-with-a-forward-class-reference-forwardref
	* https://github.com/angular/angular.io/issues/1301
	* https://stackoverflow.com/questions/36378751/angular2-2-services-depending-on-each-other
	* https://stackoverflow.com/questions/40525850/circular-dependency-injection-angular-2
	* https://stackoverflow.com/questions/37997824/angular-di-error-exception-cant-resolve-all-parameters
 * очерёдность импортов важна
	* https://stackoverflow.com/questions/37902476/automatic-ordering-of-exports-in-index-ts-makes-app-crash/37907696#37907696
	* https://angular.io/guide/dependency-injection-in-action
	* https://stackoverflow.com/questions/39062930/what-is-difference-between-declarations-providers-and-import-in-ngmodule#39063231
 * https://hacks.mozilla.org/2015/08/es6-in-depth-modules/
 * https://angular.io/guide/ngmodule-vs-jsmodule
 * ngModule

	```js
		//you configure an Angular dependency injector with a provider of that service.

		declarations: [//A declarable can only belong to one module, so only declare it in one @NgModule. When you need it elsewhere, import the module that has the declarable you need in it.
		YourComponent,
		YourPipe,
		YourDirective
		],
		imports: [
			//The module's imports array appears exclusively in the @NgModule metadata object. It tells Angular about other NgModules that this particular module needs to function properly.
		],
		exports: [
			//The set of components, directives, and pipes declared in this NgModule that can be used in the template of any component that is part of an NgModule that imports this NgModule. Exported declarations are the module's public API.
		]
		providers: [
			//The providers array is where you list the services the app needs. When you list services here, they are available app-wide. You can scope them when using feature modules and lazy loading.

		{ provide: OldLogger, useClass: LoggerClass},// Not aliased! Creates two instances of `NewLogger`
		{ provide: OldLogger, useExisting: LoggerClass}// Alias OldLogger w/ reference to NewLogger
		{ provide: Logger, useValue: SomeObject }
		],
		bootstrap: [
			//The application launches by bootstrapping the root AppModule, which is also referred to as an entryComponent. Among other things, the bootstrapping process creates the component(s) listed in the bootstrap array and inserts each one into the browser DOM.
		]

	```

 * [Inversion of Control Containers and the Dependency Injection pattern](https://martinfowler.com/articles/injection.html)

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

## httpCLient

 * запрос на html файл `responseType: 'text' as 'text'`

```js
const httpOptions = {
			headers: new HttpHeaders({
				'Content-Type': 'application/json',
				// 'Content-Type': 'text/html',
				// 'Cache-Control': 'max-age=0',
				// 'Upgrade-Insecure-Requests': '1',
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
				this.dataSource.data = data;
			});

```

## HTTP interceptors

 * https://medium.com/@ryanchenkie_40935/angular-authentication-using-the-http-client-and-http-interceptors-2f9d1540eb8
 * http://stepansuvorov.com/blog/2014/04/angularjs-interceptors-%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D1%8B/
 * [Top 10 ways to use Interceptors in Angular](https://medium.com/angular-in-depth/top-10-ways-to-use-interceptors-in-angular-db450f8a62d6)

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
 * https://medium.com/the-tech-bench/getting-visual-studio-code-and-nvm-working-together-252ec0300895

## сборка

 * rome
 * parcel2
 * swc
 * vite
 * esbuild - go
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

## graphQL API query libs

 * https://medium.com/@sergeyfetiskin/testing-apollo-graphql-in-your-angular-application-595f0a04aad3
 * [что не так с graphql](https://habr.com/post/425041/)
 * [The production-ready GraphQL client for React](https://relay.dev/)
 * [A JavaScript library for efficient data fetching](https://netflix.github.io/falcor/)
 * [Дизайн GraphQL-схем — строим схемы правильно (версия 2) / Павел Черторогов (ps.kz)](https://www.youtube.com/watch?v=tASEYJXdO_c)
 * [Дизайн GraphQL-схем — делаем АПИ удобным](https://github.com/nodkz/conf-talks/tree/master/articles/graphql/schema-design)
 * [Переход от Rest API к GraphQL на примере реальных проектов / Антон Морев (Wormsoft)](https://www.youtube.com/watch?v=iiI5L6b0Uvo)
 * [Пентест приложений с GraphQL](https://habr.com/ru/company/dsec/blog/444708/)
 * [Руководство по языку запросов GraphQL для начинающих](https://tproger.ru/translations/graphql-beginners-guide/)

## Internatiolization перевод locale локализация translate

 * @angular/localize
 * XLIFF, ICU, ARB редакторы для выгрузки UI текстов в сторону переводчиков и обратно
 * http://www.ngx-translate.com/
 * [мультиязычность в ангуляр](https://www.creativebloq.com/how-to/add-multi-language-support-to-angular)
 * https://angular.io/guide/i18n#prerequisites
 * https://tyapk.ru/blog/post/angular-pipe-localization `registerLocaleData(localeRu, 'ru');`
 * https://angular.io/api/common/DecimalPipe

## UI/UX framework фреймворки библиотеки

 * using [tailwindcss](https://tailwindcss.com/) in [angular](https://medium.com/@jacobneterer/angular-and-tailwindcss-2388fb6e0bab)
 * [Theming Angular, ViewEncapsulation](https://medium.com/swlh/theming-angular-c869827738c3)
 * [HTML UI layout for Angular applications; using Flexbox and a Responsive API ](https://github.com/angular/flex-layout)
 * https://bit.dev/
 * [add bootstrap grid into material](https://www.amadousall.com/the-good-parts-of-bootstrap-4-you-are-missing-in-your-angular-material-projects/)
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
 * [bit+angular библиотека компонентов](https://blog.bitsrc.io/sharing-components-with-angular-and-bit-b68896806c18)
 * [How I Created The Angular Wrapper For Kendo UI Controls](https://medium.com/@bilalhaidar/how-i-created-the-angular-wrapper-for-kendo-ui-controls-4e422926f477)
 * [Основы верстки в Angular c Redux и Nx. Часть 1. Верстка Header и Navbar.](https://medium.com/fafnur/%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D1%8B-%D0%B2%D0%B5%D1%80%D1%81%D1%82%D0%BA%D0%B8-%D0%B2-angular-c-redux-%D0%B8-nx-2da5e0b8e3e8) - анимации и store без @input

 * [multiple ng-content](https://medium.com/disney-streaming/content-projection-with-angular-dbc61c6c181#e0c3)
	```html
	<div class="header-title">
	<ng-content select=".title"></ng-content>
	</div>
	...
	<app-header-expanded>
	<h1 class="title">This is the title</h1>
	<p>Other Injected Content</p>
	</app-header-expanded>
	```
### checkbox галки

	* https://netbasal.com/implementing-grouping-checkbox-behavior-with-angular-reactive-forms-9ba4e3ab3965
	* [Кастомные чекбоксы правильно](https://www.youtube.com/watch?v=E6kLaaQFctU)

## angular material

* [material angular](kb/frontend/design)

### material CDK

 * [Tooltip with Angular CDK](https://medium.com/angular-in-depth/building-tooltips-for-angular-3cdaac16d138)

### material table

 * [Angular CDK Tables](https://medium.com/angular-in-depth/angular-cdk-tables-1537774d7c99)
	* https://stackblitz.com/edit/simple-table?file=src%2Fapp%2Ftable%2Ftable.component.html
	* https://github.com/ZackDeRose/simple-table
 * [Angular Material Data Table: A Complete Example (Server side Pagination, Filtering, Sorting)](https://blog.angular-university.io/angular-material-data-table/)
 * [angular material table custom sort](https://stackoverflow.com/questions/61480695/angular-material-table-custom-sort-foler-and-file-items)
	```ts
		this.dataSource.sortData = (data: YourObjectType[], sort: MatSort) => {
			return data.sort((a: YourObjectType, b: YourObjectType => {
				//Sorting logic here
			});
		}
	```
	* https://github.com/angular/components/blob/master/src/material/table/table-data-source.ts#L142
 	* [sortingDataAccessor](https://material.angular.io/components/table/api#MatTableDataSource)
	* https://stackoverflow.com/questions/48891174/angular-material-2-datatable-sorting-with-nested-objects/49057493#49057493
 * []()
 * https://www.tektutorialshub.com/angular/ngtemplateoutlet-in-angular/#passing-data-to-ngtemplateoutlet
 * []()

### генераторы

 * [для react](https://material-ui.com/getting-started/installation/)

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

## SEO

 * https://medium.com/madhash/how-to-properly-add-google-analytics-tracking-to-your-angular-web-app-bc7750713c9e
 * title
	```ts
	import { Title } from "@angular/platform-browser"@Component({
	...
	})
	export class LoginComponent implements OnInit {
	constructor(private title: Title) {}    ngOnInit() {
		title.setTitle("Login")
	}
	}
	```
 * meta
	```ts
	import { Meta } from "@angular/platform-browser"@Component({
		...
	})
	export class BlogComponent implements OnInit {
		constructor(private meta: Meta) {}    ngOnInit() {
			meta.updateTag({name: "title", content: ""})
			meta.updateTag({name: "description", content: "Lorem ipsum dolor"})
			meta.updateTag({name: "image", content: "./assets/blog-image.jpg"})
			meta.updateTag({name: "site", content: "My Site"})
		}
	}
	```
 * заменить фигурные скобки
	```ts
	Стандартный интерполятор в шаблонах — {{}}. Если вписать переменную между {{ и }}, её значение отобразится в итоговом DOM.

	Знаете ли вы, что есть возможность переопределить стандартные разделители инкапсуляции на какие угодно символы? Это просто. Необходимо лишь указать новые значения в свойстве интерполяции в декораторе Component.

	@Component({
	interpolation: ["((","))"]
	})
	export class AppComponent {}


	Интерполяция используемая в шаблоне AppComponent изменилась на (()), а {{}} больше не работает.

	@Component({
	template: `
		<div>
			((data))
		</div>
	`,
	interpolation: ["((","))"]
	})
	export class AppComponent {
	data: any = "dataVar"
	}


	В браузере вы увидите, что строка «dataVar» будет отображена на месте ((data)).
	```
 * DOM
	```ts
		import { Title } from "@angular/platform-browser"@Component({
		...
		})
		export class LoginComponent implements OnInit {
		constructor(private title: Title) {}    ngOnInit() {
			title.setTitle("Login")
		}
		}
	```

## logging логирование

 * https://medium.com/javascript-in-plain-english/error-logging-with-sentry-on-angular-a73fe04b3999
