Set root directory for knitr
============================

date: 2015-05-20

Knitr, by default, looks in the same directory as your ``.Rmd`` file to
find any files you need to draw in, like data sets or script files. If
you keep your data files and scripts in separate folders (and you
should) you need to configure knitr.

You cannot use ``setwd()`` with knitr, so the canonical way to do this
is to include an initial code chunk:

``{r setup, include=FALSE, echo=FALSE} require("knitr") opts_knit$set(root.dir = "~/path/to/folder/")``

This creates an R chunk called ``setup`` which isn’t included in the
knitted file. It loads the knitr package and sets ``root.dir`` to your
project folder. Knitr will now look for all files from this root folder
rather than the folder it is stored in.
