Installing RGDAL and RGEOS in R on Linux
========================================

date: 2014-07-14

RGDAL
-----

The RGDAL package is used by R and RStudio to plot maps. Under Linux you
may encounter one or two errors when trying to install the package:

::

   Error: gdal-config not found.
   The gdal-config script distributed with GDAL could not be found.

Or:

::

   configure: error: proj_api.h not found in standard or given locations.
   ERROR: configuration failed for package 'rgdal'

You experience these errors because R in Linux installs the packages
from source (rather than a ready-compiled binary) and you need
additional libraries to compile RGDAL. Essentially, the packages
``libgdal-dev`` and ``libproj-dev`` are required and may be missing. To
install them on an Ubuntu system open a terminal (CTRL+ALT+T) and type
(or copy and paste):

::

   sudo apt-get update
   sudo apt-get install libgdal-dev libproj-dev

To ensure you package lists are up to date and then installs the
required packages. Once these are installed on your system you can
install the RGDAL package by running the following code inside R:

::

   install.packages("rgdal")

RGEOS
-----

RGEOS is another essential GIS package in R, even though it tends to be
called by other functions and you are not likely to call ``rgeos``
functions directly. If you see the following error when you try to
install rgeos:

::

   checking geos: linking with libgeos_c... no
   /usr/bin/ld: cannot find -lgeos
   collect2: error: ld returned 1 exit status
   configure: Install failure: compilation and/or linkage problems.
   configure: error: initGEOS_r not found in libgeos_c.
   ERROR: configuration failed for package ‘rgeos’

You should install ``libgeos++-dev`` with:

::

   sudo apt update
   sudo apt install libgeos++dev

You should now be able to install rgeos in R as normal with:

::

   install.packages("rgeos")

Job done.

Sources:
--------

http://stackoverflow.com/questions/12141422/error-gdal-config-not-found
http://stackoverflow.com/questions/15248815/rgdal-package-installation
