Create a globe in QGIS
======================

date: 2016-07-14

I followed this tutorial by `Steven
Bernard <https://twitter.com/sdbernard>`__ to create a globe from a
world map in QGIS.

.. raw:: html

   <iframe width="720" height="405" src="https://www.youtube.com/embed/rUShqJde2CA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>

.. raw:: html

   </iframe>

The steps are straightforward. The fiddly bit was getting the line
endings and indentation correct which are essential in Python, so I
copied the text out and created a gist with line endings preserved:

.. raw:: html

   <script src="https://gist.github.com/philmikejones/f072d0872a870e3ce87f8b8ad3991f21.js"></script>

This can then be called by opening the Python console as per the video,
and typing:

.. code:: python

   import globe_projection_processing_qgis.py as circle
   circle.doClip(iface, x, y)

Replacing ``x`` and ``y`` with your latitude and longitude (NOT
longitude and latitude, note the order) respectively.

The result is a beautiful globe when appropriately styled:

.. figure:: ../_static/img/globe.png
   :alt: World map globe projection

   World map globe projection
