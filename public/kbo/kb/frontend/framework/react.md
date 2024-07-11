# React

## отличия от ангуляр

* вместо HTML/декларативного/shadowDOM - virtualDOM/императивный/JS аннотации
	* хорошо для сложных состояний и сложной асинхронщины
	* полностью отдельно рендеринг от браузера
	* должна быть хуже оптимизация/отладка, потому что это не гугл, у которого свой браузер
* стили и разметка вместе с логикой
	* лучше использовать отдельные библиотеки стилей
	* высокий риск дублирования кода


## собес

 * [Любимая задачка на знание React](https://habr.com/ru/companies/tensor/articles/779718/)
	```ts
		function useFetch(url) {
		const [data, setData] = useState(null);
		const [isLoading, setIsLoading] = useState(false);
		const [error, setError] = useState(null);

		useEffect(() => {
			// флаг отмены
			let cancelled = false;

			setIsLoading(true);
			setData(null);
			setError(null);
			fetch(url)
				.then((res) => res.json())
				.then((respData) => {
					if (!cancelled) setData(respData);
				})
				.catch((e) => {
					if (!cancelled) setError(e);
				})
				.finally(() => {
					if (!cancelled) setIsLoading(false);
				});

			return () => {
				// выставим признак того, что запрос отменен
				cancelled = true;
			};
		}, [url]);

		return [data, isLoading, error];
		}

	```
 * https://pomb.us/build-your-own-react/
	*
		```jsx
			// 1
			const element = <h1 title="foo">Hello</h1>
			// 1.2
			const element = React.createElement(
				"h1",
				{ title: "foo" },
				"Hello"
			)
			// 1.3
			const element = {
				type: "h1",
				props: {
					title: "foo",
					children: "Hello",
				},
			}

			// 2
			const container = document.getElementById("root")

			// 3
			ReactDOM.render(element, container)
			// 3.1
				const node = document.createElement(element.type)
				node["title"] = element.props.title

				const text = document.createTextNode("")
				text["nodeValue"] = element.props.children

				node.appendChild(text)
				container.appendChild(node)

			//
			//
			//


		```

## курсы

 * [React. Разработка сложных клиентских приложений](https://htmlacademy.ru/intensive/react)
	* 2 месяца по 20 часов
 * [Курс по React Ильи Кантора](https://learn.javascript.ru/courses/react)
	* 1,5 месяца
 * [Онлайн-курс по созданию одностраничного приложения (SPA) на React](https://school.csssr.com/ru/course/react/junior)
	* Курс состоит из 11 практических заданий, 31 видео-лекции и 26 теоретических глав
	* бесплатно
 * [hexlet основы React](https://ru.hexlet.io/courses/js-react)
	* 23 урока (видео и/или текст), 20 упражнений в тренажере, 42 проверочных теста
 * [Курс «React-разработчик» yandex](https://practicum.yandex.ru/react/)
	* хуки, State Management,TypeScript, Jest и Cypress
	* 3 месяца по 20-25 часов в неделю
 * [Продвинутый Frontend В Production на React](https://ulbitv.ru/frontend)
	* минимум 4 месяца обучения. В неделю открывается один модуль на 2.5-3ч материала. На успешное освоение и закрепление необходимо будет в неделю около 8-10ч
 * [React JS фундаментальный курс от А до Я](https://www.youtube.com/watch?v=GNrdg3PzpJQ)
 * [React: фреймворк фронтенд-разработки нетология](https://netology.ru/programs/react#/main)
	* 2,5 месяца, 13 часов теории и 76 часов практики
 * https://github.com/utimur/react-fundamental-course
 * https://github.com/utimur/React-typescript-course
 * https://ru.hexlet.io/courses/reactjs
 * https://learn.javascript.ru/courses/react
 * https://www.gitbook.com/@maxfarseer/
 * http://itvdn.com/ru/video/react-js-essential

 * [React Router 6 Tutorial](https://www.robinwieruch.de/react-router/)
 * [Best practices for React iframes](https://blog.logrocket.com/best-practices-react-iframes/)
 * [React Context & Hooks Tutorial # 19 - Редукторы, действия и состояние](https://www.youtube.com/watch?v=uXWycyeTeCs)
 * [Full React Tutorial - 2020](https://www.youtube.com/watch?v=j942wKiXFu8&list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d&index=1)

## react DOM

 * отдельная библиотека, работает независимо от браузера
 * работает и на react native и в SSR
 * фаза сравнение - reconciliation
 * фаза отрисовки - render
 * устанавливает приоритеты событий отрисовки
 * оборачивает события syntetic events

## hooks
 * новинка в React 16.8(2019). позволяют использовать state без классов.
 * работают только на корневом уровне, нельзя вкладывать в функции
 * useState()
 * useEffect()
 * useRef()
	* ссылка на элемент
 * useCallback()
 * useContext()
 * useMemo()
	* мемоизация
	* отрабатывает только при изменении зависимостей/параметров
	```tsx
		useMemo( () => factory: {/*...*/}, deps: [value1, value2])
	```
 * custom
 * useState
	* асинхронные гонки
	* сохраняет текущее значение в замыкании, обновляет с асинхронной задержкой на время работы с DOM
	* нужно пробрасывать прицепом все состояния внутрь функций по цепочке вложенности

## компоненты
 * в компоненте может быть только один корневой тэг
 * компонент должен возвращать минимум один тэг
 * предпочтительнее использовать композицию вместо наследования https://learn-reactjs.ru/basics/composition-vs-inheritance

	```tsx
		function Message(props) {
			return (
				<h3 className="message__title">{props.title}</h3>
				<p className="message__text">{props.children}</p>
			);
		}

		function SuccessMessage(props) {
			return (<Message title={props.title}>{props.children}</Message>);
		}
	```

 * генерация компонентов через интерполяцию (ngFor)
	```tsx
		{values.map( value => <div>{value}</div>)}
	```
 * для генерируемых в цикле компонентов необходимо указывать key(ngFor trackBy)
	```

	```
 * props.children aka ng-content

	```tsx
		import { React, FC}  from 'react;
		import classes from 'myClasses.module.css';

		const myComp: FC<IMyComp> = ({children: React.ReactChild | React.ReactNode, ...props}) => {
			return (
				<div ...props className={classes.myClass}>
					{children}
				</div>
			)
		}
		export default myComp;
	```
 * функциональный компонент

	```tsx
		// функциональный
		const myComp: FC<T> = ({children: React.ReactChild | React.ReactNode, ...props}) => {}
		export default myComp;

		// 2
		export default function myComp: FC<T>(props: T) => {}
	```
 * классовый компонент
	```tsx
		// классовый
		export class NavigationComponent extends Component {
			render() {
				return (<div></div>);
			}
		}

		export default NavigationComponent;

	```
 * props передаются во вложенные компоненты только от родителя к детям
 * для обратного проброса props надо передать функцию обратного вызова или использовать композицию компонентов
 * условная отрисовка
	```html
		<div>
			{values.length > 0 ? <div>{values.length}</div> : <div>empty</div>}
		</div>
	```
 * управляемый компонент
	* https://reactjs.org/docs/forms.html#controlled-components
	* прямое связывание через value
	* обратное через onChange
	```tsx
			constructor() {
				this.state = {value: ''};
			}

			handleChange = (event) => {
				this.setState({value: event.target.value});
			}

			render() {
				return (
					<input type="text" value={this.state.value} onChange={this.handleChange} />
				);
			}
	```
 * неуправляемый компонент
	* https://reactjs.org/docs/uncontrolled-components.html
	* прямое взаимодействие через hook useRef

	```tsx
		constructor() {
			this.input = React.createRef();
		}

		onChange = (event) => {
			console.log(this.input.current.value);
		}

		render() {
			return (
				<input type="text" ref={this.input} onChange={event => onChange(event.target.value) />
	```
 * изоляция стилей через css modules
 * вложенные компоненты
	* props.children
	* https://reactjs.org/docs/higher-order-components.html
 * взаимодействие компонентов
	* useMemo
	* context
		* https://reactjs.org/docs/context.html
		* useContext https://reactjs.org/docs/hooks-reference.html#usecontext
	* https://reactjs.org/docs/render-props.html
	* props callback
	* redux/mobx
	* rxJS
	* https://reactjs.org/docs/composition-vs-inheritance.html
## жизненный цикл

 *
	```tsx
		// mount
		useEffect<IObject>(()=>{/*...*/}, [])
		// update
		useEffect(()=>{/*...*/}, [someVar])
		// unmount
		useEffect(()=>{/*...*/ return ()=>{}}, [])
	```
## анимации
 * react-transition-group

## API
 * axios(HTTPCLient)
	* методы
	* статусы
	* перехватчики - custom hook сразу с крутилкой и логированием ошибок
	* авторизация
	* ошибки

## формы

 * валидация https://habr.com/ru/post/600035/#comment_23926385 https://habr.com/ru/post/600035/#comment_23924345

 *
	```tsx
		//isValid это ни стейт, ни проп, а производная от первых двух. Поэтому его нужно не хранить в useState, а вычислять на лету (декларативность же):

		function Form({required}) {
			const [value, setValue] = useState('')

			// Добавьте useMemo, если переживаете за производительность
			const isValid = validate(value, required)

			return (
				<div>
				<input
					value={value}
					onInput={event => setValue(event.target.value)}
				/>
				{!isValid && 'Не валидно'}
				</div>
			)
		}

		//Если нужно не проводить валидацию только после взаимодействия пользователя с формой, добавьте стейт isTouched.

		const [value, setValue] = useState('');
		const isValid = getValidState(value); // or any other validator

		// В подавляющем большинстве сценариев вам не нужно хранить производные значения в state
		// Конечно всё поломается, если вам нужен асинхронный валидатор. Но тут ничего нового. Асинхронные валидаторы при любой архитектуре это боль.
		// isValid, isTouched, isPristine, resetForm, setError, asyncValidator - нужны по канонам идеального UX. Ибо сама задача очень сложная. И разумеется не надо её решать по месту в каком-то отдельно взятом useEffect или onClick. Закопаетесь.
		// вещи которые можно высчитать из значений в любой момент, нужно делать ленивыми и декларативными
	```
 *

## модалки https://habr.com/ru/post/600035/#comment_23926469

 *
	```tsx

		// на верхнем уровне приложения есть HoC, который wrap-ает древо context-ом, в котором есть императивный метод showError(msg: ReactNode | Component, isFixed?: boolean): Promise<void> (и другие методы).
		// этот метод вызывается в тех самых useEffect или колбеках вроде onClick по мере необходимости ниже по древу
		// тот самый HoC сам всё это дело отображает. Сам решает в каком порядке показать. Когда удалить. Какие анимации задействовать и т.д.

		// in a component
		dispatch(addAlert("alert"));

		// in a reducer
		st.list.push({ msg: action.msg, id: genUniqId() });

		// in a <AlertManager/>
		{alerts.map(alert => <Alert key={alert.id} msg={alert.msg}/>)}

		// Состояние можно хранить в глобальным хранилище, но лучше в глобальном компоненте `<AlertManager/>` в `local state`.
		// А вместо dispatch компоненты ниже по древу просто вызывают: const showAlert = useContext(alertManagerContext);

		// Ну и небольшой бонус хранения этого в локальном сторе менеджера — можно хранить ссылки на компоненты (которые будут .children для <Alert/>) или ссылки на JSX elements. В настоящий глобальный store такие вещи пихать не рекомендуется (обычно), т.к. такие вещи типа не очень сериализуемы. Но это уже тоже всякие догмы.
	```
## RxJS

 * []()
## дизайн система
 * библиотека компонентов
 * общие переиспользуемые стили
 * https://react-bootstrap.github.io/getting-started/introduction/
 * https://getbootstrap.com/docs/4.4/getting-started/theming/
 * Because React-Bootstrap completely reimplements Bootstrap's JavaScript, it's not automatically compatible with themes that extend the default JavaScript behaviors.

 ```jsx
	// Bootstrap

	import * as React from 'react';

	function Example()  {
		return (
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
			<strong>Oh snap! You got an error!</strong>
			<p>
				Change this and that and try again.
			</p>
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			</div>
		)
	}

	// React-Bootstrap

	import * as React from 'react';
	import Alert from 'react-bootstrap/Alert';

	function Example() {
		return (
			<Alert dismissible variant="danger">
			<Alert.Heading>Oh snap! You got an error!</Alert.Heading>
			<p>
				Change this and that and try again.
			</p>
			</Alert>
		)
	}
 ```

## state management

### redux

 * вложенные состояния
 * разделение групп состояний
 * передача данных между отдельными группами состояний
 * intersectionObserver
	* .isIntersecting - отрабатывает только когда появляется в зоне видимости, а не когда выходит
	* удалять старый observer.current.disconnect, создавать новый
 *

### mobx

 * разделение групп состояний
 	* https://mobx.js.org/defining-data-stores.html#combining-multiple-stores
 * []()

## маршрутизация
	* отладка
	* вложенные маршруты
	* проверка/расчёт перед переходом
	* react-router-dom

		```html
			<browserRouter>
				<Link to='/1'></Link>
				<Switch>
					<Route path='/1'>   </Route>
					<Redirect to='/error'/>
				</Switch>
			</browserRouter>
		```
	* useHistory

		```tsx

		```
	* авторизация
		* по условию добавляем одни или другие доступные маршруты в дерево switch
		* useContext - добавляем глобальные объекты с правами


## грабли

 * спагетти useEffect hooks
 * валидация форм
 * this binding
	* constructor
	* render()
 * группировка и взаимодействие групп состояний

##

