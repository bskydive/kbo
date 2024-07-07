# vmware


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

### kernel modules

* https://thelinuxforum.com/articles/969-how-to-compile-the-vmware-workstation-pro-kernel-modules-on-ubuntu-debian

```bash
sudo vmware-modconfig --console --install-all
```

* [VMWare Workstation 15.5.1 on Kernel Linux 5.4.6 : fail to compile vmci-only](https://communities.vmware.com/thread/623768)

```bash
	git clone https://github.com/mkubecek/vmware-host-modules.git
	cd vmware-host-modules
	git checkout workstation-15.5.1
	make
	make install
	After the installation, I ran this command : /etc/init.d/vmware start
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