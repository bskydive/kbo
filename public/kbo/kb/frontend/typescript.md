#  typescript

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
 * модель с классом для API

 ```ts
	export interface IObject {field: IObjectFields<string> | IObjectField1 | IObjectField2;}

	export type IObjectField<T> = {[P in keyof T]: string;}

	export interface IObjectField1 extends IObjectField<IObjectField1> {field1: ''}

	export class ObjectClass1 implements IObjectField1 {
		field1: string = null;

		constructor (data?:IObjectField1) {this.parse(data)}

		parse(data?:IObjectField1){
			if (data) {
				if (typeof data.field1 === 'string') {this.field1 = }
			}
			return this;
		}
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


## links

 * [см.](/kbo/kb/frontend/framework/angular2.md:1067)
 * https://www.tsmean.com/articles/
 * [знакомство с typescript 2015](https://msdn.microsoft.com/ru-ru/magazine/dn890374.aspx)
 * https://www.sitepen.com/blog/2014/08/22/advanced-typescript-concepts-classes-types/
 * https://www.sitepen.com/blog/2013/12/31/definitive-guide-to-typescript/
 * [доки](https://www.gitbook.com/book/basarat/typescript)
 * http://2ality.com/2018/03/javascript-typescript-reasonml.html
 * https://medium.freecodecamp.org/typescript-javascript-with-super-powers-a333b0fcabc9
 * https://www.typescriptlang.org/index.html#download-links
 * https://github.com/Microsoft/TypeScript-React-Conversion-Guide#typescript-react-conversion-guide
 * http://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html
 * https://habrahabr.ru/company/piter/blog/347364/
 * [typescript на node сервере](https://habr.com/ru/post/328466/)
 * [расширенный ликбез 2019](https://www.youtube.com/watch?v=_-tSzfGkrew)
 * [TypeScript. Магия выражений](typescript)
 * [typescript deep dive](https://habr.com/ru/company/oleg-bunin/blog/499634/) Михаил Башуров (saitonakamura) — Senior Frontend Engineer в компании WiseBits
 * [Runtime type checking with io-ts in Typescript](https://medium.com/@ottoki/runtime-type-checking-with-io-ts-in-typescript-14465169fb02) https://github.com/gcanti/io-ts
 * https://medium.com/@fivedicephoto/understanding-enums-in-typescript-d4dcb40c1413
 * https://levelup.gitconnected.com/typescript-best-practices-namespaces-exceptions-and-type-definitions-131d85579fa3
 * [12 советов по внедрению TypeScript в React-приложениях](https://habr.com/ru/company/tinkoff/blog/505488/)
 * [Номинативная типизация в TypeScript или как защитить свой интерфейс от чужих идентификаторов](https://habr.com/ru/post/446768/)
 * https://stackoverflow.com/questions/49761972/difference-between-string-enums-and-string-literal-types-in-ts/54455743#54455743
 * [The TypeScript Tax: A Cost vs Benefit Analysis](https://javascriptweekly.com/link/81862/web)
 * [7 New and Exciting TypeScript Features](https://blog.bitsrc.io/7-new-and-exciting-typescript-features-48b760ae0b73)
 * [warning TS(2564)](https://www.ryadel.com/en/ts2564-ts-property-has-no-initializer-typescript-error-fix-visual-studio-2017-vs2017/)
	```json
		tsconfig.json
		"compilerOptions": {
			"strictPropertyInitialization": false
	```
 * for (of) - итерируемые
	* `for (const [key,value] of Object.entries(obj) {}`
 * for (in) - перечисляемые
	* `for (const key in Object.entries(obj) { obj[key as keyof typeof obj] }`

### собеседование typescript

 * [Собеседование по TypeScript: 20 вопросов и ответов](https://habr.com/ru/company/ruvds/blog/419993/)
