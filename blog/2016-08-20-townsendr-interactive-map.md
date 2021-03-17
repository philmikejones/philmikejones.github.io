
# townsendr interactive map

date: 2016-08-20

This week I updated my [Townsend Material Deprivation Score](http://philmikejones.github.io/townsendr/) project.
The update makes townsendr an interactive online map of deprivation that users can simply view in their browser, rather than having to download and run the R code or view only static maps.
I think the result is much more intuitive and useful.

Making the map interactive is achieved by using [Shiny](http://shiny.rstudio.com/), a technology for R to make interactive charts and plots.
As well as this, the maps are now rendered by [leaflet](http://leafletjs.com/) rather than [ggplot2](http://docs.ggplot2.org/current/).
`ggplot2` is an awesome technology for making beautiful charts in R, but leaflet is a javascript library designed specifically for plotting interactive maps so rendering the map is now so effortless it felt like cheating.


The data is based on the relevant census tables obtained from [Nomis](https://www.nomisweb.co.uk/census/2011).
The shapefiles are obtained from the [UK Data Service](https://census.edina.ac.uk/easy_download.html), but are greatly simplified (even the generalised versions were about 5MB, much too big for interactive use).
Both are available under open licenses.
For more information see the [townsendr web page](http://philmikejones.github.io/townsendr/) or the [GitHub repository](https://github.com/philmikejones/townsendr).
Pull requests are very welcome.

I'm really happy with the result, which is my first attempt using Shiny and leaflet, but there's more work to do (when I have time!).
Specifically I think the following need addressing:

- London probably needs removing from the analyses because car ownership and home ownership are low in London even among households that aren't deprived.
- The colour scale needs more contrast between high and low deprivation (although this might be corrected by removing London!). I might even create bands that show quantiles of deprivation.
- The legend needs improving, specifically it should be clearer that darker blue = more deprivation. The _z_-scores probably aren't that useful to someone who doesn't know what they signify.

If you notice anything else, [fix it and submit a pull request](https://github.com/philmikejones/townsendr) or [file an issue](https://github.com/philmikejones/townsendr/issues) for me to address!
