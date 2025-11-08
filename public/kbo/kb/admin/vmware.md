# vmware

 * https://www.techspot.com/downloads/189-vmware-workstation-for-windows.html
 * [страница выбора продукта workstation](https://support.broadcom.com/group/ecx/productdownloads?subfamily=VMware%20Workstation%20Pro)
 * [страница загрузки 17.6.1](https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Workstation%20Pro&displayGroup=VMware%20Workstation%20Pro%2017.0%20for%20Linux&release=17.6.1&os=&servicePk=524584&language=EN) - можно выбрать версию
 * [загрузка файла 17.6.2](https://downloads2.broadcom.com/?file=VMware-Workstation-Full-17.6.2-24409262.x86_64.bundle&oid=35597126&id=NVBT9EDOfBPY8f6wD1XebMkbYeM3Cns4PTr_r8ePFI0DpBOQ_zhyRUjZmimiGQ==&verify=1738084366-AxZHYYlsz53539c%2FM1KvJuLozOuMSk023kD82wWApgE%3D)

 * https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Workstation%20Pro&displayGroup=VMware%20Workstation%20Pro%2017.0%20for%20Linux&release=17.6.1&os=&servicePk=524584&language=EN
 SHA256 7b539aafa8251e7af3b49dc12a299b127938ef0355d3de68f616ceac3e59e016
 md5 20567d4ee560385119cf8a8d4f7fbf18
 VMware-Workstation-Full-17.6.1-24319023.x86_64.bundle(372.46 MB)
 Build Number: 24319023

 * https://support.broadcom.com/group/ecx/productfiles?subFamily=VMware%20Tools&displayGroup=VMware%20Tools%2012.x&release=12.5.0&os=&servicePk=524287&language=EN
VMware-Tools-windows-12.5.0-24276846.zip(96.58 MB)
Build Number: 24276846
sha256 abda50471c03724800675642b202a349d8bceb56198717891dd29c0dd330c849
md5 98bf4b6068a24c0779c5524dba9f6e47

 * VMware Tools for Windows, 64-bit in-guest installer
VMware-tools-12.5.0-24276846-x64.exe.zip(94.37 MB)
Build Number: 24276846
	sha256 9f1703a3551668d70de29f8241243a2450d0aa921673f3af1da4ef6c84950a35
	md5 77a1f48e8946ea8c49c750929f6a301c

## звук

усилить громкость на сервере и на госте
поставить пульс

```bash

zypper in libpulse0-32bit alsa-plugins-pulse-32bit

The following 10 NEW packages are going to be installed:
  alsa-plugins-pulse-32bit libFLAC8-32bit libjson0-32bit libogg0-32bit libpulse0-32bit libsndfile1-32bit libspeex1-32bit
  libvorbis0-32bit libvorbisenc2-32bit libwrap0-32bit

```

## ubuntu

```bash
 sudo apt-get install build-essential linux-headers-$(uname -r)
 sudo ln -s /usr/src/linux-headers-$(uname -r)/include/generated/uapi/linux/version.h /usr/src/linux-headers-$(uname -r)/include/linux/version.h
```

## workstation 25H2

* system scripts path: `/etc/systemd/system`

## workstation 12

install: kernel development template

```bash
cd /lib/modules/`uname -r`/build/include
ln -s   generated/uapi/linux/ .
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

 * Компрессоры: gzip, bzip2, xz, lz4, lzo, zstd
 * Самым быстрым, пожалуй, является lz4, самым сильным xz (но он ооочееь медленный),
 * лучшим в плане соотношения скорость-степень сжатия раньше был gzip, но теперь пальму первенства перехватил zstd.

```bash
	tar -czSf file.tar.gz file
	# лучше сразу на флешку
	zypper in pbzip2 plzip pigz
	tar -cv -I"pigz -6" -Sf /run/media/file.tar.gzp ./file/
	tar -cv -I"pbzip2 -6" -Sf /run/media/file.tar.gzp ./file/ # работает в 2 раза быстрее
	tar -cv -I"pblzip -6" -Sf /run/media/file.tar.gzp ./file/
```

 * pigz		1m7,644s
 * zstd		1m55,206s
 * pbzip2	2m49,499s
 * gzip		6m50,082s
 * bzip2	19m42,368s
 *

### external folder

[Mounts all shares](https://docs.vmware.com/en/VMware-Workstation-Pro/14.0/com.vmware.ws.using.doc/GUID-AB5C80FE-9B8A-4899-8186-3DB8201B1758.html)

```bash
/usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o subtype=vmhgfs-fuse,allow_other
```
по-умолчанию `mnt/hgfs`



## fails

### disk

 * [How to Fix VMware Error "Module Disk Power on Failed"](https://appuals.com/vmware-error-module-disk-power-on-failed/)
	* Manually Delete VMware Lock Files
 * [vmhgfs-fuse keeping one core at 99% CPU](https://github.com/vmware/open-vm-tools/issues/126)
	* https://kb.vmware.com/s/article/1018414
	* Open the virtual machine's configuration file (.vmx) in a text editor.
	* `isolation.tools.hgfs.oplockmonitor.enable = "FALSE"`
	* https://github.com/vmware/open-vm-tools
	* https://github.com/vmware/open-vm-tools/issues/246
 * [Checking and Repairing Virtual Disks](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.storage.doc/GUID-4460A049-11BF-4924-9B99-3474251261B4.html)
 * [Map or Mount a Virtual Disk to a Drive on the Host System](https://docs.vmware.com/en/VMware-Workstation-Pro/16.0/com.vmware.ws.using.doc/GUID-896E61F5-0865-4D3B-975E-DE476AFC7168.html)
	* Select File > Mount Virtual Disks
```bash

mv /VM/Server/Server-000001.vmdk.lck/ /VM/Server/Server-000001.vmdk.lck.old/
vmware-vdiskmanager -R /VM/Server/Server-000001.vmdk
# The virtual disk, '/VM/Server/Server-000001.vmdk', was corrupted and has been successfully repaired.

vmware-mount -p /VM/Server/Server-000001.vmdk
#Nr      Start       Size Type Id Sytem
#-- ---------- ---------- ---- -- ------------------------
# 1       2048       2048  GPT EE Unknown
# 2       4096   16777216  GPT EE Linux Swap
# 3   16781312    1024000  GPT EE Linux FS
# 4   17805312  146800640  GPT EE Linux FS

vmware-mount /VM/Server/Server-000001.vmdk 4 /mnt/vmdk0/
vmware-mount -L
# Disks with mounted partitions:
#	/VM/Server/Server-000001.vmdk

```

### vmware startup opensuse

 * после обновления ядра необходимо обновлять ключи UEFI
 * выключить secureboot или добавить хэши в uefi
 * пропатчить модули скриптом
 * выключить chkconfig скрипты, они не запускаются
 * добавить systemd скрипт
 * https://www.freedesktop.org/software/systemd/man/latest/systemd.service.html

```conf
[Unit]
Description=VMWare workstation modules
After=multi-user.target

[Service]
Type=exec
RemainAfterExit=yes

ExecStart=/etc/init.d/vmware start
ExecStartPost=/etc/init.d/vmware-USBArbitrator start

ExecStop=/etc/init.d/vmware-USBArbitrator stop
ExecStopPost=/bin/bash /etc/init.d/vmware stop


[Install]
WantedBy=multi-user.target


```


```bash
cat > /usr/lib/systemd/systemd-sysv-install
#!/bin/bash
echo "systemd-sysv-install deprecated"

cp /mnt/ssd480_2_data/distr/vmware/vmware.service /etc/systemd/system/
systemctl daemon-reload


chkconfig vmware-USBArbitrator off
chkconfig vmware off
#Synchronizing state of vmware.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
#Executing: /usr/lib/systemd/systemd-sysv-install disable vmware
#Failed to execute /usr/lib/systemd/systemd-sysv-install: No such file or directory





#####


/etc/init.d/vmware status
/etc/init.d/vmware-USBArbitrator status

/etc/rc.d/vmware --help
/etc/rc.d/vmware-USBArbitrator --help

vmwareLoadModule vmmon
vmwareLoadModule vmnet "$BINDIR"/vmware-networks --start

vmware_exec 'Virtual machine monitor' vmwareStartVmmon
vmware_exec 'Virtual machine communication interface' vmwareProbeVmci
vmware_exec 'VM communication interface socket family' vmwareProbeVsock
vmware_exec 'Blocking file system' vmware_start_vmblock
/sbin/modprobe parport_pc
vmware_exec 'Virtual ethernet' vmwareStartVmnet
vmware_exec 'VMware Authentication Daemon' vmware_start_authdlauncher
vmware_exec "Shared Memory Available"  vmwareCheckSharedMemory

vmware_exec 'VMware USB Arbitrator' vmwareStartUSBArbitrator



less /etc/vmware/config


libdir = "/usr/lib/vmware"
bindir = "/usr/bin"
initdir = "/etc/init.d"
initscriptdir = "/etc/init.d"
gksu.rootMethod = "su"
NETWORKING = "yes"
authd.fullpath = "/usr/sbin/vmware-authd"
```

### kernel modules

* https://thelinuxforum.com/articles/969-how-to-compile-the-vmware-workstation-pro-kernel-modules-on-ubuntu-debian

```bash
sudo vmware-modconfig --console --install-all
```

* https://github.com/bytium/vm-host-modules/
```bash
git clone https://github.com/bytium/vm-host-modules.git
cd vm-host-modules
git checkout 17.6.x
make clean && make && make install && echo okokok

#This command will:
#
#    Compile the patched vmmon and vmnet modules.
#    Create vmmon.tar and vmnet.tar files.
#    Copy the compiled .ko (kernel object) files to /lib/modules/$(uname -r)/misc/.
#    Copy the generated vmmon.tar and vmnet.tar to /usr/lib/vmware/modules/source/.
#    Run vmware-modconfig --console --install-all to rebuild and configure VMware with the new patched modules.
vmware-modconfig --console --install-all

```
* https://community.broadcom.com/vmware-cloud-foundation/discussion/workstation-pro-1752-1760-fail-to-install-virtual-machine-monitor-virtual-ethernet-fail-to-start-kde-neon
* [[SOLVED] VMWare Workstation Pro 16.1.2 - Unable to recompile vmmon/vmnet since OpenSuSE Kern. 5.12.4 ](https://community.broadcom.com/vmware-cloud-foundation/communities/community-home/digestviewer/viewthread?MessageKey=733d41bc-dbc3-4d2a-9dd5-7bfd1605a02d&)CommunityKey=fb707ac3-9412-4fad-b7af-018f5da56d9f
* [VMWare Workstation 15.5.1 on Kernel Linux 5.4.6 : fail to compile vmci-only](https://communities.vmware.com/thread/623768)
 * [How to fix VMWare Could not open /dev/vmmon](https://stackoverflow.com/questions/53058681/vmware-on-linux-could-not-open-dev-vmmon)
 * https://github.com/codiobert/vmware-vmmon-fix/tree/main
 * https://www.linuxquestions.org/questions/slackware-14/vmware-modules-build-broken-w-kernel-6-9-a-4175737459/

```bash
#!/bin/bash

MOK_PRIV=vmware-mok.priv
MOK_DER=vmware-mok.der

if [ "$EUID" -ne 0 ]
    then echo "Please run this script as root"
    exit
fi

echo
echo "Generate and sign $MOK_PRIV and $MOK_DER files"
openssl req -new -x509 -newkey rsa:2048 -keyout ~/$MOK_PRIV -outform DER -out ~/$MOK_DER -nodes -days 36500 -subj "/CN=VMware/" &&\
# ubuntu
# /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmmon) &&\
# /usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmnet) || exit 1
# opensuse
/lib/modules/$(uname -r)/build/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmmon) &&\
/lib/modules/$(uname -r)/build/scripts/sign-file sha256 ~/$MOK_PRIV ~/$MOK_DER $(modinfo -n vmnet) || exit 1
#modprobe vmmon
#modprobe vmnet
#modprobe vmw_vsock_vmci_transport
#modprobe vmw_vmci
#tail $(modinfo vmmon) | grep "Module signature appended"

echo
echo "Please set a password (BIOS will ask you for this password when the computer is rebooted to apply the key)"
mokutil --import ~/$MOK_DER

cp ~/$MOK_DER ./
cp ~/$MOK_PRIV ./

echo
echo "### IMPORTANT: Reboot your computer and follow BIOS instructions to finish the installation ###"
echo

```

```bash
openssl req -new -x509 -newkey rsa:2048 -keyout MOK.priv -outform DER -out MOK.der -nodes -days 36500 -subj "/CN=VMware/"
/usr/src/linux-headers-`uname -r`/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmmon)

/usr/src/linux-6.4.0-150600.23.33-obj/x86_64/default/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmmon)
/usr/src/linux-6.4.0-150600.23.33-obj/x86_64/default/scripts/sign-file sha256 ./MOK.priv ./MOK.der $(modinfo -n vmnet)

mokutil --import MOK.der
modinfo vmmon
mokutil --sb-state

update-secureboot-policy --enroll-key
efibootmgr -v
od -An -t u1 /sys/firmware/efi/efivars/od -An -t u1 /sys/firmware/efi/efivars/SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c/data
od -An -t u1 /sys/firmware/efi/efivars/od -An -t u1 /sys/firmware/efi/efivars/SecureBootSetup-7b59104a-c00d-4158-87ff-f04d6396a915/data
mokutil --list-new

mokutil --import /mnt/ssd480_2_data/distr/vmware/MOK.der
depmod
reboot
zypper search uefi
zypper in UEFITool
mokutil --list-enrolled
mokutil --export
mokutil --delete ./MOK-0002.der
mokutil --delete ./MOK-0003.der
```

### зависания

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


## vSphere

 * https://docs.vmware.com/en/VMware-vSphere/index.html
 * [Troubleshoot and Enhance Performance](https://docs.vmware.com/en/VMware-vSphere/8.0/vsphere-monitoring-performance/GUID-C5984D55-7E84-4F2F-855A-AF637D340DEC.html)
 * https://docs.vmware.com/en/VMware-Tools/index.html
 * http://www.vmware.com/pdf/vmware-tools-cli.pdf

## network

 * https://askubuntu.com/questions/810132/how-do-i-install-the-vmmon-kernel-module-for-vmware
	* `sudo vmware-modconfig --console --install-all`

 * netwok manager, сеть отвалилась

```bash
nmcli networking on
nmcli
```


## guest vmware tools

 * https://serverfault.com/questions/660080/detect-memory-ballooning-from-within-the-affected-vm
 * unbaloon --> migrate vm via vmotion to another node

```bash
vmware-toolbox-cmd stat balloon
```

## workstation vmrun

 * as for the 2024, workstation cli vmrun supports only local commands relying on vmx file path

```bash

# obsolete, 2009
#vmrun -T server -h https://localhost:8333/sdk -u vmachines -p "mypass" list
#vmrun -T server -h https://localhost:8333/sdk -u vmachines -p "mypass" listregisteredvm
# connect vnc plugin from browser
#port=8333
#~/.mozilla/firefox/acpp71u3.default/extensions/VMwareVMRC@vmware.com/plugins/vmware-vmrc -h "127.0.0.1:${port}" -u $user -p "${pass}" -M "${vmid}"
# cat /etc/vmware/hostd/vmInventory.xml | grep -vi config ## !!!obsolete

# 2024

cat /etc/vmware/config

# .encoding = "ASCII"
# libdir = "/usr/lib/vmware"
# bindir = "/usr/bin"
# initscriptdir = "/etc/init.d"
# gksu.rootMethod = "su"
# NETWORKING = "yes"
# authd.fullpath = "/usr/sbin/vmware-authd"
# product.buildNumber = "20800274"
# player.product.version = "17.0.0"
# vix.config.version = "1"
# telemetryUUID = "UUID-UUID-UUID-UUID"
# installerDefaults.autoSoftwareUpdateEnabled.epoch = "0000000000"
# installerDefaults.dataCollectionEnabled.epoch = "0000000000"
# installerDefaults.componentDownloadEnabled = "yes"
# installerDefaults.transferVersion = "1"
# vmware.fullpath = "/usr/bin/vmware"
# vix.libdir = "/usr/lib/vmware-vix"
# product.version = "17.0.0"
# workstation.product.version = "17.0.0"
# product.name = "VMware Workstation"
# acceptEULA = "yes"
# acceptOVFEULA = "yes"
# installerDefaults.autoSoftwareUpdateEnabled = "no"
# installerDefaults.dataCollectionEnabled = "no"
# installerDefaults.dataCollectionEnabled.initialized = "yes"

vmrun -T ws start "c:\my VMs\myVM.vmx"
vmrun -T ws -gu guestUser -gp guestPassword runProgramInGuest "c:\my VMs\myVM.vmx" "c:\Program Files\myProgram.exe"

vmrun -T ws snapshot "c:\my VMs\myVM.vmx" mySnapshot
vmrun -T ws revertToSnapshot "c:\my VMs\myVM.vmx" mySnapshot
vmrun -T ws deleteSnapshot "c:\my VMs\myVM.vmx" mySnapshot

vmrun -T ws enableSharedFolders "c:\my VMs\myVM.vmx"
```

## vmrun help

```bash

Usage: vmrun [AUTHENTICATION-FLAGS] COMMAND [PARAMETERS]

AUTHENTICATION-FLAGS
--------------------
These must appear before the command and any command parameters.

   -T <hostType> (ws|fusion||player)
   -vp <password for encrypted virtual machine>
   -gu <userName in guest OS>
   -gp <password in guest OS>

POWER COMMANDS           PARAMETERS           DESCRIPTION
--------------           ----------           -----------
start                    Path to vmx file     Start a VM or Team
                         [gui|nogui]
stop                     Path to vmx file     Stop a VM or Team
                         [hard|soft]
reset                    Path to vmx file     Reset a VM or Team
                         [hard|soft]
suspend                  Path to vmx file     Suspend a VM or Team
                         [hard|soft]
pause                    Path to vmx file     Pause a VM
unpause                  Path to vmx file     Unpause a VM

SNAPSHOT COMMANDS        PARAMETERS           DESCRIPTION
-----------------        ----------           -----------
listSnapshots            Path to vmx file     List all snapshots in a VM
                         [showTree]
snapshot                 Path to vmx file     Create a snapshot of a VM
                         Snapshot name
deleteSnapshot           Path to vmx file     Remove a snapshot from a VM
                         Snapshot name
                         [andDeleteChildren]
revertToSnapshot         Path to vmx file     Set VM state to a snapshot
                         Snapshot name

GUEST OS COMMANDS        PARAMETERS           DESCRIPTION
-----------------        ----------           -----------
runProgramInGuest        Path to vmx file     Run a program in Guest OS
                         [-noWait]
                         [-activeWindow]
                         [-interactive]
                         Complete-Path-To-Program
                         [Program arguments]
fileExistsInGuest        Path to vmx file     Check if a file exists in Guest OS
                         Path to file in guest
directoryExistsInGuest   Path to vmx file     Check if a directory exists in Guest OS
                         Path to directory in guest
setSharedFolderState     Path to vmx file     Modify a Host-Guest shared folder
                         Share name
                         Host path
                         writable | readonly
addSharedFolder          Path to vmx file     Add a Host-Guest shared folder
                         Share name
                         New host path
removeSharedFolder       Path to vmx file     Remove a Host-Guest shared folder
                         Share name
enableSharedFolders      Path to vmx file     Enable shared folders in Guest
                         [runtime]
disableSharedFolders     Path to vmx file     Disable shared folders in Guest
                         [runtime]
listProcessesInGuest     Path to vmx file     List running processes in Guest OS
killProcessInGuest       Path to vmx file     Kill a process in Guest OS
                         process id
runScriptInGuest         Path to vmx file     Run a script in Guest OS
                         [-noWait]
                         [-activeWindow]
                         [-interactive]
                         Interpreter path
                         Script text
deleteFileInGuest        Path to vmx file     Delete a file in Guest OS
                         Path in guest
createDirectoryInGuest   Path to vmx file     Create a directory in Guest OS
                         Directory path in guest
deleteDirectoryInGuest   Path to vmx file     Delete a directory in Guest OS
                         Directory path in guest
CreateTempfileInGuest    Path to vmx file     Create a temporary file in Guest OS
listDirectoryInGuest     Path to vmx file     List a directory in Guest OS
                         Directory path in guest
CopyFileFromHostToGuest  Path to vmx file     Copy a file from host OS to guest OS
                         Path on host
                         Path in guest
CopyFileFromGuestToHost  Path to vmx file     Copy a file from guest OS to host OS
                         Path in guest
                         Path on host
renameFileInGuest        Path to vmx file     Rename a file in Guest OS
                         Original name
                         New name
typeKeystrokesInGuest    Path to vmx file     Type Keystrokes in Guest OS
                         keystroke string

connectNamedDevice       Path to vmx file     Connect the named device in the Guest OS
                         device name

disconnectNamedDevice    Path to vmx file     Disconnect the named device in the Guest OS
                         device name

captureScreen            Path to vmx file     Capture the screen of the VM to a local file
                         Path on host

writeVariable            Path to vmx file     Write a variable in the VM state
                         [runtimeConfig|guestEnv|guestVar]
                         variable name
                         variable value

readVariable             Path to vmx file     Read a variable in the VM state
                         [runtimeConfig|guestEnv|guestVar]
                         variable name

getGuestIPAddress        Path to vmx file     Gets the IP address of the guest
                         [-wait]



GENERAL COMMANDS         PARAMETERS           DESCRIPTION
----------------         ----------           -----------
list                                          List all running VMs

upgradevm                Path to vmx file     Upgrade VM file format, virtual hw

installTools             Path to vmx file     Install Tools in Guest

checkToolsState          Path to vmx file     Check the current Tools state

deleteVM                 Path to vmx file     Delete a VM

clone                    Path to vmx file     Create a copy of the VM
                         Path to destination vmx file
                         full|linked
                         [-snapshot=Snapshot Name]
                         [-cloneName=Name]



Template VM COMMANDS     PARAMETERS           DESCRIPTION
---------------------    ----------           -----------
downloadPhotonVM         Path for new VM      Download Photon VM

```