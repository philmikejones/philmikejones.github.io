Build large maps with OpenStreetMap
===================================

date: 2015-01-27

This is just a quick post to remind me to produce a full post later when
I have more time.

It’s surprisingly difficult to produce street maps in GIS for paper
sizes bigger than about A2. Using QGIS for example, even if things look
good in the print composer the resulting image often doesn’t have a
background that extends to other layers.

The solution is to use Atlas convergence. With OpenStreetMap as a
background, create your map as normal in the print composer until it
looks right. Then use the Atlas composer to make sure enough tiles are
downloaded and composited to cover your other layers.

You can specify which layer you want to use as the extent of your map,
and you can then add a margin (by default 10%) to make sure the
background extends far enough around your extent layer.

Hey, presto. Big maps.
