
// docsify 4.12.1 config file

window.$docsify = {
	name: 'База знаний',
	repo: 'https://gitlab.com/stepanovv/kbo/tree/master/public/kbo',
	// basePath: '/kbo/', // Base path of the website. You can set it to another directory or another domain name.
	homepage: 'index.md',
	formatUpdated: '{DD}.{MM}.{YYYY} {HH}:{mm}',
	noEmoji: false,
	// smartypants: true,
	ext: '.md',
	//sidebar
	// loadSidebar: true,
	loadSidebar: 'sidebar.md',
	//TOC
	maxLevel: 3, // Maximum Table of content level.
	subMaxLevel: 3, // Add table of contents (TOC) in custom sidebar.
	//search
	search: 'auto',
	// search :['/'],
	noCompileLinks: [
		//https://github.com/QingWei-Li/docsify/blob/9b3b4454de43340d1c0cc7125f7246858cfe9efe/docs/configuration.md#nocompilelinks
		'files/.*',
		'kb/files/.*'
	],
	// alias:{
	// 	'/files/.*':'/'
	// },
	search: {
		maxAge: 1000, // Expiration time, the default one day
		//maxAge: 86400000, // Expiration time, the default one day
		placeholder: 'Строка для поиска',
		noData: 'Нет данных',
		// paths: ['/'], //not work
		depth: 3 // Headline depth, 1 - 6
		// 	// // Localization
		// 	// placeholder: {
		// 	// 	// '/en-us/': 'Type to search',
		// 	// 	'/': 'Type to search'
		// 	// },
		// 	// noData: {
		// 	// 	// '/en-us/': 'No results',
		// 	// 	'/': 'No Results'
		// 	// }
	},
	plugins: [
		function (hook, vm) {
			hook.beforeEach(function (html) {
				var url = 'https://gitlab.com/stepanovv/kbo/tree/master/public/kbo/' + vm.route.file
				var editHtml = '[Редактировать](' + url + ')\n'
				return html + '\n\n----\n\n' + '| Изменён {docsify-updated} | ' + editHtml + ' | '
			})
		}
	]
}
