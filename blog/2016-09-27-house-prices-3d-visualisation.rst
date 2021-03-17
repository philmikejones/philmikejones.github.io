House prices 3d visualisation
=============================

date: 2016-09-27

On Saturday (24th September) I participated in the `UK Data Service’s
Open Data Dive
Hackathon. <https://storify.com/UKDataService/uk-data-service-open-data-dive-at-the-innovation-h>`__
The goal was to use open data to create an artefact or visualisation
with the grand prize being the opportunity to have your artefact printed
on one of MMU’s industrial 3D printers.

I wanted to explore using a QGIS plugin called qgis2threejs to create 3D
visualisations using the three.js javascript framework that allows you
to render your visualisation in a WebGL-capable browser. Have a look at
`Steven Bernard’s qgis2threejs
tutorial <https://youtu.be/MVZTaA-a9kk>`__ to see how to use the plugin.
Working with `Andy Dudfield <https://twitter.com/mr_dudders>`__ from
ONS, we were able to very rapidly get a prototype working, then we were
able to try different variables, geographies, and colour schemes until
we settled on our final visualisation, showing median house prices by
local authority:

.. figure:: https://philmikejones.me/img/house-price-stl.png
   :alt: 3D house price visualisation viewed with fstl

   3D house price visualisation viewed with fstl

The height of the z axis shows the median house price for the local
authority, and this is reinforced by the thematic colour, with darker,
taller areas therefore representing more expensive areas to live. The
most expensive local authority to live in is therefore Kensington and
Chelsea, London (about £1.2million if you’re interested).

You can also `view or download an .stl
version <https://github.com/philmikejones/datavis3d/blob/master/stl/house_prices.stl>`__
of the visualisation online and all the code used to recreate the
visualisation is hosted in my `datavis3d
repository <https://github.com/philmikejones/datavis3d>`__.

I’m delighted that our’s was the winning visualisation and, after a few
weeks, we were treated to a model 3d printed by MMU’s Digital Innovation
centre. The model went on to be `exhibited at the 2017 Data Stories
exhibition <https://www.ukdataservice.ac.uk/news-and-events/newsitem/?id=4901>`__
at the Central European University in Budapest.
