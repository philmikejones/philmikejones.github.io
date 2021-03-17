Why do internet maps use Mercator?
==================================

date: 2015-05-04

I’ve often wondered why Google, as well as other internet map providers,
use the `Mercator
projection <http://en.wikipedia.org/wiki/Mercator_projection>`__. It was
originally designed for nautical navigation by keeping lines of latitude
perpendicular to lines of longitude. The `cost was that land areas were
distorted <http://en.wikipedia.org/wiki/Mercator_projection#Uses>`__,
and the distortion increases nearer the poles, making countries in very
low or very high latitudes look bigger than they really are. Using the
Mercator projection, Greenland looks bigger than Australia for example,
but in fact Australia is about three times the area of Greenland.

The `answer given by John H, a Google
employee <https://productforums.google.com/d/msg/maps/A2ygEJ5eG-o/KbZr_B0h2hkJ>`__,
is:

   [Google] Maps uses Mercator because it preserves angles. The first
   launch of Maps actually did not use Mercator, and streets in high
   latitude places like Stockholm did not meet at right angles on the
   map the way they do in reality. While this distorts a ‘zoomed-out
   view’ of the map, it allows close-ups (street level) to appear more
   like reality. The majority of our users are looking down at the
   street level for businesses, directions, etc… so we’re sticking with
   this projection for now. In the meantime, you might want to look at
   our favorite 3D view of the world.

For more information on this problem, its implications, and the reasons
Google use Mercator, see Anders Kaseorg‘s answer to ‘Why does Google use
the Mercator projection on their maps, as opposed to an equal-area
proportion map?‘ His answer also references Joel H’s answer (above) to
its original question, ‘Why does Google maps use the inaccurate, ancient
and distorted Mercator Projection?‘

So now I know why Mercator is used, I wanted to test projections to see
how much difference it makes. I’ve chosen Reykjavik, Iceland, as it is
the northernmost (i.e. highest latitude) capital city in the world, so
it will accentuate any differences in projection. I also loved visiting
Reykjavik, so it’s nice to remind myself of my holiday there!

.. container:: googlemaps

To explore this, I downloaded administrative boundary data of Iceland
(country outline, regions) from `DIVA-GIS <http://diva-gis.org/Data>`__
and roads from
`geofabrik <http://download.geofabrik.de/europe/iceland.html>`__. I
separated out the capital region then clipped the roads for just this
region, leaving the following map (in EPSG:3857 Pseudo Mercator):

.. raw:: html

   <figure id="attachment_1659" class="thumbnail wp-caption alignnone" style="width: 644px">

.. raw:: html

   <figcaption class="caption wp-caption-text">

Reykjavik in EPSG:3857 (Pseudo Mercator) with roads

.. raw:: html

   </figcaption>

.. raw:: html

   </figure>

So let’s take a look at some simple directions from the Hallgrimskirkja
(for the awesome views) back in to town, making sure we take a couple of
turns:

.. container:: googlemaps

And the same directions in QGIS using the Psuedo Mercator projection:

` <https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-pseudo-mercator.png>`__

.. raw:: html

   <figcaption class="caption wp-caption-text">

Directions from Hallgrimskirkja to Lækjargata, Reykjavik, in Pseudo
Mercator (internet maps) projection

.. raw:: html

   </figcaption>

.. raw:: html

   </figure>

And finally, the resultant directions when transformed to the WGS84
datum without projection:

.. raw:: html

   <figure id="attachment_1668" class="thumbnail wp-caption alignnone" style="width: 644px">

` <https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/directions-no-projection.png>`__

.. raw:: html

   <figcaption class="caption wp-caption-text">

Same directions without projection

.. raw:: html

   </figcaption>

.. raw:: html

   </figure>

The result is almost an `isometric
projection <http://en.wikipedia.org/wiki/Isometric_projection>`__ of the
equivalent Google Map, and changes the angle of the left turn at the
right-most point on the map from approximately 90° to 56°. Clearly the
unprojected map is inferior for local directions compared to the map
projected in Pseudo Mercator, and at high latitudes it makes a
noticeable difference.
