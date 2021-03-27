
# QGIS: Thematic Mapping with Open Source GIS

date: 2014-05-16

QGIS is a mature open source GIS package that I have been using to produce high quality thematic maps for my PhD. It is similar to proprietary packages like ArcMap but is, in my opinion, superior for the following reasons:

- I've found QGIS less prone to crashes, particularly when handling large files (> ~100MB).
- I think the QGIS interface makes it easier to understand what layers you're currently working with and have available.
- Most importantly, QGIS is freely available and has no cost to download, making it possible for any individual to easily open, replicate and check your analysis.

## Obtaining QGIS

QGIS is available from <http://www.qgis.org/en/site/forusers/download.html>

Windows users need to download just one .exe file. Ubuntu users can install with their package manager by following the instructions here: <http://www.qgis.org/en/site/forusers/alldownloads.html#ubuntu> (other distributions have similar instructions). Mac OS X users have the hardest time. If you're looking to install on Mac you need to download and install the following packages, in order, from <http://www.kyngchaos.com/software/qgis>:

  1. [GDAL complete](http://www.kyngchaos.com/software/frameworks#gdal_complete)
  2. [Matplotlib](http://www.kyngchaos.com/software/python)
  3. Finally, [QGIS itself](http://www.kyngchaos.com/software/qgis).

## Thematic Mapping with QGIS

Perhaps the most common function of GIS software, particularly in the social sciences, is to produce thematic maps. This involves the following steps:

- Load the outline of the geographical area of interest.
- Load data about the areas about a topic of interest.
- &#8216;Join' the data to the boundary information using a unique key in both files.
- Set the shading of the map based on the joined dataset.

This is easily achieved in QGIS.

## Load a Vector (Map) Layer

I use shapefiles as these appear to be the _de facto_ standard among GIS applications. Load a shapefile with SHIFT+CTRL+V or by clicking the &#8216;Add Vector Layer' icon (bottom left of this screenshot, looks like a &#8216;V'):<figure id="attachment_1094" class="thumbnail wp-caption aligncenter" style="width: 167px">

![Add vector layer](../_static/img/add-vector-layer.png)


## Add Data

To add data about the geography you've loaded &#8211; and join it to the shapefile &#8211; click &#8216;Add Delimited Text Layer' (icon looks like a comma). I'm assuming here you're using a text delimited file (probably comma delimited, like .csv) because this is the most common format data is shared in, or at least can be easily converted to. Other data formats are supported, but for now lets load a .csv:<figure id="attachment_1095" class="thumbnail wp-caption aligncenter" style="width: 66px">

[<img class="size-full wp-image-1095" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/add-csv-layer.png?fit=56%2C40" alt="QGIS: Add csv layer" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/add-csv-layer.png)<figcaption class="caption wp-caption-text">QGIS: Add CSV Layer</figcaption></figure> 

You should get the following dialogue box:<figure id="attachment_1096" class="thumbnail wp-caption aligncenter" style="width: 310px">

[<img class="size-medium wp-image-1096" src="https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue-300x194.png?fit=300%2C193" alt="Load CSV file" srcset="https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue.png?w=784 784w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue.png?resize=300%2C194 300w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue.png?resize=768%2C496 768w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue.png?resize=660%2C426 660w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/csv-dialogue.png)<figcaption class="caption wp-caption-text">QGIS: Load CSV File</figcaption></figure> 

The main thing to remember when loading a .csv file is to tell QGIS if your file contains geometry data or not. Most of the time when I download .csv files relating to a geography (like LSOA) it contains the LSOA code for referencing, but the file doesn't include any geometry data per se. I would therefore select &#8216;No geometry (attribute only table)' from the dialogue box.

## &#8216;Joining' the Two

Once the data is loaded, it's time to &#8216;join' it to the shapefile or other layer we loaded earlier. Right-click on the layer and press &#8216;Properties':<figure id="attachment_1097" class="thumbnail wp-caption aligncenter" style="width: 310px">

[<img class="size-medium wp-image-1097" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-300x189.png?fit=300%2C188" alt="Performing a join in QGIS" srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?w=1631 1631w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?resize=300%2C189 300w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?resize=768%2C483 768w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?resize=1024%2C644 1024w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?resize=660%2C415 660w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png?w=1296 1296w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join.png)<figcaption class="caption wp-caption-text">QGIS: Joining a csv file to a layer</figcaption></figure> 

From there, select Joins, then the green plus:<figure id="attachment_1098" class="thumbnail wp-caption aligncenter" style="width: 310px">

[<img class="size-medium wp-image-1098" src="https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue-300x194.png?fit=300%2C194" alt="Joining in QGIS" srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue.png?w=929 929w, https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue.png?resize=300%2C194 300w, https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue.png?resize=768%2C497 768w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue.png?resize=660%2C427 660w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/join-dialogue.png)<figcaption class="caption wp-caption-text">QGIS: Joins dialogue</figcaption></figure> 

Select your csv file (&#8216;Join layer'), the unique code you're using to join, which is probably an LSOA code or similar (&#8216;Join field'), and the target field in your vector layer. Like a key in a relational database, the codes for the join field and target layer must match exactly, or QGIS won't know which area's which!

## Thematic Mapping

Once the join is completed you can create a thematic map by modifying the &#8216;Style' tab of the layer properties. I typically change &#8216;Single Symbol' to &#8216;Graduated' and selecting an appropriate colour gradient:<figure id="attachment_1099" class="thumbnail wp-caption aligncenter" style="width: 310px">

[<img class="size-medium wp-image-1099" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join-300x194.png?fit=300%2C194" alt="Producing a thematic map" srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join.png?w=929 929w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join.png?resize=300%2C194 300w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join.png?resize=768%2C497 768w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join.png?resize=660%2C427 660w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />](https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/thematic-map-from-join.png)<figcaption class="caption wp-caption-text">QGIS: Applying styles to layer</figcaption></figure> 

The finished result should look something like this. If you want to reproduce this map you can obtain the [Townsend Scores](http://www.philmikejones.net/wp-content/uploads/2014/05/master.csv) and [shapefile map layer](http://www.philmikejones.net/wp-content/uploads/2014/05/sheffield-wards-2011.zip).<figure id="attachment_1101" class="thumbnail wp-caption aligncenter" style="width: 310px">

[<img class="size-medium wp-image-1101" src="https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster-300x212.png?fit=300%2C212" alt="Sheffield thematic map (Townsend Deprivation Scores depicted)" srcset="https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?w=3507 3507w, https://i2.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?resize=300%2C212 300w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?resize=768%2C543 768w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?resize=1024%2C724 1024w, https://i1.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?resize=660%2C467 660w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?w=1296 1296w, https://i0.wp.com/philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011-raster.png?w=1944 1944w" sizes="(max-width: 300px) 100vw, 300px" data-recalc-dims="1" />](http://philmikejones.me/wp-content/uploads/2014/05/sheffield-townsend-2011.pdf)<figcaption class="caption wp-caption-text">Sheffield Townsend Deprivation Scores 2011 &#8211; darker areas are more deprived</figcaption></figure> 

## Sources

The csv data is based on my analysis of the 2011 Census. The boundary data was obtained from the UK Data Service:

Office for National Statistics, 2011 Census: Aggregate data (England and Wales) [computer file]. UK Data Service Census Support. Downloaded from: <http://infuse.mimas.ac.uk>. This information is licensed under the terms of the Open Government Licence [http://www.nationalarchives.gov.uk/doc/open-government-licence/version/2].

Office for National Statistics, 2011 Census: Digitised Boundary Data (England and Wales) [computer file]. UK Data Service Census Support. Downloaded from: <http://edina.ac.uk/census>
