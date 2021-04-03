---
title: "Install QGIS in Ubuntu"
author: "Phil Mike Jones"
date: 2019-01-03
categories: "tutorials"
tags: ["gis", "qgis", "install", "ubuntu"]
---

# Install QGIS in Ubuntu

2019-01-03

Instructions to install QGIS 3 in Ubuntu Bionic Beaver 18.04 LTS, as of January 2019.

The instructions on the QGIS website to install QGIS on Ubuntu are a little bit ambiguous, so these are the steps I recommend you follow for most purposes.


## Add the `ubuntugis-unstable` repository

Each new version of Ubuntu usually has the most up--to--date libraries available at the time of its release, but these are not typically updated as these libraries are updated.
That means that the libraries in the latest LTS of Ubuntu are now nearly a year old.
In most cases this behaviour is desirable because it stops clashing versions of software being installed and causing problems, but in some cases it can cause its own problems because software that depends on newer libraries cannot use them.

From experience newer QGIS versions tend to depend on libraries more recent than those available by default, so we can add a repository of more up--to--date GIS libraries.
These generally do not interact with much else on the system so can be safely installed.
If you're an R user they are also useful for using `sf` and related libraries.

To install `ubuntugis-unstable` follow the instructions at [ubuntugis-unstable: Adding this PPA to your system](https://launchpad.net/~ubuntugis/+archive/ubuntu/ubuntugis-unstable).
In short, open a terminal (default CTRL + ALT + T) and copy/type:

```
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
sudo apt-get update
```

You'll be asked for your password (it's the same one you use to login).

Don't worry about the `unstable` in the name.
It doesn't mean it will keep crashing; it's just not yet as thoroughly tested as the `stable` versions.
These `unstable` libraries are perfectly adequate for production systems, just not anything mission--critical.


## Add the QGIS public key

To keep your installation safe make sure you add the QGIS public key.
This is a way for your system to automatically verify the software it downloads so that nothing malicious is installed on your system.

Under the [Debian/Ubuntu installation instructions](https://qgis.org/en/site/forusers/alldownloads.html#debian-ubuntu) there is a section that says:

> In case of keyserver errors add the qgis.org repository public key to your apt keyring, type:

```
wget -O - https://qgis.org/downloads/qgis-2017.gpg.key | gpg --import
gpg --fingerprint CAEB3DC3BDF7FB45
```

Enter these commands in your terminal.
The `wget` line downloads the key and the `gpg` line outputs a fingerprint calculated from the key you just downloaded.
Ensure this fingerprint printed in your teminal matches the one on the QGIS website.

Once you've checked this you then need to activate the key with:

```
gpg --export --armor CAEB3DC3BDF7FB45 | sudo apt-key add -
```


## Install QGIS

Finally to install QGIS open `/etc/apt/sources.list` with:

```
sudo gedit /etc/apt/sources.list
```

You might need to enter your password again, then copy and paste the following three lines to the bottom of this file:

```
# QGIS Ubuntugis-unstable dependencies
deb https://qgis.org/ubuntugis-ltr bionic main
deb-src https://qgis.org/ubuntugis-ltr bionic main
```

Then save (CTRL + s) then exit.

`/etc/apt/sources.list` is a list of places Ubuntu can download software from.
We are adding QGIS servers to this list so that Ubuntu knows where to download it from.

Now run:

```
sudo apt install qgis python-qgis
```

This will install the basic packages needed and you should now be able to run QGIS!
You might need to install additional libraries later, but these can be installed as necessary.


## Notes on QGIS version

I recommend installing the most recent LTR version of QGIS for most purposes.
This is supported for longer so is the better choice for most environments.
