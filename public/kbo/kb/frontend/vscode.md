# VSCode

## sync

 * deprecated [Настройки в github](https://gist.github.com/bskydive/8878b3d6d3e679358935d34983d9ffe1)
	* Gist ID: 85bd451c247d9e960ba40440150d6cd5
	* [Плагин для синхронизации настроек с github](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
 * для перехода по ссылокам: alt+ctrl+click

## extensions

 * articles-manager/карьера/инструменты.md

```txt
	adammaras.overtype
	Angular.ng-template
	dbaeumer.vscode-eslint
	donjayamanne.githistory
	eamodio.gitlens
	EditorConfig.EditorConfig
	esbenp.prettier-vscode
	ezforo.copy-relative-path-and-line-numbers
	firsttris.vscode-jest-runner
	joaompinto.vscode-graphviz
	jock.svg
	johnpapa.Angular2
	johnpapa.vscode-peacock
	k--kato.intellij-idea-keybindings
	maptz.camelcasenavigation
	MariusAlchimavicius.json-to-ts
	mhutchie.git-graph
	MS-CEINTL.vscode-language-pack-ru
	ms-vscode.vscode-typescript-tslint-plugin
	nhoizey.gremlins
	obenjiro.arrr
	paragdiwan.gitpatch
	rctay.karma-problem-matcher
	redhat.vscode-yaml
	rokoroku.vscode-theme-darcula
	sallar.json-to-js-object
	SimonTest.simontest
	streetsidesoftware.code-spell-checker
	streetsidesoftware.code-spell-checker-russian
	stylelint.vscode-stylelint
	sysoev.language-stylus
	usernamehw.todo-md
	vscode-icons-team.vscode-icons
	yzane.markdown-pdf
```
* disabled

```txt
	formulahendry.auto-rename-tag
	pustelto.bracketeer
	cmstead.js-codeformer
	hangxingliu.vscode-coding-tracker
	ms-vscode-remote.remote-ssh
	ms-vscode-remote.remote-ssh-edit
	ms-vscode.remote-explorer
	CoenraadS.bracket-pair-colorizer-2
	dsznajder.es7-react-js-snippets
	p42ai.refactor
	thisismanta.stylus-supremacy
	Shan.code-settings-sync
	WakaTime.vscode-wakatime
	VisualStudioExptTeam.intellicode-api-usage-examples
	VisualStudioExptTeam.vscodeintellicode
```
* vscode extensions cli setup
* https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc
* Each file watch takes up 1080 bytes, so assuming that all 524,288 watches are consumed, that results in an upper bound of around 540 MiB

```bash
	code --disable-extensions
	# vscode extensions export backup
	code --list-extensions >> vs_code_extensions_list.txt
	code --list-extensions | xargs -n 1 code --uninstall-extension
	cat vs_code_extensions_list.txt | xargs -n 1 code --force --install-extension

	#Windows %APPDATA%\Code\User\settings.json
	#macOS $HOME/Library/ApplicationSupport/Code/User/settings.json
	#Linux $HOME/.config/Code/User/settings.json

ulimit -Sn
#1024
ulimit -Hn
#524288
cat /proc/sys/fs/inotify/max_user_watches
#65536
sysctl fs.inotify.max_user_watches
#fs.inotify.max_user_watches = 65536
sysctl fs.file-max
#fs.file-max = 9223372036854775807


	cat > /etc/sysctl.d/vscode.sysctl.conf
	# fs.inotify.max_user_watches=524288
	# fs.file-max=1632119
	sysctl -p
	sysctl --system

sysctl --system
#* Applying /boot/sysctl.conf-5.14.21-150400.24.100-default ...
#kernel.hung_task_timeout_secs = 0
#kernel.msgmax = 65536
#kernel.msgmnb = 65536
#kernel.shmmax = 0xffffffffffffffff
#kernel.shmall = 0x0fffffffffffff00
#vm.dirty_ratio = 20
#* Applying /usr/lib/sysctl.d/50-default.conf ...
#net.ipv4.icmp_echo_ignore_broadcasts = 1
#net.ipv4.conf.all.rp_filter = 2
#net.ipv4.conf.default.promote_secondaries = 1
#net.ipv4.conf.all.promote_secondaries = 1
#net.ipv6.conf.default.use_tempaddr = 1
#net.ipv4.ping_group_range = 0 2147483647
#fs.inotify.max_user_watches = 65536
#kernel.sysrq = 184
#fs.protected_hardlinks = 1
#fs.protected_symlinks = 1
#kernel.kptr_restrict = 1
#* Applying /usr/lib/sysctl.d/51-network.conf ...
#net.ipv4.conf.all.accept_redirects = 0
#net.ipv4.conf.default.accept_redirects = 0
#net.ipv4.conf.all.accept_source_route = 0
#net.ipv4.conf.default.accept_source_route = 0
#net.ipv6.conf.all.accept_redirects = 0
#net.ipv6.conf.default.accept_redirects = 0
#* Applying /etc/sysctl.d/70-yast.conf ...
#net.ipv4.ip_forward = 1
#net.ipv6.conf.all.forwarding = 1
#net.ipv6.conf.all.disable_ipv6 = 0
#* Applying /usr/lib/sysctl.d/99-sysctl.conf ...
#* Applying /etc/sysctl.d/vscode.sysctl.conf ...
#fs.inotify.max_user_watches = 524288
#fs.file-max = 1632119
#* Applying /etc/sysctl.conf ...
sysctl fs.inotify.max_user_watches
#fs.inotify.max_user_watches = 524288
sysctl fs.file-max
#fs.file-max = 1632119
ulimit -Hn
#524288
ulimit -Sn
#1024
cat /proc/sys/fs/inotify/max_user_watches
#524288

cat /etc/security/limits.conf
# user hard nofile 16384
# user soft nofile 9216
ulimit -Sn
ulimit -Hn
```

## settings

 * `~/.config/Code/User/settings.json`

```json
	"window.zoomLevel": 1.2, // font size 14
	"workbench.iconTheme": "vscode-icons",
    "workbench.colorTheme": "Darcula",
    "editor.minimap.enabled": false,
    "editor.lineNumbers": "off",
    "vsicons.dontShowNewVersionMessage": true,
    "files.autoSave": "afterDelay",
    "eslint.validate": ["javascript", "typescript"],
    "eslint.alwaysShowStatus": true,
    "gitlens.defaultDateStyle": "absolute",
    "gitlens.defaultDateFormat": "DD.MM.YYYY HH.mm.ss",
    "workbench.activityBar.visible": true,
    "breadcrumbs.enabled": true,
    "cSpell.allowCompoundWords": true,
    "editor.foldingStrategy": "indentation",
    "markdown.preview.breaks": true,
    "vsicons.projectDetection.disableDetect": true,
    "overtype.abbreviatedStatus": true,
    "editor.renderWhitespace": "selection",
    "editor.semanticHighlighting.enabled": true,
    "editor.copyWithSyntaxHighlighting": false,
    "editor.emptySelectionClipboard": false,
    "terminal.integrated.copyOnSelection": true,
    "editor.multiCursorModifier": "ctrlCmd",
    "editor.formatOnPaste": false,
    "editor.fontFamily": "'Source Code Pro', 'monospace', monospace",
    "editor.fontSize": 15,
    "editor.wordWrap": "wordWrapColumn",
    "html.format.wrapAttributes": "force-expand-multiline",
    "editor.accessibilitySupport": "off",
    "window.zoomLevel": 0,
    "telemetry.enableCrashReporter": false,
    "telemetry.enableTelemetry": false,
    "sync.gist": "85bd451c247d9e960ba40440150d6cd5",
    "[json]": {
        "editor.defaultFormatter": "esbenp.prettier-vscode"
    },
    "editor.fontLigatures": false,
	"editor.linkedEditing": true,
	"window.restoreFullscreen": true,
	"window.newWindowDimensions": "maximized",
	"markdown.validate.enabled": true,
```

## debug

 * [node nvm vscode debug](https://medium.com/the-tech-bench/getting-visual-studio-code-and-nvm-working-together-252ec0300895)
 * https://code.visualstudio.com/docs/nodejs/nodejs-debugging
 * https://stackoverflow.com/questions/65097694/to-load-an-es-module-set-type-module-in-the-package-json-or-use-the-mjs-e
 * [debug typescript](https://code.visualstudio.com/docs/typescript/typescript-debugging)

	```bash
		nvm install 16 --default
		#nvm i 16
		#nvm alias default 16
		#nvm alias default node
	```

 * `~/.vscode/launch.json`
	```json
		{
			"version": "0.2.0",
			"configurations": [{
				// "type": "node-terminal",
				// "name": "node-debug",
				// "request": "launch",
				// "command": "npm run debug",
				// "cwd": "${workspaceFolder}/dist",

				"type": "node",
				"request": "launch",
				"name": "Launch Program",
				"program": "${workspaceFolder}/index.ts",
				"preLaunchTask": "tsc: build - tsconfig.json",
				"outFiles": ["${workspaceFolder}/dist/**/*.js"],
				"runtimeArgs": ["--preserve-symlinks"],
			}]
		}
	```
 * `./tsconfig.json`
	```json
		{
			"compilerOptions": {
				"target": "es5",
				"module": "commonjs",
				"outDir": "dist",
				"sourceMap": true
			}
		}
	```

## грабли

 * `Could not register service workers`
 * https://stackoverflow.com/questions/67698176/error-loading-webview-error-could-not-register-service-workers-typeerror-fai
 * https://github.com/microsoft/vscode/issues/125993
	* `rm -rf .config/Code/Service\ Worker/{CacheStorage,ScriptCache}`
 * `/etc/zypp/vscode.repo`

	```bash
		[vscode]
		enabled=1
		autorefresh=0
		baseurl=https://packages.microsoft.com/yumrepos/vscode
	```

 * во встроенном терминале локаль английская
	```bash
		> set|grep LANG
		LANG=en_US.UTF-8
	```
 * `"terminal.integrated.setLocaleVariables": true`
 * [gtk ibus emoji подменяет ctrl+shift+e](https://github.com/Microsoft/vscode/issues/48480)
 * не работает [буфер Linux](https://github.com/microsoft/vscode/issues/90297#issuecomment-583779433)

	```
		editor.action.selectionClipboardPaste
	```

 * font rendering terminal
 	* https://stackoverflow.com/questions/29966747/how-can-i-disable-gpu-rendering-in-visual-studio-code
	```
		"window.zoomLevel": 0,
		"disable-hardware-acceleration": true, // configure runtime env
		code --disable-gpu
	```


## обучение

  * https://code.visualstudio.com/docs/nodejs/angular-tutorial

## hotkeys

 * https://tproger.ru/translations/useful-hotkeys-for-vs-code/

## vscode plugins

 * https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools
 * https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-pg
 * https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
