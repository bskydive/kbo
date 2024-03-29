import gulp from "gulp";
import stylusModule from "gulp-stylus";
import pugModule from "gulp-pug";
import concatModule from "gulp-concat";
import stripModule from "gulp-strip-comments";
import execModule from "gulp-exec";
import noopModule from "gulp-noop";
import newerModule from "gulp-newer";
import sizeModule from "gulp-size";
import imageminModule from "gulp-imagemin";
import postcssModule from "gulp-postcss";
import sourcemapsModule from "gulp-sourcemaps";
import browsersyncModule from "browser-sync";

/**
 * Настройки простой системы сборки для небольших проектов
 * Файл богато прокомментирован для облегчения изучения и рефакторинга
 *
 * Использование:
 * установить node@16+
 * npm i -D postcss-assets autoprefixer usedcss cssnano gulp gulp-stylus gulp-pug gulp-concat gulp-strip-comments gulp-exec gulp-noop gulp-newer gulp-size gulp-imagemin gulp-postcss gulp-sourcemaps browser-sync
 * скопировать в папку с проектом
 * path***Src - пути к исходникам
 * path***Watch - пути к исходникам за которыми надо наблюдать. Надо наблюдать за всеми, но собирать только импортирующие других файлы.
 * path***Clean - что чистить перед пересборкой
 * path***Dest - куда пересобирать
 * отредактировать секцию =CONFIG=
 * npm run w
 * http://127.0.0.1:8080
 * второй вариант не запускает режим наблюдения(watch):
 * npm run prod
 *
 * Возможности:
 * оптимизация изображений imagemin
 * пересборка при режиме наблюдения(watch)
 * умная очистка каталога сборки при режиме наблюдения(watch)
 * конвертация и умное объединение через include шаблонов pug в html с удалением комментариев
 * конвертация и объединение стилей stylus
 * удаление ненужных стилей css и автопрефиксы
 * конвертация markdown в html для документации
 * копирование в папку сборки шрифтов
 * копирование в папку сборки с удалением комментариев скриптов js
 * запуск веб-сервера после сборки
 * Настраиваемая через переменные конфигурация расположения файлов
 *
 * Ограничения:
 * js не сшиваются в один, т.к. для этого необходим webpack(разрешение зависимостей)
 * в режиме наблюдения не пересобирается при добавлении новых файлов
 */

let devBuild =
	(process.env.NODE_ENV || "development").trim().toLowerCase() ===
	"development";

// const gulp = require('gulp');

// const stylusModule = require('gulp-stylus');
// const pugModule = require('gulp-pug');
// const concatModule = require('gulp-concat');
// const stripModule = require('gulp-strip-comments');
// const markdownModule = require('gulp-markdown');
// const renameModule = require('gulp-rename');
// const execModule = require('gulp-exec');
// const delModule = require('del');
// const noopModule = require('gulp-noop');
// const newerModule = require('gulp-newer');
// const sizeModule = require('gulp-size');
// const imageminModule = require('gulp-imagemin');
// const postcssModule = require('gulp-postcss');
// const sourcemapsModule = devBuild ? require('gulp-sourcemaps') : null;
// const browsersyncModule = devBuild ? require('browser-sync').create() : null;
// const sync = require('gulp-sync')(gulp);
// const cleanModule = require('gulp-clean');
// const replace = require('gulp-replace');
// const less = require('gulp-less');
// const markdownit = require('gulp-markdown-it');
// const sass = require('gulp-stylus');

console.log("Gulp", devBuild ? "development" : "production", "build");

/*================================================CONFIG===================================================*/
// TODO сделать объект path:{}
/**
 * Для вывода в консоль из команд gulp
 */
var reportOptions = {
	err: true, // default = true, false means don't write err
	stderr: true, // default = true, false means don't write stderr
	stdout: true // default = true, false means don't write stdout
};

//для хостинга с особенностями нужен длинный префикс
const staticPath = "public/portfolio";
// сайт имеет статические подсайты, потому корень выше папки сборки
const webServePath = "./public/portfolio";
//репозитории
const gitRemoteMain = "gl";
const gitremoteReserve = "bb";

//путь во все подпапки заставляет галп делать подпапки на выходе /**/ поэтому надо вписывать все названия файлов
const pathImgSrc = [`src/img/*`]; //['src/img/*.png', 'src/img/*.jpg', 'src/img/*.gif', 'src/img/*.jpeg']
const pathImgClean = `${staticPath}/img/*`;
const pathImgDest = `./${staticPath}/img`;

const pathJsClean = `${staticPath}/js/*`;
const pathJsSrc = [
	`src/js/*.js`,
	`src/app/timer/timer.js`,
	`src/app/portfolio/portfolio.js`,
	`src/app/quotes/quotes.js`,
	`src/app/weather/weather.js`
];
const pathJsDest = `./${staticPath}/js`;

//отдельный css для уже скомпилированных вендорных. Могут конфликтовать между собой в пространстве имён
const pathStylusSrcWatch = [
	`src/fonts/**/*.styl`,
	`src/app/**/*.styl`,
	`src/styles/**/*.styl`
];
const pathStylusSrc = [
	`src/styles/**/*.styl`,
	`src/fonts/**/*.styl`,
	`src/app/**/*.styl`,
];
const pathCssClean = `${staticPath}/css/*`;
const pathCssSrc = [`src/styles/**/*.css`];
const pathCssDest = `./${staticPath}/css`;

const pathFontsClean = `${staticPath}/fonts/*`;
const pathFontsSrc = [
	`src/fonts/**/*.ttf`,
	`src/fonts/**/*.woff`,
	`src/fonts/**/*.eot`,
	`src/fonts/**/*.woff2`,
	`src/fonts/**/*.svg`,
	`src/fonts/**/*.otf`
];
const pathFontsDest = `./${staticPath}/fonts`;

const pathSoundsClean = `${staticPath}/sounds/*`;
const pathSoundsSrc = [`src/sounds/*`];
const pathSoundsDest = `./${staticPath}/sounds`;

const pathHtmlClean = `${staticPath}/*.html`;
const pathPugSrcWatch = [`src/app/**/*.pug`];
const pathPugSrc = [
	`src/app/timer/timer.pug`,
	`src/app/portfolio/portfolio.pug`,
	`src/app/quotes/quotes.pug`,
	`src/app/weather/weather.pug`
];
const pathHtmlDest = `./${staticPath}`;

// const pathMDClean = `${staticPath}/txt/*`;
// const pathMDSrc = [
// 	`src/app/portfolio/*.md`,
// 	`src/app/quotes/*.md`,
// 	`src/app/weather/*.md`,
// 	`src/app/timer/*.md`,
// 	`src/app/conventions/**/*.md`
// ];
// const pathMDDest = `./${staticPath}/txt`;

/*================================================ERROR====================================================*/
function handleError(err) {
	console.log(err.toString());
	this.emit("end");
}

/*================================================IMAGEMIN=================================================*/

const imgConfig = [
	imageminModule.optipng({
		optimizationLevel: 5
	}),
	imageminModule.svgo({
		// https://github.com/svg/svgo#configuration
		plugins: [
			// { removeViewBox: true },
			{ cleanupIDs: false },
			{ mergePaths: false }
		]
	})
	// imageminModule.gifsicle({
	// 	interlaced: true
	// }),
	// imageminModule.mozjpeg({
	// 	quality: 75,
	// 	progressive: true
	// }),
];

function imgPipe() {
	return gulp
		.src(pathImgSrc)
		.pipe(newerModule(pathImgDest))
		.pipe(imageminModule(imgConfig))
		.pipe(
			sizeModule({
				showFiles: true
			}).on("error", handleError)
		)
		.pipe(gulp.dest(pathImgDest));
}

export const img = gulp.series(cleanImg, imgPipe);

/*================================================CLEAN====================================================*/

function cleanFonts() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathFontsClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}
function cleanSounds() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathSoundsClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}
function cleanCss() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathCssClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}
// function cleanMD() {
// 	return gulp
// 		.src(staticPath)
// 		.pipe(execModule("rm -rf " + pathMDClean, { continueOnError: true }))
// 		.pipe(execModule.reporter(reportOptions));
// }
function cleanJs() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathJsClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}
function cleanHtml() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathHtmlClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}
function cleanImg() {
	return gulp
		.src(staticPath)
		.pipe(execModule("rm -rf " + pathImgClean, { continueOnError: true }))
		.pipe(execModule.reporter(reportOptions));
}

export const cleanDev = gulp.series(
	cleanFonts,
	cleanSounds,
	cleanCss,
	// cleanMD,
	cleanJs,
	cleanHtml
);

export const clean = gulp.series(
	cleanFonts,
	cleanSounds,
	cleanCss,
	// cleanMD,
	cleanJs,
	cleanHtml,
	cleanImg
);

/*================================================JS=======================================================*/

function jsPipe() {
	return gulp
		.src(pathJsSrc)
		.pipe(stripModule())
		.pipe(gulp.dest(pathJsDest));
}

export const js = gulp.series(cleanJs, jsPipe);

/*================================================VERSION=================================================*/
/**
 * Записываем версию предыдущего коммита в шапку сайта
 * Добавляем для напоминания префикс DEV:
 * */
function versionDevPipe() {
	return (
		gulp
			.src(pathHtmlDest)
			// .pipe(execModule("git log -1 --format='DEV: %cd #%h' --date=format:'%a %d.%m.%Y %H.%M.%S' > version.txt", {continueOnError: true}));
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";git log -1 --format='DEV: %cd #%h' --date=format:'%c' > version.txt",
					{
						continueOnError: true
					}
				)
			)
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";echo \"sed 's/version-template/`cat version.txt`/' portfolio.html > portfolio.html.sed; mv portfolio.html.sed portfolio.html\" | bash",
					{
						continueOnError: true
					}
				)
			)
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";grep -E 'DEV:|version' portfolio.html",
					{
						continueOnError: true
					}
				)
			)
			.pipe(execModule.reporter(reportOptions))
	);
}

export const versionDev = versionDevPipe;

/**
 * Записываем версию предыдущего коммита в шапку сайта
 * поэтому коммитим два раза, чтобы собрать в portfolio.html текущую версию commit
 * пишем напоминалку-чеклист для тестирования
 * https://github.com/robrich/gulp-exec
 */
function versionProdPipe() {
	console.log(
		"Build done",
		"\n\nЧеклист:",
		" * npm run web-start или npm run w,\n",
		" * anchor-offset,\n",
		" * ссылки skills/nav/contacts/kb,\n",
		" * открыть на мобилке,\n",
		" * npm run web-stop,\n",
		" * g add src public,\n",
		" * npm run prod,\n",
		' * g cm "msg",\n',
		" * сделать PR на bitbucket,\n"
	);

	return (
		gulp
			.src(pathHtmlDest)
			//execModule("git log -1 --format='%cd #%h' --date=format:'%a %d.%m.%Y %H.%M.%S' > version.txt", { continueOnError: true }));
			//сохраняем если что-то забыли
			// .pipe(execModule("git commit -am 'commit-prod'", { continueOnError: true }))
			// .pipe(execModule.reporter(reportOptions))
			//пишем версию коммита
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";git log -1 --format='%cd #%h' --date=format:'%c' > version.txt",
					{
						continueOnError: true
					}
				)
			)
			.pipe(execModule.reporter(reportOptions))
			//читаем версию коммита и пишем в portfolio.html
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";echo \"sed 's/version-template/`cat version.txt`/' portfolio.html > portfolio.html.sed; mv portfolio.html.sed portfolio.html\" | bash",
					{
						continueOnError: true
					}
				)
			)
			.pipe(execModule.reporter(reportOptions))
			//выводим в консоль то что записали
			.pipe(
				execModule(
					"cd " +
						pathHtmlDest +
						";grep -E 'DEV:|version' portfolio.html",
					{
						continueOnError: true
					}
				)
			)
			.pipe(execModule.reporter(reportOptions))
			//отправляем на сервер в develop
			.pipe(
				execModule(
					`git commit -am 'commit-version';git push ${gitRemoteMain} develop;git push ${gitremoteReserve} develop`,
					{
						continueOnError: true
					}
				)
			)
			.pipe(execModule.reporter(reportOptions))
	);
}

export const versionProd = versionProdPipe;

/*================================================WEBSERVER================================================*/
//
// Останавливает и запускает веб-сервер с автоматическим рестартом
// Для смены каталога запуска веб-сервера необходимо удалить сервис
// 	'cd ./',
// 	'pm2 stop http-server',
// 	'pm2 delete http-server',
// 	'pm2 start http-server -- -c-1 -a localhost -p 8080 ./public/portfolio',
// 	'pm2 info http-server'

/** @deprecated TODO fix */
function webStopPipe() {
	return gulp
		.src(webServePath)
		.pipe(
			execModule("bash web-stop.sh", {
				continueOnError: true
			})
		)
		.pipe(execModule.reporter(reportOptions));
}

export const webStop = webStopPipe;

/** @deprecated TODO fix */
function webStartPipe() {
	// console.log('http://localhost:8080/portfolio.html')
	return gulp
		.src(webServePath)
		.pipe(webStopPipe())
		.pipe(
			execModule("bash web-start.sh " + webServePath, {
				continueOnError: true
			})
		)
		.pipe(execModule.reporter(reportOptions));
}

export const webStart = webStartPipe;

const syncConfig = {
	server: {
		baseDir: staticPath,
		index: "portfolio.html"
	},
	port: 8080,
	open: false
};

// browser-sync
function server(done) {
	if (browsersyncModule) {
		browsersyncModule.init(syncConfig);
	}
	done();
}

/*==================================================CSS====================================================*/

let postCSSModules = [
	require("postcss-assets")({
		loadPaths: ["images/"],
		basePath: staticPath
	}),
	require("autoprefixer")
];

// remove unused selectors and minify production CSS
if (!devBuild) {
	postCSSModules.push(
		require("usedcss")({
			html: ["index.html"]
		}),
		require("cssnano")
	);
}

//const sassOpts = {
//   sourceMap       : devBuild,
//   outputStyle     : 'nested',
//   imagePath       : '/images/',
//   precision       : 3,
//   errLogToConsole : true
// }

// TODO compress https://www.npmjs.com/package/gulp-stylus
function stylusPipe() {
	return (
		gulp
			.src(pathStylusSrc)
			.pipe(devBuild ? sourcemapsModule.init() : noopModule())
			.pipe(stylusModule())
			.pipe(postcssModule(postCSSModules))
			.pipe(concatModule("portfolio.css").on("error", handleError))
			.pipe(devBuild ? sourcemapsModule.write('.') : noopModule())
			.pipe(
				sizeModule({
					showFiles: true
				})
			)
			.pipe(gulp.dest(pathCssDest))
			.pipe(
				browsersyncModule
					? browsersyncModule.reload({ stream: true })
					: noopModule()
			)
	);
}

function cssPipe() {
	return (
		gulp.src(pathCssSrc)
			//stripModule())
			.on("error", handleError)
			.pipe(gulp.dest(pathCssDest))
	);
}

export const stylus = gulp.series(cleanCss, cssPipe, stylusPipe);

/*================================================PREFIX===================================================*/
//gulp.task('prefix', function () {
//	var postcss      = require('gulp-postcss');
//	var sourcemaps   = require('gulp-sourcemaps');
//	var autoprefixer = require('autoprefixer');
//
//	return gulp.src('./public/styles/*.css')
//			.pipe(sourcemapsModule.init())
//			.pipe(postcssModule([ autoprefixer() ]))
//			.pipe(sourcemapsModule.write('.'))
//			.pipe(gulp.dest('./public/styles/autoprefixer'));

/*================================================FONTS====================================================*/
function fontsPipe() {
	return gulp.src(pathFontsSrc).pipe(gulp.dest(pathFontsDest));
}

export const fonts = gulp.series(cleanFonts, fontsPipe);

/*================================================SOUND====================================================*/
function soundsPipe() {
	return gulp.src(pathSoundsSrc).pipe(gulp.dest(pathSoundsDest));
}

export const sounds = gulp.series(cleanSounds, soundsPipe);

/*================================================PUG======================================================*/
function pugPipe() {
	return gulp
		.src(pathPugSrc)
		.pipe(
			pugModule({
				pretty: true
			}).on("error", handleError)
		)
		.pipe(stripModule())
		.pipe(gulp.dest(pathHtmlDest));
}

export const pug = gulp.series(cleanHtml, pugPipe);

/*================================================TXT======================================================*/
// readme.md в html для просмотре онлайн, сейчас используются ссылки на гитлаб https://gitlab.com/stepanovv/kbo/-/blob/master/src/app/weather/weather.README.md
// todo удалить или исправить require() of ES modules is not supported

// function mdPipe() {
// 	return (
// 		gulp
// 			.src(pathMDSrc)
// 			.pipe(markdownModule())
// 			.pipe(
// 				renameModule({
// 					extname: ".md.html"
// 				})
// 			)
// 			.pipe(gulp.dest(pathMDDest))
// 	);
// }

// export const md = gulp.series(cleanMD, mdPipe);

/*================================================WATCH====================================================*/

/**
 * Всё, кроме звуков и картинок
 */
function wPipe(done) {
	gulp.watch(pathStylusSrcWatch.concat(pathCssSrc), stylus);
	gulp.watch(pathPugSrcWatch, pug);
	// gulp.watch(pathMDSrc, md);
	gulp.watch(pathJsSrc, js);
	gulp.watch(pathFontsSrc, fonts);
	//	gulp.watch(pathImgSrc,
	//			['img']);
	done();
}

export const w = gulp.series(devFn(), server, wPipe);

/*================================================RUNNER===================================================*/

/**
 * Для асинхронности все задания содержат внутри очистку
 * При синхронном выполнении можно запускать вначале clean-dev или clean
 */
function devFn() {
	return gulp.series(
		fonts,
		js,
		stylus,
		pug,
		// md,
		sounds,
		img,
		versionDev
	);
}

export const dev = devFn();

/**
 * Выполняется синхронно, чтобы сделать коммит
 * Нельзя перемешивать version
 */
export const prod = gulp.series(
	fonts,
	js,
	stylus,
	pug,
	// md,
	sounds,
	img,
	versionProd
);
