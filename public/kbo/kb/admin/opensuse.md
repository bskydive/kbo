# Opensuse


## virtualbox

 * сеть-->сетевой мост-->паравиртуальная сеть(virt-io)
 * [mount share folder](https://serverfault.com/questions/674974/how-to-mount-a-virtualbox-shared-folder#674978)

```bash
	mount -t vboxsf share /home/toto
	 VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir /home/toto/
	VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir
```

## просмотр markdown файлов

* [установить плагин в хром](https://chrome.google.com/webstore/detail/markdown-preview/jmchmkecamhbiokiopfpnfgbidieafmd?utm_source=chrome-app-launcher-info-dialog)
* [установить pandoc и настроить kate](https://www.maketecheasier.com/convert-markdown-to-html-in-kate-text-editor/)
* [смотреть плагином в idea](https://plugins.jetbrains.com/plugin/5970?pr=idea)

## screencast

 * simplescreenrecorder
 * peek - запись области в gif
 * KmCaster - нажатые клавиши - нужен JDK>14 https://www.oracle.com/java/technologies/downloads/#java18
 * OBS studio

## security

 * [spectre meltdown opensuse](https://www.suse.com/support/kb/doc/?id=7022512)
 * [spectre meltdown detect](https://github.com/speed47/spectre-meltdown-checker)

## audio

 * ffmpegyag

### pulse

 * по сети rtp
	* paprefs
 	* https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Network/RTP/
	 ```
	 	tcpdump -n net 224.0.0.0/8 -c 10
		tcpdump -n net 192.0.0.0/8 -c 10
		22:19:59.578022 IP 192.168.0.197.57664 > 224.0.0.56.46862: UDP, length 1292
		vlc rtp://@0.0.0.0:46444/

	 ```

 * [pulseaudio-equalizer](files/equalizer-preset.png)
 * в pavucontrol выбрать воспроизведение через LADSPA Plugin, чтобы эквалайзер заработал
 * удаление pulseaudio-equalizer
    ```
    
    ~/.config/pulse/default.pa
    #закомментировать module-loadspa-sink
    ### BEGIN: Equalized audio configuration
    ### Generated from: pulseaudio-equalizer
    #load-module module-ladspa-sink sink_name=ladspa_output.mbeq_1197.mbeq master=alsa_output.pci-0000_00_14.2.analog-stereo plugin=mbeq_1197 label=mbeq control=-3.4,1.7,2.0,3.0,5.0,5.6,6.5,5.2,3.2,1.5,0.0,-2.5,-4.8,-4.8,-3.2
    #set-default-sink ladspa_output.mbeq_1197.mbeq
    #set-sink-mute alsa_output.pci-0000_00_14.2.analog-stereo 0
    ### END: Equalized audio configuration
    #запуск от обычного пользователя
    pulseaudio --start
    ```
 * https://softwarerecs.stackexchange.com/questions/31490/program-measuring-sound-and-generating-an-equalizer-profile
 * https://en.opensuse.org/SDB:Audio_troubleshooting#A_possible_fix_to_choppy_.2F_skipping_sound
 * https://en.opensuse.org/SDB:Audio_troubleshooting#Intel_HDA_chipset

	```bash
		/etc/pulse/daemon.conf . Try changing the line default-sample-rate = 44100 in /etc/pulse/daemon.conf by default-sample-rate = 48000 and restart the PulseAudio server. 

		1
		PULSE_PROP="filter.want=echo-cancel" skype

		2
		load-module module-echo-cancel source_name=noechosource sink_name=noechosink
		set-default-source noechosource
		Можно добавить эти строки в /etc/pulse/default.pa куда-нибудь в конец, чтобы они выполнялись каждый раз при запуске pulseaudio.

	```
 * https://bugs.freedesktop.org/show_bug.cgi?id=94167

	```
			userB doesn't have access to /run/user/1000/pulse/native, which is why userB tries to start its own pulseaudio instance. And even if userB has access to the socket, pulseaudio will reject the connection attempt by a different user. There are a few steps to make this work:

		Copy /etc/pulse/default.pa to /home/userA/.config/pulse/default.pa and change this line

			load-module module-native-protocol-unix

		to

			load-module module-native-protocol-unix auth-anonymous=true

		After that change anyone having access to the socket will be allowed to connect. Then give userB access to /run/user/1000/pulse/native (setfacl can probably be used to grant access to only that user, but I don't know the exact command).

		It's probably also a good idea to not rely on the x11 property to point userB to userA's pulseaudio socket, so you can add "default-server = /run/user/1000/pulse/native" to /home/userB/.config/pulse/client.conf (I'm assuming that userB is only used from within userA's login sessions, so we don't need to support the case where userB logs in separately).

		If you wish to have the socket somewhere else, you can pass socket=/somewhere/else to module-native-protocol-unix the same way you pass auth-anonymous=true.

	```
 * https://www.linuxuprising.com/2020/09/how-to-enable-echo-noise-cancellation.html
 * https://www.reddit.com/r/linuxmasterrace/comments/g7mikg/rtx_voice_on_linux/
 * https://github.com/josh-richardson/cadmus
 * windows: https://www.nvidia.com/en-us/geforce/guides/nvidia-rtx-voice-setup-guide/ example: https://youtu.be/Q-mETIjcIV0?t=322

### ogg to mp3

```bash
 ./ -iname "*.ogg" -exec oggdec {} \;
 ./ -iname "*.wav" -exec lame {} {}.mp3 \;
 "*.wav.mp3" "#1.mp3"
  *.ogg *.wav
```

### mp4 to audio

```bash
ffmpeg -i ./*.mp4 -vn -sn -dn -af "volume=9.9dB" -ab 95k -f mp3 audio.mp3
ffmpeg -i video.mp4 -f mp3 -ab 192000 -vn music.mp3
ffmpeg -i video.mp4 -vn -acodec copy audio.m4a
```

```bash
#!/bin/bash
for f in *.mp4
do
    name=`echo "$f" | sed -e "s/.mp4$//g"`
    ffmpeg -i "$f" -vn -ar 44100 -ac 2 -ab 192k -f mp3 "$name.mp3"
done
```

```bash
for f in *.mp4; 
do 
ffmpeg -i "$f" -vn -c:a libmp3lame -ar 44100 -ac 2 -ab 192k "${f/%mp4/mp3}"; 
done

```

https://superuser.com/questions/323119/how-can-i-normalize-audio-using-ffmpeg

```bash
ffmpeg -i video.avi -af "volumedetect" -vn -sn -dn -f null /dev/null

Replace /dev/null with NUL on Windows.
The -vn, -sn, and -dn arguments instruct ffmpeg to ignore non-audio streams during this analysis. This drastically speeds up the analysis.

This will output something like the following:

[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] mean_volume: -16.0 dB
[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] max_volume: -5.0 dB
[Parsed_volumedetect_0 @ 0x7f8ba1c121a0] histogram_0db: 87861

As you can see, our maximum volume is -5.0 dB, so we can apply 5 dB gain. If you get a value of 0 dB, then you don't need to normalize the audio.



    Plain audio file: Just encode the file with whatever encoder you need:

    ffmpeg -i input.wav -af "volume=5dB" output.mp3

    Your options are very broad, of course.

    AVI format: Usually there's MP3 audio with video that comes in an AVI container:

    ffmpeg -i video.avi -af "volume=5dB" -c:v copy -c:a libmp3lame -q:a 2 output.avi

    Here we chose quality level 2. Values range from 0-9 and lower means better. Check the MP3 VBR guide for more info on setting the quality. You can also set a fixed bitrate with -b:a 192k, for example.

    MP4 format: With an MP4 container, you will typically find AAC audio. We can use ffmpeg's build-in AAC encoder.

    ffmpeg -i video.mp4 -af "volume=5dB" -c:v copy -c:a aac -b:a 192k output.mp4

    Here you can also use other AAC encoders. Some of them support VBR, too. See this answer and the AAC encoding guide for some tips.

In the above examples, the video stream will be copied over using -c:v copy. If there are subtitles in your input file, or multiple video streams, use the option -map 0 before the output filename.
```

```bash
ffmpeg -i ./*.mp4 -vn -sn -dn -af "volume=5dB" audio.m4a
```

## X11Forwarding


```bash
linux-it9h:~ # ssh user@192.168.0.203 -X
Password:
Last login: Wed Nov  5 21:43:15 2014 from 192.168.0.207
Have a lot of fun...
ifconfig: command not found
user@linux-rbo1:~> xclock
user@linux-rbo1:~> echo $DISPLAY
linux-rbo1.site:10.0
user@linux-rbo1:~> xhost
access control enabled, only authorized clients can connect
INET:192.168.0.203
user@linux-rbo1:~>
linux-rbo1:~ # ps axjf|grep X
  931   989   989   989 tty7       989 Ss+      0   0:22  \_ /usr/bin/X -background none :0 vt07 -nolisten tcp
  931  1189  1189  1189 ?           -1 Ssl   1000   0:00  \_ /usr/bin/lxsession -s LXDE -e LXDE
    1  1379  1189  1189 ?           -1 S     1000   0:00 /usr/bin/dbus-launch --sh-syntax --exit-with-session /etc/X11/xinit/xinitrc

linux-it9h:~ # grep -i x11 /etc/ssh/sshd_config
X11Forwarding yes
#X11DisplayOffset 10
X11UseLocalhost no
#       X11Forwarding no
linux-it9h:~ # grep -i x11 /etc/ssh/ssh_config
#   ForwardX11 no
# should not forward X11 connections to your local X11-display for
# keystrokes as you type, just like any other X11 client could do.
# file if you want to have the remote X11 authentification data to
ForwardX11Trusted yes
linux-it9h:~ #

#xauth
xauth list
xauth +localhost
xauth -

```

## crop pdf

 * https://pdf.online/crop-pdf

## jpeg to pdf

    ```bash
    convert -quality 100 -density 100 -trim test*.jpeg single.pdf
    convert -geometry 1024 -quality 100 -density 100 -trim 09.STEPANOV.ACT*.jpeg 09.STEPANOV.ACT.SIGNED.pdf
    ```

## network


смотреть в /etc/NetworkManager/system-connections/

```bash
$ nmcli c modify <name> wifi-sec.key-mgmt wpa-psk wifi-sec.psk <password>
```
https://docs.ubuntu.com/core/en/stacks/network/network-manager/docs/configure-wifi-connections

Configure WiFi Connections | NetworkManager documentation

 * http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
## policy-kit

org.freedesktop.login1.hibernate-multiple-sessions


## dark theme тёмная тема

### konqueror

вернуть чёрный на белом
настройка-настроить konqueror-таблицы стилей-использовать специальную таблицу стилей

### kde libreoffice

tools(сервис)-options(параметры)-accessability(спец возм)-
выключить:
 автоопределение выс контраста
автоматически подбирать цвет текста
разрешить анимацию


вид-тема

back to white
libreoffice -env:SAL_USE_VCLPLUGIN=gen

tools(сервис)-options(параметры)-персонализация
в строке поиска dark - search - ok

Install libreoffice-gtk (this will integrate your theme with you system theme (ex. font and style)

Значки:
Install libreoffice-theme-oxygen or libreoffice-theme-crystal and then follow  (Tools > Options > View).

## HARDWARE

### графический планшет

 * krita из discover
 * https://www.x.org/archive//X11R7.5/doc/man/man4/evdev.4.html
 * http://digimend.github.io/support/howto/drivers/evdev/
 * https://wiki.archlinux.org/title/Xorg#Input_devices
 * xp-pen
	 * https://www.xp-pen.com/download-51.html
	 * https://www.youtube.com/watch?v=bnrtPoo6-d8
	 * включить тачпад
	 * отправить тачпад на второй монитор

		```bash
		xrandr
		xinput
		xinput map-to-input $idXinput $idXrandr

		```
	* 
		```bash
		# xinput list
		⎡ Virtual core pointer                          id=2    [master pointer  (3)]
		⎜   ↳ Virtual core XTEST pointer                id=4    [slave  pointer  (2)]
		⎜   ↳ SIGMACHIP USB Keyboard Consumer Control   id=9    [slave  pointer  (2)]
		⎜   ↳ A4Tech USB Mouse                          id=11   [slave  pointer  (2)]
		⎜   ↳ XP-PEN star06c                            id=13   [slave  pointer  (2)]
		⎜   ↳ XP-PEN star06c Mouse                      id=16   [slave  pointer  (2)]
		⎣ Virtual core keyboard                         id=3    [master keyboard (2)]
			↳ Virtual core XTEST keyboard               id=5    [slave  keyboard (3)]
			↳ Power Button                              id=6    [slave  keyboard (3)]
			↳ Power Button                              id=7    [slave  keyboard (3)]
			↳ SIGMACHIP USB Keyboard                    id=8    [slave  keyboard (3)]
			↳ SIGMACHIP USB Keyboard System Control     id=10   [slave  keyboard (3)]
			↳ SIGMACHIP USB Keyboard Consumer Control   id=12   [slave  keyboard (3)]
			↳ XP-PEN star06c Keyboard                   id=14   [slave  keyboard (3)]
			↳ XP-PEN star06c                            id=15   [slave  keyboard (3)]

		# lsusb
		Bus 004 Device 004: ID 0451:8140 Texas Instruments, Inc. TUSB8041 4-Port Hub
		Bus 004 Device 003: ID 2001:4a00 D-Link Corp. 
		Bus 004 Device 002: ID 0451:8140 Texas Instruments, Inc. TUSB8041 4-Port Hub
		Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
		Bus 003 Device 008: ID 0451:3410 Texas Instruments, Inc. TUSB3410 Microcontroller
		# Bus 003 Device 009: ID 28bd:0062  
		Bus 003 Device 004: ID 0451:8142 Texas Instruments, Inc. TUSB8041 4-Port Hub
		Bus 003 Device 007: ID 09da:c10a A4Tech Co., Ltd. 
		Bus 003 Device 005: ID 1c4f:0026 SiGma Micro Keyboard
		Bus 003 Device 003: ID 1a40:0101 Terminus Technology Inc. Hub
		Bus 003 Device 002: ID 0451:8142 Texas Instruments, Inc. TUSB8041 4-Port Hub
		Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
		Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
		Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub


		# cat /usr/share/X11/xorg.conf.d/10-evdev.conf
		Section "InputClass"
				Identifier "evdev pointer catchall"
				MatchIsPointer "on"
				MatchDevicePath "/dev/input/event*"
				Driver "evdev"
		EndSection

		Section "InputClass"
				Identifier "evdev keyboard catchall"
				MatchIsKeyboard "on"
				MatchDevicePath "/dev/input/event*"
				Driver "evdev"
		EndSection

		Section "InputClass"
				Identifier "evdev touchpad catchall"
				MatchIsTouchpad "on"
				MatchDevicePath "/dev/input/event*"
				Driver "evdev"
		EndSection

		Section "InputClass"
				Identifier "evdev tablet catchall"
				MatchIsTablet "on"
				MatchDevicePath "/dev/input/event*"
				Driver "evdev"
		EndSection

		Section "InputClass"
				Identifier "evdev touchscreen catchall"
				MatchIsTouchscreen "on"
				MatchDevicePath "/dev/input/event*"
				Driver "evdev"
		EndSection

		# cat >> /usr/share/X11/xorg.conf.d/52-tablet.conf
		Section "InputClass"
			Identifier "XP-PEN star06c Mouse"
			MatchDriver "evdev"
			MatchIsPointer "on"
			MatchProduct "keyword"
			MatchDevicePath "/dev/input/event19" # not id! see list-props device node
			# Apply custom Options below.
			# XP-PEN star06c Mouse                      id=16   [slave  pointer  (2)]
		EndSection

		Section "InputClass"
			Identifier "XP-PEN star06c Keyboard"
			MatchDriver "evdev"
			MatchIsTablet "on"
			MatchProduct "keyword"
			MatchDevicePath "/dev/input/event22" # not id! see list-props device node
			# Apply custom Options below.
			# XP-PEN star06c Keyboard                   id=14   [slave  keyboard (3)]
		EndSection

		# xinput list-props "XP-PEN star06c Keyboard"
		Device 'XP-PEN star06c Keyboard':
				Device Enabled (154):   1
				Coordinate Transformation Matrix (156): 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
				libinput Send Events Modes Available (276):     1, 0
				libinput Send Events Mode Enabled (277):        0, 0
				libinput Send Events Mode Enabled Default (278):        0, 0
				Device Node (279):      "/dev/input/event22"
				Device Product ID (280):        10429, 98

		# xinput list-props "XP-PEN star06c Mouse"
		Device 'XP-PEN star06c Mouse':
				Device Enabled (154):   1
				Coordinate Transformation Matrix (156): 1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
				libinput Natural Scrolling Enabled (291):       0
				libinput Natural Scrolling Enabled Default (292):       0
				libinput Scroll Methods Available (295):        0, 0, 1
				libinput Scroll Method Enabled (296):   0, 0, 0
				libinput Scroll Method Enabled Default (297):   0, 0, 0
				libinput Button Scrolling Button (298): 2
				libinput Button Scrolling Button Default (299): 2
				libinput Middle Emulation Enabled (300):        0
				libinput Middle Emulation Enabled Default (301):        0
				libinput Accel Speed (302):     0.000000
				libinput Accel Speed Default (303):     0.000000
				libinput Accel Profiles Available (304):        1, 1
				libinput Accel Profile Enabled (305):   1, 0
				libinput Accel Profile Enabled Default (306):   1, 0
				libinput Calibration Matrix (624):      1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
				libinput Calibration Matrix Default (625):      1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000
				libinput Left Handed Enabled (307):     0
				libinput Left Handed Enabled Default (308):     0
				libinput Send Events Modes Available (276):     1, 0
				libinput Send Events Mode Enabled (277):        0, 0
				libinput Send Events Mode Enabled Default (278):        0, 0
				Device Node (279):      "/dev/input/event19"
				Device Product ID (280):        10429, 98
				libinput Drag Lock Buttons (293):       <no items>
				libinput Horizontal Scroll Enabled (294):       1

				# xinput get-button-map "XP-PEN star06c Keyboard"
				device has no buttons

				# xinput get-button-map "XP-PEN star06c Mouse"
				1 2 3 4 5 6 7 

				xinput test 'XP-PEN star06c Keyboard'
				key press   37 # wheel
				key press   21
		```

### info

 * https://mintdewdrop.wordpress.com/2013/05/04/inxi/

	```bash
		inxi -G
		#	Graphics:  Device-1: NVIDIA GP107 [GeForce GTX 1050 Ti] driver: nvidia v: 390.141 
		#			Display: server: X.Org 1.20.3 driver: nvidia unloaded: fbdev,modesetting,nouveau,vesa resolution: 2560x1440 
		#			OpenGL: renderer: GeForce GTX 1050 Ti/PCIe/SSE2 v: 4.6.0 NVIDIA 390.141 
		inxi -b
		#	System:    Host: linux-tltj Kernel: 5.3.18-lp152.72-default x86_64 bits: 64 Console: tty 7 Distro: openSUSE Leap 15.2 
		#	Machine:   Type: Desktop Mobo: Micro-Star model: B450M PRO-VDH V2 (MS-7A38) v: 6.0 serial: IC16298648 
		#			UEFI: American Megatrends v: 8.81 date: 08/19/2019 
		#	CPU:       8-Core: AMD Ryzen 7 3700X type: MT MCP speed: 2822 MHz min/max: 2200/3600 MHz 
		#	Graphics:  Device-1: NVIDIA GP107 [GeForce GTX 1050 Ti] driver: nvidia v: 390.141 
		#			Display: server: X.Org 1.20.3 driver: nvidia unloaded: fbdev,modesetting,nouveau,vesa resolution: 2560x1440 
		#			OpenGL: renderer: GeForce GTX 1050 Ti/PCIe/SSE2 v: 4.6.0 NVIDIA 390.141 
		#	Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet driver: r8169 
		#	Drives:    Local Storage: total: 670.70 GiB used: 293.01 GiB (43.7%) 
		#	Info:      Processes: 362 Uptime: 9h 34m Memory: 31.30 GiB used: 3.96 GiB (12.7%) Shell: bash inxi: 3.1.00 
		inxi -D
		#	Drives:    Local Storage: total: 670.70 GiB used: 300.07 GiB (44.7%) 
		#			ID-1: /dev/sda vendor: Samsung model: MZ7KH480HAHQ-00005 size: 447.13 GiB 
		#			ID-2: /dev/sdb vendor: Intel model: SSDSC2KB240G8 size: 223.57 GiB
		inxi --battery
		# PC
		inxi -F
		#	System:    Host: linux-tltj Kernel: 5.3.18-lp152.78-default x86_64 bits: 64 Desktop: KDE Plasma 5.18.6 
		#			Distro: openSUSE Leap 15.2 
		#	Machine:   Type: Desktop Mobo: Micro-Star model: B450M PRO-VDH V2 (MS-7A38) v: 6.0 serial: <superuser/root required> 
		#			UEFI: American Megatrends v: 8.81 date: 08/19/2019 
		#	CPU:       Topology: 8-Core model: AMD Ryzen 7 3700X bits: 64 type: MT MCP L2 cache: 4096 KiB 
		#			Speed: 2188 MHz min/max: 2200/3600 MHz Core speeds (MHz): 1: 2188 2: 2199 3: 2483 4: 2188 5: 2227 6: 2092 7: 2182 
		#			8: 2161 9: 2259 10: 2200 11: 2212 12: 2154 13: 2199 14: 2160 15: 2200 16: 2199 
		#	Graphics:  Device-1: NVIDIA GP107 [GeForce GTX 1050 Ti] driver: nvidia v: 390.143 
		#			Display: x11 server: X.Org 1.20.3 driver: nvidia unloaded: fbdev,modesetting,nouveau,vesa 
		#			resolution: 2560x1440~60Hz 
		#			OpenGL: renderer: GeForce GTX 1050 Ti/PCIe/SSE2 v: 4.6.0 NVIDIA 390.143 
		#	Audio:     Device-1: NVIDIA GP107GL High Definition Audio driver: snd_hda_intel 
		#			Device-2: Advanced Micro Devices [AMD] Starship/Matisse HD Audio driver: snd_hda_intel 
		#			Sound Server: ALSA v: k5.3.18-lp152.78-default 
		#	Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet driver: r8169 
		#			IF: eth0 state: down mac: 00:d8:61:2e:90:2b 
		#			Device-2: D-Link type: USB driver: ax88179_178a 
		#			IF: eth1 state: up speed: 100 Mbps duplex: full mac: 00:ad:24:3e:4d:79 
		#			IF-ID-1: vmnet1 state: unknown speed: N/A duplex: N/A mac: 00:50:56:c0:00:01 
		#			IF-ID-2: vmnet8 state: unknown speed: N/A duplex: N/A mac: 00:50:56:c0:00:08 
		#	Drives:    Local Storage: total: 670.70 GiB used: 258.84 GiB (38.6%) 
		#			ID-1: /dev/sda vendor: Samsung model: MZ7KH480HAHQ-00005 size: 447.13 GiB 
		#			ID-2: /dev/sdb vendor: Intel model: SSDSC2KB240G8 size: 223.57 GiB 
		#	Partition: ID-1: / size: 113.68 GiB used: 92.21 GiB (81.1%) fs: ext4 dev: /dev/sdb2 
		#	Swap:      ID-1: swap-1 type: partition size: 4.00 GiB used: 0 KiB (0.0%) dev: /dev/sdb3 
		#	Sensors:   System Temperatures: cpu: 56.8 C mobo: 41.0 C gpu: nvidia temp: 40 C 
		#			Fan Speeds (RPM): fan-1: 0 fan-2: 2360 fan-3: 1202 fan-4: 0 fan-5: 0 gpu: nvidia fan: 20% 
		#	Info:      Processes: 328 Uptime: 2h 04m Memory: 31.30 GiB used: 3.37 GiB (10.8%) Shell: bash inxi: 3.1.00 

	```

### iowait

http://doc.opensuse.org/products/draft/SLES/SLES-tuning_sd_draft/cha.tuning.io.html

```bash
~> cat /sys/block/sda/queue/scheduler
noop [deadline] cfq
```

в настройках ядра yast

известная проблема с kworker.
 В качестве временного решения обычно рекомендуют либо 
acpi=noirq 
в параметрах ядра, либо 
echo disable > /sys/firmware/acpi/interrupts/gpeXX где XX - номер проблемного IRQ

### acpi apic

http://ubuntuforums.org/showthread.php?t=2102964

http://sourceforge.net/p/acpitool/wiki/Home/

http://software.opensuse.org/download.html?project=home%3Apbleser%3AUtilities&package=acpitool

```bash
acpitool -e

acpitool -w

acpitool  -W 17
  Changed status for wakeup device #17 (USB4)

   Device       S-state   Status   Sysfs node
  ---------------------------------------
  1. PCE2         S4    *disabled  pci:0000:00:02.0
  2. PCE3         S4    *disabled
  3. PCE4         S4    *disabled
  4. PCE5         S4    *disabled
  5. PCE6         S4    *disabled  pci:0000:00:06.0
  6. PCE7         S4    *disabled
  7. PCE9         S4    *disabled
  8. PCEA         S4    *disabled
  9. PCEB         S4    *disabled
  10. PCEC        S4    *disabled
  11. SBAZ        S4    *disabled  pci:0000:00:14.2
  12. UAR1        S4    *disabled  pnp:00:08
  13. P0PC        S4    *disabled  pci:0000:00:14.4
  14. UHC1        S4    *enabled   pci:0000:00:12.0
  15. UHC2        S4    *enabled   pci:0000:00:12.1
  16. UHC3        S4    *enabled   pci:0000:00:12.2
  17. USB4        S4    *disabled  pci:0000:00:13.0
  18. UHC5        S4    *enabled   pci:0000:00:13.1
  19. UHC6        S4    *enabled   pci:0000:00:13.2
  20. UHC7        S4    *enabled   pci:0000:00:14.5
  21. PWRB        S4    *enabled 

```

### FAN control вентиляторы

 * https://landing.coolermaster.com/faq/3-pin-and-4-pin-fan-wire-diagrams/
 * https://www.cyberciti.biz/faq/howto-linux-get-sensors-information/

 ```
	zypper in sensors
	sensors-detect
		# sensors-detect revision $Revision$
		# System: Micro-Star International Co., Ltd. MS-7A38 [6.0]
		# Board: Micro-Star International Co., Ltd. B450M PRO-VDH V2 (MS-7A38)
		# Kernel: 5.3.18-lp152.78-default x86_64
		# Processor: AMD Ryzen 7 3700X 8-Core Processor (23/113/0)

		This program will help you determine which kernel modules you need
		to load to use lm_sensors most effectively. It is generally safe
		and recommended to accept the default answers to all questions,
		unless you know what you're doing.

		Some south bridges, CPUs or memory controllers contain embedded sensors.
		Do you want to scan for them? This is totally safe. (YES/no): yes
		Module cpuid loaded successfully.
		Silicon Integrated Systems SIS5595...                       No
		VIA VT82C686 Integrated Sensors...                          No
		VIA VT8231 Integrated Sensors...                            No
		AMD K8 thermal sensors...                                   No
		AMD Family 10h thermal sensors...                           No
		AMD Family 11h thermal sensors...                           No
		AMD Family 12h and 14h thermal sensors...                   No
		AMD Family 15h thermal sensors...                           No
		AMD Family 16h thermal sensors...                           No
		AMD Family 17h thermal sensors...                           No
		AMD Family 15h power sensors...                             No
		AMD Family 16h power sensors...                             No
		Intel digital thermal sensor...                             No
		Intel AMB FB-DIMM thermal sensor...                         No
		Intel 5500/5520/X58 thermal sensor...                       No
		VIA C7 thermal sensor...                                    No
		VIA Nano thermal sensor...                                  No

		Some Super I/O chips contain embedded sensors. We have to write to
		standard I/O ports to probe them. This is usually safe.
		Do you want to scan for Super I/O sensors? (YES/no): yes
		Probing for Super-I/O at 0x2e/0x2f
		Trying family `National Semiconductor/ITE'...               No
		Trying family `SMSC'...                                     No
		Trying family `VIA/Winbond/Nuvoton/Fintek'...               No
		Trying family `ITE'...                                      No
		Probing for Super-I/O at 0x4e/0x4f
		Trying family `National Semiconductor/ITE'...               No
		Trying family `SMSC'...                                     No
		Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
		Found `Nuvoton NCT6795D Super IO Sensors'                   Success!
			(address 0xa20, driver `nct6775')

		Some systems (mainly servers) implement IPMI, a set of common interfaces
		through which system health data may be retrieved, amongst other things.
		We first try to get the information from SMBIOS. If we don't find it
		there, we have to read from arbitrary I/O ports to probe for such
		interfaces. This is normally safe. Do you want to scan for IPMI
		interfaces? (YES/no): yes
		Probing for `IPMI BMC KCS' at 0xca0...                      No
		Probing for `IPMI BMC SMIC' at 0xca8...                     No

		Some hardware monitoring chips are accessible through the ISA I/O ports.
		We have to write to arbitrary I/O ports to probe them. This is usually
		safe though. Yes, you do have ISA I/O ports even if you do not have any
		ISA slots! Do you want to scan the ISA I/O ports? (yes/NO): yes
		Probing for `National Semiconductor LM78' at 0x290...       No
		Probing for `National Semiconductor LM79' at 0x290...       No
		Probing for `Winbond W83781D' at 0x290...                   No
		Probing for `Winbond W83782D' at 0x290...                   No

		Lastly, we can probe the I2C/SMBus adapters for connected hardware
		monitoring devices. This is the most risky part, and while it works
		reasonably well on most systems, it has been reported to cause trouble
		on some systems.
		Do you want to probe the I2C/SMBus adapters now? (YES/no): yes
		Using driver `i2c-piix4' for device 0000:00:14.0: AMD KERNCZ SMBus
		Module i2c-dev loaded successfully.

		Next adapter: SMBus PIIX4 adapter port 0 at 0b00 (i2c-0)
		Do you want to scan it? (yes/NO/selectively): yes
		Client found at address 0x50
		Probing for `Analog Devices ADM1033'...                     No
		Probing for `Analog Devices ADM1034'...                     No
		Probing for `SPD EEPROM'...                                 Yes
			(confidence 8, not a hardware monitoring chip)
		Probing for `EDID EEPROM'...                                No
		Client found at address 0x51
		Probing for `Analog Devices ADM1033'...                     No
		Probing for `Analog Devices ADM1034'...                     No
		Probing for `SPD EEPROM'...                                 Yes
			(confidence 8, not a hardware monitoring chip)
		Client found at address 0x52
		Probing for `Analog Devices ADM1033'...                     No
		Probing for `Analog Devices ADM1034'...                     No
		Probing for `SPD EEPROM'...                                 Yes
			(confidence 8, not a hardware monitoring chip)
		Client found at address 0x53
		Probing for `Analog Devices ADM1033'...                     No
		Probing for `Analog Devices ADM1034'...                     No
		Probing for `SPD EEPROM'...                                 Yes
			(confidence 8, not a hardware monitoring chip)

		Next adapter: SMBus PIIX4 adapter port 2 at 0b00 (i2c-1)
		Do you want to scan it? (yes/NO/selectively): yes

		Next adapter: SMBus PIIX4 adapter port 3 at 0b00 (i2c-2)
		Do you want to scan it? (yes/NO/selectively): y

		Next adapter: SMBus PIIX4 adapter port 4 at 0b00 (i2c-3)
		Do you want to scan it? (yes/NO/selectively): y

		Next adapter: SMBus PIIX4 adapter port 1 at 0b20 (i2c-4)
		Do you want to scan it? (yes/NO/selectively): y

		Next adapter: NVIDIA i2c adapter 4 at 29:00.0 (i2c-5)
		Do you want to scan it? (yes/NO/selectively): y

		Next adapter: NVIDIA i2c adapter 6 at 29:00.0 (i2c-6)
		Do you want to scan it? (yes/NO/selectively): y
		Client found at address 0x4a
		Probing for `National Semiconductor LM75'...                No
		Probing for `National Semiconductor LM75A'...               No
		Probing for `Dallas Semiconductor DS75'...                  No
		Probing for `National Semiconductor LM77'...                No
		Probing for `Analog Devices ADT7410/ADT7420'...             No
		Probing for `Analog Devices ADT7411'...                     No
		Probing for `Maxim MAX6642'...                              No
		Probing for `Texas Instruments TMP435'...                   No
		Probing for `National Semiconductor LM73'...                No
		Probing for `National Semiconductor LM92'...                No
		Probing for `National Semiconductor LM76'...                No
		Probing for `Maxim MAX6633/MAX6634/MAX6635'...              No
		Probing for `NXP/Philips SA56004'...                        No
		Client found at address 0x4b
		Probing for `National Semiconductor LM75'...                No
		Probing for `National Semiconductor LM75A'...               No
		Probing for `Dallas Semiconductor DS75'...                  No
		Probing for `National Semiconductor LM77'...                No
		Probing for `Analog Devices ADT7410/ADT7420'...             No
		Probing for `Analog Devices ADT7411'...                     No
		Probing for `Maxim MAX6642'...                              No
		Probing for `Texas Instruments TMP435'...                   No
		Probing for `National Semiconductor LM92'...                No
		Probing for `National Semiconductor LM76'...                No
		Probing for `Maxim MAX6633/MAX6634/MAX6635'...              No
		Probing for `NXP/Philips SA56004'...                        No
		Probing for `Analog Devices ADT7481'...                     No

		Next adapter: NVIDIA i2c adapter 7 at 29:00.0 (i2c-7)
		Do you want to scan it? (yes/NO/selectively): y


		Now follows a summary of the probes I have just done.
		Just press ENTER to continue: 

		Driver `nct6775':
		* ISA bus, address 0xa20
			Chip `Nuvoton NCT6795D Super IO Sensors' (confidence: 9)

		Do you want to generate /etc/sysconfig/lm_sensors? (YES/no): y
		Created symlink /etc/systemd/system/multi-user.target.wants/lm_sensors.service → /usr/lib/systemd/system/lm_sensors.service.
		Unloading i2c-dev... OK
		Unloading cpuid... OK

	sensors
		k10temp-pci-00c3

		Adapter: PCI adapter
		Vcore:        +0.95 V  
		Vsoc:         +1.01 V  
		Tdie:         +58.8°C  
		Tctl:         +58.8°C  
		Tccd1:        +42.8°C  
		Icore:       +11.00 A  
		Isoc:         +6.50 A  

		nct6795-isa-0a20
		Adapter: ISA adapter
		Vcore:                  +1.14 V  (min =  +0.00 V, max =  +1.74 V)
		in1:                    +1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		AVCC:                   +3.39 V  (min =  +2.98 V, max =  +3.63 V)
		+3.3V:                  +3.39 V  (min =  +2.98 V, max =  +3.63 V)
		in4:                    +1.01 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in5:                    +0.16 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in6:                    +0.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		3VSB:                   +3.39 V  (min =  +2.98 V, max =  +3.63 V)
		Vbat:                   +3.28 V  (min =  +2.70 V, max =  +3.63 V)
		in9:                    +1.82 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in10:                   +0.00 V  (min =  +0.00 V, max =  +0.00 V)
		in11:                   +0.66 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in12:                   +1.03 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in13:                   +0.67 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in14:                   +1.54 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		fan1:                     0 RPM  (min =    0 RPM)
		fan2:                  2441 RPM  (min =    0 RPM)
		fan3:                  1197 RPM  (min =    0 RPM)
		fan4:                     0 RPM  (min =    0 RPM)
		fan5:                     0 RPM  (min =    0 RPM)
		SYSTIN:                 +41.0°C  (high =  +0.0°C, hyst =  +0.0°C)  ALARM  sensor = CPU diode
		CPUTIN:                 +37.0°C  (high = +115.0°C, hyst = +90.0°C)  sensor = thermistor
		AUXTIN0:                +45.5°C  (high = +115.0°C, hyst = +90.0°C)  sensor = thermistor
		AUXTIN1:               -128.0°C    sensor = thermistor
		AUXTIN2:                +46.0°C    sensor = thermistor
		AUXTIN3:                 -3.0°C    sensor = thermistor
		SMBUSMASTER 0:          +58.0°C  
		PCH_CHIP_CPU_MAX_TEMP:   +0.0°C  
		PCH_CHIP_TEMP:           +0.0°C  
		PCH_CPU_TEMP:            +0.0°C  
		intrusion0:            ALARM
		intrusion1:            ALARM
		beep_enable:           disabled

 ```

## gpu video graphics видеокарта

 * выскакивает переключение дисплеев https://bugs.kde.org/show_bug.cgi?id=426496 
	* `plasmashell --replace `
	* https://www.reddit.com/r/kde/comments/oum1hr/issue_with_kde_plasma_switching_between_two/
	* https://forums.opensuse.org/showthread.php/564076-2nd-Monitor-Shutoff-upon-grub-to-Leap-on-During-Boot
 * встроенная видеокарта Процессор AMD Ryzen 7 PRO 5750G
	* https://en.opensuse.org/SDB:AMDGPU
	* https://askubuntu.com/questions/441040/failed-to-get-size-of-gamma-for-output-default-when-trying-to-add-new-screen-res

	```bash
		vi /etc/default/grub
		GRUB_GFXMODE=1920x1080 
		grub2-mkconfig -o /boot/grub2/grub.cfg
		grub2-script-check /boot/grub2/grub.cfg;echo $?
	```
	* не сработало
		```bash
			xrandr -q
			cvt 1920 1080 75
				# 1920x1080 74.91 Hz (CVT 2.07M9) hsync: 84.64 kHz; pclk: 220.75 MHz
				Modeline "1920x1080_75.00"  220.75  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync
			xrandr --newmode "1920x1080_75.00"  220.75  1920 2064 2264 2608  1080 1083 1088 1130 -hsync +vsync
			xrandr -q
			xrandr --addmode primary 1920x1080_60.00
			xrandr --output default --gamma 0:0:0 --mode 1980x1080_75.00
			xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
		```
	* https://askubuntu.com/questions/1317748/any-issues-running-20-04-with-a-ryzen-5000-cpu

## kde


 * http://techbase.kde.org/Projects/Plasma/Plasmoids
 * как отключить проигрыватель на экране блокировки https://forums.opensuse.org/showthread.php/525618-How-to-disable-media-controls-on-lock-screen

 ```
 /usr/share/plasma/look-and-feel/org.openSUSE.desktop/contents/lockscreen/LockScreenUi.qml
/usr/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/lockscreen/LockScreenUi.qml

This is part of the plasma5-workspace-5.10.4-1.1.x86_64 package.

Code:

                Loader {
                    Layout.fillWidth: true
                    Layout.preferredHeight: item ? item.implicitHeight : 0
                    active: true // TODO configurable
                    source: "MediaControls.qml"
                }

 ```

## adblock ublock

 * [как отписаться от пользователей и рекламных блогов habr](https://habr.com/ru/post/408239/)
	* geektimes.ru#?#li:-abp-has(a.user-info[href*="username"])
 * [Я никогда не писал расширения для Хрома, но ](https://habr.com/ru/post/525728/)
	* https://github.com/Drag13/HabrSanitizer
## installation migration OS

 * flatpak
	* `zypper in flatpak`
	* от пользователя! flatpak `flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo` 
	* или в discover - настройка - add flathub
 * включить numlock
 * удалить snapper packagekit
 * выключить проигрыватель на экране блокировки
 * выключить ntpd синхронизацию при загрузке, включить по таймеру каждые 50 минут
 * пароли рут и пользователя
 * установка драйвера принтера
 * настройка почты
 * сетевое имя через yast2
 * настройка выключения подсказок: настройки системы - поведение окон - рабочее пространство plasma - показывать всплывающие подсказки
 * рамки окна: цвета-цветовая схема-общие-цвет заголовка окна
 	* толщина рамки окна: оформление приложений - оформление окон - справа-внизу границы окна-тонкие
 * установка и настройка скайп SDB:Skype — openSUSE  PulseAudio — openSUSE (pavucontrol)
 * перенос /home
 * перенос закладок в браузер
 * добавить ярлыки на таскбар, индикатор ЦП, погода, сеть
 * десктоп - /usr/share/applications/
 * работа с документами - офис+экспорт в пдф
 * запомнить/перенести пароли для страниц в браузере
 * снести системный firefox, установить плагины
 	* adblock / ublock
	* noscript / whitelist
	* treestyletab https://addons.mozilla.org/ru/firefox/addon/tree-style-tab/?src=search
	* downthemall
 * снести системный thunderbird
 * pavucontrol - можно вместо него использовать kde плагин plasma
 * перенести ключи/скрипты удаленного доступа, папка scripts
 * `ssh-keygen -t rsa -b 4096`
 * установить ключи в bb, gh, gl, удалённые ПК
 * переключение окон - компактный без группировки по столам
 * настроить короткий формат даты для Dolphin в астройках локали DD.MM.YYYY
 * настроить полный формат даты для виджета часов на панели в настройках локали  
	* ddd dd.MM.yyyy
 * kate
 * konsole
	* шрифт
	* цвет
	* 10к строк лога
	* вкладки всегда видны
 * krdc
 * konqueror/dolphin
 * заменить ~/.kde4/share/apps/konqueror/bookmarks.xml
 * видео кодеки wmv. см #repo 		http://opensuse-guide.org/codecs.php
 * spectacle скриншоты починить
	* Настройки - глобальные комбинации клавиш - KDE daemon - выключить prtscr
	* Настройки - глобальные комбинации клавиш - + добавить - spectacle - назначить prtscr - снимок прямоугольной области
 * yed
 * настроить внешнюю видеокамеру/микрофон
 * git, kgit, git-gui
 * утилиты консоли
 * убрать boot splash screen
 * vscode https://code.visualstudio.com/docs/setup/linux#_visual-studio-code-is-unable-to-watch-for-file-changes-in-this-large-workspace-error-enospc
	```bash
		cat > /etc/sysctl.d/vscode.sysctl.conf
		# fs.inotify.max_user_watches=524288
		# fs.file-max=1632119
		sysctl -p
		sysctl --system
		sysctl fs.inotify.max_user_watches
		cat /proc/sys/fs/inotify/max_user_watches
		sysctl fs.file-max

		cat /etc/security/limits.conf
		# user hard nofile 16384
		# user soft nofile 9216
		ulimit -Sn
		ulimit -Hn
	```
 * настроить цвета
	* оформление рабочей среды - breeze
	* оформление рабочего стола - breeze
	* цвета - загрузить - honey oak
 * nvm
	* !!! сделать снимок ФС/ВМ
 	* `npm i -g sass npm-check pm2 http-server`
### old

 * evolution - через discover+flathub - поиск - evolution - кликнуть по пакету - источники - flathub
	* https://wiki.gnome.org/Apps/Evolution/EWS/OAuth2
	* https://wiki.gnome.org/Apps/Evolution/Flatpak

	```
		error: While opening repository /var/lib/flatpak/repo: opendir(objects): No such file or directory

		A bug is already filed in https://bugzilla.opensuse.org/show_bug.cgi?id=1173706 (and https://bugzilla.opensuse.org/show_bug.cgi?id=1172953) and there's a workaround until the issue gets solved: delete the /var/lib/flatpak/repo directory, then everything works fine

		rm /var/lib/flatpak/repo
	```
 * pulseaudio-equalizer
 * paprefs - для проигрывания звука по сети https://askubuntu.com/questions/28039/how-to-stream-music-over-the-network-to-multiple-computers 
 * digikam
 * pidgin
 * https://support.mozilla.org/en-US/kb/profiles-tb#w_backing-up-a-profile
 * freemind
 * kalendar
 * akregator
 * перенести kwallet
 * sqldeveloper java
 * akonadi
 * ssh_keys
 * kfind
 * lame для диктофона
 * apcupsd установить, настроить

### зависает при выключении

 * выключить ntp автозапуск--> синхронизировать без демона раз в 50 минут
 * удалить snapper, lvm monitor, packagekit, btrfs

```bash
	systemctl disable lvm2-monitor.service
	systemctl stop lvm2-monitor.service

	zypper rm snapper snapper-zypp-plugin yast2-snapper libsnapper5 grub2-snapper-plugin
	zypper rm PackageKit PackageKit-backend-zypp PackageKit-branding-openSUSE PackageKit-gstreamer-plugin PackageKit-gtk3-module PackageKit-lang discover-backend-packagekit libpackagekit-glib2-18 
	zypper rm btrfsprogs btrfsmaintenance btrfsprogs-udev-rules

```

 * https://forums.opensuse.org/showthread.php/539741-How-to-disable-Ibus-autostart

```bash
ibus ibus-gtk ibus-gtk3 ibus-lang ibus-m17n ibus-qt ibus-table ibus-table-rustrad ibus-table-translit libm17n0 libotf0 m17n-db m17n-db-lang typelib-1_0-IBus-1_0 zoom
ibus-lang m17n-db-lang ibus-branding-openSUSE-KDE

/etc/X11/xim.d/ibus
*kde*|*xfce*|*lxde*|*startplasma*)

chmod a-x /usr/bin/ibus-autostart
```
 * 

## ms teams

 * https://docs.microsoft.com/en-us/answers/questions/42095/sharing-screen-not-working-anymore-bug.html
	`mv /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay /usr/share/teams/resources/app.asar.unpacked/node_modules/slimcore/bin/rect-overlay.old`

## skype

 * `zypper in gnome-keyring`
 * less ~/.config/skypeforlinux/logs/skype-startup.log
 * http://arunraghavan.net/2013/08/pulseaudio-4-0-and-skype/
 * PULSE_LATENCY_MSEC=60 skype

```bash

/dumpmsnp

zypper installlibpulse0-32bit alsa-plugins-pulse-32bit libphonon4-32bit pavucontrol

The following 64 NEW packages are going to be installed:
  Mesa-32bit Mesa-libEGL1-32bit Mesa-libGL1-32bit Mesa-libglapi0-32bit alsa-oss-32bit alsa-plugins-pulse-32bit fontconfig-32bit libFLAC8-32bit libICE6-32bit libLLVM-32bit 
  libSM6-32bit libX11-6-32bit libX11-xcb1-32bit libXau6-32bit libXcursor1-32bit libXdamage1-32bit libXext6-32bit libXfixes3-32bit libXi6-32bit libXinerama1-32bit libXrandr2-32bit 
  libXrender1-32bit libXxf86vm1-32bit libasound2-32bit libdrm2-32bit libdrm_intel1-32bit libdrm_nouveau2-32bit libdrm_radeon1-32bit libelf1-32bit libexpat1-32bit libffi4-32bit 
  libfreetype6-32bit libgbm1-32bit libglib-2_0-0-32bit libgobject-2_0-0-32bit libjson0-32bit liblcms1-32bit libmng1-32bit libmysqlclient18-32bit libogg0-32bit libpciaccess0-32bit 
  libphonon4-32bit libpulse-mainloop-glib0-32bit libpulse0-32bit libqt4-32bit libqt4-qt3support-32bit libqt4-sql-32bit libqt4-sql-mysql-32bit libqt4-sql-sqlite-32bit 
  libqt4-x11-32bit libsndfile1-32bit libspeex1-32bit libsqlite3-0-32bit libudev1-32bit libuuid1-32bit libvorbis0-32bit libvorbisenc2-32bit libwayland-client0-32bit 
  libwayland-server0-32bit libwrap0-32bit libxcb-dri2-0-32bit libxcb-glx0-32bit libxcb-xfixes0-32bit libxcb1-32bit 

The following recommended package was automatically selected:
  alsa-oss-32bit 


zypper in skype-4.2.0.13-suse.i586.rpm 

The following 14 NEW packages are going to be installed:
  libQtWebKit4-32bit libXss1-32bit libXv1-32bit libgmodule-2_0-0-32bit libgstapp-0_10-0-32bit libgstinterfaces-0_10-0-32bit libgstreamer-0_10-0-32bit liborc-0_4-0-32bit libpng12-0 
  libwebp4-32bit libxml2-2-32bit libxslt1-32bit skype xorg-x11-libs 

```

## torrent


ktorrent export

```bash
	#!/bin/sh
	#DEST_DIR=$HOME/torrents

	#if [ "$#" -ge "2" ]
	#then DEST_DIR="$1"
	#fi

	#cd $HOME/.kde/share/apps/ktorrent/

	SOURCE_DIR="$1"
	DEST_DIR="$2"

	cd $SOURCE_DIR

	if ! [ -e "$DEST_DIR" ]
		then mkdir -p "$DEST_DIR"
	fi


	TORRENT_LIST=
	if [ -e tor0 ]
		then TORRENT_LIST="$TORRENT_LIST tor?"
	fi
	if [ -e tor10 ]
		then TORRENT_LIST="$TORRENT_LIST tor??"
	fi
	if [ -e tor100 ]
		then TORRENT_LIST="$TORRENT_LIST tor???"
	fi

	for  i in $TORRENT_LIST ; do
		cp -vRTpu $i/torrent $DEST_DIR/$i.torrent
	done
```

## opensuse install hangs

 "kernel-firmware" package isn't marked for installation by default

## kate

https://projects.kde.org/projects/kde/applications/kate/repository/revisions/cb94bbd610b7ed7f3421ee668fd348523b6d3229
/usr/share/kde4/apps/katepart/syntax/tcsh.xml: устаревший синтаксис. К контексту Cmd@ нельзя обращаться по символьному имени/usr/share/kde4/apps/katepart/syntax/tcsh.xml: устаревший синтаксис. К контексту CmdSet нельзя обращаться по символьному имени

https://projects.kde.org/projects/kde/applications/kate/repository/revisions/44beb7d342309f524e91ab18c9827e83225e36de
/usr/share/kde4/apps/katepart/syntax/lilypond.xml (15/56) была обнаружена ошибка The XML entity "commands-other" expands too a string that is too large to process (2594 characters > 1024).

```bash
ssh user@0.0.0.0 -X
x11forwarding yes
x11uselocalhost no
```

## firefox

* profiles https://support.mozilla.org/en-US/kb/profile-manager-create-remove-switch-firefox-profiles#w_starting-the-profile-manager
	* `about:profiles`
* https://wiki.archlinux.org/title/firefox#Hardware_video_acceleration

	```
		Hardware video acceleration via VA-API is available under Wayland [4] and Xorg [5] [6].

		To enable VA-API in Firefox:

			Ensure that your video card is correctly configured for VA-API:
				See Hardware video acceleration for steps to verify and install VA-API drivers if required.
			Ensure WebRender is enabled.
				Verify WebRender is enabled by opening about:support and then Compositing. It is enabled by default in GNOME and other desktop environments [7].
					Ensure you are not running Software WebRender as that won't work as of August 2021 [8]. If necessary WebRender can be force enabled as explained in /Tweaks#Enable WebRender compositor.
			Set the following flags in about:config:
				media.ffmpeg.vaapi.enabled to true in order to enable the use of VA-API with FFmpeg.
				media.ffvpx.enabled to false to disable the internal decoders for VP8/VP9. This is necessary despite this bug being fixed [9][10].
				media.navigator.mediadatadecoder_vpx_enabled to true to enable hardware VA-API decoding for WebRTC [11].
				media.rdd-vpx.enabled to false to disable the remote data decoder process for VP8/VP9. Firefox attempts to use the RDD process for VP8/VP9 but the RDD sandbox blocks VA-API access [12]. Disabling the remote data decoder for VP8/VP9 process means VA-API will run in the content process instead. The best solution is to move VA-API to the GPU process [13].
					Another possible workaround is to completely disable the RDD process by setting media.rdd-process.enabled to false, instead of just disabling it for VP8/VP9 as above.
				On Intel, in some cases VA-API might not work with the Intel iHD driver intel-media-driver. This might be workaroundable by using the Intel i965 driver libva-intel-driver. This workaround does not work anymore with Intel Iris Xe graphics, which are only supported by intel-media-driver, only solution there is to wait until Firefox implements a GPU process for X11/Wayland (planned FF94) [14] [15] [16].
					As a last resort, the content process sandbox can be disabled. However, this is a serious security risk and disables protection against attackers. It is recommended to leave the sandbox settings as default [17]. Nevertheless, to disable the content sandbox set security.sandbox.content.level to 0 [18].
			Run Firefox with the following environment variable enabled:
				In Wayland, with MOZ_ENABLE_WAYLAND=1, see #Wayland.
				In X.org, since 94, Firefox will run in EGL mode by default which is sufficient [19].
					For older releases, in X.org, enable EGL with MOZ_X11_EGL=1 or set gfx.x11-egl.force-enabled to true and gfx.x11-egl.force-disabled to false in about:config.
	```

* `about:config`
* `app.update.elevation.promptMaxAttempts`
* [Настройка Firefox в Linux 2019](https://habr.com/ru/post/459880/)

```
	device.sensors.enabled
	Позволяет через javascript получить доступ к датчикам устройства. Например, в мобильном Firefox можно получать информацию с датчика приближения. Если нет ни каких датчиков, либо доступ Firefox к ним вам не нужен, отключайте false

	dom.battery.enabled
	Отслеживание состояние батареи. Если используется стационарник, отключайте false

	dom.enable_performance_observer
	С помощью этой функции, разработчик сайта может узнать например, за какое время у пользователя загрузился тот или иной элемент веб-страницы. Что бы затем исправить недочёты производительности в коде сайта. Со стороны пользователя это будет выглядеть как сбор ограниченной телеметрии его действий на сайте и автоматическая её отправка. Можете отключить эту функцию false, для того что бы Firefox не отсылал сайтам эти данные.

	dom.event.clipboardevents.enabled
	Позволяет сайту следить за действиями пользователя, когда он копирует выделенный текст с веб страницы и затем, определённым образом, подсунуть к скопированному тексту в буфер обмена дополнительно строку, например
	Если вам попадаются такие сайты на которых приходится копировать текст, и затем при вставке скопированного текста в конце автоматически добавляется такая вот ерунда, которая вам не нужна или мешает, отключите эту функцию false.
	Лишь на некоторых сайтах могут возникнуть проблемы с копированием и вставкой текста из-за её отключения.

	security.sandbox.content.level * * *
	Функция безопасности Firefox. Во включённом по умолчанию состоянии, в режиме работы 4, браузер создаёт изолированную программную среду в которой обрабатывается загруженный контент. В такой «песочнице» вредоносному коду сложнее украсть данные, попытаться установить вирус или использовать уязвимости браузера.
	Если у вас используются основные защитные инструменты самого Firefox, установлен блокировщик рекламы с актуальными в нём фильтрами, плюс вы не шастаете по левым сайтам с сомнительным содержимым — можете отключить эту функцию, поставив значение 0. Браузер будет немного быстрее работать и процессор в среднем на 5-10% станет меньше нагружаться.

	To use the middle mouse button to paste whatever text has been highlighted/added to the clipboard, as is common in UNIX-like operating systems, set either middlemouse.contentLoadURL or middlemouse.paste to true in about:config. Having middlemouse.contentLoadURL enabled was the default behaviour prior to Firefox 57.

	To scroll on middle-click (default for Windows browsers) set general.autoScroll to true. 
```

* [archLinux firefox база знаний](https://wiki.archlinux.org/index.php/Firefox#Middle-click_behavior)

* выключенные дополнения 

```
	about:config
	xpinstall.signatures.required - false
	extensions.legacy.enabled - true
```

* [читаемые ссылки utf-8](https://addons.mozilla.org/ru/firefox/addon/pure-url/?src=search)

```
	unMHT
	network.standard-url.encode-utf8;false
	network.standard-url.escape-utf8;false
```

* настройки синхронизации

```
	about:preferences#sync

```

 * http://www.computerra.ru/gid/rtfm/browser/37428/

 * http://www.guillermomolina.com.ar/index.php/en/projects/firefox-kwallet-extension/103-library-path-issues

```
	Failed to open VDPAU backend libvdpau_nvidia.so: невозможно открыть разделяемый объектный файл: Нет такого файла или каталога
	turning off hardware acceleration in preferences > advanced > general
```

## thunderbird

 * http://kb.mozillazine.org/IMAP:_advanced_account_configuration
 * [реиндекс глобального поиска](https://support.mozilla.org/en-US/kb/rebuilding-global-database)

## repo

 * https://flathub.org/home
 * https://snapcraft.io/store
 * https://appimage.github.io/
 	* проверенные пакеты https://github.com/vinifmor/bauh-files/blob/master/appimage/apps.txt
 * https://en.opensuse.org/images/1/17/Zypper-cheat-sheet-1.pdf
 * gcc++33 gcc++5 `https://download.opensuse.org/repositories/devel:/gcc/openSUSE_Leap_15.3/`
 * multimedia codecs 

	```bash
		#1) Add the needed repositories:
		zypper addrepo -f http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_15.2/ packman
		zypper addrepo -f http://opensuse-guide.org/repo/openSUSE_Leap_15.2/ dvd

		#2) Then install the necessary packages:
		zypper install --allow-vendor-change ffmpeg-3 lame gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-libav libavdevice58 libdvdcss2 vlc-codecs

		#3) Make sure all your multimedia packages are coming from the Packman Repository:
		zypper dup --allow-vendor-change --from http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_15.2/

		zypper install freshplayerplugin

		#Installing Java browser plugin in the terminal:
		zypper install icedtea-web
		#Installing multimedia plugin in the terminal:
		zypper install xine-browser-plugin

		#First add the repository:
		zypper addrepo -f https://download.nvidia.com/opensuse/leap/15.2 nvidia
		#The following command should automatically install the correct driver for your card:
		zypper install-new-recommends --repo https://download.nvidia.com/opensuse/leap/15.2

		#tumbleweed https://forums.opensuse.org/showthread.php/523474-Multimedia-Guide-for-openSUSE-Tumbleweed
		zypper ar -f http://packman.inode.at/suse/openSUSE_Tumbleweed/ packman
		zypper ar -f http://opensuse-guide.org/repo/openSUSE_Tumbleweed/ libdvdcss
		zypper ref

		zypper install libxine2-codecs ffmpeg lame gstreamer-0_10-plugins-good gstreamer-0_10-plugins-bad gstreamer-0_10-plugins-ugly gstreamer-0_10-plugins-bad-orig-addon gstreamer-0_10-plugins-good-extra gstreamer-0_10-plugins-ugly-orig-addon gstreamer-0_10-plugins-ffmpeg libdvdcss2 dvdauthor07 gstreamer-plugins-base gstreamer-plugins-bad gstreamer-plugins-bad-orig-addon gstreamer-plugins-good gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-good-extra gstreamer-0_10-plugins-fluendo_mpegdemux gstreamer-0_10-plugins-fluendo_mpegmux k3b-codecs vlc-beta h264enc x264 gstreamer-plugins-libav vlc-beta-codecs
	```
 * общие

	```bash
		zypper repos -Pu
		zypper locks
		zypper ps -s
	```

 * ya repos

	```bash
		zypper addrepo -f https://mirror.yandex.ru/opensuse/packman/openSUSE_Leap_15.2/ ya_packman_repodata
		zypper addrepo -f https://mirror.yandex.ru/opensuse/packman/openSUSE_Leap_15.2/Multimedia/ ya_packman_Multimedia
		zypper addrepo -f https://mirror.yandex.ru/opensuse/packman/openSUSE_Leap_15.2/Games/ ya_packman_Games
		zypper addrepo -f https://mirror.yandex.ru/opensuse/packman/openSUSE_Leap_15.2/Extra/ ya_packman_Extra
		zypper addrepo -f https://mirror.yandex.ru/opensuse/packman/openSUSE_Leap_15.2/Essentials/ ya_packman_Essentials
		zypper addrepo -f https://mirror.yandex.ru/opensuse/distribution/leap/15.2/repo/non-oss/ ya_distribution_non_oss
		zypper addrepo -f https://mirror.yandex.ru/opensuse/distribution/leap/15.2/repo/oss/ ya_distribution_oss
		zypper addrepo -f https://mirror.yandex.ru/opensuse/update/leap/15.2/non-oss/ ya_update_non-oss
		zypper addrepo -f https://mirror.yandex.ru/opensuse/update/leap/15.2/oss/ ya_update_oss

		zypper modifyrepo -f -p80 ya_packman_repodata
		zypper modifyrepo -f -p80 ya_packman_Multimedia
		zypper modifyrepo -f -p80 ya_packman_Games
		zypper modifyrepo -f -p80 ya_packman_Extra
		zypper modifyrepo -f -p80 ya_packman_Essentials
		zypper modifyrepo -f -p80 ya_distribution_non_oss
		zypper modifyrepo -f -p80 ya_distribution_oss
		zypper modifyrepo -f -p80 ya_update_non-oss
		zypper modifyrepo -f -p80 ya_update_oss

		zypper modifyrepo -f -p99 ya_packman_repodata
		zypper modifyrepo -f -p99 ya_packman_Multimedia
		zypper modifyrepo -f -p99 ya_packman_Games
		zypper modifyrepo -f -p99 ya_packman_Extra
		zypper modifyrepo -f -p99 ya_packman_Essentials
		zypper modifyrepo -f -p99 ya_distribution_non_oss
		zypper modifyrepo -f -p99 ya_distribution_oss
		zypper modifyrepo -f -p99 ya_update_non-oss
		zypper modifyrepo -f -p99 ya_update_oss
	```

 * ya repos remove

	```
		zypper removerepo ya_packman_repodata
		zypper removerepo ya_packman_Multimedia
		zypper removerepo ya_packman_Games
		zypper removerepo ya_packman_Extra
		zypper removerepo ya_packman_Essentials
		zypper removerepo ya_distribution_non_oss
		zypper removerepo ya_distribution_oss
		zypper removerepo ya_update_non_oss
		zypper removerepo ya_update_oss
	```

 * old repos 

	```bash
		http://mirror.yandex.ru/opensuse/packman/12.3/repodata/
		http://download.opensuse.org/repositories/home:/hillwood/openSUSE_12.3/
		http://code.google.com/p/vpnpptp/downloads/list
		http://geeko.ioda.net/mirror/amd-fglrx/openSUSE_13.1/ radeon
 	 	http://software.opensuse.org/package/opensuse-codecs-installer?search_term=opensuse-codecs-installer
	```
 * hosts

	```bash 
		13.80.99.124		packages.microsoft.com
		13.80.99.124		csd-apt-weu-d-1.westeurope.cloudapp.azure.com

		104.73.92.137		repo.skype.com
		104.73.92.137		a104-73-92-137.deploy.static.akamaitechnologies.com

		46.30.215.58		opensuse-guide.org
		46.30.215.58		webcluster2.webpod5-cph3.one.com

		195.135.221.134		download.opensuse.org

		192.229.220.191		download.nvidia.com
		192.229.220.191		cs486284.wpc.phicdn.net

		142.250.74.46		dl.google.com
		142.250.74.46		arn09s22-in-f14.1e100.net

		148.251.201.107		packages.x2go.org
		148.251.201.107		ymir.das-netzwerkteam.de

		134.76.12.6			ftp.gwdg.de
	```

## freemind

http://freemind.sourceforge.net/wiki/index.php/Download

http://www.liberatedcomputing.net/mm2fm/scripts/mm2fm

http://www.liberatedcomputing.net/mm2fm

## vmware

 * [VMWare Workstation 15.5.1 on Kernel Linux 5.4.6 : fail to compile vmci-only](https://communities.vmware.com/thread/623768)
	```bash
		git clone https://github.com/mkubecek/vmware-host-modules.git
		cd vmware-host-modules
		git checkout workstation-15.5.1
		make
		make install
		After the installation, I ran this command : /etc/init.d/vmware start
	```
 * зависания cpu has been disabled by guest

	```bash
		zypper rm snapper snapper-zypp-plugin yast2-snapper PackageKit PackageKit-backend-zypp PackageKit-branding-openSUSE PackageKit-gstreamer-plugin PackageKit-gtk3-module PackageKit-lang discover-backend-packagekit  grub2-snapper-plugin libpackagekit-glib2-18 libsnapper5
	```
	* https://www.geekrar.com/how-to-fix-the-cpu-has-been-disabled-by-the-guest-os/

	```
		Now without closing the .vmx file, copy the following code and paste it at the end of all lines. If you've the config key smc.version = 0 already there, you may remove it and paste this in place of it. It should look like this.

		cpuid.0.eax = "0000:0000:0000:0000:0000:0000:0000:1011"
		cpuid.0.ebx = "0111:0101:0110:1110:0110:0101:0100:0111"
		cpuid.0.ecx = "0110:1100:0110:0101:0111:0100:0110:1110"
		cpuid.0.edx = "0100:1001:0110:0101:0110:1110:0110:1001"
		cpuid.1.eax = "0000:0000:0000:0001:0000:0110:0111:0001"
		cpuid.1.ebx = "0000:0010:0000:0001:0000:1000:0000:0000"
		cpuid.1.ecx = "1000:0010:1001:1000:0010:0010:0000:0011"
		cpuid.1.edx = "0000:0111:1000:1011:1111:1011:1111:1111"
		featureCompat.enable = "TRUE"
	```
	* https://kb.vmware.com/s/article/2000542

	```
	Collect information from the current outage:

		Identify the virtual machine and time of the outage
		Take a screenshot of the virtual machine's console and note the error messages
		In the inventory, Right Click on the VM, select 'Suspend' for the virtual machine, the checkpoint suspend (.vmss) and memory image (.vmem)  will be generated and can be found in the datastore from the virtual machine directory
		Convert the checkpoint suspend files (.vmss and .vmem) from the virtual machine into a core dump file using the vmss2core utility. For more information, see the Debugging Virtual Machines with the Checkpoint to Core Tool technical note, and the article Converting a snapshot file to memory dump using the vmss2core tool. 
		Resume the virtual machine to the suspended state, then reset the virtual machine to start the GuestOS.
		Collect logs from the GuestOS kernel leading up to the outage. For more information, contact the guest operating system vendor.
		Collect logs from the host leading up to the outage.
	```
 * [Анализ производительности виртуальной машины в VMware vSphere. Часть 1: CPU](https://habr.com/ru/company/dataline/blog/452884/).
 * выключить memory page trimming и debug logging https://www.vmware.com/support/ws55/doc/ws_performance_diskio.html
### звук

усилить громкость на сервере и на госте
поставить пульс

```bash

zypper in libpulse0-32bit alsa-plugins-pulse-32bit 

The following 10 NEW packages are going to be installed:
  alsa-plugins-pulse-32bit libFLAC8-32bit libjson0-32bit libogg0-32bit libpulse0-32bit libsndfile1-32bit libspeex1-32bit 
  libvorbis0-32bit libvorbisenc2-32bit libwrap0-32bit 

```

### workstation 12 

install: kernel development template

```bash
cd /lib/modules/`uname -r`/build/include
ln -s   generated/uapi/linux/ .
```

http://www.redhat.com/archives/rhl-list/2007-June/msg05664.html

```bash
cat>>/etc/vmware-fuse.conf
/etc/modprobe.d/vmware-fuse.conf
options loop max_loop=64
rmmod loop && modprobe loop && echo okok
```

### loop

http://www.redhat.com/archives/rhl-list/2007-June/msg05664.html

```bash
cat>>/etc/vmware-fuse.conf
/etc/modprobe.d/vmware-fuse.conf
options loop max_loop=64
rmmod loop && modprobe loop && echo okok
```

### net

 * http://www.liberidu.com/blog/2006/09/29/solving-vmware-network-problems-on-linux-vmware-guests/

```bash
#linux network
vi /etc/sysconfig/network-scripts/ifcfg-eth0
onboot=yes
/etc/init.d/network restart
```

```bash
#Remove the kernel's networking interface rules file so that it can be regenerated

# rm -f /etc/udev/rules.d/70-persistent-net.rules
# reboot
        
UPDATE your interface configuration file

# vim /etc/sysconfig/networking/devices/ifcfg-eth0

Remove the MACADDR entry or update it to the new MACADDR for the interface (listed in this file: /etc/udev/rules.d/70-persistent-net.rules).
Remove the UUID entry
Save and exit the file
Restart the networking service

# service network restart
        
```

### archive sparce/sparse files 

tar -czSf file.tar.gz file

pigz
pbzip2

### external folder

[Mounts all shares](https://docs.vmware.com/en/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-AB5C80FE-9B8A-4899-8186-3DB8201B1758.html)

```bash
/usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o subtype=vmhgfs-fuse,allow_other
```
по-умолчанию `mnt/hgfs`


## grub2

http://sourceforge.net/projects/kcm-grub2/

http://ksmanis.wordpress.com/projects/grub2-editor/

```bash
zypper addrepo http://download.opensuse.org/repositories/home:ksmanis/openSUSE_12.3/home:ksmanis.repo
zypper refresh
zypper install kcm-grub2
```


```bash
Figure out from the partition table what is your (main) linux partition, e.g. /dev/sda3:

fdisk -l

mount /dev/sda3 /mnt
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc # maybe superfluous
mount --bind /sys /mnt/sys # maybe superfluous

chroot /mnt
grub2-install /dev/sda
exit
reboot

If using legacy grub

Open a terminal and type (no 'sudo' is required in Rescue System mode):

 sudo /usr/sbin/grub
 grub> find /boot/grub/stage2 (will show the path of actual grub installation, you will need on the next step)
 grub> root (hdx,y)
 grub> setup (hdx)
 grub> quit

```


## vpn

 * http://code.google.com/p/vpnpptp/downloads/detail?name=vpnpptp_setup-ru-Linux-x86_64-Install.tar.gz&can=2&q=
 * http://forums.opensuse.org/p-russian/dhydhdhdhdhundhdhdh/gnome/453520-networkmanager-l2tp.html
 * http://code.google.com/p/vpnpptp/downloads/detail?name=xroot-0.0.6-1.x86_64.rpm&can=2&q=

## nomachine
 * https://www.nomachine.com/download
	
	```bash
		zypper in libstdc++6-32bit
		zypper rm nomachine
		rm -rf /usr/NX/
		rm -rf /home/vika/.nx/
		rm -rf /etc/NX/
	```


## x2go

 * 2m-png-jpeg
 * XFCE
 * Проблема с цифровой клавой
	* http://unixforum.org/index.php?showtopic=108708&st=120&p=1263239&#entry1263239
	
	```bash
	#!/bin/bash
	setxkbmap -rules xorg -model pc105 -layout "ru(winkeys),us" -option 'grp:alt_shift_toggle,grp_led:scroll'
	xmodmap -e "keycode 91 = KP_Delete KP_Decimal KP_Delete KP_Decimal"
	```
 * http://packages.x2go.org/opensuse/
 * tumbleweed

	````bash
		zypper addrepo http://packages.x2go.org/opensuse/tumbleweed/heuler/ x2go
		zypper addrepo http://packages.x2go.org/opensuse/tumbleweed/extras/ x2go-extras
		zypper refresh
		zypper in x2goserver x2goclient
	````

 * leap 15.1

	```bash
	zypper addrepo http://packages.x2go.org/opensuse/15.1/main/ x2go
	zypper addrepo http://packages.x2go.org/opensuse/15.1/extras/ x2go-extras
	zypper refresh
	zypper in x2goserver x2goclient
	zypper rm x2goserver x2goserver-desktopsharing x2goserver-common x2goserver-x2goagent perl-X2Go-Serverperl-X2Go-Log perl-X2Go-Server-DB nxproxy nx-libs nxagent libNX_X11-6
	```
 * leap 42.1

	```bash
		zypper addrepo http://download.opensuse.org/repositories/X11:/RemoteDesktop:/x2go/openSUSE_Leap_42.1/X11:RemoteDesktop:x2go.repo
		zypper addrepo http://download.opensuse.org/repositories/X11:RemoteDesktop:x2go/openSUSE_Factory/X11:RemoteDesktop:x2go.repo
		zypper refresh
		zypper in x2goserver x2goclient
	```
 * Keyboard Shortcuts

	```
	X2Go follows the general keyboard shortcuts of the NX client. In particular:

		Ctrl + Alt + T: terminate session / disconnect
		Ctrl + Alt + F: toggle fullscreen/windowed
		Ctrl + Alt + M: minimize or maximize fullscreen window
		Ctrl + Alt + arrow keys: move viewport (when remote screen is bigger than client window)
	```

 * http://wihttp://wiki.x2go.org/doku.php/doc:usage:x2goclientki.x2go.org/doku.php/doc:usage:x2goclient
 * http://wiki.x2go.org/doku.php/doc:de-compat
 * https://build.opensuse.org/project/repositories/X11:RemoteDesktop:x2go



## rdp

```bash
	zypper in yast2-rdp xrdp xorgxrdp
```

## vnc

 * default port 5901
 * https://habrahabr.ru/company/ruvds/blog/312556

```bash
	disable ipv6
	vncpasswd
	xinetd.d/vnc
	-rfbauth /home/bsk/.vnc/passwd
	user = bsk
	dbus-launch vncserver

	/usr/bin/Xvnc :7 -depth 16 -alwaysshared -geometry 1024x768 -query localhost -once -rfbauth ~/.vnc/passwd


	service vnc1
	{
		socket_type     = stream
		protocol        = tcp
		wait            = no
		user            = bsk
		server          = /usr/bin/Xvnc
		server_args     = -noreset -inetd -once -query localhost -geometry 1024x768 -depth 16 -rfbauth /home/bsk/.vnc/passwd
		type            = UNLISTED
		port            = 5901
	}

	zypper in x11vnc
	x11vnc - allow VNC connections to real X11 displays

	/usr/bin/x11vnc -dontdisconnect -display :0 -notruecolor -noxfixes -shared -forever -rfbport 5900 -bg -o /var/log/x11vnc.log -rfbauth ~/.vnc/passwd -env  FD_XDM=1  -auth  guess
```

## wallpapers kde

/usr/share/wallpapers

## kopete icq

 * http://icqserver.net/forum/topic101.html
 
