# README #

### What is this? ###

This is my identity, contacts and code examples preview page.
Also, I'm using it as a bookmarking service.

### What is this repository for? ###

* To support my career improving process. It is my training field.
* To help someone learn by observing working code

### How do I see the working example of that code? ###

* Production version at http://portfolio.stepanovv.ru/
* You can set up my apps in your own environment

### How do I get set up? ###

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

### How can I contribute? ###

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

## Where is the documentation for code?

* pull requests, merge and commit comments at the bitbucket repo 
* bitbucket issues
* slack chat integration
* jsdoc and comments in code sources
* code conventions

### That is the features? ###

* System and icons fonts
* Responsive design
* noScript warning
* free hosting
* Open repository on gitlab
* Gulp, Stylus, PUG, JS
* CSS-first design. Less js code for animation and interaction.
* Modular structure. One component - one folder.

### What does the application interact with?  ###
* portfolio, quotes, timer app - itself only
* weather app - with https://api.openweathermap.org/ 

### How I can ask my questions? ###

* [Contacts](https://stepanovv.ru/portfolio/portfolio.html#id-contacts)

