# React

 * https://ru.hexlet.io/courses/reactjs
 * https://learn.javascript.ru/courses/react
 * https://www.gitbook.com/@maxfarseer/
 * http://itvdn.com/ru/video/react-js-essential

 * [React Router 6 Tutorial](https://www.robinwieruch.de/react-router/)
 * [Best practices for React iframes](https://blog.logrocket.com/best-practices-react-iframes/)
 * [React Context & Hooks Tutorial # 19 - Редукторы, действия и состояние](https://www.youtube.com/watch?v=uXWycyeTeCs)
 * [Full React Tutorial - 2020](https://www.youtube.com/watch?v=j942wKiXFu8&list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d&index=1)
 * отличия от ангуляр
 	* вместо HTML/декларативного/shadowDOM - virtualDOM/императивный/JS аннотации
		* хорошо для сложных состояний и сложной асинхронщины
		* полностью отдельно рендеринг от браузера
		* должна быть хуже оптимизация/отладка, потому что это не гугл, у которого свой браузер
	* стили и разметка вместе с логикой
		* лучше использовать отдельные библиотеки стилей
		* высокий риск дублирования кода
 * [React JS фундаментальный курс от А до Я - 2021](https://www.youtube.com/watch?v=GNrdg3PzpJQ)
	* https://github.com/utimur/react-fundamental-course
	* https://github.com/utimur/React-typescript-course
	* react DOM
		* работает и на react native и в SSR
		* фаза сравнение - reconciliation
		* фаза отрисовки - render
		* оборачивает события syntetic events
	* hooks
		* useRef
			* ссылка на элемент
	* компоненты
		* в компоненте может быть только один корневой тэг
		* компонент должен возвращать минимум один тэг
		* генерация компонентов через интерполяцию
			```tsx
				{values.map( value => <div>{value}</div>)}
			```
		* для генерируемых в цикле компонентов необходимо указывать key(ngFor trackBy)
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
		* для корректной работы с generics <T> необходимо использовать `function` вместо `=>`

			```tsx
				// const myComp: FC<T> = ({children: React.ReactChild | React.ReactNode, ...props}) => {//
				// export default myComp;

				export default function myComp: FC<T>(props: T) => {//
			```
		* props передаются во вложенные компоненты только от родителя к детям
		* для обратного проброса props надо передать функцию обратного вызова
		* условная отрисовка
			```
				<div>
					{values.length > 0 ? <div>{values.length}</div> : <div>empty</div>}
				</div>
			```
		* управляемый компонент
			* прямое связывание через value
			* обратное через onChange
			```tsx
				<input value={value} onChange={event => onChange(event.target.value)}></input>
			```
		* неуправляемый компонент
			* прямое взаимодействие через hook useRef
		* жизненный цикл
			
			```tsx
				// mount
				useEffect<IObject>(()=>{/*...*/}, [])
				// update
				useEffect(()=>{/*...*/}, [someVar])
				// unmount
				useEffect(()=>{/*...*/ return ()=>{}}, [])
			```
		* изоляция стилей через css modules
	* вложенные компоненты
	* анимации
		* react-transition-group
	* hooks
		* useMemo
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
	* API
		* axios
			* методы
			* статусы
			* перехватчики - custom hook сразу с крутилкой и логированием ошибок
			* авторизация
			* ошибки
	* формы
		* валидация
	* RxJS
		* 
	* дизайн система
		* библиотека компонентов
		* общие переиспользуемые стили
	* state management
		* redux
			* 
		* вложенные состояния
		* разделение групп состояний
		* передача данных между отдельными группами состояний
	* маршрутизация
		* react-router-dom

			```tsx
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
 * intersectionObserver
	* .isIntersecting - отрабатывает только когда появляется в зоне видимости, а не когда выходит
	* удалять старый observer.current.disconnect, создавать новый
 * []()

## грабли

 * спагетти useEffect hooks
 * валидация форм
 * группировка и взаимодействие групп состояний

## 

## 

## 

