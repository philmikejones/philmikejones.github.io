# Trigpoints data set released

date: 2018-09-22

I've packaged up the Ordnance Survey's [archive of trig points](https://www.ordnancesurvey.co.uk/gps/legacy-control-information/triangulation-stations) into an R package for immediate download and use with R.

Install it with:


```r
install.packages("trigpoints")
```

Load it as you would a normal package (I also load a few other useful packages here):


```r
library("trigpoints")
library("dplyr")
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library("sf")
```

```
## Linking to GEOS 3.9.0, GDAL 3.2.1, PROJ 7.2.1
```

Check it's loaded correctly:


```r
trigpoints
```

```
## Simple feature collection with 31521 features and 14 fields
## geometry type:  POINT
## dimension:      XY
## bbox:           xmin: 8710.27 ymin: 5575.208 xmax: 654884 ymax: 1219690
## projected CRS:  OSGB 1936 / British National Grid
## # A tibble: 31,521 x 15
##    name    station new_name height order type  sec_com_blk com_date   maintained
##    <chr>   <chr>   <chr>     <dbl> <int> <chr> <chr>       <date>     <date>    
##  1 1       TL08/I… TL08I010      0     3 APEX  TL08        1954-06-01 1979-05-01
##  2 2 Site… SD80/T… SD80T150      0     4 BOLT  SD80        1949-06-01 NA        
##  3 2 Site… SD80/T… SD80T150      0     4 CENT… SD80        1949-06-01 NA        
##  4 2 Site… SD80/T… SD80T190      0     4 BOLT  SD80        1949-06-01 NA        
##  5 202 F … SJ44/T… SJ44T132      0     4 RIVET SJ44        1957-06-01 NA        
##  6 208 Le… SD30/T… SD30T308      0     4 RIVET SD30        1954-06-01 NA        
##  7 3 Site… SD80/T… SD80T149      0     4 BOLT  SD80        1949-06-01 NA        
##  8 3 Site… SD80/T… SD80T149      0     4 CENT… SD80        1949-06-01 NA        
##  9 507 Se… TQ53/T… TQ53T061      0     3 BOLT  TQ53        1949-06-01 NA        
## 10 53 Col… TQ53/T… TQ53T069      0     3 BOLT  TQ53        1949-06-01 1982-04-01
## # … with 31,511 more rows, and 6 more variables: lvl_class <int>,
## #   lvl_date <date>, lvl_datum <chr>, destroyed <int>, notes <chr>,
## #   geometry <POINT [m]>
```

And a quick (ish) plot:


```r
plot(trigpoints, max.plot = 1)
```

<img src="figure/plot-1.png" title="plot of chunk plot" alt="plot of chunk plot" width="778px" />

The coordinates are projected and stored in OSGB36 British National Grid, for plotting with most OS or other UK shapefiles.
However, these are incompatible with most web--based providers tiles so transform them if you want to plot with these:


```r
trigpoints =
  trigpoints %>% 
  st_transform(crs = 4326)
```

Before we plot these there are far too many to plot interactively, so instead I plot a random selection:


```r
trigpoints =
  trigpoints %>% 
  sample_frac(0.1)
```

I also remove any trigpoints that have been destroyed, and keep only those that are the iconic 'Hotine' pillar style:


```r
trigpoints =
  trigpoints %>%
  filter(destroyed == 0L) %>%
  filter(type == "PILLAR")
```

Now we can plot these on a basemap:


```r
# install.packages("leaflet")
library("leaflet")

map =
  leaflet(trigpoints, width = 758) %>%
  addMarkers(popup = ~ paste0(
    htmltools::htmlEscape(name),
    "<br />",
    "Height: ",
    htmltools::htmlEscape(height), " m")
  ) %>% 
  addTiles()  

map
```

```
## PhantomJS not found. You can install it with webshot::install_phantomjs(). If it is installed, please make sure the phantomjs executable can be found via the PATH variable.
```

```
## Error in path.expand(path): invalid 'path' argument
```


## Package websites

- [Documentation](https://philmikejones.github.io/trigpoints/)
- [CRAN](https://cran.r-project.org/package=trigpoints)
- [GitHub](https://github.com/philmikejones/trigpoints)


## Notes

- This data set is no longer maintained by Ordnance Survey so stations marked as not destroyed might no longer exist.
- The coordinates specified are not true OSGB36 National Grid coordinates. They are expected to be accurate to within a metre so will be fine for most purposes.


## Licence

- Code: Copyright 2018 Phil Mike Jones. Licensed under the terms of the MIT License. see LICENSE
- Data: Contains OS data © Crown copyright and database right (2018)

## Source

The full list of trig points was obtained from: https://www.ordnancesurvey.co.uk/gps/legacy-control-information/triangulation-stations
