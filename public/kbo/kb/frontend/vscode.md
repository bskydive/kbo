# VSCode

## sync

 * [Настройки в github](https://gist.github.com/bskydive/8878b3d6d3e679358935d34983d9ffe1)
 * [Плагин для синхронизации настроек с github](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
 * для перехода по ссылокам: alt+ctrl+click

## грабли

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