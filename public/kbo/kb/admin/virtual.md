# Виртуализация

## KVM

* [удалённая консоль kvm over ip](https://habr.com/ru/company/selectel/blog/464565)

### сжатие диска qemu-kvm qcov2

* Backup: Create a backup of your qcow2 image before proceeding.
* Zero free space Inside the guest OS
	On Windows: `sdelete -z c:`
	On Linux: If virtio-scsi is enabled with discard support, use the `fstrim`
* Shrink the qcow2 file
	* Method 1: qemu-img convert
		* `qemu-img convert -O qcow2 -c old_disk.qcow2 new_disk.qcow2`
		* -O qcow2: Specifies the output format.
		* -c: Creates a compressed file, which can result in a smaller size.
	* Method 2: qemu-img resize
		* `qemu-img resize old_disk.qcow2 --shrink -1500G`
		* --shrink: This option tells qemu-img to shrink the image.
		* -1500G: Specifies the new desired size in gigabytes.
* Fix the GPT table (if necessary)
	* `sudo sgdisk -e /dev/sda`

### драйвер видео win11

в настройках поменять  borcsh на virtio
https://pve.proxmox.com/wiki/Windows_11_guest_best_practices
https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.285-1/


## VirtualBox

 * сеть-->сетевой мост-->паравиртуальная сеть(virt-io)
 * [mount share folder](https://serverfault.com/questions/674974/how-to-mount-a-virtualbox-shared-folder#674978)

```bash
	mount -t vboxsf share /home/toto
	 VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir /home/toto/
	VBoxControl guestproperty set /VirtualBox/GuestAdd/SharedFolders/MountDir
```


## VMWare

 * [vmware](./vmware.md)

### windows guest

 * bitlocker без TPM https://www.howtogeek.com/howto/6229/how-to-use-bitlocker-on-drives-without-tpm/
	* open the Local Group Policy Editor, press Windows+R on your keyboard, type "gpedit.msc" into the Run dialog box, and press Enter.
	* Local Computer Policy > Computer Configuration > Administrative Templates > Windows Components > BitLocker Drive Encryption > Operating System Drives in the left pane.
	* Double-click the "Require additional authentication at startup" option in the right pane.
	* Select "Enabled" at the top of the window, and ensure the "Allow BitLocker without a compatible TPM (requires a password or a startup key on a USB flash drive)" checkbox is enabled here.



