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
	# Currently gulp can run on node version 20
	nvm install 20 --default
	nvm alias default 20
	nvm alias default node
	nvm current
	# Install dependencies
	npm i
	# Build dev and run
	npm run dev
	npm run start
	# Open in browser http://127.0.0.1:8080/portfolio/portfolio.html
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

#### Upgrade from packages

 * update packages
 ```bash
	# lock the "gulp-imagemin": "7.1.0" version or use "type": "module", in package.json
 	npm run up
	rm -r node_modules/
	nvm use 20
	npm i
 ```
 * init docsify
	```bash
		rm -r public/docsify-init/
	 	npm run kb-init
		cp public/docsify-init/docsify.js public/vendor/
		rm -r public/docsify-init/
	```
 * [download prism highlight plugins(ts won't work)](https://prismjs.com/download.html#themes=prism-dark&languages=markup+css+clike+javascript+bash+java+javadoc+javadoclike+jsdoc+json+json5+less+markdown+pug+python+sass+scss+stylus+typescript+yaml&plugins=line-numbers+toolbar+download-button)
 *  [download prism highlight plugins except `core`(works fine)](https://cdn.jsdelivr.net/npm/prismjs@1/components/)
```bash
	cd public/vendor/
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-bash.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-css.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-css-extras.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-java.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-javadoc.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-javascript.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-js-extras.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-jsdoc.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-json.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-jsx.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-less.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-log.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-markdown.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-markup.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-markup-templating.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-pug.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-python.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-sass.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-scss.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-stylus.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-typescript.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-tsx.min.js
	wget https://cdn.jsdelivr.net/npm/prismjs@1.29.0/components/prism-yaml.min.js
```

 * download plugins
```bash
	cd public/vendor/
	wget https://cdn.jsdelivr.net/npm/docsify-copy-code
	wget https://cdn.jsdelivr.net/npm/docsify/lib/plugins/zoom-image.min.js
	wget https://cdn.jsdelivr.net/npm/docsify/lib/plugins/search.min.js
```

 * download fonts
 	* https://fonts.googleapis.com/css?family=Roboto+Mono:300,400,600
	* https://fonts.google.com/specimen/Roboto+Mono?query=roboto#standard-styles

#### Upgrade from sources

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
* 27977 lines in kbo md files
	* `find ./public/kbo/ -type f -name '*.md' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'`
* 2921 lines in kbb md files
	* `find ./public/kbb/ -type f -name '*.md' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'`

### What does the application interact with?  ###
* portfolio, quotes, timer app - itself only
* weather app - with https://api.openweathermap.org/

### How I can ask my questions? ###

* [Contacts](https://stepanovv.ru/portfolio/portfolio.html#id-contacts)

## TODO

 * add automatic stats collection: lines of md files
 * replace docsify with obsidian
