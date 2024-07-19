# Виртуализация

## KVM

* [удалённая консоль kvm over ip](https://habr.com/ru/company/selectel/blog/464565)


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



