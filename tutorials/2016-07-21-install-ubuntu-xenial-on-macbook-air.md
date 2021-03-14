---
title: "Install Ubuntu on Macbook Air"
date: 2016-07-21
author: "Phil Mike Jones"
categories: ["tutorials"]
tags: ["Ubuntu", "Linux", "Mac", "Macbook", "OS X"]
---

Below are simply my notes on installing Ubuntu on a Macbook Air as I couldn't find one clear or up-to-date source.
My Macbook is a mid-2011 (4,2) so your mileage may vary if you have a different model.

<!--more-->

> NB: If you try to follow these instructions you do so at your own risk; I make no guarantees that these instructions work or even that they won't brick your Macbook.
> Needless to say, make a backup of anything you need before you begin.

There are essentially three stages to the installation:

1. Download the necessary software
1. Install rEFInd
1. Install Ubuntu
1. (optional) Tweak your Ubuntu installation


## Download software

We need to download two packages, Ubuntu itself and rEFInd.

1. Download Ubuntu from the [Ubuntu website](https://www.ubuntu.com/download/desktop).
    1. I strongly recommend you use the latest Long Term Support (LTS) version.
    1. You almost certainly want the desktop version.
    1. You want the 64-bit version.
1. Download the binary zip version of [rEFInd](http://www.rodsbooks.com/refind/getting.html).


## Install rEFInd

rEFInd is the software that allows your Mac to boot a different operating system.
This is an absolutely necessary step to boot Linux so don's skip it!
There are installation instructions in the zip folder you downloaded, but essentially you need to:

1. Extract the rEFInd zip.
1. Reboot, and at the chime hold Command + R.
1. Open the Terminal from the Utilities menu. Navigate to where you unzipped the folder to (it's probably `/Volumes/Macintosh\ HD/Users/your-user-name/Downloads/refind-folder/`). Replace 'Macintosh HD' if necessary, and the refind folder usually has a version number.
1. Install rEFInd with `./refind-install`. You might get a warning about secure boot, but if you choose to proceed the installation should still work.
1. Restart your Mac and you should be presented with the rEFInd menu, demonstrating it worked. You should now boot back into your Mac.


## Install Ubuntu

1. Prepare a USB stick that's bootable for a Mac.
    1. The USB stick should be at least 4GB in size.
    1. To make it bootable, first format it as 'MS-DOS (FAT)' or ExFAT (not sure if it makes a difference).
1. Open a terminal in (or navigate to) the folder containing your Ubuntu iso.
1. Convert the .iso into an .img with: `hdiutil convert -format UDRW -o ubuntu-16.04-desktop-amd64.img ubuntu-16.04-desktop-amd64.iso`
1. Unmount (but do not remove) the USB drive to be able to copy the .img onto it. 
    1. Find out your USB drive's drive identifier with `diskutil list`. It might be `/dev/disk2`, for example.
    1. Unmount it with `diskutil unmountDisk /dev/disk2` (replacing `/dev/disk2` with the actual disk identifier from step 7.1.
1. Copy the .img with `sudo dd if=ubuntu-16.04-desktop-amd64.img.dmg of=/dev/rdisk2 bs=1m` (replacing `rdisk2` with the drive identifier obtained in 7.1).
1. Eject with `diskutil eject /dev/disk2` then remove the drive.
1. Shutdown your Mac. Insert the USB drive and turn the computer back on (you don't need to hold option at the chime). The rEFInd menu should have an option to boot from USB.
1. I suggest trying the live environment first to make sure everything boots and works correctly. You can then begin installing Ubuntu from the live environment once you're happy.
1. Begin the installation by clicking on the icon on the desktop.
1. Set up options as you wish. Once you get to the 'Installation Type' option choose 'Something else'. Select the partitions based on how you want your installation (I install just Ubuntu but remove everything else).

> **Warning: do not remove** the efi partition, which is at the beginning of the drive and about 200MB.
You can work with the rest of the drive, but this is what boots your Mac.

You should now be able to complete the installation and boot into Ubuntu as normal. 

## (Optional) tweak settings

Almost everything works out of the box, including wi-fi, but there are a few things that I found I wanted to tweak.

### Function key behaviour

Apple's default is to have the Function keys (F1 for example) work as media keys (so on my keyboard F1 decreases the brightness of the screen).
To be consistent with my desktop computer I prefer to have the function keys work as function keys rather than media keys.
To change the behavior open a terminal and run:

```bash
echo options hid_apple fnmode=2 | sudo tee -a /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u -k all
```

Then reboot.

More information and other options should this not work are on the [Ubuntu community documentation Apple Keyboard](https://help.ubuntu.com/community/AppleKeyboard#Corrections) page.
