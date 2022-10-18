# VSCode

## sync

 * [Настройки в github](https://gist.github.com/bskydive/8878b3d6d3e679358935d34983d9ffe1)
 * Gist ID: 85bd451c247d9e960ba40440150d6cd5
 * [Плагин для синхронизации настроек с github](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
 * для перехода по ссылокам: alt+ctrl+click

```json
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
```

## debug

 * [node nvm vscode debug](https://medium.com/the-tech-bench/getting-visual-studio-code-and-nvm-working-together-252ec0300895)
 * [debug](https://code.visualstudio.com/docs/nodejs/nodejs-debugging)
	```bash
		nvm install 16 --default
		#nvm i 16
		#nvm alias default 16
		cat >> .vscode/launch.json
	```

	```json
		{
			"configurations": [
				{
					"type": "node-terminal",
					"name": "Run Script: debug",
					"request": "launch",
					"command": "npm run debug",
					"cwd": "${workspaceFolder}"
				}
			]
		}
	```

## грабли

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
