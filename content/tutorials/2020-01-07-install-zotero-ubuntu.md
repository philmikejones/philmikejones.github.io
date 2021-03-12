---
title: "Install Zotero in Ubuntu"
author: "Phil Mike Jones"
date: 2020-01-07
categories: "tutorials"
tags: ["zotero", "install", "ubuntu"]
---

Instructions to install Zotero 5 in Ubuntu Bionic Beaver 18.04 LTS, as of January 2020.

<!--more-->

I follow the [installation instructions](https://www.zotero.org/support/installation) to install Zotero, but there's perhaps not enough detail if you're new to Ubuntu (or, like me, you just forget!).

## Download and extract

First, download Zotero 5.0 tarball from https://www.zotero.org/download/ then extract the archive using your archive manager.

## Create a directory

Now you need to make a directory to install it in to.
For ease you can just make this in your home directory, but I do like to keep software out of my home directory and use `/opt` like the installation instructions suggest.

Make a directory called `zotero` in `/opt` (i.e. `/opt/zotero`).
You may find you need to be root to do this initially so open a terminal and type:

```bash
sudo mkdir /opt/zotero
```

and type your password.

## Set owner and permissions for the directory

Next change the owner of the `zotero` directory you've just created so you can access it without root:

```bash
sudo chown user:group /opt/zotero
```

(where `user` is you and `group` is an optional group name (possibly `staff` or similar)).
You may also want to change the [permissions](http://linuxcommand.org/lc3_lts0090.php) so that only you can write to this folder.
For example, I want read, write, and execute permissions for myself (`7`), read permission (`5`) for group, and no permissions for everyone else (`0`) (so others can read it but not write to it and bodge it up):

```bash
chmod 750 -R /opt/zotero
```

The `-R` does this recusively (i.e. all files and directories in `/opt/zotero`).

## Copy the files across

Copy the extracted files to `/opt/zotero` using:

```bash
cp -r path/to/extracted/files/* /opt/zotero
```

The `*` is a wildcard and means, "copy all files and directories in this directory".
The `-r ` means copy recursively (i.e. copy all folders and folder contents).
Thanks to Chris Erkal for the reminder.

## Create menu item

So that you can run Zotero from your menu you need to run:

```bash
/opt/zotero/set_launcher_icon
```

as suggested in the installation instructions.
However, I find I also need to manually edit the `zotero.desktop` file to point to the correct directory.
Open `/opt/zotero/zotero.desktop` in a text editor and change the line:

```bash
Exec=bash -c "$(dirname $(readlink -f %k))/zotero -url %U"
```

to

```bash
Exec=bash -c "/opt/zotero/zotero -url %U"
```

Before you create a symlink you may need to create the `~/.local/share/applications/` directory:

```bash
mkdir ~/.local/share/applications
```

Then you can create your symlink as described in the installation instructions:

```bash
ln -s /opt/zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
```

## Log out and back in

This might be an `xfce`/`xubuntu` quirk, but for the menu item to work I have to log out and log back in of my account.
Once I've done this I can now open Zotero from the menu.
