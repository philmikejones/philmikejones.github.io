# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= -E
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = docs

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

knit:
	# Rscript -e 'knitr::knit("tutorials/2019-04-09-test-your-data.Rmd", "tutorials/2019-04-09-test-your-data.md")'
	pandoc tutorials/2019-04-09-test-your-data.md -o tutorials/2019-04-09-test-your-data.rst
	pandoc tutorials/2019-01-03-install-qgis-ubuntu.md -o tutorials/2019-01-03-install-qgis-ubuntu.rst
	pandoc tutorials/2018-09-04-commissioning-research.md -o tutorials/2018-09-04-commissioning-research.rst
	pandoc tutorials/2018-08-29-install-sf-ubuntu.md -o tutorials/2018-08-29-install-sf-ubuntu.rst
	# Rscript -e 'knitr::knit("tutorials/2017-05-30-geocoding-googleway.Rmd", "tutorials/2017-05-30-geocoding-googleway.md")'
	pandoc tutorials/2017-05-30-geocoding-googleway.md -o tutorials/2017-05-30-geocoding-googleway.rst
	pandoc tutorials/2017-05-19-group-figures-for-faster-review.md -o tutorials/2017-05-19-group-figures-for-faster-review.rst
	pandoc tutorials/2017-05-12-spatial-packages-and-travis.md -o tutorials/2017-05-12-spatial-packages-and-travis.rst
	# Rscript -e 'knitr::knit("tutorials/2016-09-29-simplify-polygons-without-creating-slivers.Rmd", "tutorials/2016-09-29-simplify-polygons-without-creating-slivers.md")'
	pandoc tutorials/2016-09-29-simplify-polygons-without-creating-slivers.md -o tutorials/2016-09-29-simplify-polygons-without-creating-slivers.rst
	pandoc tutorials/2016-07-14-creating-a-globe-in-qgis.md -o tutorials/2016-07-14-creating-a-globe-in-qgis.rst
	pandoc tutorials/2016-07-21-install-ubuntu-xenial-on-macbook-air.md -o tutorials/2016-07-21-install-ubuntu-xenial-on-macbook-air.rst
	# Rscript -e 'knitr::knit("tutorials/2015-09-03-dissolve-polygons-in-r.Rmd", "tutorials/2015-09-03-dissolve-polygons-in-r.md")'
	pandoc tutorials/2015-09-03-dissolve-polygons-in-r.md -o tutorials/2015-09-03-dissolve-polygons-in-r.rst
	# Rscript -e 'knitr::knit("tutorials/2015-09-01-clip-polygons-r.Rmd", "tutorials/2015-09-01-clip-polygons-r.md")'
	pandoc tutorials/2015-09-01-clip-polygons-r.md -o tutorials/2015-09-01-clip-polygons-r.rst
	pandoc tutorials/2015-07-17-configure-ssh-server-encrypted-home-directory.md -o tutorials/2015-07-17-configure-ssh-server-encrypted-home-directory.rst
	pandoc tutorials/2015-06-29-list-nomisweb-datasets-json.md -o tutorials/2015-06-29-list-nomisweb-datasets-json.rst
	pandoc tutorials/2015-05-20-set-root-directory-knitr.md -o tutorials/2015-05-20-set-root-directory-knitr.rst
	pandoc tutorials/2015-03-13-embed-google-map.md -o tutorials/2015-03-13-embed-google-map.rst
	pandoc tutorials/2015-02-27-glossary-acronyms-latex.md -o tutorials/2015-02-27-glossary-acronyms-latex.rst
	pandoc tutorials/2015-01-27-build-large-maps-with-openstreetmap.md -o tutorials/2015-01-27-build-large-maps-with-openstreetmap.rst
	pandoc tutorials/2014-11-24-automate-hyperlinks-libreoffice-calc.md -o tutorials/2014-11-24-automate-hyperlinks-libreoffice-calc.rst
	pandoc tutorials/2014-11-21-obtaining-date-webpage.md -o tutorials/2014-11-21-obtaining-date-webpage.rst
	pandoc tutorials/2014-07-14-installing-rgdal-in-r-on-linux.md -o tutorials/2014-07-14-installing-rgdal-in-r-on-linux.rst
	pandoc tutorials/2014-05-16-qgis-thematic-mapping-open-source.md -o tutorials/2014-05-16-qgis-thematic-mapping-open-source.rst

.PHONY: help Makefile knit

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# Use -b to output into docs/, not docs/html
# See https://github.com/sphinx-doc/sphinx/issues/6896#issue-534386946
%: Makefile
	@$(SPHINXBUILD) -b $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
