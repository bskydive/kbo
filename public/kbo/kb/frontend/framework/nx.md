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
