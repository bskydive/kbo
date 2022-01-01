# React

 * https://ru.hexlet.io/courses/reactjs
 * https://learn.javascript.ru/courses/react
 * https://www.gitbook.com/@maxfarseer/
 * http://itvdn.com/ru/video/react-js-essential

 * [React Router 6 Tutorial](https://www.robinwieruch.de/react-router/)
 * [Best practices for React iframes](https://blog.logrocket.com/best-practices-react-iframes/)
 * [React Context & Hooks Tutorial # 19 - Редукторы, действия и состояние](https://www.youtube.com/watch?v=uXWycyeTeCs)
 * [Full React Tutorial - 2020](https://www.youtube.com/watch?v=j942wKiXFu8&list=PL4cUxeGkcC9gZD-Tvwfod2gaISzfRiP9d&index=1)
 * вместо shadowDOM - virtualDOM и императивный стиль JS/аннотации вместо HTML вместо декларативного
	* хорошо для сложных состояний и сложной асинхронщины
 * [React JS фундаментальный курс от А до Я - 2021](https://www.youtube.com/watch?v=GNrdg3PzpJQ)
	* react DOM
		* работает и на react native и в SSR
		* фаза сравнение - reconciliation
		* фаза отрисовки - render
	* hooks
		* useRef
			* ссылка на элемент
	* компоненты
		* в компоненте может быть только один корневой тэг
		* генерация компонентов через интерполяцию
			```tsx
				{values.map( value => <div>{value}</div>)}
			```
		* для генерируемых в цикле компонентов необходимо указывать key(ngFor trackBy)
		* {props.children} (ng-content)

		```tsx
			import React from 'react;
			import classes from 'myClasses.module.css';

			const myComp = ({children, ...props}) => {
				return (
					<div ...props className={classes.myClass}>
						{children}
					</div>
				)
			}
			export default myComp;
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
	* вложенные компоненты
	* hooks
		* useMemo
			* мемоизация
			* отрабатывает только при изменении зависимостей/параметров
			```tsx
				useMemo( () => factory: {/*...*/}, deps: [value1, value2])
			```
	* формы
		* валидация
	* RxJS
		* 
	* дизайн система
		* библиотека компонентов
		* общие переиспользуемые стили
	* state management
		* redux
		* вложенные состояния
		* разделение групп состояний
		* передача данных между отдельными группами состояний
 * []()

## грабли

 * спагетти useEffect hooks
 * валидация форм
 * группировка и взаимодействие групп состояний

## 

## 

## 

