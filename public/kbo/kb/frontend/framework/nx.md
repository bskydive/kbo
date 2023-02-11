# NRWL NX

 *
 *
 *
 *
 ```
npm run generate:lib
 ```

## грабли

 * `npm run nx build some`
 	```
		Compiling with Angular sources in Ivy partial compilation mode.
		libs/some/src/lib/some.component.ts - error NG3001: Unsupported private class SomeComponent. This class is visible to consumers via SomeModule -> SomeComponent, but is not exported from the top-level library entrypoint.

		libs/some/src/index.ts

		export * from './lib/some.module';
		export * from './lib/some.service';
		export * from './lib/some.component';
		export * from './lib/models';
	```

## ngx-translate localization перевод

 * использование составных переводов. Самое сложное - не перепутать EN/RU в названиях переменных.
 * Словари импортируются из пакетов, сливаются на стороне репы-потребителя пакетов
 * Данные покрыты интерфейсами для предотвращения ошибок
 * плагины IDE для поиска/копирования составных ключей: ``. К сожалению, не нашёл плагины для TS объектов, потому формат словарей - json

 * assets/some1.en.dictionary.json

	```json
		{
			"LABEL": {
				"NAME": "Name1 {Type}",
				"HINT": "Hint1"
			}
		}
	```

 * assets/some1.en.dictionary.ts

	```ts
		import {TSome1Dictionary} from './some1.ru.dictionary';
		import SOME1_EN_JSON_DICT from './some1.ru.dictionary.json';

		/** типизация не даёт разойтись ключам в данных RU/EN */
		export const SOME1_EN_DICTIONARY: TSome1Dictionary = {
			SOME1: SOME1_EN_JSON_DICT;
		}
	```

 * assets/some1.ru.dictionary.json

	```json
		{
			"LABEL": {
				"NAME": "Имя1 {Type}",
				"HINT": "Подсказка1"
			}
		}
	```

 * assets/some1.ru.dictionary.ts

	```ts
		export type TSome1Dictionary = typeof SOME1_RU_DICTIONARY;

		export const SOME1_RU_DICTIONARY = {
			SOME1: SOME1_RU_JSON_DICT
		}
	```

 * some1.component.ts

	```ts
		data = {
			label: {
				token: 'SOME1.LABEL.NAME'
				params: {
					Type: 'Type1',
				}
			},
			hint: {
				token: 'SOME1.LABEL.HINT'
			}
		}
	```

 * some1.component.html

	```html
		<div class="some1-label">
			{{ data.label.token | translate: data.label?.params }}
		</div>
		<div class="some1-label">
			{{ data.hint.token | translate }}
		</div>
	```

 * модуль в репе поставщике пакетов

	```ts
		// ...
		import { TranslateModule } from '@ngx-translate/core';

		@NgModule({
			imports: [
				TranslateModule,
			],
		})
		export class Some1Module {}
	```

 * tsconfig.json в репе потребителе пакетов

	```json
		{
			"compilerOptions": {
				"allowSyntheticDefaultImports": true,
				"resolveJsonModule": true,
			}
		}
	```

 * модуль app.module.ts в репе потребителе пакетов

	```ts
		// ...
		import { TranslateCompiler, TranslateLoader, TranslateModule } from '@ngx-translate/core';
		import { TranslateMessageFormatCompiler } from 'ngx-translate-messageformat-compiler';
		import {
			Some1Module,
			SOME1_EN_DICT,
			SOME1_RU_DICT,
		} from '@repo-name/some1';
		import {
			SOME2_EN_DICT,
			SOME2_RU_DICT,
			Some2Module,
		} from '@repo-name/some2';

		// для импорта из json можно использовать @angular/HTTPLoader или настроить tsconfig.json
		import {SOME_RU_DICT} from '../assets/some.ru.dict.json';
		import {SOME_EN_DICT} from '../assets/some.en.dict.json';

		const SOME_RU_DICT = {
				...SOME_RU_DICT,
				...SOME1_RU_DICT,
		};

		const SOME_EN_DICT = {
				...SOME_EN_DICT,
				...SOME1_EN_DICT,
		};

		// пример изолированного словаря
		const SOME2_DICT = {
			ru: SOME2_EN_DICT,
			en: SOME2_RU_DICT,
		};

		@NgModule({
		imports: [
			Some1Module,
			Some2Module,
			// ...
			TranslateModule.forChild({
				// isolate: true, // для изоляции словарей с повторяющимися ключами
				defaultLanguage: 'ru',
				compiler: { provide: TranslateCompiler, useClass: TranslateMessageFormatCompiler },
				loader: {
					provide: TranslateLoader,
					useFactory: () => ({
					getTranslation: (lang?: string) => {
						if (lang === 'ru') {
						return of(SOME_DICT);
						}
						return of(SOME_DICT);
					},
					}),
				},
			}),
		],

		})

		/** модуль-потребитель пакетов */
		export class DemoSomeModule {}
	```
