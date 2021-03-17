Calculating Townsend Material Deprivation Score
===============================================

date: 2014-02-21

The Townsend Material Deprivation Score was first developed by Townsend
et al in 1988. It is a measure of deprivation derived from the following
four Census tables:

1. Percentage of households without access to a car or van.
2. Percentage of households with more than one person per room
   (overcrowding).
3. Percentage of households not owner-occupied (tenure).
4. Percentage of economically active residents who are unemployed.

Once these percentages are calculated, they are converted to a
*z*-score. The four *z*-scores can then simply be added to create the
final Townsend Score.

This process is usually done on small geographical areas – such as
LSOAs, MSOAs, ward, or local authority – across the whole country. That
way, the scores can be ranked and compared, and it is possible to see
which areas are more or less deprived than others.

I needed an up-to-date Townsend Score for the UK based on 2011 Census
data for my PhD, so I’ve produced a small R script which takes the
supplied Census tables from Nomis Web and creates a final *z*-score for
each geographical area required.

The script file, example data files, and instructions are all available
from Github: https://github.com/philmikejones/townsend-depr-score-2011

If you’re confident with Github you can simply clone the repository. It
you prefer the old-fashioned approach, save the following files to a
folder and run source.R:

-  car.csv
-  oc.csv
-  tenure.csv
-  unemp.csv
-  source.R

The readme contains detailed instructions, but essentially the script
outputs a ‘master.csv’ file which contains every geographical area of
interest in England and Wales along with its associated *z*-score.
Scotland and Northern Ireland Census tables are not yet published so
they are excluded.

You can then plot the *z*-scores using any GIS software. The following
map shows each district, London borough and unitary authority in England
and Wales with its associated deprivation rank (i.e. those shaded
darkest are more deprived).

.. raw:: html

   <figure id="attachment_1001" class="thumbnail wp-caption aligncenter" style="width: 410px">

` <http://philmikejones.me/wp-content/uploads/20../_static/eng-wales-townsend-lad-2011.pdf>`__

.. raw:: html

   <figcaption class="caption wp-caption-text">

Townsend Score for England and Wales from 2011 Census tables (image
links to 3.4MB vector file)

.. raw:: html

   </figcaption>

.. raw:: html

   </figure>

The Townsend deprivation score is useful for demonstrating which areas
are more or less deprived. For example, the map above shows higher
levels of relative deprivation across the North East and North West.

References
----------

Townsend, P., Phillimore, P. and Beattie, A. (1988) *Health and
Deprivation: Inequality and the North*. London: Croom Helm.
