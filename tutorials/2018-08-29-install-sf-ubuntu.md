---
title: "Install sf package in Ubuntu"
author: "Phil Mike Jones"
date: 2018-08-29
subtitle: ""
categories: "tutorials"
tags: ["rstats", "gis", "sf"]
---

# Install sf package in Ubuntu

If you receive errors about `udunits2` or `gdal-config` when installing `sf` in Ubuntu, this tutorial shows you how to fix them.


## `udunits2`

Here's the `udunits2` error:

```
checking udunits2.h usability... no
checking udunits2.h presence... no
checking for udunits2.h... no
checking udunits2/udunits2.h usability... no
checking udunits2/udunits2.h presence... no
checking for udunits2/udunits2.h... no
checking for ut_read_xml in -ludunits2... no
configure: error: in `/tmp/RtmpLjOYHU/R.INSTALL9fb6a264546/units':
configure: error:
--------------------------------------------------------------------------------
  libudunits2.so not found!

  If the udunits2 library is installed in a non-standard location, use:

    --configure-args='--with-udunits2-lib=/usr/local/lib'

  for example, if the library was not found, and/or

    --configure-args='--with-udunits2-include=/usr/include/udunits2'

  if the header was not found, replacing paths with appropriate values for your
  installation. You can alternatively use the UDUNITS2_INCLUDE and UDUNITS2_LIBS
  environment variables.

  If udunits2 is not installed, please install it.
  It is required for this package.
--------------------------------------------------------------------------------

See `config.log' for more details
ERROR: configuration failed for package ‘units’
* removing ‘/home/lw1pj/R/x86_64-pc-linux-gnu-library/3.5/units’
Warning in install.packages :
  installation of package ‘units’ had non-zero exit status
ERROR: dependency ‘units’ is not available for package ‘sf’
* removing ‘/home/lw1pj/R/x86_64-pc-linux-gnu-library/3.5/sf’
Warning in install.packages :
  installation of package ‘sf’ had non-zero exit status

The downloaded source packages are in
	‘/tmp/RtmptQoX2j/downloaded_packages’
```

To fix this, install `libudunits2-0` and `libudunits2-dev`:

```bash
$ sudo apt install -y libudunits2-0 libudunits2-dev
```

Enter your sudo password when prompted.


## `gdal-config`

And the `gdal-config` error:

```
checking for gdal-config... no
no
configure: error: gdal-config not found or not executable.
ERROR: configuration failed for package ‘sf’
* removing ‘/home/lw1pj/R/x86_64-pc-linux-gnu-library/3.5/sf’
Warning in install.packages :
  installation of package ‘sf’ had non-zero exit status

The downloaded source packages are in
	‘/tmp/RtmptQoX2j/downloaded_packages’
```

To fix this you need to install `libgdal-dev`:

```bash
$ sudo apt install libgdal-dev
```
