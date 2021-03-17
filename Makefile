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
	pandoc tutorials/2010-08-11-telephone-interviewing.md -o tutorials/2010-08-11-telephone-interviewing.rst
	Rscript -e 'knitr::knit("blog/2018-09-22-trigpoints-data-set-released.Rmd", "blog/2018-09-22-trigpoints-data-set-released.md")'
	Rscript -e 'knitr::knit("blog/2017-10-11-raker-v0-2-1-patched.Rmd", "blog/2017-10-11-raker-v0-2-1-patched.md")'
	pandoc blog/2017-10-11-raker-v0-2-1-patched.md -o blog/2017-10-11-raker-v0-2-1-patched.rst
	pandoc blog/2011-08-07-negotiating-careers-outside-academia.md -o blog/2011-08-07-negotiating-careers-outside-academia.rst
	pandoc blog/2011-11-13-travelling-by-train-physical-disability.md -o blog/2011-11-13-travelling-by-train-physical-disability.rst
	pandoc blog/2013-02-17-soa-bsa-annual-conference.md -o blog/2013-02-17-soa-bsa-annual-conference.rst
	pandoc blog/2013-04-21-ethics-cbpr.md -o blog/2013-04-21-ethics-cbpr.rst
	pandoc blog/2013-09-23-a-world-full-of-data.md -o blog/2013-09-23-a-world-full-of-data.rst
	pandoc blog/2013-10-09-social-research-methods-jobs.md -o blog/2013-10-09-social-research-methods-jobs.rst
	pandoc blog/2013-11-19-depicting-human-issues-with-human-cartograms.md -o blog/2013-11-19-depicting-human-issues-with-human-cartograms.rst
	pandoc blog/2013-12-04-landing-a-passenger-plane-for-children-in-need.md -o blog/2013-12-04-landing-a-passenger-plane-for-children-in-need.rst
	pandoc blog/2014-01-08-geographical-analysis-proposed-library-closures-sheffield.md -o blog/2014-01-08-geographical-analysis-proposed-library-closures-sheffield.rst
	pandoc blog/2014-02-20-townsend-material-deprivation-index.md -o blog/2014-02-20-townsend-material-deprivation-index.rst
	pandoc blog/2014-02-21-calculating-townsend-material-deprivation-score.md -o blog/2014-02-21-calculating-townsend-material-deprivation-score.rst
	pandoc blog/2015-03-15-gis-shapefile-resources.md -o blog/2015-03-15-gis-shapefile-resources.rst
	pandoc blog/2015-04-13-health-resilience-systematic-review.md -o blog/2015-04-13-health-resilience-systematic-review.rst
	pandoc blog/2015-05-04-internet-maps-mercator.md -o blog/2015-05-04-internet-maps-mercator.rst
	pandoc blog/2015-05-10-update-to-townsend-deprivation-score-script.md -o blog/2015-05-10-update-to-townsend-deprivation-score-script.rst
	pandoc blog/2016-01-29-formal-informal-testing-research-code.md -o blog/2016-01-29-formal-informal-testing-research-code.rst
	pandoc blog/2016-02-24-sheffield-madina-masjid.md -o blog/2016-02-24-sheffield-madina-masjid.rst
	pandoc blog/2016-04-15-letter-from-lesvos-april-2016.md -o blog/2016-04-15-letter-from-lesvos-april-2016.rst
	pandoc blog/2016-04-18-petition-to-eu-council.md -o blog/2016-04-18-petition-to-eu-council.rst
	pandoc blog/2016-06-01-sheffield-great-european-disaster-movie.md -o blog/2016-06-01-sheffield-great-european-disaster-movie.rst
	pandoc blog/2016-07-07-sheffield-migration-matters-festival.md -o blog/2016-07-07-sheffield-migration-matters-festival.rst
	pandoc blog/2016-08-20-townsendr-interactive-map.md -o blog/2016-08-20-townsendr-interactive-map.rst
	pandoc blog/2016-09-19-raker-initial-cran-release.md -o blog/2016-09-19-raker-initial-cran-release.rst
	pandoc blog/2016-09-27-house-prices-3d-visualisation.md -o blog/2016-09-27-house-prices-3d-visualisation.rst
	pandoc blog/2016-12-21-spatial-microsimulation-101.md -o blog/2016-12-21-spatial-microsimulation-101.rst
	pandoc blog/2017-10-21-doncaster-festival-of-research.md -o blog/2017-10-21-doncaster-festival-of-research.rst
	pandoc blog/2018-02-05-phd-awarded.md -o blog/2018-02-05-phd-awarded.rst
	pandoc blog/2018-03-07-unit-testing-in-r.md -o blog/2018-03-07-unit-testing-in-r.rst
	pandoc blog/2018-09-10-spatial-microsimulation-book-chapter-published.md -o blog/2018-09-10-spatial-microsimulation-book-chapter-published.rst
	pandoc blog/2018-09-22-trigpoints-data-set-released.md -o blog/2018-09-22-trigpoints-data-set-released.rst


.PHONY: help Makefile knit

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# Use -b to output into docs/, not docs/html
# See https://github.com/sphinx-doc/sphinx/issues/6896#issue-534386946
%: Makefile
	@$(SPHINXBUILD) -b $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
