# Эмуляторы терминала



## Цветовые темы

 * http://terminal.sexy/
 * https://github.com/Gogh-Co/Gogh
 * https://github.com/chriskempson/base16-schemes-source
 * https://github.com/mbadolato/iTerm2-Color-Schemes/
 * https://rgbcolorcode.com/color/converter/

## шрифты

 * https://www.nerdfonts.com/

## kitty

 * слишком много куда лезет, нет в snap/flathub. Из коробки 'portable' не работает su/sudo/ssh. Нет GUI настроек.
 * слишком глубоко лезет в систему, к разработчикам на кривой козе не подъедешь
 * https://sw.kovidgoyal.net/kitty/
 * https://github.com/kovidgoyal/kitty
 * GPU
 * простая portable установка
 * подменяет ssh/xterm/tmux для расширения функционала
 * позволяет скопировать на целевую машину настройки и бинарники для сохранения рабочего окружения. Однако они могут конфликтовать с другими kitty окружениями, если пользователей несколько, а логинятся они в одного пользователя.
 * меряется скоростью
 * python/go
 * умеет в разные цвета вкладок
 * есть в репах ОС

### remote editor

 * https://sw.kovidgoyal.net/kitty/kittens/remote_file/

```
ls --hyperlink=auto
ctrl+shift+click
```

### performance

 * https://sw.kovidgoyal.net/kitty/faq/#i-opened-and-closed-a-lot-of-windows-tabs-and-top-shows-kitty-s-memory-usage-is-very-high

```bash
PYTHONMALLOC=malloc valgrind --tool=massif kitty
massif-visualizer massif.out.*
```
 * https://sw.kovidgoyal.net/kitty/performance/

### session

 * https://sw.kovidgoyal.net/kitty/overview/#startup-sessions

```bash
# Set the layout for the current tab
layout tall
# Set the working directory for windows in the current tab
cd ~
# Create a window and run the specified command in it
launch zsh
# Create a window with some environment variables set and run vim in it
launch --env FOO=BAR vim
# Set the title for the next window
launch --title "Chat with x" irssi --profile x

# Create a new tab
# The part after new_tab is the optional tab title which will be displayed in
# the tab bar, if omitted, the title of the active window will be used instead.
new_tab my tab
cd ~/somewhere
# Set the layouts allowed in this tab
enabled_layouts tall,stack
# Set the current layout
layout stack
launch zsh

# Create a new OS window
# Any definitions specified before the first new_os_window will apply to first OS window.
new_os_window
# Set new window size to 80x24 cells
os_window_size 80c 24c
# Set the --class for the new OS window
os_window_class mywindow
# Change the OS window state to normal, fullscreen, maximized or minimized
os_window_state normal
launch sh
# Resize the current window (see the resize_window action for details)
resize_window wider 2
# Make the current window the active (focused) window in its tab
focus
# Make the current OS Window the globally active window (not supported on Wayland)
focus_os_window
launch emacs
```

### Hints

 * https://sw.kovidgoyal.net/kitty/kittens/hints/
 * `ctrl+shift+p>f` to select anything that looks like a path or filename and then insert it into the terminal
 * `ctrl+shift+p>n` to select anything that looks like a path or filename followed by a colon and a line number and open the file in your default editor at the specified line number

### функции

 * fonts
	* `kitty list-fonts`
 * Layout
	* https://sw.kovidgoyal.net/kitty/layouts/
 * ripgrep
	* https://sw.kovidgoyal.net/kitty/kittens/hyperlinked_grep/
 * rsync
	* https://sw.kovidgoyal.net/kitty/kittens/transfer/
 * remote hazard
	* https://sw.kovidgoyal.net/kitty/remote-control/
 * [Mouse features](https://sw.kovidgoyal.net/kitty/overview/#mouse-features)
    * double click to select a word and then drag to select more words.
    * triple click to select a line and then drag to select more lines.
    * triple click while holding `Ctrl+Alt` to select from clicked point to end of line.
    * right click to extend a previous selection.
    * hold down `Ctrl+Alt` and drag with the mouse to select in columns.
    * Selecting text automatically copies it to the primary clipboard (on platforms with a primary clipboard).
    * right click while holding Ctrl+Shift to open the output of the clicked on command in a pager (requires Shell integration)
    * select text with kitty even when a terminal program has grabbed the mouse by holding down the Shift key
 * [scrollback buffer](https://sw.kovidgoyal.net/kitty/overview/#the-scrollback-buffer)
	* `ctrl+shift+h` will open the scrollback buffer in your favorite pager program (which is less by default).
 * [поиск по экрану](https://sw.kovidgoyal.net/kitty/marks/)


## alacrity

 * https://alacritty.org/config-alacritty.html
 * https://github.com/alacritty/alacritty
 * GPU
 * нужен SDK Rust для установки
 * умеет в разные цвета вкладок
 * меряется скоростью
 * очень много issues
 * нет вкладок
 * для разделения окна нужен tmux

## konsole

 * не умеет в разные цвета вкладок
 * поддерживает цвет bold/intense
 * KDE/QT
 * есть UI для коррекции цветов и настроек
 * не умеет растягивать фон-картинку
 * цвет курсора задаётся в конфиге приложения, а не в конфиге цветовой темы
 * есть в репах ОС
 * https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/Konsole

## wezterm

 * всё работает из коробки, есть в snap/flathub ,можно писать скрипты на lua под любую задачу. Нет GUI настроек.
 * https://wezfurlong.org/wezterm/
 * [wezterm](https://github.com/wez/wezterm)
 * Rust
 * GPU
 * lua конфиги
 * конфиг watch меняет на лету схему
 * не умеет в разные цвета разделённой вкладки, умеет в разные цвета вкладок
 * не поддерживает цвет bold/intense, есть скрипт-костыль
 * куча открытых багов
 * тормозит с рендерингом фона-картинки, не умеет в crop
 * очень много issues
 * https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/wezterm
 * https://ansidev.substack.com/p/wezterm-cheatsheet

### scripting

 * [Allow brightening bold + default fg, and bolding bright colors](https://github.com/wez/wezterm/issues/3415)
 * [when the tab/pane focus changes](https://wezfurlong.org/wezterm/config/lua/window-events/update-status.html)
 * [for the current window](https://wezfurlong.org/wezterm/config/lua/window/set_config_overrides.html)
 * [the pane is local or one of your remote mux panes](https://wezfurlong.org/wezterm/config/lua/pane/get_domain_name.html)
 * [текстовый скринкаст](https://wezfurlong.org/wezterm/cli/record.html)
 * [домен](https://github.com/wez/wezterm/discussions/4138)
 * [имя процесса](https://github.com/wez/wezterm/issues/1680)
	* https://wezfurlong.org/wezterm/config/lua/pane/get_foreground_process_name.html
 * [текст вкладки](https://github.com/wez/wezterm/discussions/4282)
	* https://wezfurlong.org/wezterm/config/lua/pane/get_title.html

```lua
local wezterm = require 'wezterm'

local DOMAIN_TO_SCHEME = {
    ["host1"] = "Yellow Scheme",
}

local ENV_TO_SCHEME = {
    ["prod"] = "Blue Scheme",
}

local PROCESS_TO_SCHEME = {
    ["ssh"] = "Red Scheme",
}

local TEXT_TO_SCHEME = {
    ["monitoring"] = "Green Scheme",
}


-- maximize on startup
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)


-- https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/wezterm
local COLOR_SCHEMES = {
	['Red Scheme'] = {
		background = 'red',
		-- config.color_scheme = 'Red Alert',
	},
	['Blue Scheme'] = {
		background = 'blue',
		-- config.color_scheme = 'VisiBlue (terminal.sexy)'
	},
	['Yellow Scheme'] = {
		background = 'yellow',
		-- config.color_scheme = 'Mono Amber (Gogh)'
	},
}


wezterm.on('update-status', function(window, pane)

	local COLOR_SCHEME_NAME = {}
	--local gruvbox = wezterm.color.get_builtin_schemes()['Gruvbox Light']
	-- my_default = wezterm.color.get_default_colors()

    ----------------- DOMAIN -----------------
    local domain = pane:get_domain_name()

    if domain == "host" then
        -- show the domain name in the right status area to aid in debugging/understanding
        window:set_right_status(domain)
        -- resolve the scheme for the domain. If there is no mapping, then the overridden scheme is cleared and your default colors will be used
        COLOR_SCHEME_NAME = DOMAIN_TO_SCHEME[domain]
    end

    ----------------- ENV --------------------
    local env_value = pane:get_user_vars().stage

    if env_value == "prod" then
        COLOR_SCHEME_NAME = ENV_TO_SCHEME[env_value]
    end

    ----------------- PROCESS ----------------
    local process_name = pane:get_foreground_process_name()

    if process_name == "top" then
        -- When using wezterm connect, wezterm ssh, or wezterm serial the foreground process name will be nil
        COLOR_SCHEME_NAME = PROCESS_TO_SCHEME[process_name]
    end

    ----------------- TAB TEXT ---------------
    local pane_text = pane:get_title()

    if panetext == "monitoring" then
        COLOR_SCHEME_NAME = TEXT_TO_SCHEME[pane_text]
    end

	----------------- OVERRIDE COLOR ---------

	if COLOR_SCHEMES[COLOR_SCHEME_NAME] ~= nil then
    	local overrides = window:get_config_overrides() or {}
		overrides.color_scheme = COLOR_SCHEMES[COLOR_SCHEME_NAME]
		window:set_config_overrides(overrides)
	end
end)

return {}

```


## terminator

 * https://github.com/gnome-terminator/terminator
 * python
 * умеет в разные цвета вкладок
 * поддерживает цвет bold/intense
 * есть UI для коррекции цветов и настроек

## tilix

 * https://github.com/gnunn1/tilix/
 * проблемы с поддержкой, старое решение
 * D, GTK3
 * json конфиги
 * https://gnunn1.github.io/tilix-web/
 * https://github.com/storm119/Tilix-Themes/blob/master/README.md
 * https://github.com/isacikgoz/gogh-to-tilix/tree/master
 * поддерживает цвет bold/intense
 * умеет в разные цвета вкладок
 * есть UI для коррекции цветов и настроек

## hyper

 * https://github.com/vercel/hyper
 * JS

## contour

 * https://contour-terminal.org/
 * [contour](https://github.com/contour-terminal/contour/)
* c++
* yml
* https://contour-terminal.org/
* QT6

## tabby

	* есть пакеты для установки
	* работает в chromium
	* JS/TS
	* https://github.com/eugeny/tabby
	* https://tabby.sh/
	* очень много issues
	* есть UI для коррекции цветов и настроек

## https://wiki.archlinux.org/title/Foot

	* wayland
	* нет поддержки
	* subpixel antialiasing

## tmux

 * старое решение, функционал пренесён на многие аналоги/эмуляторы
