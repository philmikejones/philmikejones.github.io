---
title: "Create a globe in QGIS"
date: 2016-07-14
author: "Phil Mike Jones"
categories: ["tutorials"]
tags: ["cartography", "gis", "globe", "projection", "QGIS", "map"]
---

I followed this tutorial by [Steven Bernard](https://twitter.com/sdbernard) to create a globe from a world map in QGIS.

<iframe width="720" height="405" src="https://www.youtube.com/embed/rUShqJde2CA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

<!--more-->

The steps are straightforward.
The fiddly bit was getting the line endings and indentation correct which are essential in Python, so I copied the text out and created a gist with line endings preserved:

<script src="https://gist.github.com/philmikejones/f072d0872a870e3ce87f8b8ad3991f21.js"></script>

This can then be called by opening the Python console as per the video, and typing:

```python
import globe_projection_processing_qgis.py as circle
circle.doClip(iface, x, y)
```

Replacing `x` and `y` with your latitude and longitude (NOT longitude and latitude, note the order) respectively.

The result is a beautiful globe when appropriately styled:

![World map globe projection](../../img/globe.png)
