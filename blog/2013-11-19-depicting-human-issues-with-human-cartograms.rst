Depicting Human Issues with Human Cartograms
============================================

date: 2013-11-19

`Cartography <http://en.wikipedia.org/wiki/Cartography>`__, to the best
of my knowledge, is the study and method of map making. It is distinct
from mapping or geography in that the latter two generally use maps to
analyse regions or present findings. Typically, a standard land area map
is used, with points or areas of interest highlighted.

Cartography, on the other hand, is interested in things like how the map
is `projected <http://en.wikipedia.org/wiki/Map_projection>`__ from a
three dimensional shape (the Earth) on to a two-dimensional piece of
paper. The choice of projection method – and creating new methods of
projection – are the domain of the cartographer. Again, that’s to the
best of my knowledge, so don’t quote me!

Human cartography, then, is the study and method of producing maps that
best highlight human issues, in contrast to a traditional approach which
uses a geographical area map to which additional information is somehow
added or superimposed. Perhaps I had better illustrate this with an
example.

The following map is taken from
`worldmapper.org <http://www.worldmapper.org>`__ who have kindly
licensed their maps under a Creative Commons licence. The map is a
standard land area map of the world; no surprises:

.. raw:: html

   <p style="text-align:center;">

<img class=“aligncenter size-medium wp-image-897” title=“Land area map
of the world. Source: http://www.worldmapper.org/display.php?selected=1”
alt=“Land Area map of the world”
src="https://i0.wp.com/philmikejones.me/wp-content/uploads/20../_static/land-area-world-300x148.png?fit=300%2C147"
srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/20../_static/land-area-world.png?w=512
512w,
https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/land-area-world.png?resize=300%2C148
300w" sizes=“(max-width: 300px) 100vw, 300px”
data-recalc-dims="1../_static/a>

.. raw:: html

   </p>

I’m not sure of the exact projection method used – probably
`Mercator <http://en.wikipedia.org/wiki/Mercator_projection>`__ – but
it’s a standard map that we all recognise. The main limitation of this
projection is that land areas closer to the equator are depicted as
smaller than they really are, whereas areas closer to the poles are
depicted as bigger than they normally are. Nevertheless, if this map
were shaded or coloured with a theme such as life expectancy, you would
know how to read it.

But a human cartogram is different. It produces a map that is still
recognisable (if you recognise the original, like the world map), but it
distorts the map to illustrate a human topic. For example, the following
map – again kindly taken from worldmapper.org – depicts the prevalence
of HIV/AIDS (that is, how many people have HIV/AIDS):

.. raw:: html

   <p style="text-align:center;">

<img class=“aligncenter size-medium wp-image-898” title=“Human cartogram
depicting HIV/AIDS prevalence. Source:
http://www.worldmapper.org/display.php?selected=227” alt=“Human
Cartogram of HIV/AIDS Prevalence”
src="https://i1.wp.com/philmikejones.me/wp-content/uploads/20../_static/hivaids-human-cartogram-300x148.png?fit=300%2C147"
srcset="https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/hivaids-human-cartogram.png?w=512
512w,
https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/hivaids-human-cartogram.png?resize=300%2C148
300w" sizes=“(max-width: 300px) 100vw, 300px”
data-recalc-dims="1../_static/a>

.. raw:: html

   </p>

Now, I knew that many countries in Africa, as well as India, had the
highest prevalence of HIV and AIDS in the world, but this map is a
striking illustration of the extent of both HIV/AIDS and it’s unequal
distribution among countries.

Producing Your Own Cartogram
----------------------------

Worldmapper.org and other sources have produced a wealth of human
cartograms free to use and analyse, and these are an amazing resources.
However, they typically only show information on the global level,
i.e. the whole world, like the maps above.

Human cartograms can, however, be produced for any geographical region,
provided you have data (or at least estimated data) for that region. You
need a `shapefile <http://en.wikipedia.org/wiki/Shapefile>`__, which is
a file produced by GIS software and has an extension .shp. The shape
file needs to contain information about the geography or region you are
studying, as well as the data on your human topic (like HIV/AIDS
prevalence or life expectancy).

Sadly, the easiest way to produce a shape file is with proprietary
software like `ArcMap <http://en.wikipedia.org/wiki/ArcMap>`__. If you
have access to such software through your institution or organisation,
great. I encourage you to use it. If you don’t, there are open source
(and free) alternatives available such as
`QGIS <http://www.qgis.o../_static/site/>`__ and I’ve even seen `R used
for GIS <http://spatial.ly/r/>`__. I know nothing yet about using them,
but am booked on a course later this year to learn so I’m sure there
will be a subsequent blog post about open source GIS soon.

The source you use for your geographical boundaries will of course vary
depending on your region or area of interest. I know, for example, that
the `UK Data Service <http://census.ukdataservice.ac.uk>`__ provide
census boundary data for all regions in the UK, which is what I have
used to construct my cartograms. Once you have obtained your boundary
data this can be imported in to ArcMap (or alternative).

Next, you should join your human topic data to your geographical data in
your GIS software, such as ArcMap. There are various data sources
available, and I have again been using the UK Data Service website to
obtain data. There are two important things to remember when obtaining
data:

-  You must have some way to link your data to the geographical
   boundaries. This is normally done by a code (for example a ward code)
   and is like a database key so the ArcMap knows *where* that data is
   for.\_

\_ - Your data must be a count. You cannot use means, percentage, rates,
etc. The acid test is this: you must be able to add your data up and for
that total to be a useful statistic. So, using the example above, you
can add up the number of HIV/AIDS patients in each country, but you
would not add up the percentage of HIV/AIDS patients in each country
because that would be meaningless (instead you would probably work out
an average percentage).

Once you have your geographical boundary data and have joined your data
set, you need to export this as your shape file. You can then use a free
piece of software called `ScapeToad <http://scapetoad.choros.ch>`__ to
produce your cartogram. The process of producing your cartogram is
straightforward (at least compared to obtaining and saving your data in
the necessary format!). ScapeToad is java-based, so runs on any and all
operating systems with java available.

To produce your cartogram, load your new shape file. Tell ScapeToad
where to find the boundary data and then which is the thematic data. You
can then produce your own cartogram for your own region of interest.

An Example Cartogram: Owner Occupancy in England
------------------------------------------------

I’ve produced an example below. Both maps depict the number of people by
unitary authority or district in England who do not own their own house
(or have a mortgage on it). I’ve used this because it is one of four
census themes used in the Townsend Material Deprivation Index, so it is
one way to indicate relative deprivation.

The first map is a traditional geographical map of England that is
instantly recognisable. Each district or unitary authority is shaded to
highlight the number of people in that area who do not own their home.
It’s crude, but the darker the shade of grey, the more people who do not
own their own, and arguably the greater deprivation. The map is roughly
what I would expect to see, and overall this map does not have any great
surprises. There is low owner-occupancy in central London, for example.

` <https://i1.wp.com/philmikejones.me/wp-content/uploads/20../_static/tenure-england-thematic-map.png>`__

In contrast, the human cartogram below is still recognisable as England
but it is much easier to immediately determine the areas that have low
owner-occupancy because they appear larger.

` <https://i2.wp.com/philmikejones.me/wp-content/uploads/20../_static/tenure-england-thematic-map1.png>`__

There are clearly a large number of people who do not own their own home
in central London, and to a lesser extent areas in the midlands, the
north west and the north east. Conversely, comparatively more people own
their own homes in Devon, Cornwall, Norfolk and in the Cotswolds and
areas of central England.

I’m not intending to start a debate about the merits of the Townsend
Material Deprivation indices, or the use of home ownership as a measure
of deprivation, or even of how to interpret these maps. Instead I just
want to illustrate that human cartograms offer a powerful alternative to
depict and present geographical data where:

-  Good quality data is available about the geography in question.
-  The audience is, or is likely to be, familiar with the geography
   discussed (for example England, the World). I think this technique is
   less successful where the geography is less familiar (for example
   wards, LSOAs). It is of course possible to provide a standard
   geographical map of the area beforehand for comparison, but I believe
   this technique is strongest and most striking when the audience is
   already highly familiar with the area.
-  A human theme is being depicted (for example poverty or deprivation).

Copyright
---------

Maps from Worldmapper.org © Copyright Sasi Group (University of
Sheffield) and Mark Newman (University of Michigan).

Some of the data for the example is taken from the 2011 Census. Census
output is Crown copyright and is reproduced with the permission of the
Controller of HMSO and the Queen’s Printer for Scotland.
