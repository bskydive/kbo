# README

### What is this?

This is my identity, contacts and code examples preview page.
Also, I'm using it as a bookmarking service starting from the 2014.

### What is this repository for?

* To support my career improving process. It is my training field.
* To help someone learn by observing working code

### How do I see the working example of that code?

* Production version at http://portfolio.stepanovv.ru/
* You can set up my apps in your own environment

### How do I get set up?

```bash
	#!!! Currently gulp can run on node version 10 
	nvm install 10
	nvm use 10
	# Install global dependencies 
	npm i -g pm2 http-server
	# Install dependencies 
	cd portfolio/
	npm i
	# Build dev and run 
	npm run w
	# npm run web-start
	# Open in browser http://127.0.0.1:8080/portfolio.html
```

### How can I contribute?

* Currently I'm not ready to maintain contributing processes
* Sources are in `src/*`, build output dir is `public/*`
* check before publish
	* convert md articles to html
	* anchor-offset
 	* links skills/nav/contacts/kb
 	* open on mobile device
* publish

```bash
 	npm run web-stop
 	npm run prod
 	git commit "msg"
	push.sh
 	# make PR on bitbucket
```

### Docsify upgrade

 * init docsify
	```bash
	 	npm run kbo-init
	```
 * [BROKEN] js+css [PrismJS](https://prismjs.com/download.html#themes=prism-dark&languages=markup+css+clike+javascript+bash+java+javadoc+javadoclike+jsdoc+json+json5+less+markdown+pug+python+sass+scss+stylus+typescript+yaml&plugins=toolbar+download-button) to `vendor/`
 *  download highlight plugin js except `core`: https://cdn.jsdelivr.net/npm/prismjs@1/components/
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-bash.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-css.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-css-extras.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-java.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-javadoc.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-javascript.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-js-extras.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-jsdoc.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-json.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-jsx.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-less.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-log.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-markdown.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-markup.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-markup-templating.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-pug.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-python.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-sass.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-scss.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-stylus.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-typescript.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-tsx.min.js
	* https://cdn.jsdelivr.net/npm/prismjs@1.25.0/components/prism-yaml.min.js
 * download plugins
	* https://cdn.jsdelivr.net/npm/docsify-copy-code
	* https://cdn.jsdelivr.net/npm/docsify/lib/plugins/zoom-image.min.js
	* https://cdn.jsdelivr.net/npm/docsify/lib/plugins/search.min.js
 * download fonts 
 	* https://fonts.googleapis.com/css?family=Roboto+Mono:300,400,600
	* https://fonts.google.com/specimen/Roboto+Mono?query=roboto#standard-styles
 * modify `./src/docsify/themes/dark.styl`
	* 
		```styl
			// @import url('https://fonts.googleapis.com/css?family=Roboto+Mono|Source+Sans+Pro:300,400,600')

			// $color-primary = #ea6f5a
			$color-primary = #4caf50
		```
 * modify `./src/docsify/themes/basic/_layout.styl`

	```styl
		.markdown-section tr
			border-top 1px solid #ccc

			&:nth-child(2n)
				// background-color #f8f8f8
				background-color #585858

		.sidebar-nav
			// line-height 2em
			line-height 1em
	```
 * `npm run kbo-styl`
 * modify `.docsify.js`
 * modify `index.html`

 	```html
		<head>
			<!-- ... -->
			<link rel="stylesheet" href="../vendor/themes/dark1.css">
			<link rel="stylesheet" href="../vendor/themes/fonts1.css">
			<!-- <link rel="stylesheet" href="../vendor/themes/prism-line-numbers.css"> -->
		</head>
		<body>
			<!-- ... -->
			<script defer type='text/javascript' src="../vendor/.docsify.js"></script>

			<script defer type='text/javascript' src="../vendor/docsify.js"></script>
			<script defer type='text/javascript' src="../vendor/docsify-copy-code.min.js"></script>
			<script defer type='text/javascript' src="../vendor/search.min.js"></script>
			<script defer type='text/javascript' src="../vendor/zoom-image.min.js"></script>

			<script defer type='text/javascript' src="../vendor/prism-bash.min.js"></script>
			<!-- ... -->

	```
 * `npm run start` --> http://127.0.0.1:8080/kbo/

## Where is the documentation for code?

* jsdoc and comments in code sources
* package.json scripts section
* gulpfile.js
* readme files

### That is the features? ###

* System and icons fonts
* Responsive design
* noScript warning
* free hosting
* Open repository on gitlab
* Gulp, Stylus, PUG, JS
* CSS-first design. Less js code for animation and interaction.
* Modular structure. One component - one folder.
* 24575 lines in kbo md files
	* `find ./public/kbo/ -type f -name '*.md' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'`
* 2878 lines in kbb md files
* `find ./public/kbb/ -type f -name '*.md' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'`

### What does the application interact with?  ###
* portfolio, quotes, timer app - itself only
* weather app - with https://api.openweathermap.org/ 

### How I can ask my questions? ###

* [Contacts](https://stepanovv.ru/portfolio/portfolio.html#id-contacts)

